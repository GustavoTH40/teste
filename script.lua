--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--VALOR
_G.ESP = false

-- Função ESP
function ESP()
    while _G.ESP do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("Head") then
                    local headPosition = workspace.CurrentCamera:WorldToScreenPoint(character.Head.Position)
                    local topPosition = Vector2.new(headPosition.X, headPosition.Y - 30)  -- 30 pixels acima da cabeça

                    createLine(headPosition, topPosition)
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

-- Adicione a parte do ESP fornecida anteriormente aqui

