local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Panel.lua"))()
local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local char = plrs.LocalPlayer.Character or plrs.LocalPlayer.CharacterAdded:Wait()
local server = nil

getgenv().settings = {
    ["loop kill"] = false;
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

local function loadmap(map)
	pcall(function()
        local parts = {}
        local track = game.Workspace.ChildAdded:Connect(function(part)
            parts[#parts+1] = part
        end)
        local ci = 0
        local function mapper(b)
            for i, part in pairs(map) do
                if i > ci then
                    ci+=1
                    local partType = part.shape
                    if part.shape == "Block" then partType = "Normal" end
                    server:InvokeServer("CreatePart", partType, CFrame.new(unpack(part.cframe)), game.Workspace)
                end
            end
            if b then mapper() end
        end
        mapper(true)
        track:Disconnect()
        for i,p in pairs(map) do
            local part = parts[i]
            server:InvokeServer("SyncColor", {{["Color"] = Color3.fromRGB(unpack(p.color)), ["Part"] = part, ["UnionColoring"] = true}})
            server:InvokeServer("SyncResize", {{["CFrame"] = CFrame.new(unpack(p.cframe)), ["Part"] = part, ["Size"] = Vector3.new(unpack(p.size))}})
            if p.surface then
                server:InvokeServer("SyncSurface", {{["Part"] = part, ["Surfaces"] = p.surface}})
            end
            server:InvokeServer("SyncMaterial", {{["Part"] = part, ["Material"] = p.texture, ["Transparency"] = p.transparency, ["Reflectance"]=p.reflectance}})
            server:InvokeServer("SyncRotate", {{["CFrame"]=CFrame.new(unpack(p.cframe)),["part"]=part}})
            server:InvokeServer("SyncAnchor", {{["Anchored"]=p.anchored,["Part"]=part}})
            server:InvokeServer("SetLocked", {part}, p.locked)
            server:InvokeServer("SyncCollision",{{["CanCollide"]=p.cancollide,["Part"]=part}})
            if p.decal then
                server:InvokeServer("CreateTextures", {{["Face"]=p.decal.face,["Part"]=part,["TextureType"]="Decal"}})
                server:InvokeServer("SyncTexture", {{["Face"]=p.decal.face,["Part"]=part,["Texture"]=p.decal.texture,["Transparency"]=p.decal.transparency,["TextureType"]="Decal"}})
            end
            if p.mesh then
                server:InvokeServer("CreateMeshes", {{["Part"]=part}})
                server:InvokeServer("SyncMesh", {{["Part"]=part,["TextureId"]=p.mesh.texture,["VertexColor"]=Vector3.new(unpack(p.mesh.vertexcolor)),["MeshType"]=p.mesh.meshtype,["Scale"]=Vector3.new(unpack(p.mesh.scale)),["Offset"]=Vector3.new(unpack(p.mesh.offset))}})
                if p.mesh.meshtype == Enum.MeshType.FileMesh then
                    server:InvokeServer("SyncMesh", {{["Part"]=part,["MeshId"]=p.mesh.meshid}})
                end
            end
        end
    end)
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
        loadmap(loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/maps/skybox"))():load(id))
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
            loadmap(loadstring(readfile("f3x maps/"..name))())
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
		loadmap(loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/maps/tree-house.lua"))())
	end
})

maps:Button({
	Name = "Tower";
	Callback = function()
		loadmap(loadstring(game:HttpGet("https://pastebin.com/raw/2bnc2AED"))())
	end
})

maps:Button({
	Name = "Doomspire";
	Callback = function()
		loadmap(loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/maps/doomspire.lua"))())
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
		loadmap(loadstring(game:HttpGet(url))())
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
