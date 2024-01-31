if game.PlaceId == 15991080927 then

--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


--VALOR
_G.ESP = true

--funcao
function ESP()
    --verificar se o esp está ligado
    if _G.ESP == true then
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
    end
end

--pegar o serviço de execução
local runService = game:GetService("RunService")

--definir o estado inicial do esp
_G.ESP = false

--conectar a função ESP ao evento RenderStepped
local connection = runService.RenderStepped:Connect(ESP)

--pegar o botão toggle
local JogadorTab = Window:MakeTab({
	Name = "Jogador",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = JogadorTab:AddSection({
	Name = "VISUAL"
})

JogadorTab:AddToggle({
	Name = "ESP",
	Default = false,
	Callback = function(Value)
        --mudar o valor do esp
		_G.ESP = Value
        --verificar se o esp está ligado ou desligado
        if Value == true then
            --reconectar a função ESP ao evento RenderStepped
            connection = runService.RenderStepped:Connect(ESP)
        else
            --desconectar a função ESP do evento RenderStepped
            connection:UnbindFromRenderStep()
        end
	end    
})

