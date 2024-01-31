-- Load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- VALOR
local ESPEnabled = false

-- Função para criar uma linha entre dois pontos
local function createLine(pointA, pointB)
    local line = Drawing.new("Line")
    line.From = pointA
    line.To = pointB
    line.Color = Color3.new(1, 0, 0)
    line.Thickness = 2
    line.Transparency = 0.5
    line.Visible = true

    return line
end

-- Função ESP
function ESP()
    while ESPEnabled do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("Head") then
                    local headPosition = workspace.CurrentCamera:WorldToViewportPoint(character.Head.Position)
                    local myHeadPosition = workspace.CurrentCamera:WorldToViewportPoint(game.Players.LocalPlayer.Character.Head.Position)
                    
                    -- Criar a linha apenas para o jogador local
                    createLine(Vector2.new(myHeadPosition.x, myHeadPosition.y), Vector2.new(headPosition.x, headPosition.y))
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
        ESPEnabled = Value
        if Value then
            ESP()
        end
    end
})
