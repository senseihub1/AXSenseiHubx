-- AXSenseiHub v1.0 | Full Auto Ink Game + Troll + GUI | KRNL-Compatible

local SenseiHub = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- GUI Setup
SenseiHub.Name = "AXSenseiHub"
SenseiHub.Parent = game.CoreGui
Frame.Size = UDim2.new(0, 240, 0, 350)
Frame.Position = UDim2.new(0.5, -120, 0.5, -175)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Parent = SenseiHub
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

title.Text = "AXSenseiHub 🧠"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = Frame

ScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Parent = Frame

UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.Parent = ScrollingFrame

local function makeButton(text, callback)
	local btn = Instance.new("TextButton")
	btn.Text = text
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSans
	btn.TextScaled = true
	btn.Parent = ScrollingFrame
	btn.MouseButton1Click:Connect(callback)

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = btn
end

-- 🧠 FEATURES 🧠 --

-- Red Light Auto TP
makeButton("Auto TP Red Light Green Light", function()
	for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("Part") and v.Name == "FinishPart" then
			game.Players.LocalPlayer.Character:PivotTo(v.CFrame + Vector3.new(0, 3, 0))
		end
	end
end)

-- Dalgona AutoComplete
makeButton("Auto Complete Dalgona", function()
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer("DalgonaSuccess", true)
end)

-- Tug of War Auto Click
makeButton("Auto Tug of War", function()
	while task.wait(0.2) do
		local tug = game:GetService("ReplicatedStorage"):FindFirstChild("ClickEvent")
		if tug then
			tug:FireServer()
		end
	end
end)

-- Hide and Seek Auto TP to Hider
makeButton("Auto TP to Hider", function()
	for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name then
			game.Players.LocalPlayer.Character:PivotTo(v:GetPivot())
		end
	end
end)

-- Noclip Toggle
makeButton("Enable Noclip", function()
	local char = game.Players.LocalPlayer.Character
	while true do
		task.wait(0.1)
		for _,part in pairs(char:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

-- Glass Bridge Reveal Path
makeButton("Reveal Glass Bridge", function()
	for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("Part") and v.Name == "GlassStep" then
			v.Transparency = 0.2
			v.Color = v:GetAttribute("Correct") and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
		end
	end
end)

-- End Fight Kill Aura
makeButton("End Fight Aura", function()
	while task.wait(0.3) do
		for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") then
				v.Character.Humanoid:TakeDamage(5)
			end
		end
	end
end)

-- Troll: Sky Launch
makeButton("Troll: Launch All Players", function()
	for _,v in pairs(game.Players:GetPlayers()) do
		if v.Character then
			v.Character:PivotTo(CFrame.new(0, 1000, 0))
		end
	end
end)

-- Speed Boost
makeButton("Speed Boost", function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- Fly Mode
makeButton("Enable Fly", function()
	local char = game.Players.LocalPlayer.Character
	char.HumanoidRootPart.Anchored = true
end)

-- Reset GUI
makeButton("Remove GUI", function()
	SenseiHub:Destroy()
end)
