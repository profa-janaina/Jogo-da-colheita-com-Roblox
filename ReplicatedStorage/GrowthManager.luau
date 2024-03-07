local GrowthManager = {}
local GrowthChancePerSecond = 0.02


function GrowthManager:run(deltaTime:number)
	local tilesPumpkin = _G.gameData.tilesPumpkin
	local tileCabbages = _G.gameData.tileCabbages
	local tilesWatermelon = _G.gameData.tilesWatermelon
	local tilesCarrot = _G.gameData.tilesCarrot
	
	for _, tile in tilesPumpkin do
		--Ignore complete tiles
		if tile:isComplete() then
			continue
		end
		
		--Calculate chance
		local chance = GrowthChancePerSecond * deltaTime
		if math.random() > chance then
			continue
		end
		
		--Grow
		tile:setStage(tile.stage + 1, 'tilesPumpkin')	
		
	end
	
	for _, tile in tileCabbages do
		--Ignore complete tiles
		if tile:isComplete() then
			continue
		end

		--Calculate chance
		local chance = GrowthChancePerSecond * deltaTime
		if math.random() > chance then
			continue
		end

		--Grow
		tile:setStage(tile.stage + 1, 'tileCabbages')	

	end
	
	for _, tile in tilesWatermelon do
		--Ignore complete tiles
		if tile:isComplete() then
			continue
		end

		--Calculate chance
		local chance = GrowthChancePerSecond * deltaTime
		if math.random() > chance then
			continue
		end

		--Grow
		tile:setStage(tile.stage + 1, 'tilesWatermelon')	

	end
	
	for _, tile in tilesCarrot do
		--Ignore complete tiles
		if tile:isComplete() then
			continue
		end

		--Calculate chance
		local chance = GrowthChancePerSecond * deltaTime
		if math.random() > chance then
			continue
		end

		--Grow
		tile:setStage(tile.stage + 1, 'tilesCarrot')	

	end
	
end

return GrowthManager
