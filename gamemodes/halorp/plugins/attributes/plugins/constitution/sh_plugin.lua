PLUGIN.name = "Constitution"
PLUGIN.author = "Toast"
PLUGIN.desc = "Iterum Attribute System Sub-Plug"

if (SERVER) then
	function PLUGIN:PostEntityTakeDamage(client, damage, context)
		if(client:IsPlayer()) then
			local character = client:getChar()
			if (character) then
				character:updateAttrib("con", 0.0001)	-- For every damage incident taken, increment the attribute by the second value
			end
		end
	end
	
	function PLUGIN:PostPlayerLoadout(client)
		local uniqueID = "nutConst"..client:SteamID()
		local maxHealth = client:GetMaxHealth()
		
		-- Continually run this timer to update the playes max health on the fly
		timer.Create(uniqueID, 0.25, 0, function()
			if (not IsValid(client)) then
				timer.Remove(uniqueID)
				return
			end
			local character = client:getChar()
			if character == nil then timer.Remove(uniqueID) return end
			
			local conLevel = character:getAttribs("con")["con"]
			if(conLevel == nil) then conLevel = 0 end	-- If a player has no points in constitution, nutscript simply does not create the attribute table, so wed get a null (nil because fag brit) error
			
			local healthBonus
			
			if(conLevel < 10) then
				healthBonus = 0
			elseif(conLevel < 20) then
				healthBonus = 5
			else
				healthBonus = 10
			end
			
			client:SetMaxHealth(maxHealth + healthBonus)
		end)
	end
end