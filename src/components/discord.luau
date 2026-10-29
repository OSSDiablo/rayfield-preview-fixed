--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- A Discord invite on a card: the server's icon, its name, how many are in it, a line of copy
-- and a Join Server button. The name, icon and counts come from Discord's public invite lookup,
-- so the card shows the real server without the script spelling any of it out; until that lands
-- (or where the executor can't reach Discord) it shows what the script passed in.

local Discord = {}
Discord.__index = Discord
Discord.__type = "Discord"

local utility = script.Parent.Parent.utility
local moveable = require(utility.moveable)
local locale = require(utility.locale)
local network = require(utility.network)
local variables = require(utility.variables)
local imageCache = require(utility.imageCache)
local hapticEngine = require(utility.HapticEngine)

local iconSize = 64
local buttonHeight = 40
local bodyShown = 0.45
local blurple = Color3.fromRGB(88, 101, 242)
local buttonColor = Color3.fromRGB(255, 255, 255)
local buttonHover = Color3.fromRGB(226, 226, 230)

local inviteEndpoint = "https://discord.com/api/v10/invites/%s?with_counts=true"
local iconEndpoint = "https://cdn.discordapp.com/icons/%s/%s.png?size=128"
local rpcEndpoint = "http://127.0.0.1:6463/rpc?v=1"

local defaultText = "Join our Discord to report bugs, give suggestions or ask a question!"

local function inviteCode(invite: string): string
    return string.match(invite, "discord%.gg/([%w%-_]+)")
        or string.match(invite, "discord%.com/invite/([%w%-_]+)")
        or string.match(invite, "^([%w%-_]+)$")
        or invite
end

-- 18006 -> 18,006
local function withCommas(value: number): string
    local text = tostring(math.floor(value))
    local formatted
    repeat
        text, formatted = string.gsub(text, "^(%d+)(%d%d%d)", "%1,%2")
    until formatted == 0
    return text
end

local function copyToClipboard(text: string): boolean
    local env = getfenv()
    local clipboard = (env.getgenv and env.getgenv().setclipboard) or env.setclipboard or env.toclipboard
    if type(clipboard) ~= "function" then
        return false
    end
    return (pcall(clipboard, text))
end

local function fetchInvite(code: string)
    local ok, body = pcall(function()
        return game:HttpGet(string.format(inviteEndpoint, code))
    end)
    if not ok or type(body) ~= "string" then
        return nil
    end
    local decoded, parsed = pcall(function()
        return variables.httpService:JSONDecode(body)
    end)
    if not decoded or type(parsed) ~= "table" or type(parsed.guild) ~= "table" then
        return nil
    end
    return parsed
end

-- Ask a running Discord desktop client to open the invite. Only the desktop app listens on this
-- port, so on a phone or without the app this quietly does nothing and the copied link is what
-- the player is left with.
local function openInClient(code: string): boolean
    local request = network.getRequestFn()
    if not request then
        return false
    end
    local ok, response = pcall(request, {
        Url = rpcEndpoint,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json", Origin = "https://discord.com" },
        Body = variables.httpService:JSONEncode({
            cmd = "INVITE_BROWSER",
            nonce = variables.httpService:GenerateGUID(false),
            args = { code = code },
        }),
    })
    return ok and type(response) == "table" and response.StatusCode == 200
end

function Discord.new(tab, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local invite = tostring(properties.invite or properties.Invite or "")
    local self = setmetatable({
        tab = assert(tab, "Missing argument #1 (Tab expected)"),
        window = tab.window,
        invite = invite,
        code = inviteCode(invite),
        name = tostring(properties.name or properties.Name or "Discord"),
        text = tostring(properties.text or properties.Text or defaultText),
        buttonText = tostring(properties.buttonText or properties.ButtonText or "Join Server"),
        callback = properties.callback or properties.Callback,
        showMembers = properties.showMembers ~= false and properties.ShowMembers ~= false,
        shown = false,
    }, Discord)

    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        Name = "Discord",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),

        -- Animation
        BackgroundTransparency = 1, -- In = ElementTransparency

        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })

    self.stroke = self.window:StyleElementBody(self.main)

    self.window:Create("UIPadding", {
        PaddingTop = UDim.new(0, 16),
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 14),
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.main,
    })

    -- icon on the left, name, count and copy stacked beside it
    local header = self.window:Create("Frame", {
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 1,

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 14),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,

        Parent = header,
    })

    -- blurple tile with the Discord mark until the server's own icon arrives and replaces both
    self.serverIcon = self.window:Create("ImageLabel", {
        Name = "ServerIcon",
        Size = UDim2.fromOffset(iconSize, iconSize),
        BorderSizePixel = 0,
        BackgroundColor3 = blurple,
        ScaleType = Enum.ScaleType.Crop,
        Image = "",
        LayoutOrder = 1,

        -- Animation
        BackgroundTransparency = 1,
        ImageTransparency = 1,

        Parent = header,
    })

    self.window:Create("UICorner", {
        CornerRadius = UDim.new(0, 16),

        Parent = self.serverIcon,
    })

    self.mark = self.window:Create("ImageLabel", {
        Name = "Mark",
        Image = imageCache.discordIcon() or "",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(34, 34),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ImageColor3 = Color3.fromRGB(255, 255, 255),

        -- Animation
        ImageTransparency = 1,

        Parent = self.serverIcon,
    })

    local info = self.window:Create("Frame", {
        Name = "Info",
        Size = UDim2.new(1, -(iconSize + 14), 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 2,

        Parent = header,
    })

    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 3),
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = info,
    })

    local function label(order, text, size, bindings)
        return self.window:Create("TextLabel", {
            Text = text,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            RichText = true,
            TextSize = size,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = order,

            -- Animation
            TextTransparency = 1,

            Parent = info,
        }, bindings)
    end

    -- named title so the shared reveal fades it with the card
    self.title = label(1, self.name, 17, { TextColor3 = "TitlingColor", FontFace = "Font" })
    self.members = label(2, "", 14, { TextColor3 = "ContentColor", FontFace = "Font" })
    self.members.Visible = false
    self.body = label(3, locale.t(self.text), 14, { TextColor3 = "ContentColor", FontFace = "Font" })

    self.button = self.window:Create("TextButton", {
        Name = "Join",
        Text = locale.t(self.buttonText),
        Size = UDim2.new(1, 0, 0, buttonHeight),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        BackgroundColor3 = buttonColor,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 16,
        LayoutOrder = 2,

        -- Animation
        BackgroundTransparency = 1,
        TextTransparency = 1,

        Parent = self.main,
    }, { FontFace = "Font" })

    self.window:Create("UICorner", {
        CornerRadius = UDim.new(0, 10),

        Parent = self.button,
    })

    self.window:ConnectFor(self, self.button.MouseEnter, function()
        variables.tweenService:Create(self.button, TweenInfo.new(0.15), { BackgroundColor3 = buttonHover }):Play()
    end)
    self.window:ConnectFor(self, self.button.MouseLeave, function()
        variables.tweenService:Create(self.button, TweenInfo.new(0.15), { BackgroundColor3 = buttonColor }):Play()
    end)
    self.window:ConnectFor(self, self.button.MouseButton1Click, function()
        hapticEngine.click()
        self:Join()
    end)

    task.spawn(function()
        self:Refresh()
    end)

    return self
end

-- Copy the invite and try to open it in the Discord app.
function Discord:Join()
    local link = if string.find(self.invite, "^https?://") then self.invite else "https://discord.gg/" .. self.code
    local copied = copyToClipboard(link)
    local opened = openInClient(self.code)
    if opened then
        self.window:Toast({ title = "Opened in Discord", subtitle = "Accept the invite in the app" })
    elseif copied then
        self.window:Toast({ title = "Invite copied", subtitle = "Paste it in your browser or Discord" })
    else
        self.window:Toast({ title = link, subtitle = "Your executor can't copy, type it in instead" })
    end
    if type(self.callback) == "function" then
        task.spawn(self.callback, link)
    end
end

-- Pull the server's name, icon and counts again.
function Discord:Refresh()
    local data = fetchInvite(self.code)
    if not data or not self.main.Parent then
        return
    end
    local guild = data.guild

    if type(guild.name) == "string" then
        self.name = guild.name
        self.title.Text = guild.name
    end

    local total = data.approximate_member_count
    if self.showMembers and type(total) == "number" then
        local line = "Member Count : " .. withCommas(total)
        if type(data.approximate_presence_count) == "number" then
            line ..= "  ·  Online : " .. withCommas(data.approximate_presence_count)
        end
        self.members.Text = line
        self.members.Visible = true
    end

    if type(guild.id) == "string" and type(guild.icon) == "string" then
        local uri = imageCache.remote(
            "discord_" .. guild.id .. "_" .. guild.icon,
            string.format(iconEndpoint, guild.id, guild.icon)
        )
        if uri and self.main.Parent then
            -- no tile behind a real icon: its anti-aliased rim let the tile colour show as a
            -- thin outline round the corners
            self.iconLoaded = true
            self.serverIcon.Image = uri
            self.serverIcon.BackgroundTransparency = 1
            self.mark.Visible = false
        end
    end
end

function Discord:_setShown(shown, animate)
    self.shown = shown
    if shown then
        self.window:_revealCommon(self, animate)
    else
        self.window:_hideCommon(self, animate)
    end

    local window = self.window
    local opacity = if shown then 0 else 1
    window:_reveal(self.serverIcon, {
        BackgroundTransparency = if self.iconLoaded then 1 else opacity,
        ImageTransparency = opacity,
    }, animate)
    window:_reveal(self.mark, { ImageTransparency = opacity }, animate)
    window:_reveal(self.members, { TextTransparency = if shown then bodyShown else 1 }, animate)
    window:_reveal(self.body, { TextTransparency = if shown then bodyShown else 1 }, animate)
    window:_reveal(self.button, { BackgroundTransparency = opacity, TextTransparency = opacity }, animate)
end

moveable(Discord)

return Discord
