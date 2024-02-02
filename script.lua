-- Script para dar kick em todos os jogadores do roblox
local players = game:GetService ("Players") -- obtém o serviço de jogadores
for i,v in ipairs (players:GetPlayers ()) do -- percorre todos os jogadores
  v:kick ("Motivo") -- v é a instância/objeto do jogador
end
