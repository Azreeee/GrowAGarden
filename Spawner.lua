--// Custom Grow a Garden Spawner (Keyless)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Sample database
local Pets = {"Raccoon", "Frog", "Chick", "Snail"}
local Seeds = {"Candy Blossom", "Sunflower Seed", "Mushroom Spores"}
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
    -- Replace this print with actual spawning if RemoteEvents exist
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
    local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
    ScreenGui.Name = "CustomSpawnerUI"
    
    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(1, -20, 0, 40)
    Button.Position = UDim2.new(0, 10, 0, 10)
    Button.Text = "Spawn Candy Blossom"
    Button.MouseButton1Click:Connect(function()
        Spawner.SpawnSeed("Candy Blossom")
    end)
end

return Spawner
