-- Start
local allowedPlace = game.PlaceId == 70876832253163

if allowedPlace then
    loadstring(game:HttpGet("raw.githubusercontent.com/agungsan147/script/refs/heads/main/70876832253163/farm.lua"))()
    task.wait(2)
    loadstring(game:HttpGet("raw.githubusercontent.com/agungsan147/script/refs/heads/main/70876832253163/rejoin.lua"))()  
end
