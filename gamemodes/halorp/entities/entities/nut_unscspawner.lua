AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Pelican Spawner"
ENT.Author = "Toast"
ENT.Category = "Iterum"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

if (SERVER) then
	function ENT:SpawnFunction(client, trace, class)
		local entity = ents.Create(class)
		entity:SetPos(trace.HitPos + trace.HitNormal * 10)
		entity:Spawn()
		entity:Activate()

		return entity
	end

	function ENT:Initialize()
		self:SetModel("models/hunter/tubes/circle4x4.mdl")
		self:SetMaterial("phoenix_storms/stripes")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)

		self.pelican = ents.Create("wac_hc_transpelican")
		self.pelican:SetPos(self:GetPos() + self:GetUp()*10)
		self.pelican:SetAngles(Angle(0,180,0))
		self.pelican:Spawn()
		
		local physObj = self:GetPhysicsObject()
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
		end
	end

	function ENT:Think()
		if !self.pelican:IsValid() then
			self.pelican = ents.Create("wac_hc_transpelican")
			timer.Simple(600, function()
				self.pelican:SetPos(self:GetPos() + self:GetUp()*10)
				self.pelican:SetAngles(Angle(0,0,0))
				self.pelican:Spawn()
			end)
		end
	end

	function ENT:OnRemove()
		if self.pelican:IsValid() then self.pelican:Remove() end
	end
end