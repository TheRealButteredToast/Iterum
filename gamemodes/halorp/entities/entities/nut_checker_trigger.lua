AddCSLuaFile()

ENT.Type = "anim"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_wasteland/interior_fence001g.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_NONE)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

		if (SERVER) then
			self:SetTrigger(true)
		end
	end

	local defualtWeapons = {
		["weapon_physgun"] = true,
		["gmod_tool"] = true,
		["gmod_camera"] = true,
		["nut_hands"] = true,
		["nut_unarrest"] = true,
		["nut_keys"] = true,
		["weapon_healer"] = true,
		["nut_stunbaton"] = true,
		["weapon_detector"] = true,
		["keypad_cracker"] = true,
	}
	function ENT:StartTouch(client)
		if (IsValid(client) and client != self and client != self:GetParent() and client:IsPlayer()) then
			local char = client:getChar()

			if (!char) then return end
			if (char:hasFlags("B")) then return end
			
			local weapons = client:GetWeapons()

			local illegal = false

			for k, v in pairs(weapons) do
				-- exclude default weapon and melee weapons.
				if (!defualtWeapons[v:GetClass()] and !v.IsMelee) then
					self:GetParent():Popup(client, v)
					illegal = true
					return
				end
			end
			
			for k, v in pairs(char:getInv():getItems()) do
				if (v.isWeapon and !v.weaponCategory == "melee") then
					self:GetParent():Popup(client, v)
					illegal = true
					return
				end
			end
		end
	end
else
	function ENT:Draw()
	end
end