local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "RedShadow"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(270, 330)
main.Position = UDim2.new(0.5, -135, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 35, 50)
stroke.Thickness = 2
stroke.Parent = main

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -45, 0, 48)
header.Position = UDim2.fromOffset(12, 0)
header.BackgroundTransparency = 1
header.Text = "RED SHADOW"
header.TextColor3 = Color3.fromRGB(255, 40, 55)
header.Font = Enum.Font.GothamBlack
header.TextSize = 21
header.Parent = main

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(32, 32)
minimize.Position = UDim2.new(1, -39, 0, 8)
minimize.BackgroundColor3 = Color3.fromRGB(65, 15, 22)
minimize.Text = "−"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.TextSize = 23
minimize.Font = Enum.Font.GothamBold
minimize.Parent = main
Instance.new("UICorner", minimize).CornerRadius =
    UDim.new(0, 8)

local line = Instance.new("Frame")
line.Size = UDim2.new(1, -24, 0, 2)
line.Position = UDim2.fromOffset(12, 48)
line.BackgroundColor3 = Color3.fromRGB(230, 30, 45)
line.BorderSizePixel = 0
line.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 9)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder

local container = Instance.new("Frame")
container.Size = UDim2.new(1, -24, 1, -70)
container.Position = UDim2.fromOffset(12, 60)
container.BackgroundTransparency = 1
container.Parent = main
layout.Parent = container

local options = {
    "⚡  VELOCIDAD",
    "⬆  SUPER SALTO",
    "✈  VUELO",
    "📍  TELETRANSPORTE",
    "↻  REINICIAR"
}

for _, name in ipairs(options) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 43)
    button.BackgroundColor3 = Color3.fromRGB(35, 17, 21)
    button.BorderSizePixel = 0
    button.Text = name
    button.TextColor3 = Color3.fromRGB(245, 245, 245)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = container

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    local border = Instance.new("UIStroke")
    border.Color = Color3.fromRGB(155, 30, 42)
    border.Thickness = 1
    border.Parent = button

    button.MouseButton1Click:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.12),
            {BackgroundColor3 = Color3.fromRGB(105, 20, 32)}
        ):Play()

        task.delay(0.15, function()
            if button.Parent then
                TweenService:Create(
                    button,
                    TweenInfo.new(0.18),
                    {BackgroundColor3 = Color3.fromRGB(35, 17, 21)}
                ):Play()
            end
        end)

        print("Seleccionaste: " .. name)
    end)
end

local minimized = false

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    container.Visible = not minimized
    line.Visible = not minimized

    TweenService:Create(
        main,
        TweenInfo.new(0.2),
        {
            Size = minimized
                and UDim2.fromOffset(270, 48)
                or UDim2.fromOffset(270, 330)
        }
    ):Play()

    minimize.Text = minimized and "+" or "−"
end)
