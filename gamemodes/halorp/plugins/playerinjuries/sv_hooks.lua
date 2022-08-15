LIMB_GROUPS = LIMB_GROUPS or {}
LIMB_GROUPS[HITGROUP_LEFTARM] = true
LIMB_GROUPS[HITGROUP_RIGHTARM] = true
LIMB_GROUPS[HITGROUP_LEFTLEG] = true
LIMB_GROUPS[HITGROUP_RIGHTLEG] = true
LIMB_GROUPS[HITGROUP_GEAR] = true

function BreakLeg(ply,duration,cause)
	local char = ply:getChar()
	if char:getData("b_leg") == false then
		char:setData("b_leg", true)

		ply:breakLegs()
		ply:notifyLocalized(cause.." and your legs have been broken! They will naturally heal in ".. duration .. " minutes!")
	end
	
end

function PLUGIN:ScalePlayerDamage(client, hitGroup, dmgInfo)
	if (hitGroup == HITGROUP_HEAD) then
		dmgInfo:ScaleDamage(1.25)
	elseif (LIMB_GROUPS[hitGroup]) then
		dmgInfo:ScaleDamage(0.99999)
	end
	
	if(hitGroup == HITGROUP_LEFTLEG or hitGroup == HITGROUP_RIGHTLEG) then
		if client:IsPlayer() then
			hook.Run("OnPlayerLegDamaged", client, dmginfo)
			BreakLeg(client,10,"You've been shot")
		end
	end
end

function PLUGIN:PlayerHurt(client, attacker, health, damage)
	if(attacker:IsPlayer() == true and client:LastHitGroup() == 1) then
		net.Start("HitMarkerNoti")
		net.WriteInt(1,3)
		net.Send(attacker)
	elseif(attacker:IsPlayer() == true) then
		net.Start("HitMarkerNoti")
		net.WriteInt(0,3)
		net.Send(attacker) 
	end
end

function PLUGIN:GetFallDamage(client, speed)
	local damage = speed / 30
	if (damage > client:Health() / 1.5 and damage < client:Health()) then
		BreakLeg(client,5,"You've fallen")
	end
	return damage
end