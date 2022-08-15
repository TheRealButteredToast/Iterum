ENT.Type = "anim"
ENT.PrintName = "Rock"
ENT.Author = "Cyumus"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Gathering"

if (SERVER) then
	function ENT:Initialize()
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
		local tx, ty = drawText("Rock", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
