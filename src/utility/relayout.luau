--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Swapping a live window between tabs across the top and tabs down the side. The layout is built
-- into the window from the first frame, so a swap builds a fresh window in the other layout and
-- replays every tab, section and element the script made on the old one, in the same order with
-- the same properties, then puts each element's current value back.
--
-- For that the script never holds the window or its elements directly: it holds stand-ins that
-- pass every read, write and call through to whichever real object is current. After a swap the
-- stand-ins point at the new objects, so a toggle the script kept a handle to still works.

local filesystem = require(script.Parent.filesystem)
local path = require(script.Parent.path)
local variables = require(script.Parent.variables)

local relayout = {}

local preferenceFile = path.join(variables.fileSystemManager:getRootFolder(), "layout.txt")

-- The layout the player last picked, which beats the one the script asked for.
function relayout.preference(): boolean?
    if typeof(filesystem.isfile) ~= "function" then
        return nil
    end
    local ok, saved = pcall(function()
        return if filesystem.isfile(preferenceFile) then filesystem.readfile(preferenceFile) else nil
    end)
    if not ok or type(saved) ~= "string" then
        return nil
    end
    if saved == "sidebar" then
        return true
    elseif saved == "top" then
        return false
    end
    return nil
end

local function savePreference(sidebar: boolean)
    pcall(filesystem.writefile, preferenceFile, if sidebar then "sidebar" else "top")
end

-- build(properties) makes a real window. Returns the window stand-in the script gets.
function relayout.session(properties, build)
    local records = setmetatable({}, { __mode = "k" }) -- stand-in -> { real }
    local standIns = setmetatable({}, { __mode = "k" }) -- real -> stand-in
    local made = {} -- every Create* call, in order: { standIn, parent, method, args }

    local function unwrap(value)
        local record = records[value]
        return if record then record.real else value
    end

    local wrap

    local function standIn(real)
        local record = { real = real }
        local proxy = setmetatable({}, {
            __index = function(_, key)
                local value = record.real[key]
                if type(value) ~= "function" then
                    return wrap(value)
                end
                return function(first, ...)
                    local target = if first == nil or records[first] then record.real else first
                    local args = table.pack(...)
                    local passed = table.create(args.n)
                    for index = 1, args.n do
                        passed[index] = unwrap(args[index])
                    end
                    local results = table.pack(value(target, table.unpack(passed, 1, args.n)))
                    local isCreate = type(key) == "string" and string.sub(key, 1, 6) == "Create"
                    for index = 1, results.n do
                        local result = results[index]
                        if isCreate and type(result) == "table" and not standIns[result] then
                            local child = wrap(result)
                            if records[child] then
                                table.insert(made, { standIn = child, parent = record, method = key, args = args })
                            end
                        end
                        results[index] = wrap(result)
                    end
                    return table.unpack(results, 1, results.n)
                end
            end,
            __newindex = function(_, key, value)
                record.real[key] = unwrap(value)
            end,
            __tostring = function()
                return tostring(record.real)
            end,
        })
        records[proxy] = record
        standIns[real] = proxy
        return proxy
    end

    -- only the library's own objects get stand-ins; Instances, values and plain tables pass as is
    function wrap(value)
        if type(value) ~= "table" then
            return value
        end
        local existing = standIns[value]
        if existing then
            return existing
        end
        local meta = getmetatable(value)
        if type(meta) ~= "table" or type(rawget(meta, "__type")) ~= "string" then
            return value
        end
        return standIn(value)
    end

    local current = table.clone(properties)
    local preferred = relayout.preference()
    if preferred ~= nil then
        current.sidebarLayout = preferred
        current.SidebarLayout = nil
    end

    local window = build(current)
    local windowProxy = standIn(window)
    local windowRecord = records[windowProxy]
    local swapping = false

    local function swap()
        if swapping or windowRecord.real.unloaded then
            return
        end
        swapping = true

        -- what each element holds now, so the rebuild shows what the player left it at
        local values = {}
        for index, entry in made do
            local record = records[entry.standIn]
            local real = record and record.real
            local snapshot = {}
            if type(real) == "table" then
                snapshot.value = rawget(real, "value")
                snapshot.locked = rawget(real, "locked")
            end
            values[index] = snapshot
        end

        local old = windowRecord.real
        local wasOpen = not old.hidden
        local openTab = old.selectedTab and old.selectedTab.name
        current = table.clone(current)
        current.sidebarLayout = not (old.layout and old.layout.mode == "sidebar")
        current.SidebarLayout = nil
        savePreference(current.sidebarLayout)

        local fresh = build(current)
        pcall(old.Unload, old)
        standIns[fresh] = windowProxy
        windowRecord.real = fresh
        fresh._requestRelayout = swap

        for index, entry in made do
            local parent = entry.parent.real
            local args = entry.args
            local passed = table.create(args.n)
            for i = 1, args.n do
                passed[i] = unwrap(args[i])
            end
            local ok, result = pcall(parent[entry.method], parent, table.unpack(passed, 1, args.n))
            local record = records[entry.standIn]
            if ok and type(result) == "table" and record then
                record.real = result
                standIns[result] = entry.standIn
                local snapshot = values[index]
                if snapshot.value ~= nil and type(result.Set) == "function" then
                    pcall(result.Set, result, snapshot.value, true)
                end
                if snapshot.locked and type(result.Lock) == "function" then
                    pcall(result.Lock, result)
                end
            end
        end

        -- a fresh window starts hidden; open it straight away on the tab the player was on
        if wasOpen and not fresh.unloaded then
            pcall(fresh.Show, fresh)
            if openTab then
                pcall(fresh.Navigate, fresh, openTab)
            end
        end
        swapping = false
    end

    window._requestRelayout = swap
    return windowProxy, window
end

return relayout
