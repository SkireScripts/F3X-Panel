local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Panel.lua"))()
local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local char = plrs.LocalPlayer.Character or plrs.LocalPlayer.CharacterAdded:Wait()
local tool = nil
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
local function createPart(parts, position, size, color, material, transparency, surfaceType, isSpawn, decalId)
	local partType = isSpawn and "Spawn" or "Normal"
	server:InvokeServer("CreatePart", partType, CFrame.new(unpack(position)), game.Workspace) task.wait()
	server:InvokeServer("SyncColor", {{["Color"] = Color3.fromRGB(unpack(color)), ["Part"] = parts[#parts], ["UnionColoring"] = true}})
	server:InvokeServer("SyncResize", {{["CFrame"] = CFrame.new(unpack(position)), ["Part"] = parts[#parts], ["Size"] = Vector3.new(unpack(size))}})

	if surfaceType then
		server:InvokeServer("SyncSurface", {{["Part"] = parts[#parts], ["Surfaces"] = surfaceType}})
	end

	server:InvokeServer("SyncMaterial", {{["Part"] = parts[#parts], ["Material"] = material, ["Transparency"] = transparency or 0}})
end

-- // builds tab

local maps = builds:Section({Name = "Maps"})


maps:Button({
	Name = "Logs House";
	Callback = function()
		local parts = {}
		local a = game.Workspace.ChildAdded:Connect(function(part)
			parts[#parts+1]=part
		end)

		local logs_house = {
			{position = {94.21, 731, -256.415}, size = {200, 1, 200}, color = {75, 151, 75}, texture = "Plastic", surface = {["Back"] = Enum.SurfaceType.Studs, ["Bottom"] = Enum.SurfaceType.Studs, ["Front"] = Enum.SurfaceType.Studs, ["Left"] = Enum.SurfaceType.Studs, ["Right"] = Enum.SurfaceType.Studs, ["Top"] = Enum.SurfaceType.Studs}},
			{position = {99.529, 731.45, -265.385}, size = {26.596, 0.9, 30.143}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {110.018, 737.845, -250.963}, size = {5.251, 12.889, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {99.513, 743.551, -250.963}, size = {26.26, 4.132, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {89.018, 737.845, -250.963}, size = {5.251, 12.889, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {99.652, 733.56, -250.963}, size = {25.983, 4.319, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {89.018, 737.845, -279.963}, size = {5.251, 12.889, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {110.018, 737.845, -279.963}, size = {5.251, 12.889, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {99.513, 743.551, -279.963}, size = {26.26, 4.132, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {99.652, 733.56, -279.963}, size = {25.983, 4.319, 1.003}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {112.087, 738.533, -265.935}, size = {1.112, 14.266, 29.059}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {86.946, 738.533, -274.6}, size = {1.141, 14.266, 11.729}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {86.946, 743.31, -265.443}, size = {1.141, 4.713, 30.044}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {86.946, 738.617, -256.264}, size = {1.141, 14.098, 11.687}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {99.518, 745.382, -265.527}, size = {26.085, 0.715, 29.716}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {99.653, 738.354, -250.982}, size = {16.277, 6.269, 0.164}, color = {255, 255, 255}, texture = "Plastic", transparency = 0.9},
			{position = {99.653, 738.354, -279.893}, size = {16.277, 6.269, 0.164}, color = {255, 255, 255}, texture = "Plastic", transparency = 0.9},
			{position = {74.905, 732.596, -275.768}, size = {0.309, 3.086, 0.254}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {75.06, 734.871, -275.359}, size = {2.571, 1.889, 0.356}, color = {124, 92, 70}, texture = "WoodPlanks"},
			{position = {23.039, 732, -264.64}, size = {10, 1, 9}, color = {255, 255, 255}, texture = "Plastic", transparency = 0.5, part = "Spawn"}
		}

		for _, d in ipairs(logs_house) do
			createPart(parts, d.position, d.size, d.color, d.texture, d.transparency, d.surface, d.part == "Spawn", d.decal)
		end
		
		a:Disconnect()
		
		task.wait(1)
		
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v:IsA("Part") or v:IsA("SpawnLocation") then
				if not table.find(parts,v) then
					for _,plr in pairs(plrs:GetPlayers()) do
						if v.Parent ~= plr.Character then
							server:InvokeServer("Remove",{v})
						end
					end
				end
			end
		end
	end
})

maps:Button({
	Name = "Backrooms";
	Callback = function()
		local parts = {}
		local a = game.Workspace.ChildAdded:Connect(function(part)
			parts[#parts+1]=part
		end)

		local nds = loadstring(game:HttpGet("https://pastebin.com/raw/309Ky6M8"))()

		for _, d in ipairs(nds) do
			createPart(parts, d.position, d.size, d.color, d.texture, d.transparency, d.surface, d.part == "Spawn", d.decal)
		end

		a:Disconnect()

		task.wait(1)

		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v:IsA("Part") or v:IsA("SpawnLocation") then
				if not table.find(parts,v) then
					for _,plr in pairs(plrs:GetPlayers()) do
						if v.Parent ~= plr.Character then
							server:InvokeServer("Remove",{v})
						end
					end
				end
			end
		end
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
