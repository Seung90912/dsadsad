local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Roblox rivals",
   Icon = 0,
   LoadingTitle = "loading",
   LoadingSubtitle = "by seftresdx",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "login to game",
      Subtitle = "Key System",
      Note = "https://discord.gg/CRhn8wa8W9",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ub6k7nIEPRBfUtte"}
   }
})

local MainTab = Window:CreateTab("Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed the script",
   Content = "complete",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

-- ==================== Aimbot Button with Team Check ====================
local Button = MainTab:CreateButton({
   Name = "Aimbot",
   Callback = function()
      local plrs = game:GetService("Players")
      local rs = game:GetService("RunService")
      local uis = game:GetService("UserInputService")
      local lp = plrs.LocalPlayer
      local cam = workspace.CurrentCamera
      
      getgenv().Aimbot = true
      getgenv().Smoothness = 0
      getgenv().FOV = 0
      getgenv().TeamCheck = true
      
      local circle = Drawing.new("Circle")
      circle.Thickness = 2
      circle.Visible = true
      circle.Color = Color3.fromRGB(255, 50, 50)
      circle.Transparency = 0.5
      
      local function get_target()
         local target = nil
         local dist = getgenv().FOV
         local mouse = uis:GetMouseLocation()
         for _, v in pairs(plrs:GetPlayers()) do
            if v ~= lp and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
               if getgenv().TeamCheck and v.Team == lp.Team then continue end -- Team Check
               
               local part = v.Character:FindFirstChild("HeadHB") or v.Character:FindFirstChild("Head") or v.Character:FindFirstChild("UpperTorso")
               if part then
                  local pos, on_screen = cam:WorldToViewportPoint(part.Position)
                  if on_screen then
                     local mag = (Vector2.new(pos.X, pos.Y) - mouse).Magnitude
                     if mag < dist then
                        dist = mag
                        target = part
                     end
                  end
               end
            end
         end
         return target
      end
      
      rs.RenderStepped:Connect(function()
         circle.Visible = getgenv().Aimbot
         circle.Radius = getgenv().FOV
         circle.Position = uis:GetMouseLocation()
         
         if uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and getgenv().Aimbot then
            local target = get_target()
            if target then
               local targetPos = target.Position
               local currentCFrame = cam.CFrame
               local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
               
               cam.CFrame = currentCFrame:Lerp(targetCFrame, getgenv().Smoothness / 10)
            end
         end
      end)
   end,
})

-- FOV Slider
local Slider = MainTab:CreateSlider({
   Name = "fov",
   Range = {0, 600},
   Increment = 10,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "FOVSlider",
   Callback = function(Value)
      getgenv().FOV = Value
   end,
})

-- Smooth Slider
local Slider = MainTab:CreateSlider({
   Name = "smooth",
   Range = {0, 30},
   Increment = 1,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "SmoothSlider",
   Callback = function(Value)
      getgenv().Smoothness = Value
   end,
})

-- Team Check Toggle
local Toggle = MainTab:CreateToggle({
   Name = "Team Check",
   CurrentValue = true,
   Flag = "TeamCheck",
   Callback = function(Value)
      getgenv().TeamCheck = Value
   end,
})

-- ESP Button
local Button = MainTab:CreateButton({
   Name = "ESP",
   Callback = function()
            --allowlocal 
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/BufferExploiters/EspLibrary5/refs/heads/main/esp/esp.lua"))()
local Config = ESP.Table

Config['Enabled'] = true
Config['Distance'] = 500

-- Boxes
Config['Boxes']['Enabled'] = true
Config['Boxes']['Gradients']['Top'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Boxes']['Gradients']['Bot'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Boxes']['Bounding Box']['Enabled'] = true
Config['Boxes']['Bounding Box']['BoxY'] = 6
Config['Boxes']['Bounding Box']['BoxX'] = 2
Config['Boxes']['Box Glow']['Enabled'] = true
Config['Boxes']['Box Glow']['Top'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Boxes']['Box Glow']['Bot'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Boxes']['Box Glow']['Transparency'] = {0.9, 0.9}
Config['Boxes']['Filled']['Enabled'] = true
Config['Boxes']['Filled']['Top'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Boxes']['Filled']['Bot'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Boxes']['Filled']['Transparency'] = {1, 0.75}

-- Bars
Config['Bars']['Health Bar']['Enabled'] = true
Config['Bars']['Health Bar']['Top'] = Color3.fromRGB(255, 255, 255)
Config['Bars']['Health Bar']['Mid'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Bars']['Health Bar']['Bot'] = Color3.fromRGB(0, 200, 255) -- Cyan

-- Text
Config['Texts']['Name']['Enabled'] = true
Config['Texts']['Name']['Color'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Texts']['Distance']['Enabled'] = true
Config['Texts']['Distance']['Color'] = Color3.fromRGB(0, 255, 255) -- Cyan
Config['Texts']['Weapon']['Enabled'] = true
Config['Texts']['Weapon']['Color'] = Color3.fromRGB(0, 255, 255) -- Cyan

local InputService = game:GetService("UserInputService")
InputService.InputBegan:Connect(function(Input, Processed)
    if not Processed and Input.KeyCode == Enum.KeyCode.Delete then
        ESP:Unload()
    end
end)

-- Team Check 직접 추가
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

RunService.RenderStepped:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                -- Team Check
                if player.Team == Players.LocalPlayer.Team then
                    -- 같은 팀이면 ESP 숨김
                    continue
                end
            end
        end
    end
end)
end,
})

local Button = MainTab:CreateButton({
   Name = "Inf jump",
   Callback = function()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- 캐릭터 리스폰 대응
player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
end)

local function doJump()
	if humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end

-- PC (스페이스)
UserInputService.JumpRequest:Connect(function()
	doJump()
end)

-- 모바일 + 콘솔 점프 버튼까지 커버
ContextActionService:BindAction(
	"InfiniteJump",
	function(_, inputState)
		if inputState == Enum.UserInputState.Begin then
			doJump()
		end
	end,
	false,
	Enum.KeyCode.Space,
	Enum.KeyCode.ButtonA
)
   end,
})

local Button = MainTab:CreateButton({
   Name = "fly",
   Callback = function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- 상태
local flying = false
local speed = 60

local keys = {W=false,A=false,S=false,D=false}

local character, humanoid, root
local att, lv, ao

-------------------------------------------------
-- 🧹 완전 종료 (절대 안전)
-------------------------------------------------
local function stopFly()
	flying = false

	if humanoid then
		humanoid.PlatformStand = false
		humanoid.WalkSpeed = 16
		humanoid.JumpPower = 50
		humanoid.AutoRotate = true
	end

	if root then
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero
	end

	if lv then lv:Destroy() lv = nil end
	if ao then ao:Destroy() ao = nil end
	if att then att:Destroy() att = nil end
end

-------------------------------------------------
-- 🚀 안전 setup (핵심: 항상 재생성 보장)
-------------------------------------------------
local function setup(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
	root = char:WaitForChild("HumanoidRootPart")

	stopFly()

	att = Instance.new("Attachment")
	att.Name = "FlyAttachment"
	att.Parent = root

	lv = Instance.new("LinearVelocity")
	lv.Name = "FlyVelocity"
	lv.Attachment0 = att
	lv.RelativeTo = Enum.ActuatorRelativeTo.World
	lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
	lv.MaxForce = math.huge
	lv.VectorVelocity = Vector3.zero
	lv.Parent = root

	ao = Instance.new("AlignOrientation")
	ao.Name = "FlyAlign"
	ao.Attachment0 = att
	ao.MaxTorque = math.huge
	ao.Responsiveness = 25
	ao.Parent = root
end

-------------------------------------------------
-- 🔥 Character 안정 로딩 (핵심 개선)
-------------------------------------------------
player.CharacterAdded:Connect(function(char)
	task.wait(0.2)
	setup(char)
end)

if player.Character then
	task.wait(0.2)
	setup(player.Character)
end

-------------------------------------------------
-- 🎮 입력
-------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end

	if input.KeyCode == Enum.KeyCode.F then
		flying = not flying

		if flying then
			-- 🔥 안전 보장 (nil 방지)
			if not root or not lv or not ao then
				if character then
					setup(character)
				end
			end

			if humanoid then
				humanoid.PlatformStand = true
				humanoid.WalkSpeed = 0
				humanoid.JumpPower = 0
				humanoid.AutoRotate = false
			end
		else
			stopFly()
		end
	end

	if input.KeyCode == Enum.KeyCode.W then keys.W = true end
	if input.KeyCode == Enum.KeyCode.A then keys.A = true end
	if input.KeyCode == Enum.KeyCode.S then keys.S = true end
	if input.KeyCode == Enum.KeyCode.D then keys.D = true end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then keys.W = false end
	if input.KeyCode == Enum.KeyCode.A then keys.A = false end
	if input.KeyCode == Enum.KeyCode.S then keys.S = false end
	if input.KeyCode == Enum.KeyCode.D then keys.D = false end
end)

-------------------------------------------------
-- 🕊️ Fly loop (완전 안정)
-------------------------------------------------
RunService.RenderStepped:Connect(function()
	if not flying then return end
	if not root or not lv or not ao then return end

	local cam = workspace.CurrentCamera
	local cf = cam.CFrame

	local x = (keys.D and 1 or 0) - (keys.A and 1 or 0)
	local z = (keys.W and 1 or 0) - (keys.S and 1 or 0)

	local move = Vector3.new(x, 0, z)

	local dir =
		(cf.RightVector * move.X) +
		(cf.LookVector * move.Z)

	lv.VectorVelocity = dir * speed
	ao.CFrame = cam.CFrame

	root.AssemblyAngularVelocity = Vector3.zero
end)
   end,
})
