ENT.Type = "anim"
ENT.PrintName = "To-Spawn"
ENT.Category = "Iterum"
ENT.Spawnable = true
ENT.AdminOnly = true


function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/valk/h3/unsc/props/teleporter/teleporter_receiever.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		self:PhysicsInit(SOLID_BBOX)
		
	end
end
