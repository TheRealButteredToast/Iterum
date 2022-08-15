ENT.Type = "anim"
ENT.PrintName = "Carbon Deposit"
ENT.Author = "Cyumus"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

if (SERVER) then
	function ENT:Initialize()
		local function getRandomRockModel()
			local rock = {
				"models/props_foliage/forestrock_cluster02.mdl",
				"models/props_foliage/forestrock_cluster01.mdl",
				"models/props_foliage/forestrock_single01.mdl"
			}
			local random = math.random(1,table.getn(rock))
			return rock[random]
		end
		
		self:SetModel(getRandomRockModel())
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetHealth(nut.config.get("rockLife"))

		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
		end
	end

	function ENT:Use(activator)
	end
else
	function ENT:Draw()
		self:DrawModel()
	end

	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		local tx, ty = drawText("Carbon Deposit", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
