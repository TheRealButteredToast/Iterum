include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.EngineHealth = 3500

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*50)
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply	
	self.Sounds=table.Copy(sndt)
	return ent
end

function ENT:PhysicsUpdate(ph)
	self:base("wac_hc_base").PhysicsUpdate(self,ph)
	
	if IsValid(ph) and not self.disabled then
		if ph:GetVelocity():Length() > 100 then
			self:SetBodygroup(2,1)
		else
			self:SetBodygroup(2,0)
		end
	end
end

