if game.PlaceId == 15991080927 then

--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


--VALOR
_G.ESP = true

---funcao
function ESP()
    while _G.ESP == true do
        --pegar todos os jogadores
        local players = game:GetService("Players")
        --loopar por cada jogador
        for i, player in pairs(players:GetChildren()) do
            --verificar se o jogador é diferente do localplayer
            if player ~= players.LocalPlayer then
                --pegar a personagem do jogador
                local character = player.Character
                --verificar se a personagem existe e está viva
                if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                    --pegar a cabeça da personagem
                    local head = character:FindFirstChild("Head")
                    --verificar se a cabeça existe
                    if head then
                        --criar um billboard gui na cabeça
                        local esp = head:FindFirstChild("ESP") or Instance.new("BillboardGui", head)
                        --definir as propriedades do esp
                        esp.Name = "ESP"
                        esp.AlwaysOnTop = true
                        esp.Size = UDim2.new(0, 200, 0, 50)
                        esp.StudsOffset = Vector3.new(0, 1, 0)
                        esp.Adornee = head
                        --criar um texto no esp
                        local text = esp:FindFirstChild("Text") or Instance.new("TextLabel", esp)
                        --definir as propriedades do texto
                        text.Name = "Text"
                        text.BackgroundTransparency = 1
                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.TextColor3 = Color3.new(1, 0, 0) --vermelho
                        text.TextStrokeTransparency = 0
                        text.Font = Enum.Font.SourceSansBold
                        text.TextSize = 20
                        text.Text = player.Name --mostrar o nome do jogador
                    end
                end
            end
        end
        --esperar um pouco antes de repetir o loop
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
