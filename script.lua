--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--funcao
_G.ESP = false -- mude para true se quiser ativar o esp por padrão
function ESP()
    while _G.ESP == true do
        -- obter todos os jogadores no jogo
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer
        local currentCamera = workspace.CurrentCamera
        
        -- criar uma pasta para armazenar os elementos do esp
        local espFolder = Instance.new("Folder", game.CoreGui)
        espFolder.Name = "ESP"
        
        -- loop por cada jogador
        for i, player in pairs(players:GetPlayers()) do
            -- verificar se o jogador é inimigo e está vivo
            if player ~= localPlayer and player.TeamColor ~= localPlayer.TeamColor and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                -- obter a posição do jogador na tela
                local playerHead = player.Character:FindFirstChild("Head")
                local playerHeadPos, playerHeadVis = currentCamera:WorldToScreenPoint(playerHead.Position)
                
                -- criar uma caixa ao redor do jogador
                local box = Instance.new("Frame", espFolder)
                box.Name = "Box"
                box.Size = UDim2.new(0, 100, 0, 100) -- ajuste o tamanho da caixa
                box.Position = UDim2.new(0, playerHeadPos.X - 50, 0, playerHeadPos.Y - 50) -- ajuste a posição da caixa
                box.AnchorPoint = Vector2.new(0.5, 0.5)
                box.BorderSizePixel = 2
                box.BorderColor3 = Color3.new(1, 0, 0) -- ajuste a cor da caixa
                box.BackgroundTransparency = 1
                
                -- criar um texto com o nome do jogador
                local name = Instance.new("TextLabel", box)
                name.Name = "Name"
                name.Size = UDim2.new(1, 0, 0, 20)
                name.Position = UDim2.new(0, 0, 0, -20)
                name.AnchorPoint = Vector2.new(0, 0)
                name.Font = Enum.Font.SourceSansBold
                name.TextSize = 14
                name.TextColor3 = Color3.new(1, 1, 1) -- ajuste a cor do texto
                name.BackgroundTransparency = 1
                name.Text = player.Name
                
                -- criar um texto com a distância do jogador
                local distance = Instance.new("TextLabel", box)
                distance.Name = "Distance"
                distance.Size = UDim2.new(1, 0, 0, 20)
                distance.Position = UDim2.new(0, 0, 1, 0)
                distance.AnchorPoint = Vector2.new(0, 1)
                distance.Font = Enum.Font.SourceSansBold
                distance.TextSize = 14
                distance.TextColor3 = Color3.new(1, 1, 1) -- ajuste a cor do texto
                distance.BackgroundTransparency = 1
                distance.Text = math.floor((playerHead.Position - localPlayer.Character.Head.Position).Magnitude) .. "m" -- calcular a distância em metros
                
                -- criar um texto com a saúde do jogador
                local health = Instance.new("TextLabel", box)
                health.Name = "Health"
                health.Size = UDim2.new(1, 0, 0, 20)
                health.Position = UDim2.new(0, 0, 0.5, 0)
                health.AnchorPoint = Vector2.new(0, 0.5)
                health.Font = Enum.Font.SourceSansBold
                health.TextSize = 14
                health.TextColor3 = Color3.new(1, 1, 1) -- ajuste a cor do texto
                health.BackgroundTransparency = 1
                health.Text = player.Character.Humanoid.Health .. "/" .. player.Character.Humanoid.MaxHealth -- mostrar a saúde atual e máxima do jogador
                
                -- atualizar o esp a cada quadro
                game:GetService("RunService").RenderStepped:Connect(function()
                    -- verificar se o jogador ainda é inimigo e está vivo
                    if player ~= localPlayer and player.TeamColor ~= localPlayer.TeamColor and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                        -- atualizar a posição do jogador na tela
                        local playerHead = player.Character:FindFirstChild("Head")
                        local playerHeadPos, playerHeadVis = currentCamera:WorldToScreenPoint(playerHead.Position)
                        
                        -- atualizar a posição da caixa
                        box.Position = UDim2.new(0, playerHeadPos.X - 50, 0, playerHeadPos.Y - 50) -- ajuste a posição da caixa
                        
                        -- atualizar o texto da distância
                        distance.Text = math.floor((playerHead.Position - localPlayer.Character.Head.Position).Magnitude) .. "m" -- calcular a distância em metros
                        
                        -- atualizar o texto da saúde
                        health.Text = player.Character.Humanoid.Health .. "/" .. player.Character.Humanoid.MaxHealth -- mostrar a saúde atual e máxima do jogador
                        
                        -- verificar se o jogador está visível ou não
                        if playerHeadVis then
                            -- mostrar a caixa e os textos
                            box.Visible = true
                        else
                            -- esconder a caixa e os textos
                            box.Visible = false
                        end
                    else
                        -- destruir a caixa e os textos
                        box:Destroy()
                    end
                end)
            end
        end
    end
end

--jogador
local JogadorTab = Window:MakeTab({
	Name = "Jogador",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--SECAO
local Section = JogadorTab:AddSection({
	Name = "VISUAL"
})
JogadorTab:AddToggle({
	Name = "ESP",
	Default = false,
	Callback = function(Value)
		_G.ESP = Value
        ESP()
	end    
})
