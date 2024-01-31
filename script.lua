if game.PlaceId == 15991080927 then

--load SORCE
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--MENU
local Window = OrionLib:MakeWindow({Name = "JRC MENU", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


--VALOR
_G.ESP = true

--funcao
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
