
if SERVER then AddCSLuaFile() end

function EFFECT:Init(data)

	self.Start = data:GetOrigin()
	self.size = 1
	self.Emitter = ParticleEmitter(self.Start)
			
		for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/spiker_muzzleflash", self.Start)

			p:SetDieTime(math.Rand(0.7, 0.7))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(54,53) * self.size)
			p:SetEndSize(85 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(0, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(125, 175) * self.size)
			p:SetColor(127, 127, 255)
		end
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/spiker_muzzleflash", self.Start)

			p:SetDieTime(math.Rand(0.3, 0.7))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(15,54) * self.size)
			p:SetEndSize(10 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(0, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(125, 175) * self.size)
			p:SetColor(128, 128, 255)
		end
		
		for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/beam_rifle_hit", self.Start)

			p:SetDieTime(math.Rand(1.5,0.6))
			p:SetStartAlpha(60)
			p:SetEndAlpha(60)
			p:SetStartSize(math.random(14, 14) * self.size)
			p:SetEndSize(61 * self.size)
			p:SetRoll(math.Rand(0, 0))
			p:SetRollDelta(math.Rand(0.03, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(0, 0) * self.size)
			p:SetColor(128, 128, 255)
		end
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/beam_rifle_hit", self.Start)

			p:SetDieTime(math.Rand(0.3, 0.4))
			p:SetStartAlpha(60)
			p:SetEndAlpha(60)
			p:SetStartSize(math.random(44, 35) * self.size)
			p:SetEndSize(60 * self.size)
			p:SetRoll(math.Rand(0, 0))
			p:SetRollDelta(math.Rand(1.03, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(0, 0) * self.size)
			p:SetColor(126, 127, 255)
		end
		
		/*for i = 1, 20 do
			local vec = VectorRand()
			//vec.z = 10
			local pos = (self.Start + vec * 5)
		
			local p = self.Emitter:Add("effects/beam_rifle_hit", self.Start)

			p:SetDieTime(math.Rand(0.1, 0.2))
			p:SetStartAlpha(255)
			p:SetEndAlpha(0)
			p:SetStartSize(50 * self.size)
			p:SetEndSize(0 * self.size)
			p:SetVelocity(VectorRand() * math.random(34, 35) * self.size)
			p:SetGravity(Vector(0, 0, -40))
			p:SetColor(80, 80, 80)
			p:SetRoll(math.Rand(-10, 10))
			p:SetRollDelta(math.Rand(-10, 10))
			//p:SetCollide(true)
			
			//timer.Simple(0.5, function() p:SetVelocity(p:GetVelocity() / 10) end)
		end*/
	
	self.Emitter:Finish()
	
	surface.PlaySound("bruteshot/elite_shot_explode_0"..math.random(1,6)..".wav")
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
	return false
end