-- Load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- VALOR
_G.ESP = false

-- Função para criar uma linha entre dois pontos
local function createLine(pointA, pointB)
    local line = Instance.new("LineHandleAdornment")
    line.Parent = game.Players.LocalPlayer.PlayerGui
    line.Adornee = workspace.CurrentCamera
    line.ZIndex = 0
    line.Color3 = Color3.new(1, 0, 0)  -- Cor da linha (vermelha)
    line.Thickness = 2  -- Largura da linha
    line.Transparency = 0.5

    line.Position = UDim2.new(0, 0, 0, 0)
    line.Size = UDim2.new(1, 0, 1, 0)
    line.AlwaysOnTop = true
    line.Visible = true

    line.PointA = pointA
    line.PointB = pointB

    return line
end

-- Função ESP
function ESP()
    while _G.ESP do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("Head") then
                    local headPosition = workspace.CurrentCamera:WorldToScreenPoint(character.Head.Position)
                    local myHeadPosition = workspace.CurrentCamera:WorldToScreenPoint(game.Players.LocalPlayer.Character.Head.Position)
                    
                    -- Criar a linha apenas para o jogador local
                    createLine(myHeadPosition, headPosition)
                end
            end
        end
        wait(0.1)
    end
end

-- Adicionando a função ESP ao menu
local JogadorTab = Window:MakeTab({
    Name = "Jogador",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adicionando uma seção ao menu
local Section = JogadorTab:AddSection({
    Name = "VISUAL"
})

-- Adicionando um botão de alternância para o ESP
JogadorTab:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(Value)
        _G.ESP = Value
        if Value then
            ESP()
        end
    end
})
