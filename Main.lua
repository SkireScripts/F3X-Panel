local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Panel.lua"))()
local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local char = plrs.LocalPlayer.Character or plrs.LocalPlayer.CharacterAdded:Wait()
local server = nil

getgenv().settings = {
    ["loop kill"] = false;
    ["burn players"] = false;
    ["burn builds"] = false;
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
local misc = panel:AddTab({
	Name = "Misc",
	Icon = "7072723685",
	Selected = false
})
local Maps = panel:AddTab({
    Name = "Maps",
    Icon = "7072718631",
    Selected = false
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
            for _, v in pairs(char:GetDescendants()) do
                if v.Name == "SyncAPI" then
                    server = v:FindFirstChildWhichIsA("RemoteFunction")
                end
            end
            if not server then
                for _, v in pairs(plrs.LocalPlayer.Backpack:GetDescendants()) do
                    if v.Name == "SyncAPI" then
                        server = v:FindFirstChildWhichIsA("RemoteFunction")
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

local function loadbuild(map)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/buildloader.lua"))():LoadBuild(map, server)
end

-- // builds tab

local b = builds:Section({Name = "Basic"})
local id = ""
b:Input({
    Name = "Skybox id",
    ClearOnFocus = false,
    PlaceHolder = "rbxassetid",
    Text = "",
    Callback = function(t)
        id = t
    end
})

b:Button({
    Name = "SkyBox";
    Callback = function()
        loadbuild(loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/maps/skybox"))():load(id))
    end
})

-- // misc tab

local fire = misc:Section({Name = "Fire"})
local immune = "none"

fire:Input({
	Name = "Immune Player";
	Text = "none";
	PlaceHolder = "player";
	ClearOnFocus = false;
	Callback = function(t)
		immune = getplayer(t)
		if immune == nil then
			if t:lower() == "me" then
				immune = plrs.LocalPlayer
			elseif t:lower():match("no") then
				immune = "none"
			end
		end
	end
})

fire:Toggle({
	Name = "Burn all players";
	Enabled = false;
	Callback = function(bool)
		getgenv().settings["burn players"]=bool
		while getgenv().settings["burn players"] do wait()
			local parts = {}
			for i,v in pairs(plrs:GetPlayers()) do
				if typeof(immune) == "string" and immune == "none" then
					if v.Character then
						for _,b in pairs(v.Character:GetChildren()) do
							if b:IsA("Part") or b:IsA("MeshPart") then
								parts[#parts+1] = {
									["DecorationType"] = "Fire";
									["Part"] = b;
								}
							end
						end
					end
				else
					if v ~= immune then
						if v.Character then
							for _,b in pairs(v.Character:GetChildren()) do
								if b:IsA("Part") or b:IsA("MeshPart") then
									parts[#parts+1] = {
										["DecorationType"] = "Fire";
										["Part"] = b;
									}
								end
							end
						end
					end
				end
			end
			server:InvokeServer("CreateDecorations",parts)
			parts={}
		end
	end
})

fire:Toggle({
	Name = "Burn all builds";
	Enabled = false;
	Callback = function(bool)
		getgenv().settings["burn builds"]=bool
		while getgenv().settings["burn builds"] do wait()
			local parts = {}
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if not plrs:GetPlayerFromCharacter(v.Parent) then
					if v:IsA("Part") or v:IsA("SpawnLocation") or v:IsA("WedgePart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("Seat") or v:IsA("MeshPart") or v:IsA("VehicleSeat") then
						parts[#parts+1] = {
							["DecorationType"] = "Fire";
							["Part"] = v;
						}	
					end
				end
			end
			server:InvokeServer("CreateDecorations",parts)
			parts={}
		end
	end
})

-- // maps tab

local maps = Maps:Section({Name = "Maps"})
local custommap = Maps:Section({Name = "Custom Map"})
local savedmaps = Maps:Section({Name = "Saved Maps"})
local function addsaved(name)
    savedmaps:Button({
        Name = name;
        Callback = function()
            loadbuild(loadstring(readfile("f3x maps/"..name))())
        end
    })
end
if not isfolder("f3x maps") then makefolder("f3x maps") end
for i,v in pairs(listfiles("f3x maps")) do
    local filename = string.split(v,"/");filename=filename[#filename]
    addsaved(filename)
end

maps:Button({
	Name = "Tree House";
	Callback = function()
		loadbuild(loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/maps/tree-house.lua"))())
	end
})

maps:Button({
	Name = "Tower";
	Callback = function()
		loadbuild(loadstring(game:HttpGet("https://pastebin.com/raw/2bnc2AED"))())
	end
})

maps:Button({
	Name = "Doomspire";
	Callback = function()
		loadbuild(loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/maps/doomspire.lua"))())
	end
})

local url, name
custommap:Input({
    Name = "Custom Map",
    ClearOnFocus = false,
    PlaceHolder = "Map Source/Url",
    Text = "",
    Callback = function(t)
        url = t
    end
})
custommap:Button({
	Name = "Load Map";
	Callback = function()
		loadbuild(loadstring(game:HttpGet(url))())
	end
})
custommap:Input({
    Name = "Map Name",
    ClearOnFocus = false,
    PlaceHolder = "Map Name",
    Text = "",
    Callback = function(t)
        name = t
    end
})
custommap:Button({
	Name = "Save Map";
	Callback = function()
		if not isfolder("f3x maps") then makefolder("f3x maps") end
        writefile("f3x maps/"..name..".lua", game:HttpGet(url))
        addsaved(name..".lua")
    end
})

-- // players tab

local ats = players:Section({Name = "Player Controls"})
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
