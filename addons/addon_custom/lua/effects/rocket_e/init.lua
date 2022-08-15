
if SERVER then AddCSLuaFile() end

function EFFECT:Init(data)

	self.Start = data:GetOrigin()
	self.size = 1
	self.Emitter = ParticleEmitter(self.Start)
			
		for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/smoke1", self.Start)


			p:SetDieTime(math.Rand(0.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(1,1) * self.size)
			p:SetEndSize(95 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(125, 175) * self.size)
			p:SetColor(40, 40, 40)
		end
		
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/smoke1", self.Start)


			p:SetDieTime(math.Rand(1.0, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(1,1) * self.size)
			p:SetEndSize(95 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(125, 175) * self.size)
			p:SetColor(1, 1, 1)
		end
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/smoke1", self.Start)
            p:SetGravity( Vector( -12, -12, 10 ) )
			p:SetDieTime(math.Rand(0.6, 0.7))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(45,64) * self.size)
			p:SetEndSize(90 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(0, 0))
			
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(1, 175) * self.size)
			p:SetColor(255, 93, 0)
		end
		
			for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/smoke1", self.Start)


			p:SetDieTime(math.Rand(1.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(1,1) * self.size)
			p:SetEndSize(1 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(125, 175) * self.size)
			p:SetColor(255, 255, 0)
		end
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/explosion2", self.Start)


			p:SetDieTime(math.Rand(2.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(01,01) * self.size)
			p:SetEndSize(1 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(1325, 1275) * self.size)
			p:SetColor(255, 93, 0)
		end
		
		for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/spiker_muzzleflash", self.Start)


			p:SetDieTime(math.Rand(2.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(12,01) * self.size)
			p:SetEndSize(201 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 6
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(325, 115) * self.size)
			p:SetColor(1, 1, 1)
		end
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/spiker_muzzleflash", self.Start)


			p:SetDieTime(math.Rand(2.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(01,01) * self.size)
			p:SetEndSize(1 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(795, 15) * self.size)
			p:SetColor(14, 14, 14)
		end
		
						for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/explosion2", self.Start)


			p:SetDieTime(math.Rand(3.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(01,01) * self.size)
			p:SetEndSize(1 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(595, 15) * self.size)
			p:SetColor(255, 255, 255)
		end
		
				for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/explosion2", self.Start)


			p:SetDieTime(math.Rand(0.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(51,21) * self.size)
			p:SetEndSize(220 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(105, 145) * self.size)
			p:SetColor(10, 10, 10)
		end
	
		
		for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/explosion2", self.Start)

			p:SetDieTime(math.Rand(0.8, 0.4))
			p:SetStartAlpha(60)
			p:SetEndAlpha(60)
			p:SetStartSize(math.random(1, 5) * self.size)
			p:SetEndSize(160 * self.size)
			p:SetRoll(math.Rand(0, 0))
			p:SetRollDelta(math.Rand(.03, 02))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(0, 0) * self.size)
			p:SetColor(45, 45, 45)
		end
		
					for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/spiker_muzzleflash", self.Start)

			p:SetDieTime(math.Rand(0.8, 0.4))
			p:SetStartAlpha(60)
			p:SetEndAlpha(60)
			p:SetStartSize(math.random(1, 5) * self.size)
			p:SetEndSize(130 * self.size)
			p:SetRoll(math.Rand(0, 0))
			p:SetRollDelta(math.Rand(1.03, 03))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(0, 0) * self.size)
			p:SetColor(30, 30, 30)
		end
		
		for i = 1, math.random(10, 35) do
			local p = self.Emitter:Add("effects/explosion2", self.Start)


			p:SetDieTime(math.Rand(0.7, 0.3))
			p:SetStartAlpha(60)
			p:SetEndAlpha(0)
			p:SetStartSize(math.random(100,121) * self.size)
			p:SetEndSize(50 * self.size)
			p:SetRoll(math.Rand(0, 10))
			p:SetRollDelta(math.Rand(3, 0))
			//p:SetCollide(true)
				
			local vec = VectorRand()
			vec.z = 0
			local pos = (self.Start + vec * 5)
					
			p:SetVelocity(VectorRand() * math.random(15, 145) * self.size)
			p:SetColor(25,25, 25)
		end
		
		/*for i = 1, 20 do
			local vec = VectorRand()
			//vec.z = 10
			local pos = (self.Start + vec * 5)
		
			local p = self.Emitter:Add("effects/smoke1", self.Start)

			p:SetDieTime(math.Rand(0.1, 0.2))
			p:SetStartAlpha(255)
			p:SetEndAlpha(0)
			p:SetStartSize(0 * self.size)
			p:SetEndSize(50 * self.size)
			p:SetVelocity(VectorRand() * math.random(34, 35) * self.size)
			p:SetGravity(Vector(0, 0, -40))
			p:SetColor(0, 0, 0)
			p:SetRoll(math.Rand(-10, 10))
			p:SetRollDelta(math.Rand(-10, 10))
			//p:SetCollide(true)
			
			//timer.Simple(0.5, function() p:SetVelocity(p:GetVelocity() / 10) end)
		end*/
	
	self.Emitter:Finish()
	
	surface.PlaySound("rocket launcher/rocket_expl"..math.random(1,6)..".wav")
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
	return false
end