if game.PlaceId == 15991080927 then

--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


--VALOR
_G.ESP = true

--funcao
function ESP()
    while _G.ESP == true do
        --pegar todos os jogadores
        local players = game:GetService("Players")
        --pegar o serviço de entrada do usuário
        local userInputService = game:GetService("UserInputService")
        --pegar a câmera do jogo
        local camera = workspace.CurrentCamera
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
                        --converter a posição da cabeça para a posição na tela
                        local headPos = camera:WorldToViewportPoint(head.Position)
                        --converter a posição do localplayer para a posição na tela
                        local localPos = camera:WorldToViewportPoint(players.LocalPlayer.Character.Head.Position)
                        --desenhar uma linha entre as duas posições
                        userInputService:DrawLine(headPos, localPos, Color3.new(1, 0, 0), 2) --vermelho
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
		_G.ESP = true
        ESP()
	end    
})

end
