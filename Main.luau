local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Bypass Tp Anticheat", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local workspace = game.Workspace



local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Main:AddTextbox({
	Name = "Name of Player",
	Default = "write",
	TextDisappear = true,
	Callback = function(Value)
		
	end	  
})

Main:AddButton({
	Name = "Goto",
	Callback = function()
            local destination = workspace.Value.Head.CFrame.Position --Vector3.new(0, 10, 0) -- Точка в космосе или в другом месте
            local function setGravity(value)
                workspace.Gravity = value
            end
            local tweenInfo = TweenInfo.new(
                0.5,
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.InOut,
                0,
                false,
                0
            )
            local goal = {
                CFrame = CFrame.new(destination)
            }
            humanoidRootPart.CanCollide = false
            local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
            tween.Completed:Connect(function()
                print("Movement complete.")
                setGravity(196.1)
            end)
            local function startMovement()
                print("Calculating...")
                setGravity(0)
                tween:Play()
            end
            startMovement()
  	end    
})


