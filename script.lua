if game.PlaceId == 15991080927 then

--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


--VALOR
_G.ESP = true

--funcao
--funcao
function ESP()
    while _G.ESP == true do
        --pegar todos os jogadores
        local Players = game:GetService("Players")
        --loop for para cada jogador
        for i, v in pairs(Players:GetPlayers()) do
            --verificar se o jogador é diferente de você e se está vivo
            if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                --verificar se o jogador está na mesma equipe que você
                local SameTeam = v.TeamColor == Players.LocalPlayer.TeamColor
                --criar um BillboardGui para o jogador
                local Billboard = Instance.new("BillboardGui", v.Character)
                --definir as propriedades do BillboardGui
                Billboard.Name = "ESP"
                Billboard.AlwaysOnTop = true
                Billboard.Size = UDim2.new(0, 100, 0, 150)
                Billboard.StudsOffset = Vector3.new(0, 2, 0)
                Billboard.Adornee = v.Character
                --criar um TextLabel para o BillboardGui
                local TextLabel = Instance.new("TextLabel", Billboard)
                --definir as propriedades do TextLabel
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.TextColor3 = SameTeam and Color3.new(0, 1, 0) or Color3.new(1, 0, 0) --verde para aliados, vermelho para inimigos
                TextLabel.TextStrokeTransparency = 0.5
                TextLabel.Font = Enum.Font.SourceSansBold
                TextLabel.TextSize = 20
                TextLabel.Text = v.Name .. "\n" .. math.floor((v.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) .. "m\n" .. v.Character.Humanoid.Health .. "/" .. v.Character.Humanoid.MaxHealth --mostrar o nome, a distância e a saúde do jogador
            end
        end
        --esperar 0.1 segundos antes de repetir o loop
        wait(0.1)
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
		_G.ESP =true
        ESP()
	end    
})

end
