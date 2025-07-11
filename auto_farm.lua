-- Auto Farm Muscle Legends com GUI
-- Compatível com Delta Executor

pcall(function()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Toggle = Instance.new("TextButton")
    local isFarming = false

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
    Frame.Size = UDim2.new(0, 180, 0, 100)

    UICorner.Parent = Frame

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(1, 0, 0.4, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Auto Farm - Muscle Legends"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14.000

    Toggle.Name = "Toggle"
    Toggle.Parent = Frame
    Toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
    Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
    Toggle.Size = UDim2.new(0.8, 0, 0.3, 0)
    Toggle.Font = Enum.Font.Gotham
    Toggle.Text = "Iniciar Auto Farm"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14.000

    local function startAutoFarm()
        local player = game.Players.LocalPlayer
        local tool
        while isFarming do
            if player.Character and player.Character:FindFirstChildOfClass("Tool") then
                tool = player.Character:FindFirstChildOfClass("Tool")
                tool:Activate()
            else
                for _, item in ipairs(player.Backpack:GetChildren()) do
                    if item:IsA("Tool") then
                        item.Parent = player.Character
                        break
                    end
                end
            end
            task.wait(0.2)
        end
    end

    Toggle.MouseButton1Click:Connect(function()
        isFarming = not isFarming
        Toggle.Text = isFarming and "Parar Auto Farm" or "Iniciar Auto Farm"
        if isFarming then
            task.spawn(startAutoFarm)
        end
    end)
end)
