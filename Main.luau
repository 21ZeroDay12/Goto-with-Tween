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
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		local destination = game.Players.LocalPlayer.Character.Parent[Value].HumanoidRootPart.Position -- Точка в космосе или в другом месте
        local function setGravity(value)
            workspace.Gravity = value
        end
        local tweenInfo = TweenInfo.new(
            10,
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

--{    Main:AddButton({
--        Name = "Goto",
--       Callback = function()
--                
--        end    
--    })
--}
