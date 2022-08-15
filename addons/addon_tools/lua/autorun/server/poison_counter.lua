CreateConVar("headcrabplus_settings_poison_bites", 3, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

hook.Add("EntityTakeDamage", "headcrabplus_poison_counter", function(target, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker == nil then return end
	if (attacker:GetClass() != "npc_headcrab_black" and attacker:GetClass() != "npc_headcrab_poison") or (dmginfo:GetDamageType() != DMG_SLASH) then return end
	
	if !target:IsNPC() and !target:IsPlayer() then return end
	
	if target.PoisonBites == nil then target.PoisonBites = 1
	else target.PoisonBites = target.PoisonBites + 1 end
	
	local CreationID = tostring(target:GetCreationID())
	
	if !timer.Exists(CreationID) then
		timer.Create(CreationID, 10, 0, function()
			if target.PoisonBites == nil or target.PoisonBites <= 0 then target.PoisonBites = nil timer.Destroy(CreationID) return end
			target.PoisonBites = target.PoisonBites - 1
		end)
	end
	
	if target.PoisonBites >= GetConVar("headcrabplus_settings_poison_bites"):GetInt() then target:TakeDamage(1000, attacker, attacker) target.PoisonBites = nil timer.Destroy(CreationID)
	else timer.Simple(0.1, function() if !target:IsValid() then return end target:SetHealth(target:Health() + 1) end) end
end)