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

		local progress2 = 0
		local progresstext2 = a:Log({
			Color = Color3.fromRGB(255,255,255);
			Content = "Progress: "..progress2.."%\n[▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁]";
		})

		local s,x = pcall(function()
			for i, p in pairs(map) do
				local part = parts[i]
				server:InvokeServer("SyncColor", {{["Color"] = Color3.fromRGB(unpack(p.color)), ["Part"] = part, ["UnionColoring"] = true}})
				server:InvokeServer("SyncResize", {{["CFrame"] = CFrame.new(unpack(p.cframe)), ["Part"] = part, ["Size"] = Vector3.new(unpack(p.size))}})
				if p.surface then
					server:InvokeServer("SyncSurface", {{["Part"] = part, ["Surfaces"] = p.surface}})
				end
				server:InvokeServer("SyncMaterial", {{["Part"] = part, ["Material"] = p.texture, ["Transparency"] = p.transparency, ["Reflectance"]=p.reflectance}})
				server:InvokeServer("SyncRotate", {{["CFrame"] = CFrame.new(unpack(p.cframe)), ["part"] = part}})
				server:InvokeServer("SyncAnchor", {{["Anchored"] = p.anchored, ["Part"] = part}})
				server:InvokeServer("SetLocked", {part}, true)
				server:InvokeServer("SyncCollision", {{["CanCollide"] = p.cancollide, ["Part"] = part}})
				if p.decal then
					server:InvokeServer("CreateTextures", {{["Face"] = p.decal.face, ["Part"] = part, ["TextureType"] = "Decal"}})
					server:InvokeServer("SyncTexture", {{["Face"] = p.decal.face, ["Part"] = part, ["Texture"] = p.decal.texture, ["Transparency"] = p.decal.transparency, ["TextureType"] = "Decal"}})
				end
				if p.mesh then
					server:InvokeServer("CreateMeshes", {{["Part"] = part}})
					server:InvokeServer("SyncMesh", {{["Part"] = part, ["TextureId"] = p.mesh.texture, ["VertexColor"] = Vector3.new(unpack(p.mesh.vertexcolor)), ["MeshType"] = p.mesh.meshtype, ["Scale"] = Vector3.new(unpack(p.mesh.scale)), ["Offset"] = Vector3.new(unpack(p.mesh.offset))}})
					if p.mesh.meshtype == Enum.MeshType.FileMesh then
						server:InvokeServer("SyncMesh", {{["Part"] = part, ["MeshId"] = p.mesh.meshid}})
					end
				end
				progress2 = i
				local percentage2 = math.floor((progress2 / total) * 100)
				progresstext2:Edit({
					Color = progresstext2:GetColor();
					Content = "Progress: "..percentage2.."%\n"..getvisualbar(progress2, total, 20);
				})
				rs.Heartbeat:Wait()
			end
		end)

		if not s then
			a:Log({
				Color = Color3.fromRGB(255, 65, 65);
				Content = "[ERROR]: "..x
			})
		else
			a:Log({
				Color = Color3.fromRGB(84, 255, 84);
				Content = "Done! (you can close this now)"
			})
		end
		a:Complete()
	end
end

return buildloader
