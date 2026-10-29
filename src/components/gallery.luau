--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- A searchable grid of picture tiles: skins, pets, items, anything a player picks by how it looks.
-- A search box and a row of filter chips narrow it down, the count under the title follows what
-- is left, and a click hands the item to the callback. Only a page of tiles is built at a time,
-- with Show more for the rest, since a game's whole item list can run past a thousand.

local Gallery = {}
Gallery.__index = Gallery
Gallery.__type = "Gallery"

local utility = script.Parent.Parent.utility
local moveable = require(utility.moveable)
local locale = require(utility.locale)
local variables = require(utility.variables)
local hapticEngine = require(utility.HapticEngine)
local constants = require(utility.constants)
local imageUtil = require(utility.image)

local gap = 8
local labelHeight = 36
local strokeRest = 0.92
local strokeHover = 0.7
local subShown = 0.15
local fieldHeight = 38
local chipHeight = 34
local optionHeight = 30
local bodyShown = 0.45
local hoverInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quint)
local pressInfo = TweenInfo.new(0.35, Enum.EasingStyle.Back)

-- Tiles and chips are torn down and rebuilt on every search keystroke, so they skip
-- window:Create, which keeps every instance it makes for the window's lifetime.
local function make(className, properties)
    local instance = Instance.new(className)
    for property, value in properties do
        if property ~= "Parent" then
            instance[property] = value
        end
    end
    instance.Parent = properties.Parent
    return instance
end

local function lower(text)
    return string.lower(tostring(text or ""))
end

function Gallery.new(tab, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local self = setmetatable({
        tab = assert(tab, "Missing argument #1 (Tab expected)"),
        window = tab.window,
        name = tostring(properties.name or properties.Name or "Gallery"),
        -- {count} is replaced with how many items match right now
        text = tostring(properties.text or properties.Text or "{count} items"),
        placeholder = tostring(properties.placeholder or properties.Placeholder or "Search..."),
        tileSize = tonumber(properties.tileSize or properties.TileSize) or 96,
        pageSize = tonumber(properties.pageSize or properties.PageSize) or 48,
        callback = properties.callback or properties.Callback,
        filterGroups = properties.filterGroups or properties.FilterGroups,
        fixedFilters = properties.filters or properties.Filters,
        items = {},
        matches = {},
        shownCount = 0,
        query = "",
        picks = {},
        groups = {},
        pills = {},
        tiles = {},
        shown = false,
    }, Gallery)

    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        Name = "Gallery",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),

        -- Animation
        BackgroundTransparency = 1, -- In = ElementTransparency

        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })

    self.stroke = self.window:StyleElementBody(self.main)

    self.window:Create("UIPadding", {
        PaddingTop = UDim.new(0, 14),
        PaddingBottom = UDim.new(0, 14),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.main,
    })

    self:_buildSearch()
    self:_buildChips()
    self:_buildHeader()
    self:_buildGrid()

    self:SetItems(properties.items or properties.Items or {})

    return self
end

function Gallery:_buildSearch()
    self.field = self.window:Create("Frame", {
        Name = "Search",
        Size = UDim2.new(1, 0, 0, fieldHeight),
        BorderSizePixel = 0,
        LayoutOrder = 1,

        -- Animation
        BackgroundTransparency = 1, -- In = FieldTransparency

        Parent = self.main,
    }, { BackgroundColor3 = "FieldBackground" })

    self.window:Create("UICorner", {
        CornerRadius = UDim.new(0, 10),

        Parent = self.field,
    })

    self.searchIcon = self.window:Create("ImageLabel", {
        Name = "Icon",
        Image = constants.icons.search,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 14, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,

        -- Animation
        ImageTransparency = 1, -- In = 0.5

        Parent = self.field,
    }, { ImageColor3 = "ContentColor" })

    self.search = self.window:Create("TextBox", {
        Text = "",
        PlaceholderText = locale.t(self.placeholder),
        Size = UDim2.new(1, -54, 1, 0),
        Position = UDim2.fromOffset(40, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ClearTextOnFocus = false,

        -- Animation
        TextTransparency = 1, -- In = 0

        Parent = self.field,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })

    self.window:ConnectFor(self, self.search:GetPropertyChangedSignal("Text"), function()
        self.query = lower(self.search.Text)
        self:_applyFilter()
    end)
end

function Gallery:_buildChips()
    -- one pill per filter group, side by side under the search box
    self.chipRow = self.window:Create("Frame", {
        Name = "Filters",
        Size = UDim2.new(1, 0, 0, chipHeight),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 2,

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.chipRow,
    })

    -- the open pill's choices, inline under the pills so nothing it shows can be clipped
    self.optionPanel = self.window:Create("Frame", {
        Name = "Options",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Visible = false,
        LayoutOrder = 3,

        Parent = self.main,
    })

    self.optionLayout = self.window:Create("UIGridLayout", {
        CellPadding = UDim2.fromOffset(6, 6),
        CellSize = UDim2.new(1 / 3, -4, 0, optionHeight),
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.optionPanel,
    })
end

function Gallery:_buildHeader()
    local header = self.window:Create("Frame", {
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 4,

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = header,
    })

    -- named title so the shared reveal fades it with the card
    self.title = self.window:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 18,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,

        -- Animation
        TextTransparency = 1,

        Parent = header,
    }, { TextColor3 = "TitlingColor", FontFace = "TitleFont" })

    self.body = self.window:Create("TextLabel", {
        Text = "",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 2,

        -- Animation
        TextTransparency = 1, -- In = bodyShown

        Parent = header,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
end

function Gallery:_buildGrid()
    self.grid = self.window:Create("Frame", {
        Name = "Grid",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 5,

        Parent = self.main,
    })

    self.gridLayout = self.window:Create("UIGridLayout", {
        CellPadding = UDim2.fromOffset(gap, gap),
        CellSize = UDim2.fromOffset(self.tileSize, self.tileSize + labelHeight),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,

        Parent = self.grid,
    })

    -- tiles stretch so a row always fills the card edge to edge, as many across as fit
    local function fit()
        local width = self.grid.AbsoluteSize.X
        if width <= 0 then
            return
        end
        local columns = math.max(2, math.floor((width + gap) / (self.tileSize + gap)))
        local cell = math.floor((width - gap * (columns - 1)) / columns)
        self.gridLayout.CellSize = UDim2.fromOffset(cell, cell + labelHeight)
    end
    self.window:ConnectFor(self, self.grid:GetPropertyChangedSignal("AbsoluteSize"), fit)
    task.defer(fit)

    self.more = self.window:Create("TextButton", {
        Name = "ShowMore",
        Text = locale.t("Show more"),
        Size = UDim2.new(1, 0, 0, 34),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        TextSize = 14,
        Visible = false,
        LayoutOrder = 6,

        -- Animation
        BackgroundTransparency = 1,
        TextTransparency = 1,

        Parent = self.main,
    }, { BackgroundColor3 = "FieldBackground", TextColor3 = "ContentColor", FontFace = "Font" })

    self.window:Create("UICorner", {
        CornerRadius = UDim.new(0, 10),

        Parent = self.more,
    })

    self.window:ConnectFor(self, self.more.MouseButton1Click, function()
        hapticEngine.click()
        self:_showUpTo(self.shownCount + self.pageSize)
    end)
end

-- The groups to filter by. filterGroups names them outright ({ name, key, options? }); without
-- it, the older filters list (or the items' own categories) makes a single group.
function Gallery:_resolveGroups()
    local groups = {}
    if self.filterGroups then
        for _, group in self.filterGroups do
            table.insert(groups, {
                name = tostring(group.name or group.Name or group.key or "Filter"),
                key = tostring(group.key or group.Key or "category"),
                options = group.options or group.Options,
            })
        end
    else
        local options = nil
        if self.fixedFilters then
            options = {}
            for _, filter in self.fixedFilters do
                if filter ~= "All" then
                    table.insert(options, filter)
                end
            end
        end
        table.insert(groups, { name = "Category", key = "category", options = options })
    end

    -- a group with no fixed options takes the values its items carry, in first-seen order
    for _, group in groups do
        if not group.options then
            group.options = {}
            local seen = {}
            for _, item in self.items do
                local value = item.values[group.key]
                if value ~= nil and not seen[value] then
                    seen[value] = true
                    table.insert(group.options, value)
                end
            end
        end
        -- a pick the new list no longer offers falls back to All
        local pick = self.picks[group.key] or "All"
        if pick ~= "All" and not table.find(group.options, pick) then
            pick = "All"
        end
        self.picks[group.key] = pick
    end
    return groups
end

function Gallery:_rebuildChips()
    for _, pill in self.pills do
        pill.button:Destroy()
    end
    table.clear(self.pills)
    self:_closeOptions()

    self.groups = self:_resolveGroups()
    local any = false
    for _, group in self.groups do
        any = any or #group.options > 0
    end
    self.chipRow.Visible = any

    local theme = self.window.theme
    for index, group in self.groups do
        if #group.options == 0 then
            continue
        end
        local button = make("TextButton", {
            Name = group.name,
            Text = "",
            Size = UDim2.new(0, 0, 1, 0),
            BorderSizePixel = 0,
            AutoButtonColor = false,
            BackgroundColor3 = theme.FieldBackground,
            BackgroundTransparency = if self.shown then theme.FieldTransparency else 1,
            LayoutOrder = index,

            Parent = self.chipRow,
        })
        make("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = button })
        make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = button })

        local label = make("TextLabel", {
            Name = "Label",
            Text = "",
            Position = UDim2.fromOffset(12, 0),
            Size = UDim2.new(1, -40, 1, 0),
            BackgroundTransparency = 1,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextColor3 = theme.ContentColor,
            FontFace = theme.Font,
            TextTransparency = 1,

            Parent = button,
        })

        local chevron = make("ImageLabel", {
            Name = "Chevron",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -12, 0.5, 0),
            Size = UDim2.fromOffset(14, 14),
            BackgroundTransparency = 1,
            ImageColor3 = theme.ContentColor,
            ImageTransparency = 1,

            Parent = button,
        })
        imageUtil.assign(chevron, "Image", constants.icons.chevron)

        button.MouseButton1Click:Connect(function()
            hapticEngine.click()
            if self.openGroup == group then
                self:_closeOptions()
            else
                self:_openOptions(group)
            end
        end)

        table.insert(self.pills, { group = group, button = button, label = label, chevron = chevron })
    end
    self:_paintChips(false)
end

function Gallery:_paintChips(animate)
    local theme = self.window.theme
    for _, pill in self.pills do
        local pick = self.picks[pill.group.key] or "All"
        local active = pick ~= "All"
        local open = self.openGroup == pill.group
        pill.label.Text = locale.resolve(pill.group.name) .. ": " .. locale.resolve(pick)
        self.window:_reveal(pill.button, {
            BackgroundTransparency = if not self.shown
                then 1
                elseif open then theme.FieldTransparency - 0.05
                else theme.FieldTransparency,
        }, animate)
        self.window:_reveal(pill.label, {
            TextTransparency = if not self.shown then 1 elseif active or open then 0 else 0.35,
        }, animate)
        self.window:_reveal(pill.chevron, {
            ImageTransparency = if self.shown then 0.4 else 1,
            Rotation = if open then 180 else 0,
        }, animate)
    end
end

function Gallery:_closeOptions()
    self.openGroup = nil
    if self.optionPanel then
        for _, child in self.optionPanel:GetChildren() do
            if child.ClassName == "TextButton" then
                child:Destroy()
            end
        end
        self.optionPanel.Visible = false
    end
end

-- The open group's choices as a grid of pills: the current pick solid white, a tap picks and
-- closes, so it reads and behaves like a dropdown without leaving the card.
function Gallery:_openOptions(group)
    self:_closeOptions()
    self.openGroup = group
    local theme = self.window.theme
    local pick = self.picks[group.key] or "All"

    local choices = { "All" }
    for _, option in group.options do
        table.insert(choices, option)
    end
    for index, option in choices do
        local picked = option == pick
        local button = make("TextButton", {
            Name = tostring(option),
            Text = locale.resolve(tostring(option)),
            BorderSizePixel = 0,
            AutoButtonColor = false,
            BackgroundColor3 = if picked then Color3.fromRGB(255, 255, 255) else theme.FieldBackground,
            BackgroundTransparency = if picked then 0 else theme.FieldTransparency,
            TextColor3 = if picked then Color3.fromRGB(0, 0, 0) else theme.ContentColor,
            TextTransparency = if picked then 0 else 0.2,
            TextSize = 13,
            TextTruncate = Enum.TextTruncate.AtEnd,
            FontFace = theme.Font,
            LayoutOrder = index,

            Parent = self.optionPanel,
        })
        make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = button })

        button.MouseButton1Click:Connect(function()
            hapticEngine.click()
            self:SetFilter(option, group.key)
        end)
    end
    self.optionPanel.Visible = true
    self:_paintChips(true)
end

function Gallery:_matches(item)
    for key, pick in self.picks do
        if pick ~= "All" and item.values[key] ~= pick then
            return false
        end
    end
    if self.query == "" then
        return true
    end
    return string.find(item.searchName, self.query, 1, true) ~= nil
end

function Gallery:_applyFilter()
    table.clear(self.matches)
    for _, item in self.items do
        if self:_matches(item) then
            table.insert(self.matches, item)
        end
    end
    self.body.Text = (string.gsub(locale.resolve(self.text), "{count}", tostring(#self.matches)))

    for _, tile in self.tiles do
        tile.frame:Destroy()
    end
    table.clear(self.tiles)
    self.shownCount = 0
    self:_showUpTo(self.pageSize)
end

function Gallery:_showUpTo(count)
    count = math.min(count, #self.matches)
    for index = self.shownCount + 1, count do
        table.insert(self.tiles, self:_buildTile(self.matches[index], index))
    end
    self.shownCount = count
    self.more.Visible = count < #self.matches
end

function Gallery:_buildTile(item, order)
    local theme = self.window.theme
    local rarity = item.color
    local shown = self.shown

    -- the card itself stays neutral; the rarity colour only rises from the bottom edge and
    -- names the tier under the item, so a page of mixed rarities reads calm, not like a rainbow
    local frame = make("TextButton", {
        Name = item.name,
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        BackgroundColor3 = theme.StatBackground,
        LayoutOrder = order,
        BackgroundTransparency = if shown then 0 else 1,

        Parent = self.grid,
    })

    make("UICorner", {
        CornerRadius = UDim.new(0, 10),

        Parent = frame,
    })

    local stroke = make("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Transparency = if shown then strokeRest else 1,

        Parent = frame,
    })

    local scale = make("UIScale", { Parent = frame })

    local glow
    if rarity then
        glow = make("Frame", {
            Name = "Glow",
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundColor3 = rarity,
            BackgroundTransparency = if shown then 0 else 1,

            Parent = frame,
        })

        -- ClipsDescendants cuts to the box, not the rounding, so the glow needs its own corners
        make("UICorner", {
            CornerRadius = UDim.new(0, 10),

            Parent = glow,
        })

        make("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 1),
                NumberSequenceKeypoint.new(1, 0.78),
            }),

            Parent = glow,
        })
    end

    local image = make("ImageLabel", {
        Name = "Image",
        Image = item.image or "",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 10),
        Size = UDim2.new(1, -24, 1, -(labelHeight + 14)),
        ScaleType = Enum.ScaleType.Fit,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ImageTransparency = if shown then 0 else 1,
        ZIndex = 2,

        Parent = frame,
    })

    local label = make("TextLabel", {
        Name = "Label",
        Text = item.name,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, if item.category then -22 else -10),
        Size = UDim2.new(1, -14, 0, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 13,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextColor3 = theme.TitlingColor,
        FontFace = theme.TitleFont,
        TextTransparency = if shown then 0 else 1,
        ZIndex = 2,

        Parent = frame,
    })

    local sub
    if item.category then
        sub = make("TextLabel", {
            Name = "Rarity",
            Text = item.category,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, -8),
            Size = UDim2.new(1, -14, 0, 13),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = 11,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextColor3 = rarity or theme.ContentColor,
            FontFace = theme.Font,
            TextTransparency = if shown then subShown else 1,
            ZIndex = 2,

            Parent = frame,
        })
    end

    local tag
    if item.tag then
        tag = make("TextLabel", {
            Name = "Tag",
            Text = item.tag,
            Position = UDim2.fromOffset(7, 7),
            Size = UDim2.fromOffset(0, 16),
            AutomaticSize = Enum.AutomaticSize.X,
            BorderSizePixel = 0,
            BackgroundColor3 = item.tagColor or theme.AccentColor,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 10,
            FontFace = theme.TitleFont,
            BackgroundTransparency = if shown then 0 else 1,
            TextTransparency = if shown then 0 else 1,
            ZIndex = 3,

            Parent = frame,
        })

        make("UICorner", {
            CornerRadius = UDim.new(1, 0),

            Parent = tag,
        })

        make("UIPadding", {
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),

            Parent = tag,
        })
    end

    frame.MouseEnter:Connect(function()
        variables.tweenService:Create(stroke, hoverInfo, { Transparency = strokeHover }):Play()
        variables.tweenService:Create(scale, hoverInfo, { Scale = 1.03 }):Play()
    end)
    frame.MouseLeave:Connect(function()
        variables.tweenService:Create(stroke, hoverInfo, { Transparency = strokeRest }):Play()
        variables.tweenService:Create(scale, hoverInfo, { Scale = 1 }):Play()
    end)
    frame.MouseButton1Click:Connect(function()
        hapticEngine.click()
        scale.Scale = 0.96
        variables.tweenService:Create(scale, pressInfo, { Scale = 1 }):Play()
        if type(self.callback) == "function" then
            task.spawn(self.callback, item.source)
        end
    end)

    return { frame = frame, stroke = stroke, glow = glow, image = image, label = label, sub = sub, tag = tag }
end

-- Swap the whole list. Each item is { name, image, category?, tag?, tagColor?, color? }; the
-- callback gets the table back as passed, so scripts can hang their own fields on it.
function Gallery:SetItems(items)
    table.clear(self.items)
    local keys = { category = true }
    for _, group in self.filterGroups or {} do
        keys[tostring(group.key or group.Key or "category")] = true
    end
    for _, source in items do
        if type(source) == "table" then
            local name = tostring(source.name or source.Name or "")
            local category = source.category or source.Category
            -- what each filter group reads off the item, looked up once here
            local values = {}
            local searchName = lower(name)
            for key in keys do
                local value = source[key]
                if value == nil then
                    value = source[string.upper(string.sub(key, 1, 1)) .. string.sub(key, 2)]
                end
                if value ~= nil then
                    values[key] = tostring(value)
                    searchName ..= " " .. lower(value)
                end
            end
            table.insert(self.items, {
                source = source,
                name = name,
                values = values,
                searchName = searchName,
                image = source.image or source.Image,
                category = category,
                tag = source.tag or source.Tag,
                tagColor = source.tagColor or source.TagColor,
                color = source.color or source.Color,
            })
        end
    end
    self:_rebuildChips()
    self:_applyFilter()
end

-- Pick an option in a group (the first group when key is left out); "All" clears it.
function Gallery:SetFilter(option, key)
    key = key or (self.groups[1] and self.groups[1].key) or "category"
    self.picks[key] = tostring(option)
    self:_closeOptions()
    self:_paintChips(true)
    self:_applyFilter()
end

function Gallery:SetSearch(text)
    self.search.Text = tostring(text or "")
end

function Gallery:_setShown(shown, animate)
    self.shown = shown
    if shown then
        self.window:_revealCommon(self, animate)
    else
        self.window:_hideCommon(self, animate)
    end

    local window = self.window
    local theme = window.theme
    local opacity = if shown then 0 else 1
    window:_reveal(self.field, { BackgroundTransparency = if shown then theme.FieldTransparency else 1 }, animate)
    window:_reveal(self.search, { TextTransparency = opacity }, animate)
    window:_reveal(self.searchIcon, { ImageTransparency = if shown then 0.5 else 1 }, animate)
    window:_reveal(self.body, { TextTransparency = if shown then bodyShown else 1 }, animate)
    window:_reveal(self.more, {
        BackgroundTransparency = if shown then theme.FieldTransparency else 1,
        TextTransparency = opacity,
    }, animate)
    self:_paintChips(animate)

    for _, tile in self.tiles do
        window:_reveal(tile.frame, { BackgroundTransparency = opacity }, animate)
        window:_reveal(tile.stroke, { Transparency = if shown then strokeRest else 1 }, animate)
        window:_reveal(tile.glow, { BackgroundTransparency = opacity }, animate)
        window:_reveal(tile.image, { ImageTransparency = opacity }, animate)
        window:_reveal(tile.label, { TextTransparency = opacity }, animate)
        window:_reveal(tile.sub, { TextTransparency = if shown then subShown else 1 }, animate)
        if tile.tag then
            window:_reveal(tile.tag, { BackgroundTransparency = opacity, TextTransparency = opacity }, animate)
        end
    end
end

moveable(Gallery)

return Gallery
