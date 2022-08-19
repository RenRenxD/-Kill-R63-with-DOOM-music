local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Kill R63 with DOOM")
local b = w:CreateFolder("MADE BY ren !#2925")

local playertable = {}

local function doshit()
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
   if v~=game.Players.LocalPlayer then
       playertable[#playertable+1] = v.Name
   end
end
end

doshit()

game.Players.PlayerAdded:Connect(function()
doshit()
b:Refresh(playertable)
end)

game.Players.PlayerRemoving:Connect(function()
doshit()
b:Refresh(playertable)
end)

local a

b:Dropdown("Select Player",{table.unpack(playertable)},true,function(mob)
    a = mob
    print(a)
end)

b:Box("Kills amount","number",function(kills)
    print(kills)
    game:GetService("ReplicatedStorage").ACS_Engine.Events.Refil:FireServer(game.Players[a].leaderstats.Kills, kills/2)
end)

b:Box("Currency amount","number",function(money)
    print(money)
    game:GetService("ReplicatedStorage").ACS_Engine.Events.Refil:FireServer(game.Players[a].leaderstats.Currency, money/2)
end)

b:DestroyGui()
