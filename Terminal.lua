local term = {}

local function newui(header)
	local G2L = {};
	-- StarterGui.Terminal
	G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
	G2L["1"]["Name"] = [[Terminal]];
	G2L["1"]["ResetOnSpawn"] = false;

	-- StarterGui.Terminal.UI
	G2L["2"] = Instance.new("Frame", G2L["1"]);
	G2L["2"]["BorderSizePixel"] = 0;
	G2L["2"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 11);
	G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["2"]["Size"] = UDim2.new(0, 339, 0, 227);
	G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["2"]["Name"] = [[UI]];

	-- StarterGui.Terminal.terminalCorner
	G2L["3"] = Instance.new("UICorner", G2L["2"]);
	G2L["3"]["CornerRadius"] = UDim.new(0, 10);

	-- StarterGui.Terminal.terminalStroke
	G2L["4"] = Instance.new("UIStroke", G2L["2"]);
	G2L["4"]["Color"] = Color3.fromRGB(37, 37, 37);
	G2L["4"]["Thickness"] = 0.6000000238418579;
	G2L["4"]["Transparency"] = 0.4399999976158142;

	-- StarterGui.Terminal.UI.top
	G2L["5"] = Instance.new("Frame", G2L["2"]);
	G2L["5"]["BorderSizePixel"] = 0;
	G2L["5"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["5"]["Size"] = UDim2.new(1, 0, 0, 38);
	G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["5"]["Name"] = [[top]];

	-- StarterGui.Terminal.UI.top.UICorner
	G2L["6"] = Instance.new("UICorner", G2L["5"]);
	G2L["6"]["CornerRadius"] = UDim.new(0, 10);

	-- StarterGui.Terminal.UI.top.cover
	G2L["7"] = Instance.new("Frame", G2L["5"]);
	G2L["7"]["BorderSizePixel"] = 0;
	G2L["7"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["7"]["Size"] = UDim2.new(1, 0, 0, 7);
	G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7"]["Position"] = UDim2.new(0, 0, 1, -7);
	G2L["7"]["Name"] = [[cover]];

	-- StarterGui.Terminal.UI.top.Header
	G2L["8"] = Instance.new("TextLabel", G2L["5"]);
	G2L["8"]["BorderSizePixel"] = 0;
	G2L["8"]["RichText"] = true;
	G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	G2L["8"]["TextSize"] = 14;
	G2L["8"]["TextColor3"] = Color3.fromRGB(228, 228, 228);
	G2L["8"]["Size"] = UDim2.new(1, -120, 1, 0);
	G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8"]["Text"] = header
	G2L["8"]["Name"] = [[Header]];
	G2L["8"]["BackgroundTransparency"] = 1;

	-- StarterGui.Terminal.UI.top.Header.UIPadding
	G2L["9"] = Instance.new("UIPadding", G2L["8"]);
	G2L["9"]["PaddingLeft"] = UDim.new(0, 10);

	-- StarterGui.Terminal.UI.top.wincontrols
	G2L["a"] = Instance.new("Frame", G2L["5"]);
	G2L["a"]["BorderSizePixel"] = 0;
	G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["a"]["BackgroundTransparency"] = 1;
	G2L["a"]["Size"] = UDim2.new(0, 120, 1, 0);
	G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["a"]["Position"] = UDim2.new(1, -120, 0, 0);
	G2L["a"]["Name"] = [[wincontrols]];

	-- StarterGui.Terminal.UI.top.wincontrols.UIListLayout
	G2L["b"] = Instance.new("UIListLayout", G2L["a"]);
	G2L["b"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	G2L["b"]["FillDirection"] = Enum.FillDirection.Horizontal;
	G2L["b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
	G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.Terminal.UI.top.wincontrols.close
	G2L["e"] = Instance.new("ImageButton", G2L["a"]);
	G2L["e"]["BorderSizePixel"] = 0;
	G2L["e"]["AutoButtonColor"] = false;
	G2L["e"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["e"]["LayoutOrder"] = 2;
	G2L["e"]["Size"] = UDim2.new(0, 38, 0, 38);
	G2L["e"]["Name"] = [[close]];
	G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

	-- StarterGui.Terminal.UI.top.wincontrols.close.UICorner
	G2L["f"] = Instance.new("UICorner", G2L["e"]);
	G2L["f"]["CornerRadius"] = UDim.new(0, 10);

	-- StarterGui.Terminal.UI.top.wincontrols.close.cover
	G2L["10"] = Instance.new("Frame", G2L["e"]);
	G2L["10"]["BorderSizePixel"] = 0;
	G2L["10"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["10"]["Size"] = UDim2.new(1, 0, 0, 7);
	G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["10"]["Position"] = UDim2.new(0, 0, 1, -7);
	G2L["10"]["Name"] = [[cover]];

	-- StarterGui.Terminal.UI.top.wincontrols.close.cover
	G2L["11"] = Instance.new("Frame", G2L["e"]);
	G2L["11"]["BorderSizePixel"] = 0;
	G2L["11"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["11"]["Size"] = UDim2.new(0, 7, 1, 0);
	G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["11"]["Name"] = [[cover]];

	-- StarterGui.Terminal.UI.top.wincontrols.close.icon
	G2L["12"] = Instance.new("ImageLabel", G2L["e"]);
	G2L["12"]["BorderSizePixel"] = 0;
	G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["12"]["ImageColor3"] = Color3.fromRGB(151, 151, 151);
	G2L["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["12"]["Image"] = [[rbxassetid://7072725342]];
	G2L["12"]["Size"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["12"]["Name"] = [[icon]];
	G2L["12"]["BackgroundTransparency"] = 1;
	G2L["12"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.Terminal.UI.list
	G2L["13"] = Instance.new("ScrollingFrame", G2L["2"]);
	G2L["13"]["Active"] = true;
	G2L["13"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
	G2L["13"]["BorderSizePixel"] = 0;
	G2L["13"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["13"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	G2L["13"]["BackgroundTransparency"] = 1;
	G2L["13"]["Size"] = UDim2.new(1, 0, 1, -38);
	G2L["13"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["13"]["Position"] = UDim2.new(0, 0, 0, 38);
	G2L["13"]["Name"] = [[list]];

	-- StarterGui.Terminal.UI.list.UIListLayout
	G2L["14"] = Instance.new("UIListLayout", G2L["13"]);
	G2L["14"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	return G2L["1"]
end

function term:Window(header)
	local ui,window = newui(header),{}
	local terminal = ui.UI
	local done = false;
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
				resizer.Parent = terminal
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
		terminal.Position = UDim2.new(0,terminal.AbsolutePosition.X,0,terminal.AbsolutePosition.Y);terminal.AnchorPoint = Vector2.new(0,0)
		resizer.makeResizable(terminal, Vector2.new(339, 227))
		resizer.makeDraggable(terminal)
	end)
	terminal.top.wincontrols.close.MouseButton1Click:Connect(function()
		terminal.Visible = done
		if done then
			ui:Destroy()
		end
	end)
	terminal.top.wincontrols.close.MouseEnter:Connect(function()
		terminal.top.wincontrols.close.icon.ImageColor3=Color3.fromRGB(255,255,255)
		terminal.top.wincontrols.close.BackgroundColor3=Color3.fromRGB(222, 86, 86)
		for i,v in pairs(terminal.top.wincontrols.close:GetChildren()) do
			if v:IsA("Frame") then
				v.BackgroundColor3=Color3.fromRGB(222, 86, 86)
			end
		end
	end)
	terminal.top.wincontrols.close.MouseLeave:Connect(function()
		terminal.top.wincontrols.close.icon.ImageColor3=Color3.fromRGB(150,150,150)
		terminal.top.wincontrols.close.BackgroundColor3=Color3.fromRGB(8,8,8)
		for i,v in pairs(terminal.top.wincontrols.close:GetChildren()) do
			if v:IsA("Frame") then
				v.BackgroundColor3=Color3.fromRGB(8,8,8)
			end
		end
	end)
	function window:Log(config)
		local G2L, log = {}, {}

		G2L["15"] = Instance.new("TextLabel", terminal.list);
		G2L["15"]["TextWrapped"] = true;
		G2L["15"]["BorderSizePixel"] = 0;
		G2L["15"]["RichText"] = true;
		G2L["15"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["15"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		G2L["15"]["TextSize"] = 14;
		G2L["15"]["TextColor3"] = config.Color;
		G2L["15"]["AutomaticSize"] = Enum.AutomaticSize.XY;
		G2L["15"]["Size"] = UDim2.new(1, 0, 0, 0);
		G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["15"]["Text"] =	config.Content
		G2L["15"]["Name"] = tostring(tick())
		G2L["15"]["BackgroundTransparency"] = 1;

		G2L["16"] = Instance.new("UIPadding", G2L["15"]);
		G2L["16"]["PaddingTop"] = UDim.new(0, 5);
		G2L["16"]["PaddingRight"] = UDim.new(0, 5);
		G2L["16"]["PaddingBottom"] = UDim.new(0, 5);
		G2L["16"]["PaddingLeft"] = UDim.new(0, 14);

		function log:Edit(config)
			if config.Color then
				G2L["15"]["TextColor3"] = config.Color;
			end
			if config.Content then
				G2L["15"]["Text"] =	config.Content
			end
		end

		function log:GetValue()
			return G2L["15"]["Text"]
		end

		function log:GetColor()
			return G2L["15"]["TextColor3"]
		end

		return log
	end

	function window:Clear()
		for i,v in pairs(ui.list:GetChildren()) do
			if v:IsA("TextLabel") then
				v:Destroy()
			end
		end
	end

	function window:Complete()
		done = true
		terminal.Visible = done
	end

	return window
end

return term
