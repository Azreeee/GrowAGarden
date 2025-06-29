--// Enhanced Custom Grow a Garden Spawner (Keyless)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Sample database
local Pets = {"Raccoon", "Dragonfly"}
local Seeds = {"Candy Blossom"}
local Eggs = {"Night Egg", "Spring Egg"}

local Spawner = {}

function Spawner.GetPets()
    return Pets
end

function Spawner.GetSeeds()
    return Seeds
end

function Spawner.SpawnPet(name, weight, age)
    print("Spawned pet:", name, "| Weight:", weight, "KG | Age:", age)
    -- Replace with RemoteEvent if needed
end

function Spawner.SpawnSeed(name)
    print("Spawned seed:", name)
end

function Spawner.SpawnEgg(name)
    print("Spawned egg:", name)
end

function Spawner.Spin(item)
    print("Spinning:", item)
end

function Spawner.Load()
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "CustomSpawnerUI"
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(75, 85, 115)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundTransparency = 0
    frame.ZIndex = 2
    frame.Visible = true
    frame.Active = true
    frame.Draggable = true
    frame.BorderColor3 = Color3.new(0, 0, 0)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    frame.SizeConstraint = Enum.SizeConstraint.RelativeXY
    frame.AutomaticSize = Enum.AutomaticSize.None
    frame.Visible = false

    -- Round corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame

    -- Tween pop up
    frame.Visible = true
    frame.Size = UDim2.new(0, 0, 0, 0)
    local tween = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 250)
    })
    tween:Play()

    -- Minimize / Back Button
    local backBtn = Instance.new("TextButton")
    backBtn.Parent = frame
    backBtn.Size = UDim2.new(0, 30, 0, 30)
    backBtn.Position = UDim2.new(1, -35, 0, 5)
    backBtn.Text = "-"
    backBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 120)

    local corner2 = Instance.new("UICorner")
    corner2.CornerRadius = UDim.new(1, 0)
    corner2.Parent = backBtn

    local minimized = false
    backBtn.MouseButton1Click:Connect(function()
        if minimized then
            tween = TweenService:Create(frame, TweenInfo.new(0.3), {
                Size = UDim2.new(0, 300, 0, 250)
            })
        else
            tween = TweenService:Create(frame, TweenInfo.new(0.3), {
                Size = UDim2.new(0, 300, 0, 40)
            })
        end
        minimized = not minimized
        tween:Play()
    end)

    -- Candy Blossom Button
    local btn1 = Instance.new("TextButton", frame)
    btn1.Size = UDim2.new(1, -20, 0, 40)
    btn1.Position = UDim2.new(0, 10, 0, 50)
    btn1.Text = "Spawn Candy Blossom"
    btn1.BackgroundColor3 = Color3.fromRGB(100, 150, 100)

    local corner3 = Instance.new("UICorner")
    corner3.CornerRadius = UDim.new(0, 8)
    corner3.Parent = btn1

    btn1.MouseButton1Click:Connect(function()
        Spawner.SpawnSeed("Candy Blossom")
    end)

    -- Raccoon Button
    local btn2 = Instance.new("TextButton", frame)
    btn2.Size = UDim2.new(1, -20, 0, 40)
    btn2.Position = UDim2.new(0, 10, 0, 100)
    btn2.Text = "Spawn Raccoon"
    btn2.BackgroundColor3 = Color3.fromRGB(130, 100, 150)

    local corner4 = Instance.new("UICorner")
    corner4.CornerRadius = UDim.new(0, 8)
    corner4.Parent = btn2

    btn2.MouseButton1Click:Connect(function()
        Spawner.SpawnPet("Raccoon", 1, 2)
    end)

    -- Dragonfly Button
    local btn3 = Instance.new("TextButton", frame)
    btn3.Size = UDim2.new(1, -20, 0, 40)
    btn3.Position = UDim2.new(0, 10, 0, 150)
    btn3.Text = "Spawn Dragonfly"
    btn3.BackgroundColor3 = Color3.fromRGB(80, 130, 160)

    local corner5 = Instance.new("UICorner")
    corner5.CornerRadius = UDim.new(0, 8)
    corner5.Parent = btn3

    btn3.MouseButton1Click:Connect(function()
        Spawner.SpawnPet("Dragonfly", 1, 2)
    end)
end

return Spawner
