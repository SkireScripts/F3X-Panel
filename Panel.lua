local ts = game:GetService("TweenService")
local ti = TweenInfo.new(0.1,Enum.EasingStyle.Linear)

local UI = {}

local function animate(o,i,props)
	ts:Create(o,i,props):Play()
end

function UI:Window(winconfig)
	local function initui()
		local G2L = {};

		-- StarterGui.Panel
		G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
		G2L["1"]["ResetOnSpawn"] = false;
		G2L["1"]["Name"] = winconfig.Name;

		-- StarterGui.Panel.UI
		G2L["2"] = Instance.new("Frame", G2L["1"]);
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
		G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		G2L["2"]["Size"] = UDim2.new(0, 379, 0, 267);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["2"]["Visible"] = not winconfig.Hidden;
		G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		G2L["2"]["Name"] = [[UI]];

		-- StarterGui.Panel.UI.UICorner
		G2L["3"] = Instance.new("UICorner", G2L["2"]);
		G2L["3"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.Panel.UI.side
		G2L["4"] = Instance.new("Frame", G2L["2"]);
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
		G2L["4"]["Size"] = UDim2.new(0, 112, 1, 0);
		G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["4"]["Name"] = [[side]];

		-- StarterGui.Panel.UI.side.UICorner
		G2L["5"] = Instance.new("UICorner", G2L["4"]);
		G2L["5"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.Panel.UI.side.cover
		G2L["6"] = Instance.new("Frame", G2L["4"]);
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
		G2L["6"]["Size"] = UDim2.new(0, 5, 1, 0);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Position"] = UDim2.new(1, -5, 0, 0);
		G2L["6"]["Name"] = [[cover]];

		-- StarterGui.Panel.UI.side.Header
		G2L["7"] = Instance.new("TextLabel", G2L["4"]);
		G2L["7"]["BorderSizePixel"] = 0;
		G2L["7"]["RichText"] = true;
		G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		G2L["7"]["TextSize"] = 14;
		G2L["7"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
		G2L["7"]["Size"] = UDim2.new(1, 0, 0, 26);
		G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["7"]["Text"] = winconfig.Title
		G2L["7"]["Name"] = [[Header]];
		G2L["7"]["BackgroundTransparency"] = 1;

		-- StarterGui.Panel.UI.side.Header.UIPadding
		G2L["8"] = Instance.new("UIPadding", G2L["7"]);
		G2L["8"]["PaddingLeft"] = UDim.new(0, 10);

		-- StarterGui.Panel.UI.side.tabs
		G2L["ts"] = Instance.new("ScrollingFrame", G2L["4"])
		G2L["ts"]["Size"] = UDim2.new(1,0,1,0)
		G2L["ts"]["Name"] = "tabs"
		G2L["ts"]["AutomaticSize"] = Enum.AutomaticSize.Y
		G2L["ts"]["CanvasSize"] = UDim2.new(0,0,0,0)
		G2L["ts"]["ScrollBarImageTransparency"] = 1
		G2L["ts"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
		G2L["ts"]["BackgroundTransparency"] = 1

		-- StarterGui.Panel.UI.side.tabs.UIListLayout
		G2L["ut"] = Instance.new("UIListLayout", G2L["ts"])
		G2L["ut"]["Padding"] = UDim.new(0,2)

		-- StarterGui.Panel.UI.side.tabs.UIPadding
		G2L["up"] = Instance.new("UIPadding", G2L["ts"])
		G2L["up"]["PaddingTop"] = UDim.new(0,26)

		-- StarterGui.Panel.UI.pages
		G2L["e"] = Instance.new("Frame", G2L["2"]);
		G2L["e"]["BorderSizePixel"] = 0;
		G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["e"]["BackgroundTransparency"] = 1;
		G2L["e"]["Size"] = UDim2.new(1, -112, 1, 0);
		G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["e"]["Position"] = UDim2.new(0, 112, 0, 0);
		G2L["e"]["Name"] = [[pages]];

		-- StarterGui.Panel.UI.pages.Frame
		G2L["10"] = Instance.new("Frame", G2L["e"]);
		G2L["10"]["BorderSizePixel"] = 0;
		G2L["10"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
		G2L["10"]["AnchorPoint"] = Vector2.new(0.5,0)
		G2L["10"]["Size"] = UDim2.new(1, -18,0, 30);
		G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["10"]["Position"] = UDim2.new(0.5, 0,0, 7);
		G2L["10"]["Name"] = "Search"

		-- StarterGui.Panel.UI.pages.Frame.UICorner
		G2L["11"] = Instance.new("UICorner", G2L["10"]);
		G2L["11"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.Panel.UI.pages.Frame.UIStroke
		G2L["12"] = Instance.new("UIStroke", G2L["10"]);
		G2L["12"]["Color"] = Color3.fromRGB(37, 37, 37);
		G2L["12"]["Thickness"] = 0.6000000238418579;
		G2L["12"]["Transparency"] = 0.4399999976158142;

		-- StarterGui.Panel.UI.pages.Frame.Box
		G2L["13"] = Instance.new("TextBox", G2L["10"]);
		G2L["13"]["ZIndex"] = 2;
		G2L["13"]["BorderSizePixel"] = 0;
		G2L["13"]["TextSize"] = 14;
		G2L["13"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["13"]["TextColor3"] = Color3.fromRGB(191, 191, 191);
		G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		G2L["13"]["BackgroundTransparency"] = 1;
		G2L["13"]["PlaceholderText"] = [[Search]];
		G2L["13"]["Size"] = UDim2.new(1, -23, 1, 0);
		G2L["13"]["ClipsDescendants"] = true;
		G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["13"]["Text"] = [[]];
		G2L["13"]["Position"] = UDim2.new(0, 23, 0, 0);
		G2L["13"]["Name"] = [[Box]];
		G2L["13"]["ClearTextOnFocus"] = false;

		-- StarterGui.Panel.UI.pages.Builds.Frame.Icon
		G2L["14"] = Instance.new("ImageLabel", G2L["10"]);
		G2L["14"]["BorderSizePixel"] = 0;
		G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["14"]["ImageColor3"] = Color3.fromRGB(228, 228, 228);
		G2L["14"]["AnchorPoint"] = Vector2.new(0, 0.5);
		G2L["14"]["Image"] = [[rbxassetid://7072721559]];
		G2L["14"]["Size"] = UDim2.new(0, 15, 0, 15);
		G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["14"]["Name"] = [[Icon]];
		G2L["14"]["BackgroundTransparency"] = 1;
		G2L["14"]["Position"] = UDim2.new(0, 5, 0.5, 0);

		-- StarterGui.Panel.UI.UIStroke
		G2L["16"] = Instance.new("UIStroke", G2L["2"]);
		G2L["16"]["Color"] = Color3.fromRGB(37, 37, 37);
		G2L["16"]["Thickness"] = 0.6;
		G2L["16"]["Transparency"] = 0.4;

		return G2L["1"];
	end
	local ui = initui()
	local panel = ui.UI	

	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == winconfig.Key then
			panel.Visible = not panel.Visible
		end
	end)

	panel.pages.Search.Box.Changed:Connect(function(type)
		if type == "Text" then
			local searchText = panel.pages.Search.Box.Text
			local selecttab

			for _, tab in pairs(panel.pages:GetChildren()) do
				if tab:IsA("Frame") and tab ~= panel.pages.Search then
					if tab.Visible then
						selecttab = tab
						break
					end
				end
			end

			if selecttab then
				for _, frame in pairs(selecttab.content:GetChildren()) do
					if frame:IsA("Frame") and frame:FindFirstChild("items") then
						for _, item in pairs(frame.items:GetChildren()) do
							if item:IsA("GuiObject") and item:FindFirstChild("Header") then
								print("5: Header found - " .. item.Header.Name)
								local matchFound = searchText == "" or item.Name:lower():match(searchText:lower())
								item.Visible = matchFound
								frame.Visible = not matchFound
								if searchText =="" then
									frame.Visible = true
								end
							end
						end
					end
				end
			end
		end
	end)


	pcall(function() -- ui stuff
		local function handler()
			local module = {}

			local mouse = game.Players.LocalPlayer:GetMouse()

			local DRAGGER_SIZE = 30
			local DRAGGER_TRANSPARENCY = .5

			local dragging = false

			function module.makeResizable(obj:GuiObject, minSize)

				local resizer = Instance.new("Frame")
				local dragger = Instance.new("ImageButton")
				local UICorner = Instance.new("UICorner")

				resizer.Name = "resizer"
				resizer.Parent = panel
				resizer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				resizer.BackgroundTransparency = 1
				resizer.BorderColor3 = Color3.fromRGB(27, 42, 53)
				resizer.ClipsDescendants = true
				resizer.Position = UDim2.new(1, -DRAGGER_SIZE, 1, -DRAGGER_SIZE)
				resizer.Size = UDim2.fromOffset(DRAGGER_SIZE, DRAGGER_SIZE)
				resizer.SizeConstraint = Enum.SizeConstraint.RelativeXX

				dragger.Name = "dragger"
				dragger.Parent = resizer
				dragger.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
				dragger.BorderColor3 = Color3.fromRGB(27, 42, 53)
				dragger.BorderSizePixel = 0
				dragger.BackgroundTransparency = 1
				dragger.Size = UDim2.new(2, 0, 2, 0)
				dragger.ZIndex = 2
				dragger.ImageTransparency = 1

				UICorner.CornerRadius = UDim.new(0.5, 0)
				UICorner.Parent = dragger

				local duic = dragger.UICorner
				minSize = minSize or Vector2.new(160, 90)

				local startDrag, startSize
				local gui = ui
				resizer.Parent = obj

				local function finishResize(tr)
					dragger.Position = UDim2.new(0,0,0,0)
					dragger.Size = UDim2.new(2,0,2,0)
					dragger.Parent = resizer
					dragger.BackgroundTransparency = tr
					duic.Parent = dragger
					startDrag = nil
				end
				dragger.MouseButton1Down:Connect(function()
					if not startDrag then
						startSize = obj.AbsoluteSize			
						startDrag = Vector2.new(mouse.X, mouse.Y)
						dragger.BackgroundTransparency = 1
						dragger.Size = UDim2.fromOffset(gui.AbsoluteSize.X, gui.AbsoluteSize.Y)
						dragger.Position = UDim2.new(0,0,0,0)
						duic.Parent = nil
						dragger.Parent = gui
					end
				end)	
				dragger.MouseMoved:Connect(function()
					if startDrag then		
						local m = Vector2.new(mouse.X, mouse.Y)
						local mouseMoved = Vector2.new(m.X - startDrag.X, m.Y - startDrag.Y)

						local s = startSize + mouseMoved
						local sx = math.max(minSize.X, s.X) 
						local sy = math.max(minSize.Y, s.Y)

						obj.Size = UDim2.fromOffset(sx, sy)

					end
				end)
				dragger.MouseEnter:Connect(function()
					finishResize(DRAGGER_TRANSPARENCY)				
				end)
				dragger.MouseLeave:Connect(function()
					finishResize(1)
				end)		
				dragger.MouseButton1Up:Connect(function()
					finishResize(DRAGGER_TRANSPARENCY)
				end)	
			end

			function module.makeDraggable(obj)
				local UIS = game:GetService("UserInputService")
				local dragInput, dragStart
				local startPos = obj.Position 
				local dragger = obj	
				local function updateInput(input)
					local offset = input.Position - dragStart
					local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + offset.X, startPos.Y.Scale, startPos.Y.Offset + offset.Y)
					game:GetService("TweenService"):Create(obj, TweenInfo.new(0.25), {Position = Position}):Play()
				end
				dragger.InputBegan:Connect(function(input)
					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not UIS:GetFocusedTextBox() then
						dragging = true
						dragStart = input.Position
						startPos = obj.Position
						module.dragged = obj
						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								dragging = false
							end
						end)
					end
				end)
				dragger.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						dragInput = input
					end
				end)
				UIS.InputChanged:Connect(function(input)
					if input == dragInput and dragging then
						updateInput(input)
					end
				end)
			end

			return module
		end
		local resizer = handler()
		panel.Position = UDim2.new(0,panel.AbsolutePosition.X,0,panel.AbsolutePosition.Y);panel.AnchorPoint = Vector2.new(0,0)
		resizer.makeResizable(panel, Vector2.new(379, 267))
		resizer.makeDraggable(panel)
	end)
	local window = {}

	local tabs,sections = 0,0
	function window:AddTab(tabconfig)
		local G2L, stab = {}, ""
		tabs+=1
		G2L["page"] = Instance.new("Frame", panel.pages);
		G2L["page"]["BorderSizePixel"] = 0;
		G2L["page"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["page"]["BackgroundTransparency"] = 1;
		G2L["page"]["LayoutOrder"] = tabs
		G2L["page"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["page"]["Visible"] = tabconfig.Selected;
		G2L["page"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["page"]["Name"] = tabconfig.Name;

		G2L["sframe"] = Instance.new("ScrollingFrame", G2L["page"]);
		G2L["sframe"]["Active"] = true;
		G2L["sframe"]["BorderSizePixel"] = 0;
		G2L["sframe"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		G2L["sframe"]["ScrollBarImageTransparency"] = 1;
		G2L["sframe"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["sframe"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		G2L["sframe"]["BackgroundTransparency"] = 1;
		G2L["sframe"]["Size"] = UDim2.new(1, 0, 1, -44);
		G2L["sframe"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["sframe"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["sframe"]["Position"] = UDim2.new(0, 0, 0, 44);
		G2L["sframe"]["Name"] = [[content]];

		G2L["dsfd"] = Instance.new("UIListLayout", G2L["sframe"])
		G2L["dsfd"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		G2L["dsfd"]["Padding"] = UDim.new(0,5)

		G2L["2"] = Instance.new("Frame", panel.side.tabs);
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["2"]["BackgroundTransparency"] = 1;
		G2L["2"]["Size"] = UDim2.new(1, 0, 0, 24);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["2"]["Name"] = tabconfig.Name;

		-- StarterGui.ScreenGui.Players.UIPadding
		G2L["3"] = Instance.new("UIPadding", G2L["2"]);
		G2L["3"]["PaddingLeft"] = UDim.new(0, -29);

		-- StarterGui.ScreenGui.Players.trigger
		G2L["4"] = Instance.new("ImageButton", G2L["2"]);
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["AutoButtonColor"] = false;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
		G2L["4"]["Size"] = UDim2.new(0, 116, 0, 24);
		G2L["4"]["Name"] = [[trigger]];
		G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		-- StarterGui.ScreenGui.Players.trigger.UICorner
		G2L["5"] = Instance.new("UICorner", G2L["4"]);
		G2L["5"]["CornerRadius"] = UDim.new(1, 0);

		-- StarterGui.ScreenGui.Players.trigger.Header
		G2L["6"] = Instance.new("TextLabel", G2L["4"]);
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		G2L["6"]["TextSize"] = 14;
		G2L["6"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
		G2L["6"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Text"] = tabconfig.Name;
		G2L["6"]["Name"] = [[Header]];
		G2L["6"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.Players.trigger.Header.UIPadding
		G2L["7"] = Instance.new("UIPadding", G2L["6"]);
		G2L["7"]["PaddingLeft"] = UDim.new(0, 40);

		-- StarterGui.ScreenGui.Players.trigger.Icon
		G2L["8"] = Instance.new("ImageLabel", G2L["4"]);
		G2L["8"]["BorderSizePixel"] = 0;
		G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["8"]["ImageColor3"] = Color3.fromRGB(151, 151, 151);
		G2L["8"]["AnchorPoint"] = Vector2.new(0, 0.5);
		G2L["8"]["Image"] = [[rbxassetid://]]..tabconfig.Icon;
		G2L["8"]["Size"] = UDim2.new(0, 15, 0, 15);
		G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["8"]["Name"] = [[Icon]];
		G2L["8"]["BackgroundTransparency"] = 1;
		G2L["8"]["Position"] = UDim2.new(1, -25, 0.5, 0);

		stab = G2L["sframe"]
		if tabconfig.Selected then
			animate(G2L["2"].trigger,ti,{BackgroundColor3=Color3.fromRGB(36,36,36)})
			animate(G2L["2"].UIPadding,ti,{PaddingLeft=UDim.new(0,-15)})
			animate(G2L["2"].trigger.Icon,ti,{ImageColor3=Color3.fromRGB(227,227,227)})
			animate(G2L["2"].trigger.Header,ti,{TextColor3=Color3.fromRGB(227,227,227)})
		end

		G2L["4"].MouseButton1Click:Connect(function()
			for i,v in pairs(panel.side.tabs:GetChildren()) do
				if v:IsA("Frame") then
					if v ~= G2L["2"] then
						panel.pages[v.Name].Visible = false
						animate(v.trigger,ti,{BackgroundColor3=Color3.fromRGB(13,13,13)})
						animate(v.UIPadding,ti,{PaddingLeft=UDim.new(0,-29)})
						animate(v.trigger.Icon,ti,{ImageColor3=Color3.fromRGB(227,227,227)})
						animate(v.trigger.Header,ti,{TextColor3=Color3.fromRGB(151,151,151)})
					else
						panel.pages[v.Name].Visible = true
						animate(v.trigger,ti,{BackgroundColor3=Color3.fromRGB(36,36,36)})
						animate(v.UIPadding,ti,{PaddingLeft=UDim.new(0,-15)})
						animate(v.trigger.Icon,ti,{ImageColor3=Color3.fromRGB(227,227,227)})
						animate(v.trigger.Header,ti,{TextColor3=Color3.fromRGB(227,227,227)})
					end
				end
			end
		end)

		local tab = {}

		function tab:Section(name)
			local G2L = {}
			sections+=1
			-- StarterGui.ScreenGui.content.Open Section
			G2L["3"] = Instance.new("Frame", stab);
			G2L["3"]["BorderSizePixel"] = 0;
			G2L["3"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
			G2L["3"]["BackgroundTransparency"] = 1;
			G2L["3"]["Position"] = UDim2.new(0,10,0,0)
			G2L["3"]["Size"] = UDim2.new(1, -20, 0, 0);
			G2L["3"]["LayoutOrder"] = sections
			G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["3"]["AutomaticSize"] = Enum.AutomaticSize.Y;
			G2L["3"]["Name"] = name;

			-- StarterGui.ScreenGui.content.Open Section.top
			G2L["4"] = Instance.new("Frame", G2L["3"]);
			G2L["4"]["ZIndex"] = 2;
			G2L["4"]["BorderSizePixel"] = 0;
			G2L["4"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
			G2L["4"]["Size"] = UDim2.new(1, 0, 0, 30);
			G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["4"]["Name"] = [[top]];

			-- StarterGui.ScreenGui.content.Open Section.top.UICorner
			G2L["5"] = Instance.new("UICorner", G2L["4"]);
			G2L["5"]["CornerRadius"] = UDim.new(0, 7);

			-- StarterGui.ScreenGui.content.Open Section.top.cover
			G2L["6"] = Instance.new("Frame", G2L["4"]);
			G2L["6"]["ZIndex"] = 2;
			G2L["6"]["BorderSizePixel"] = 0;
			G2L["6"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
			G2L["6"]["Size"] = UDim2.new(1, 0, 0, 18);
			G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["6"]["Position"] = UDim2.new(0, 0, 1, -18);
			G2L["6"]["Name"] = [[cover]];

			-- StarterGui.ScreenGui.content.Open Section.top.cover.UICorner
			G2L["7"] = Instance.new("UICorner", G2L["6"]);
			G2L["7"]["CornerRadius"] = UDim.new(0, 0);

			-- StarterGui.ScreenGui.content.Open Section.top.Header
			G2L["8"] = Instance.new("TextLabel", G2L["4"]);
			G2L["8"]["ZIndex"] = 3;
			G2L["8"]["BorderSizePixel"] = 0;
			G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
			G2L["8"]["TextSize"] = 14;
			G2L["8"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
			G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0);
			G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["8"]["Text"] = name
			G2L["8"]["Name"] = [[Header]];
			G2L["8"]["BackgroundTransparency"] = 1;

			-- StarterGui.ScreenGui.content.Open Section.top.Header.UIPadding
			G2L["9"] = Instance.new("UIPadding", G2L["8"]);
			G2L["9"]["PaddingLeft"] = UDim.new(0, 10);

			-- StarterGui.ScreenGui.content.Open Section.top.Hide
			G2L["a"] = Instance.new("ImageButton", G2L["4"]);
			G2L["a"]["ZIndex"] = 3;
			G2L["a"]["BorderSizePixel"] = 0;
			G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["a"]["ImageColor3"] = Color3.fromRGB(228, 228, 228);
			G2L["a"]["AnchorPoint"] = Vector2.new(0, 0.5);
			G2L["a"]["Image"] = [[rbxassetid://7072706663]];
			G2L["a"]["Size"] = UDim2.new(0, 20, 0, 20);
			G2L["a"]["Name"] = [[Hide]];
			G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["a"]["Position"] = UDim2.new(1, -30, 0.5, 0);
			G2L["a"]["BackgroundTransparency"] = 1;

			-- StarterGui.ScreenGui.content.Open Section.items
			G2L["b"] = Instance.new("Frame", G2L["3"]);
			G2L["b"]["BorderSizePixel"] = 0;
			G2L["b"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
			G2L["b"]["Size"] = UDim2.new(1, 0, 0, 30);
			G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["b"]["Position"] = UDim2.new(0, 0, 0, 25);
			G2L["b"]["ClipsDescendants"] = true;
			G2L["b"]["AutomaticSize"] = Enum.AutomaticSize.Y;
			G2L["b"]["Name"] = [[items]];

			-- StarterGui.ScreenGui.content.Open Section.items.UICorner
			G2L["c"] = Instance.new("UICorner", G2L["b"]);
			G2L["c"]["CornerRadius"] = UDim.new(0, 7);

			-- StarterGui.ScreenGui.content.Open Section.items.UIListLayout
			G2L["d"] = Instance.new("UIListLayout", G2L["b"]);
			G2L["d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
			G2L["d"]["Padding"] = UDim.new(0, 5);
			G2L["d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterGui.ScreenGui.content.Open Section.items.UIPadding
			G2L["13"] = Instance.new("UIPadding", G2L["b"]);
			G2L["13"]["PaddingTop"] = UDim.new(0, 10);
			G2L["13"]["PaddingBottom"] = UDim.new(0, 6);

			local hidden = false

			G2L["a"].MouseButton1Click:Connect(function()
				if hidden then
					animate(G2L["a"],ti,{Rotation=0})
					G2L["b"].Visible = true
					G2L["7"]["CornerRadius"] = UDim.new(0,0)
					hidden = false
				else
					animate(G2L["a"],ti,{Rotation=-90})
					G2L["b"].Visible = false
					G2L["7"]["CornerRadius"] = UDim.new(0,7)
					hidden = true
				end
			end)

			local items = G2L["b"]

			local section = {}

			function section:Button(btnconfig)
				local G2L = {}
				-- StarterGui.ScreenGui.content.Open Section.items.Button
				G2L["e"] = Instance.new("ImageButton", items);
				G2L["e"]["BorderSizePixel"] = 0;
				G2L["e"]["AutoButtonColor"] = false;
				G2L["e"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
				G2L["e"]["Size"] = UDim2.new(1, -10, 0, 27);
				G2L["e"]["Name"] = btnconfig.Name
				G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				-- StarterGui.ScreenGui.content.Open Section.items.Button.UICorner
				G2L["f"] = Instance.new("UICorner", G2L["e"]);
				G2L["f"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ScreenGui.content.Open Section.items.Button.Header
				G2L["10"] = Instance.new("TextLabel", G2L["e"]);
				G2L["10"]["TextWrapped"] = true;
				G2L["10"]["ZIndex"] = 2;
				G2L["10"]["BorderSizePixel"] = 0;
				G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				G2L["10"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				G2L["10"]["TextSize"] = 13;
				G2L["10"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
				G2L["10"]["Size"] = UDim2.new(1, 0, 1, 0);
				G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["10"]["Text"] = btnconfig.Name
				G2L["10"]["Name"] = [[Header]];
				G2L["10"]["BackgroundTransparency"] = 1;

				-- StarterGui.ScreenGui.content.Open Section.items.Button.Header.UIPadding
				G2L["11"] = Instance.new("UIPadding", G2L["10"]);
				G2L["11"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.ScreenGui.content.Open Section.items.Button.UIStroke
				G2L["12"] = Instance.new("UIStroke", G2L["e"]);
				G2L["12"]["Color"] = Color3.fromRGB(37, 37, 37);
				G2L["12"]["Thickness"] = 0.6000000238418579;
				G2L["12"]["Transparency"] = 0.4399999976158142;

				G2L["e"].MouseButton1Click:Connect(function()
					btnconfig.Callback()
				end)
			end

			function section:Toggle(togconfig)
				local G2L = {}
				-- StarterGui.ScreenGui.content.Open Section.items.Toggle
				G2L["14"] = Instance.new("ImageButton", items);
				G2L["14"]["BorderSizePixel"] = 0;
				G2L["14"]["AutoButtonColor"] = false;
				G2L["14"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
				G2L["14"]["Size"] = UDim2.new(1, -10, 0, 27);
				G2L["14"]["Name"] = togconfig.Name
				G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.UICorner
				G2L["15"] = Instance.new("UICorner", G2L["14"]);
				G2L["15"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.Header
				G2L["16"] = Instance.new("TextLabel", G2L["14"]);
				G2L["16"]["TextWrapped"] = true;
				G2L["16"]["ZIndex"] = 2;
				G2L["16"]["BorderSizePixel"] = 0;
				G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				G2L["16"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				G2L["16"]["TextSize"] = 13;
				G2L["16"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
				G2L["16"]["Size"] = UDim2.new(1, 0, 1, 0);
				G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["16"]["Text"] = togconfig.Name
				G2L["16"]["Name"] = [[Header]];
				G2L["16"]["BackgroundTransparency"] = 1;

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.Header.UIPadding
				G2L["17"] = Instance.new("UIPadding", G2L["16"]);
				G2L["17"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.UIStroke
				G2L["18"] = Instance.new("UIStroke", G2L["14"]);
				G2L["18"]["Color"] = Color3.fromRGB(37, 37, 37);
				G2L["18"]["Thickness"] = 0.6000000238418579;
				G2L["18"]["Transparency"] = 0.4399999976158142;

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.Box
				G2L["19"] = Instance.new("ImageButton", G2L["14"]);
				G2L["19"]["ZIndex"] = 2;
				G2L["19"]["BorderSizePixel"] = 0;
				G2L["19"]["AutoButtonColor"] = false;
				G2L["19"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
				G2L["19"]["ImageColor3"] = Color3.fromRGB(228, 228, 228);
				G2L["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
				G2L["19"]["Size"] = UDim2.new(0, 20, 0, 20);
				G2L["19"]["Name"] = [[Box]];
				G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["19"]["Position"] = UDim2.new(1, -25, 0.5, 0);

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.Box.UICorner
				G2L["1a"] = Instance.new("UICorner", G2L["19"]);
				G2L["1a"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ScreenGui.content.Open Section.items.Toggle.Box.Icon
				G2L["1b"] = Instance.new("ImageLabel", G2L["19"]);
				G2L["1b"]["ZIndex"] = 2;
				G2L["1b"]["BorderSizePixel"] = 0;
				G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				G2L["1b"]["ImageColor3"] = Color3.fromRGB(0,0,0);
				G2L["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				G2L["1b"]["Image"] = [[rbxassetid://7072706620]];
				G2L["1b"]["ImageTransparency"] = 1
				G2L["1b"]["Size"] = UDim2.new(0.6, 0, 0.6, 0);
				G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["1b"]["Name"] = [[Icon]];
				G2L["1b"]["BackgroundTransparency"] = 1;
				G2L["1b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

				local bool = false

				G2L["14"].MouseButton1Down:Connect(function()
					if bool == false then
						animate(G2L["19"],ti,{BackgroundColor3=Color3.fromRGB(255,179,26)})
						animate(G2L["1b"],ti,{ImageTransparency=0})
						bool = true
					else
						animate(G2L["19"],ti,{BackgroundColor3=Color3.fromRGB(14,14,14)})
						animate(G2L["1b"],ti,{ImageTransparency=1})
						bool = false
					end
					togconfig.Callback(bool)
				end)

				if togconfig.Enabled then
					animate(G2L["19"],ti,{BackgroundColor3=Color3.fromRGB(255,179,26)})
					animate(G2L["1b"],ti,{ImageTransparency=0})
					bool = true
					togconfig.Callback(bool)
				end
			end

			function section:Input(inconfig)
				local G2L = {}

				-- StarterGui.ScreenGui.content.Open Section.items.Input
				G2L["1c"] = Instance.new("ImageButton", items);
				G2L["1c"]["BorderSizePixel"] = 0;
				G2L["1c"]["AutoButtonColor"] = false;
				G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
				G2L["1c"]["Size"] = UDim2.new(1, -10, 0, 27);
				G2L["1c"]["Name"] = inconfig.Name
				G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				-- StarterGui.ScreenGui.content.Open Section.items.Input.UICorner
				G2L["1d"] = Instance.new("UICorner", G2L["1c"]);
				G2L["1d"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ScreenGui.content.Open Section.items.Input.Header
				G2L["1e"] = Instance.new("TextLabel", G2L["1c"]);
				G2L["1e"]["TextWrapped"] = true;
				G2L["1e"]["ZIndex"] = 2;
				G2L["1e"]["BorderSizePixel"] = 0;
				G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				G2L["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				G2L["1e"]["TextSize"] = 13;
				G2L["1e"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
				G2L["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
				G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["1e"]["Text"] = inconfig.Name
				G2L["1e"]["Name"] = [[Header]];
				G2L["1e"]["BackgroundTransparency"] = 1;

				-- StarterGui.ScreenGui.content.Open Section.items.Input.Header.UIPadding
				G2L["1f"] = Instance.new("UIPadding", G2L["1e"]);
				G2L["1f"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.ScreenGui.content.Open Section.items.Input.UIStroke
				G2L["20"] = Instance.new("UIStroke", G2L["1c"]);
				G2L["20"]["Color"] = Color3.fromRGB(37, 37, 37);
				G2L["20"]["Thickness"] = 0.6000000238418579;
				G2L["20"]["Transparency"] = 0.4399999976158142;

				-- StarterGui.ScreenGui.content.Open Section.items.Input.Input
				G2L["21"] = Instance.new("ImageButton", G2L["1c"]);
				G2L["21"]["ZIndex"] = 2;
				G2L["21"]["BorderSizePixel"] = 0;
				G2L["21"]["AutoButtonColor"] = false;
				G2L["21"]["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
				G2L["21"]["ImageColor3"] = Color3.fromRGB(228, 228, 228);
				G2L["21"]["AnchorPoint"] = Vector2.new(0, 0.5);
				G2L["21"]["Size"] = UDim2.new(0, 65, 0, 20);
				G2L["21"]["Name"] = [[Input]];
				G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["21"]["Position"] = UDim2.new(0.806034505367279, -25, 0.5, 0);

				-- StarterGui.ScreenGui.content.Open Section.items.Input.Input.UICorner
				G2L["22"] = Instance.new("UICorner", G2L["21"]);
				G2L["22"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ScreenGui.content.Open Section.items.Input.Input.Box
				G2L["23"] = Instance.new("TextBox", G2L["21"]);
				G2L["23"]["ZIndex"] = 2;
				G2L["23"]["BorderSizePixel"] = 0;
				G2L["23"]["TextSize"] = 12;
				G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				G2L["23"]["TextColor3"] = Color3.fromRGB(191, 191, 191);
				G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				G2L["23"]["BackgroundTransparency"] = 1;
				G2L["23"]["PlaceholderText"] = inconfig.PlaceHolder
				G2L["23"]["Size"] = UDim2.new(1, 0, 1, 0);
				G2L["23"]["ClipsDescendants"] = true;
				G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["23"]["Text"] = inconfig.Text
				G2L["23"]["Name"] = [[Box]];
				G2L["23"]["ClearTextOnFocus"] = inconfig.ClearOnFocus;

				G2L["23"].FocusLost:Connect(function()
					inconfig.Callback(G2L["23"].Text)
				end)
			end
			
			function section:Label(text)
				-- StarterGui.Panel.UI.side.Header
				G2L["7"] = Instance.new("TextLabel", items);
				G2L["7"]["BorderSizePixel"] = 0;
				G2L["7"]["RichText"] = true;
				G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				G2L["7"]["TextSize"] = 14;
				G2L["7"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
				G2L["7"]["Size"] = UDim2.new(1, 0, 0, 23);
				G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				G2L["7"]["Text"] = text
				G2L["7"]["Name"] = [[Header]];
				G2L["7"]["BackgroundTransparency"] = 1;

				-- StarterGui.Panel.UI.side.Header.UIPadding
				G2L["8"] = Instance.new("UIPadding", G2L["7"]);
				G2L["8"]["PaddingLeft"] = UDim.new(0, 10);
			end

			return section

		end

		return tab
	end

	return window
end

return UI
