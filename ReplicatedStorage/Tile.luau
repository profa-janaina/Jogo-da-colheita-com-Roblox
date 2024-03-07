local class = require(game.ReplicatedStorage.middleclass)

local Tile = class('Tile')

local MAX_STAGE = 4

local stages = {
	game.ReplicatedStorage.Prefabs.Stage1,
	game.ReplicatedStorage.Prefabs.Stage2,
	game.ReplicatedStorage.Prefabs.Stage3,
	game.ReplicatedStorage.Prefabs.Stage4,
	game.ReplicatedStorage.Prefabs.Stage31,
	game.ReplicatedStorage.Prefabs.Stage41,
	game.ReplicatedStorage.Prefabs.Stage32,
	game.ReplicatedStorage.Prefabs.Stage42,
	game.ReplicatedStorage.Prefabs.Stage33,
	game.ReplicatedStorage.Prefabs.Stage43
}

function Tile:initialize(instance)
	self.stage = 0
	self.position = instance.Position
	self.model = nil
end

function Tile:isComplete()
	return self.stage >= MAX_STAGE
end

function Tile: setStage(stage, nameVegetable)
	self.stage = stage
	self.nameVegetable = nameVegetable
	
	--Destroy old model
	if self.model ~= nil  then
		self.model:Destroy()
		self.model = nil
	end
	
	--Handle model
	if self.stage > 0 then
		local prefab
		if self.stage >= 3  then
			if (self.nameVegetable == 'tilesPumpkin') then
				prefab = stages[self.stage]
				
			elseif (self.nameVegetable == 'tileCabbages') then
				prefab = stages[self.stage + 2]
				
			elseif (self.nameVegetable == 'tilesWatermelon') then
				prefab = stages[self.stage + 4]
				
			elseif (self.nameVegetable == 'tilesCarrot') then
				prefab = stages[self.stage + 6]
				
			end
			
		else			
		prefab = stages[self.stage]			
		end
		
		
		
		local model = prefab:Clone()
		model.Parent = game.Workspace
		model:TranslateBy(self.position - model:GetPrimaryPartCFrame().p)

		self.model = model
		
		--Handle click detection
		if self.stage == MAX_STAGE then
			model.ClickDetector.MouseClick:Connect(function()
				self:setStage(0)
				_G.gameData.coins += 10
			end)
		end
	end
end
return Tile