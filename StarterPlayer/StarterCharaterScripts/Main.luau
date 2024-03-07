--Load GameData
_G.gameData = require(game.ReplicatedStorage.gameData)

--Dependencies
local Tile = require(game.ReplicatedStorage.Tile)
local GrowthManager = require(game.ReplicatedStorage.GrowthManager)
local RunService = game:GetService('RunService')


--Create Tile objects
local tilesChildren = game.Workspace.Tiles:GetChildren()
for index, tileInstance in tilesChildren do
	local tile = Tile:new(tileInstance)
	
	--table.insert(_G.gameData.tiles, tile)
	
	if (index <= 16) then
		table.insert(_G.gameData.tilesPumpkin, tile)
	elseif (index > 16 and index <= 32) then
		table.insert(_G.gameData.tileCabbages, tile)
	elseif (index > 32 and index <= 48) then
		table.insert(_G.gameData.tilesWatermelon, tile)
	elseif (index > 48) then
		table.insert(_G.gameData.tilesCarrot, tile)
	end
	
	--print(tile.position)
end

--Criar loop para o GrowthManager com delta time
RunService.Heartbeat:Connect(function(deltaTime: number) 
	GrowthManager:run(deltaTime)
end)

