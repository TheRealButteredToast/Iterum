include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.Sounds = {
	shoot = "falcon/falconmg.wav",
	stop = "falcon/mg2.wav",
}


function ENT:Initialize()
	self:base("wac_pod_base").Initialize(self)
	self.basePodThink = self:base("wac_pod_base").Think
end



function ENT:fire()
	if !self.shooting then
		self.shooting = true
		self.sounds.stop:Stop()
		self.sounds.shoot:Play()
	end
	
	if not self:takeAmmo(1) then return end
	
	local dir = self.aircraft:getCameraAngles():Forward()
	local pos = self.aircraft:LocalToWorld(self.ShootPos) + dir*self.ShootOffset.x
	local tr = util.QuickTrace(self:LocalToWorld(self.aircraft.Camera.pos) + dir*20, dir*999999999, {self, self.aircraft})
	local ang = (tr.HitPos - pos):Angle()
	
	local b = ents.Create("wac_hc_hebullet")
	ang = ang + Angle(math.Rand(-1,1), math.Rand(-1,1), math.Rand(-1,1))*self.Spray
	b:SetPos(pos)
	b:SetAngles(ang)
	b.col = Color(255,200,100)
	b.Speed = 400
	b.Size = 0
	b.Width = 0
	b:Spawn()
	b.Owner = self:getAttacker()
	b.Explode = function(self,tr)
		if self.Exploded then return end
		self.Exploded = true
		if not tr.HitSky then
			local bt = {}
			bt.Src 		= self:GetPos()
			bt.Dir 		= tr.Normal
			bt.Force	= 1
			bt.Damage	= 10
			bt.Tracer	= 0
			b.Owner:FireBullets(bt)
			local explode = ents.Create("env_physexplosion")
			explode:SetPos(tr.HitPos)
			explode:Spawn()
			explode:SetKeyValue("magnitude", 60)
			explode:SetKeyValue("radius", 10)
			explode:SetKeyValue("spawnflags", "19")
			explode:Fire("Explode", 0, 0)
			timer.Simple(5,function() explode:Remove() end)
			util.BlastDamage(self, self.Owner, tr.HitPos, 10, 10)
			local ed = EffectData()
			ed:SetEntity(self)
			ed:SetAngles(tr.HitNormal:Angle())
			ed:SetOrigin(tr.HitPos)
			ed:SetScale(30)
			util.Effect("wac_impact_m197",ed)
		end
		self.Entity:Remove()
	end
	local effectdata = EffectData()
	effectdata:SetOrigin(pos)
	effectdata:SetAngles(ang)
	effectdata:SetScale(0.5)
	util.Effect("MuzzleEffect", effectdata)
end

function ENT:stop()
	if self.shooting then
		self.sounds.shoot:Stop()
		self.sounds.stop:Play()
		self.shooting = false
	end				
end