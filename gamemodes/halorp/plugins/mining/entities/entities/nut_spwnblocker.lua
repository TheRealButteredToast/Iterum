ENT.Type = "anim"
ENT.PrintName = "Spawn Blocker"
ENT.Author = "Toast"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Iterum"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/hunter/plates/plate6x6.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetMaterial("models/props_lab/warp_sheet")
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
		local tx, ty = drawText("Spawns are blocked for Raids!", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end
