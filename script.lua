if game.PlaceId == 15991080927 then

--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


--VALOR
_G.ESP =true

--funcao
function ESP()
while ESP == true then
    local gui = Instance.new ("SurfaceGui", parte)
    gui.Name = "ESP"
    gui.AlwaysOnTop = true
    gui.LightInfluence = 0
    gui.Size = UDim2.new (1.75, 0, 1.75, 0)
    local frame = Instance.new ("Frame", gui)
    frame.BackgroundColor3 = Color3.fromRGB (170, 0, 0)
    frame.Size = UDim2.new (1, 0, 1, 0)
    frame.BorderSizePixel = 4
    frame.BorderColor3 = Color3.fromRGB (0, 0, 0)
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
