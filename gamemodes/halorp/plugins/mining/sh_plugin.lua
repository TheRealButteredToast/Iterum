local PLUGIN = PLUGIN
PLUGIN.name = "Mining"
PLUGIN.author = "Toast"
PLUGIN.desc = "Adds resources and ways to get them."
PLUGIN.resEntities = {"nut_tree", "nut_rock"}
PLUGIN.spawnedGathers = PLUGIN.spawnedGathers or {}
PLUGIN.gatherPoints = PLUGIN.gatherPoints or {}

nut.config.add("gathering", true, "Whether gathering is active or not.", nil, {
	category = "Gathering"
})

nut.config.add("gDamage", true, "Whether the trees and rocks will deplete from gathering resources from them", nil, {
	category = "Gathering"
})

nut.config.add("gatheringSpawn", 3600, "How much time it will take for a gathering entity to spawn.", nil, {
	data = {min = 1, max = 84600},
	category = "Gathering"
})

nut.config.add("gMaxWorldGather", 75, "Number of gathering entitites the World will have.", nil, {
	data = {min = 1, max = 75},
	category = "Gathering"
})

nut.config.add("lifeDrain", 10, "How much life will be drain from the entities that are being gathered.", nil, {
	category = "Gathering",
	data = {min=1, max=200}
})

nut.config.add("treeLife", 150, "How much life the trees will have.", nil, {
	category = "Gathering",
	data = {min=1, max=2000}
})

nut.config.add("rockLife", 100, "How much life the rocks will have.", nil, {
	category = "Gathering",
	data = {min=1, max=2000}
})

gatherItems = {
	["rock"] = {
		["default"] = {
			["rock"] = 15
		}
	},
	["carbon"] = {
		["default"] = {
			["carbon"] = 15
		}
	},
	["titanium"] = {
		["default"] = {
			["titanium"] = 15
		}
	},
	["carobell"] = {
		["default"] = {
			["carobellium"] = 15
		}
	},
	["tree"] = {
		["default"] = {
			["wood"] = 15
		}
	}
}

if SERVER then
	function PLUGIN:SaveData()
		self:setData(self.gatherPoints)
	end

	function PLUGIN:LoadData()
		self.gatherPoints = self:getData()
		self:Initialize()
	end

	function PLUGIN:Initialize()
		if nut.config.get("gathering") then
			for k, v in pairs(self.gatherPoints) do
				self:setGathering(v)
			end
		end
	end

	function PLUGIN:Think()

		if nut.config.get("gathering") then
			self:removeInvalidGathers()
			local point = table.Random(self.gatherPoints)

			if (!point) then return end

			for _, v in pairs(self.spawnedGathers) do
				if point == v[2] then return end
			end
			
			if(!timer.Exists("RS")) then
				timer.Create("RS", nut.config.get("gatheringSpawn"), 1, function()
					self:setGathering(point)
				end)
			end
		end
	end

	local function getRandomTreeModel()
		local trees = {
			"models/props_foliage/tree_poplar_01.mdl",
			"models/props_foliage/tree_springers_01a-lod.mdl",
			"models/props_foliage/tree_springers_01a.mdl",
			"models/props_foliage/tree_deciduous_03b.mdl",
			"models/props_foliage/tree_deciduous_03a.mdl",
			"models/props_foliage/tree_deciduous_02a.mdl",
			"models/props_foliage/tree_deciduous_01a.mdl",
			"models/props_foliage/tree_deciduous_01a-lod.mdl",
			"models/props_foliage/tree_cliff_01a.mdl",
		}
		local random = math.random(1,table.getn(trees))
		return trees[random]
	end

	local function getRandomRockModel()
		local rock = {
			"models/props_wasteland/rockcliff01b.mdl",
			"models/props_wasteland/rockcliff01c.mdl",
			"models/props_wasteland/rockcliff01e.mdl",
			"models/props_wasteland/rockcliff01f.mdl",
			"models/props_wasteland/rockcliff01j.mdl",
			"models/props_wasteland/rockcliff01k.mdl",
		}
		local random = math.random(1,table.getn(rock))
		return rock[random]
	end

	local function getRandomCarbonModel()
		local rock = {
			"models/props_foliage/forestrock_cluster02.mdl",
			"models/props_foliage/forestrock_cluster01.mdl",
			"models/props_foliage/forestrock_single01.mdl"
		}
		local random = math.random(1,table.getn(rock))
		return rock[random]
	end

	local function getRandomTitaniumModel()
		local rock = {
			"models/astbelt/ast_big.mdl",
			"models/astbelt/ast_med1.mdl",
			"models/astbelt/ast_med2.mdl",
			"models/astbelt/ast_med3.mdl",
			"models/astbelt/ast_small.mdl",
		}
		local random = math.random(1,table.getn(rock))
		return rock[random]
	end

	local function getRandomCaroModel()	
		local rock = {
			"models/props_foliage/rock_forest01.mdl",
			"models/props_foliage/rock_forest01a.mdl",
			"models/props_foliage/rock_forest02.mdl"
		}
		local random = math.random(1,table.getn(rock))
		return rock[random]
	end

	function PLUGIN:setGathering(point)
		local entity = ents.Create("nut_"..point[2])
		entity:SetPos(point[1])
		entity:setNetVar("resTable", point[3])
		entity:SetAngles(entity:GetAngles())

		if (point[2] == "rock") then
			entity:SetModel(getRandomRockModel())
		elseif (point[2] == "carbon") then	
			entity:SetModel(getRandomCarbonModel())
		elseif (point[2] == "carobell") then	
			entity:SetModel(getRandomCaroModel())
			entity:SetMaterial("models/weapons/v_crossbow/rebar_glow")
		elseif (point[2] == "titanium") then	
			entity:SetModel(getRandomTitaniumModel())
		elseif (point[2] == "tree") then	
			entity:SetModel(getRandomTreeModel())
		end

		entity:Spawn()
		table.insert(self.spawnedGathers, {entity, point})
	end

	function PLUGIN:removeInvalidGathers()
		for k, v in ipairs(self.spawnedGathers) do
			if !IsValid(v[1]) then
				table.remove(self.spawnedGathers, k)
			end
		end
	end
end

local function getGatheredItem(client, ent)
	if(ent:GetClass() == "nut_rock") then
		return "rock"
	elseif(ent:GetClass() == "nut_carbon") then
		return "carbon"
	elseif(ent:GetClass() == "nut_titanium") then
		return "titanium"
	elseif(ent:GetClass() == "nut_carobell") then
		return "carobellium"
	elseif(ent:GetClass() == "nut_tree") then
		return "wood"
	end
	
	return nil
end

local function getItemEntity(item)
	for k, v in SortedPairs(nut.item.list) do
		if (item == v.uniqueID) then
			return v
		end
	end
	return nil
end


netstream.Hook("nut_lc_gather", function(client, ent, tool)
	if (IsValid(ent)) then
		if (ent:GetClass() == "nut_rock" and tool:GetClass() == "hl2_m_pickaxe") or (ent:GetClass() == "nut_tree" and tool:GetClass() == "hl2_m_pickaxe") or (ent:GetClass() == "nut_carbon" and tool:GetClass() == "hl2_m_pickaxe") or (ent:GetClass() == "nut_titanium" and tool:GetClass() == "hl2_m_pickaxe") or (ent:GetClass() == "nut_carobell" and tool:GetClass() == "hl2_m_pickaxe") then
			client:EmitSound( Format( "physics/concrete/rock_impact_hard%d.wav",math.random(1, 6)), 80, math.random(150,170))
			local itemID = getGatheredItem(client, ent)
			if (itemID != nil) then
				ent:Remove()
				client:getChar():getInv():add(itemID, 1)
			end
		end
	end
end)

netstream.Hook("nut_displayGatherSpawnPoints", function(data)
	for k, v in pairs(data) do
		local emitter = ParticleEmitter(v[1])
		local smoke = emitter:Add("sprites/glow04_noz", v[1])
		smoke:SetVelocity(Vector(0, 0, 1))
		smoke:SetDieTime(15)
		smoke:SetStartAlpha(255)
		smoke:SetEndAlpha(255)
		smoke:SetStartSize(64)
		smoke:SetEndSize(64)
		smoke:SetColor(255,0,0)
		smoke:SetAirResistance(300)
	end
end)

nut.command.add("gatheraddspawn", {
	adminOnly = true,
	syntax = "<string entity>",
	onRun = function(client, arguments)
		if(!client:getChar():hasFlags("A")) then
			return "Only admins can use this command."
		end
		
		if (!arguments[1]) then
			return "@lc_noEntity"
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + Vector(trace.HitNormal*5)
			table.insert(PLUGIN.gatherPoints, {hitpos, arguments[1], "fluff"})
			PLUGIN:setGathering(PLUGIN.gatherPoints[#PLUGIN.gatherPoints])
			client:notifyLocalized("lc_gatherSpawn")
		end
	end
})

nut.command.add("gatherremovespawn", {
	adminOnly = true,
	syntax = "<number distance>",
	onRun = function(client, arguments)
		if(!client:getChar():hasFlags("A")) then
			return "Only admins can use this command."
		end
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local count = 0
		for k, v in pairs(PLUGIN.gatherPoints) do
			local distance = v[1]:Distance(hitpos)
			if distance <= tonumber(range) then
				PLUGIN.gatherPoints[k] = nil
				count = count+1
			end
		end
		client:notifyLocalized("lc_removedSpawners", count)
	end
})

nut.command.add("gatherdisplayspawn", {
	adminOnly = true,
	onRun = function(client)
		if(!client:getChar():hasFlags("A")) then
			return "Only admins can use this command."
		end
		if SERVER then
			netstream.Start(client, "nut_displayGatherSpawnPoints", PLUGIN.gatherPoints)
			client:notifyLocalized("lc_display")
		end
	end
})
