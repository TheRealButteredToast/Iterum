ENT.Type = "anim"
ENT.PrintName = "Fire Grenade"
ENT.Author = "Toast"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.Category = "NutScript Throwable"
ENT.RenderGroup 		= RENDERGROUP_BOTH

ENT.configLifetime = 30
ENT.configDelayedEffect = 7
ENT.configColor = Color( 255, 50, 50 )

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/Items/grenadeAmmo.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self.lifetime = CurTime() + self.configLifetime
		self.delaytime = CurTime() + self.configDelayedEffect
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound( self, "weapons/flaregun/burn.wav" )
		self.loopsound:Play()
		local physicsObject = self:GetPhysicsObject()
		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
	end

	function ENT:OnRemove()
		self.loopsound:Stop()
	end

	function ENT:Think()
		if self.lifetime < CurTime() then
			self:Remove()
		end

		if self:WaterLevel() > 0 then
			self:Remove()
		end

		local perc = (( self.lifetime - CurTime() )/self.configLifetime)
		if (self.delaytime < CurTime()) then
			for k, v in pairs( ents.FindInSphere( self:GetPos(), 230*perc ) ) do
				if (v.IsPlayer and v:IsPlayer()) then
					local tpos = v:GetPos() + Vector( 0, 0, 5 )
					local curpos = self:GetPos() + self:GetUp() * 50
					local tvec = ( tpos - curpos )
					local t = {}

					tvec:Normalize()
					t.start = curpos
					t.endpos = curpos + tvec * 230*perc
					t.filter = { self } -- By adding player and the vehicle, you can get the seat.
				end
			end
		end
		
		return CurTime()
	end

	function ENT:Use(activator)
	end
else
	function ENT:Initialize()
	end

	function ENT:Draw()
		self:DrawModel()
	end

	function ENT:Think()
	end
end

function ENT:PhysicsCollide(data, phys)
	if data.Speed > 50 then
		self.Entity:EmitSound( Format( "physics/metal/metal_grenade_impact_hard%s.wav", math.random( 1, 3 ) ) ) 
	end
	
	local rad = self:BoundingRadius()
	local vel = self:GetUp() * 10

	local rad = self:BoundingRadius()
			local vel = self:GetUp() * 10

			for i=1,6 do
				self.vFireBall = CreateVFireBall(rad, rad * 2, self:GetPos() + self:GetUp() * 50, vel, self:GetOwner() or self.Owner or self)
		    end
	local impulse = -data.Speed * data.HitNormal * 0.3 + (data.OurOldVelocity * -0.5)
	phys:ApplyForceCenter(impulse)
end