if game.PlaceId == 15991080927 then

    --load SORCE
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

    --MENU
    local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

    --VALOR
    _G.ESP = false

    --funcao
    function ESP()
        while true do
            wait(1)

            if _G.ESP then
                -- Obter todos os jogadores no jogo
                local players = game:GetService("Players"):GetPlayers()

                -- Iterar sobre cada jogador
                for _, player in pairs(players) do
                    -- Verificar se o jogador é diferente do jogador local
                    if player ~= game.Players.LocalPlayer then
                        -- Criar uma linha ESP para o jogador
                        local espLine = Drawing.new("Line")
                        espLine.Visible = true
                        espLine.From = Vector2.new(game.Players.LocalPlayer:WaitForChild("PlayerGui").ViewportFrame.WorldFrame:WaitForChild(player.Name).Position.X, game.Players.LocalPlayer:WaitForChild("PlayerGui").ViewportFrame.WorldFrame:WaitForChild(player.Name).Position.Y)
                        espLine.To = Vector2.new(game.Players.LocalPlayer:WaitForChild("PlayerGui").ViewportFrame.WorldFrame:WaitForChild(player.Name).Position.X, game.Players.LocalPlayer:WaitForChild("PlayerGui").ViewportFrame.WorldFrame:WaitForChild(player.Name).Position.Y + player.Character:WaitForChild("Humanoid").HipHeight * 3)
                        espLine.Color = Color3.new(1, 1, 1) -- Cor do ESP (branco)
                    end
                end
            end
        end
    end

    -- Jogador
    local JogadorTab = Window:MakeTab({
        Name = "Jogador",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- SECAO
    local Section = JogadorTab:AddSection({
        Name = "VISUAL"
    })

    JogadorTab:AddToggle({
        Name = "ESPp",
        Default = false,
        Callback = function(Value)
            _G.ESP = Value
        end
    })

    -- Iniciar ESP
    ESP()

end
