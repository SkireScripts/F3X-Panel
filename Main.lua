local ui = loadstring(game:HttpGet("https://pastebin.com/raw/KyAgbvAk"))()
local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local char = plrs.LocalPlayer.Character or plrs.LocalPlayer.CharacterAdded:Wait()
local tool = nil
local server = nil

getgenv().settings = {
    ["loop kill"] = false;
    ["rain"] = false;
}

local panel = ui:Window({
    Name = "F3X Panel",
    Title = "<font color=\"#ffb31a\">F3X</font> Panel",
    Hidden = false,
    Key = Enum.KeyCode.Insert
})
local builds = panel:AddTab({
    Name = "Builds",
    Icon = "7072706318",
    Selected = true
})
local players = panel:AddTab({
    Name = "Players",
    Icon = "7072724538",
    Selected = false
})

-- // idk

local function getserver()
    pcall(function()
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("SyncAPI") and v.SyncAPI:FindFirstChild("ServerEndpoint") then
                    tool = v
                    server = v.SyncAPI.ServerEndpoint
                end
            end
            if not server then
                for _, v in pairs(plrs.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v:FindFirstChild("SyncAPI") and v.SyncAPI:FindFirstChild("ServerEndpoint") then
                        tool = v
                        server = v.SyncAPI.ServerEndpoint
                    end
                end
            end
        end
    end)
end

rs.Stepped:Connect(function()
    getserver()
end)

plrs.LocalPlayer.CharacterAdded:Connect(function(a)
    tool = nil
    server = nil
end)

-- // functions

local function getplayer(str)
    for _, v in pairs(plrs:GetPlayers()) do
        if v.Name:lower():match(str:lower()) then
            return v
        end
        if v.DisplayName:lower():match(str:lower()) then
            return v
        end
    end
    return nil
end

local function killplayer(target)
    if target and server then
        if typeof(target) ~= "string" then
            pcall(function()
                server:InvokeServer("Remove", {target.Character.Head})
            end)
        elseif target == "others" then
            for _, plr in pairs(plrs:GetPlayers()) do
                if plr ~= plrs.LocalPlayer then
                    pcall(function()
                        server:InvokeServer("Remove", {plr.Character.Head})
                    end)
                end
            end
        elseif target == "all" then
            for _, plr in pairs(plrs:GetPlayers()) do
                pcall(function()
                    server:InvokeServer("Remove", {plr.Character.Head})
                end)
            end
        end
    else
        if not target then print("target is nil") end
        if not server then print("server is nil") end
    end
end

-- // players tab

local ats = players:Section({Name = "Admin type shit"})
local target = ""

ats:Input({
    Name = "Target",
    ClearOnFocus = false,
    PlaceHolder = "User",
    Text = "",
    Callback = function(t)
        target = getplayer(t:lower())
        if target == nil then
            target = t:lower()
        end
    end
})

ats:Button({
    Name = "Kill",
    Callback = function()
        killplayer(target)
    end
})

ats:Toggle({
    Name = "Loop kill",
    Enabled = false,
    Callback = function(b)
        getgenv().settings["loop kill"] = b
        while true do wait()
             if getgenv().settings["loop kill"] then
               killplayer(target)
            end
        end
    end
})
