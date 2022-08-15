include("shared.lua")
AddCSLuaFile("shared.lua")

ENT.EngineHealth = 2000

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*100)
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply	
	self.Sounds=table.Copy(sndt)
	return ent
end

function ENT:addWheels()
	for _,t in pairs(self.Wheels) do
		if t.mdl then
			local e=self:addEntity("prop_physics")
			e:SetModel(t.mdl)
			e:SetPos(self:LocalToWorld(t.pos))
			e:SetAngles(self:GetAngles())
			e:Spawn()
			e:Activate()
			e:PhysicsInitSphere( e:BoundingRadius()/2, "rubber")
			local ph=e:GetPhysicsObject()
			if t.mass then
				ph:SetMass(t.mass)
			end
			if t.ice then
				ph:SetMaterial("gmod_ice")
			end
			ph:EnableDrag(false)
			constraint.Axis(e,self,0,0,Vector(0,0,0),self:WorldToLocal(e:LocalToWorld(Vector(0,1,0))),0,0,t.friction,1)
			table.insert(self.wheels,e)
			self:AddOnRemove(e)
		end
	end
end

function ENT:PhysicsUpdate(ph)
	self:base("wac_pl_base").PhysicsUpdate(self,ph)
	
	local trace=util.QuickTrace(self:LocalToWorld(Vector(0,0,62)), self:LocalToWorld(Vector(0,0,50)), {self, self.wheels[1], self.wheels[2], self.wheels[3], self.rotor})
	local phys=self:GetPhysicsObject()
	if IsValid(phys) and not self.disabled then
		if self.controls.throttle>0 and self.rotorRpm>0.8 and phys:GetVelocity():Length() > 2000 and trace.HitPos:Distance( self:LocalToWorld(Vector(0,0,62)) ) > 100 then
			self:SetBodygroup(2,0)
			for i=1,3 do 
				self.wheels[i]:SetRenderMode(RENDERMODE_TRANSALPHA)
				self.wheels[i]:SetColor(Color(255,255,255,0))
				self.wheels[i]:SetSolid(SOLID_NONE)
			end
		elseif self.controls.throttle<0 and trace.HitPos:Distance( self:LocalToWorld(Vector(0,0,62)) ) > 100 then
			if self.wheels then
				for i=1,3 do 
					self.wheels[i]:SetRenderMode(RENDERMODE_NORMAL)
					self.wheels[i]:SetColor(Color(255,255,255,255))
					self.wheels[i]:SetSolid(SOLID_VPHYSICS)
				end
			end
			self:SetBodygroup(2,1)
		end
	end
	
	if IsValid(ph) and not self.disabled then
		if ph:GetVelocity():Length() > 1600 then
			self:SetBodygroup(0,0)
			self:SetBodygroup(1,1)
			self:SetBodygroup(2,1)
		else
			self:SetBodygroup(0,0)
			self:SetBodygroup(1,0)
			self:SetBodygroup(2,0)
		end
	end
end