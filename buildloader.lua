local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local char = plrs.LocalPlayer.Character or plrs.LocalPlayer.CharacterAdded:Wait()
local term = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Terminal.lua"))()
local buildloader = {}

function buildloader:LoadBuild(map, server)
	local a = term:Window("Build Loader v1.3")
	local parts = {}
	local track = game.Workspace.ChildAdded:Connect(function(part)
		parts[#parts+1] = part
	end)
	local ci = 0
	local total = 0
	local progress = 0
	a:Log({
		Color = Color3.fromRGB(255,255,255);
		Content = "Mapping build...";
	})
	local progresstext = a:Log({
		Color = Color3.fromRGB(255,255,255);
		Content = "Progress: "..progress.."%\n[▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁]";
	})
	for i,v in pairs(map) do total += 1 end

	local function getvisualbar(progress, total, bar)
		local perc = progress / total
		local fill = math.floor(bar * perc)
		local empty = bar - fill

		local filled = string.rep("▇", fill)
		local empty2 = string.rep("▁", empty)

		return string.format("[%s%s]", filled, empty2)
	end

	local time = tick()
	local s,x = pcall(function()
		local function mapper()
			for i, part in pairs(map) do
				if i > ci then
					ci += 1
					local partType = part.shape
					if part.shape == "Block" then partType = "Normal" end
					server:InvokeServer("CreatePart", partType, CFrame.new(unpack(part.cframe)), game.Workspace)
					progress = ci
					local percentage = math.floor((progress / total) * 100)
					progresstext:Edit({
						Color = progresstext:GetColor();
						Content = "Progress: "..percentage.."%\n"..getvisualbar(progress, total, 20);
					})
					rs.Heartbeat:Wait()
				end
			end
		end
		mapper()
	end)
	track:Disconnect()
	if not s then
		a:Log({
			Color = Color3.fromRGB(255, 65, 65);
			Content = "[ERROR]: "..x
		})
		a:Complete()
	else
		a:Log({
			Color = Color3.fromRGB(255,255,255);
			Content = "Done Mapping!";
		})
		server:InvokeServer("CreateGroup", "Model", game.Workspace, parts)
		a:Log({
			Color = Color3.fromRGB(255,255,255);
			Content = "Setting Properties...";
		})
	
		local properties = {
			Colors = {},
			Resize = {},
			Surface = {},
			Material = {},
			Rotate = {},
			Anchor = {},
			Locked = {},
			Collision = {},
			Decal = {},
			SyncDecal = {},
			Mesh = {},
			SyncMesh = {}
		}
		
		for i, p in pairs(map) do
			local part = parts[i]
			properties.Colors[#properties.Colors+1] = {["Color"] = Color3.fromRGB(unpack(p.color)), ["Part"] = part, ["UnionColoring"] = true}
			properties.Resize[#properties.Resize+1] = {["CFrame"] = CFrame.new(unpack(p.cframe)), ["Part"] = part, ["Size"] = Vector3.new(unpack(p.size))}
			if p.surface then
				properties.Surface[#properties.Surface+1] = {["Part"] = part, ["Surfaces"] = p.surface}
			end
			properties.Material[#properties.Material+1] = {["Part"] = part, ["Material"] = p.texture, ["Transparency"] = p.transparency, ["Reflectance"] = p.reflectance}
			properties.Rotate[#properties.Rotate+1] = {["CFrame"] = CFrame.new(unpack(p.cframe)), ["Part"] = part}
			properties.Anchor[#properties.Anchor+1] = {["Anchored"] = p.anchored, ["Part"] = part}
			properties.Locked[#properties.Locked+1] = part
			properties.Collision[#properties.Collision+1] = {["CanCollide"] = p.cancollide, ["Part"] = part}
			if p.decal then
				properties.Decal[#properties.Decal+1] = {["Face"] = p.decal.face, ["Part"] = part, ["TextureType"] = "Decal"}
				properties.SyncDecal[#properties.SyncDecal+1] = {["Face"] = p.decal.face, ["Part"] = part, ["Texture"] = p.decal.texture, ["Transparency"] = p.decal.transparency, ["TextureType"] = "Decal"}
			end
			if p.mesh then
				local meshProps = {
					["Part"] = part,
					["TextureId"] = p.mesh.texture,
					["VertexColor"] = Vector3.new(unpack(p.mesh.vertexcolor)),
					["MeshType"] = p.mesh.meshtype,
					["Scale"] = Vector3.new(unpack(p.mesh.scale)),
					["Offset"] = Vector3.new(unpack(p.mesh.offset))
				}
				if p.mesh.meshtype == Enum.MeshType.FileMesh then
					meshProps["MeshId"] = p.mesh.meshid
				end
				properties.Mesh[#properties.Mesh+1] = {["Part"]=meshProps.Part}
				properties.SyncMesh[#properties.SyncMesh+1] = meshProps
			end
		end
		local s,x = pcall(function()
			server:InvokeServer("SyncColor", properties.Colors)
			server:InvokeServer("SyncResize", properties.Resize)
			server:InvokeServer("SyncSurface", properties.Surface)
			server:InvokeServer("SyncMaterial", properties.Material)
			server:InvokeServer("SyncRotate", properties.Rotate)
			server:InvokeServer("SyncAnchor", properties.Anchor)
			server:InvokeServer("SetLocked", properties.Locked, true)
			server:InvokeServer("SyncCollision", properties.Collision)
			server:InvokeServer("CreateTextures", properties.Decal)
			server:InvokeServer("SyncTexture", properties.SyncDecal)
			server:InvokeServer("CreateMeshes", properties.Mesh)
			server:InvokeServer("SyncMesh", properties.SyncMesh)
		end)
		
		local finish = tick()

		local elapsed = finish - time
		local ftime

		if elapsed < 60 then
			ftime = string.format("Finished in %.0fs", elapsed)
		elseif elapsed < 3600 then
			local minutes = math.floor(elapsed / 60)
			local seconds = elapsed % 60
			ftime = string.format("Finished in %dm %.0fs", minutes, seconds)
		else
			local hours = math.floor(elapsed / 3600)
			local minutes = math.floor((elapsed % 3600) / 60)
			ftime = string.format("Finished in %dh %dm", hours, minutes)
		end
		
		if not s then
			a:Log({
				Color = Color3.fromRGB(255, 65, 65);
				Content = "[IGNORABLE][ERROR]: "..x
			})
		end
		a:Log({
			Color = Color3.fromRGB(84, 255, 84);
			Content = "Done! | "..ftime
		})
		a:Complete()
	end
end

return buildloader
