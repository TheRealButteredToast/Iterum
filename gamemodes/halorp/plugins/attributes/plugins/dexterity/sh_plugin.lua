PLUGIN.name = "Dexterity"
PLUGIN.author = "Toast"
PLUGIN.desc = "Iterum Attribute System Sub-Plug"
local PLUGIN = PLUGIN

nut.config.add("defaultStamina", 100, "A higher number means that characters can run longer without tiring.", nil,
{	data = {min = 50, max = 500},
	category = "stamina"
})

nut.config.add("staminaRegenMultiplier", 1, "A higher number means that characters can run regenerate stamina faster.",nil,
{	data = {min = 0.1, max = 20},
	category = "stamina"
})

if (SERVER) then
	function PLUGIN:PostPlayerLoadout(client)
		client:setLocalVar("dex", nut.config.get("defaultStamina", 100))

		local uniqueID = "nutDex"..client:SteamID()
		local offset = 0
		local runSpeed = client:GetRunSpeed() - 5

		timer.Create(uniqueID, 0.25, 0, function()
			if (not IsValid(client)) then
				timer.Remove(uniqueID)
				return
			end
			local character = client:getChar()
			if (client:GetMoveType() == MOVETYPE_NOCLIP or not character) then
				return
			end

			local bonus = character.getAttrib
				and character:getAttrib("dex", 0)
				or 0
			runSpeed = nut.config.get("runSpeed") + bonus

			if (client:WaterLevel() > 1) then
				runSpeed = runSpeed * 0.775
			end

			if (client:isRunning()) then
				bonus = character.getAttrib
					and character:getAttrib("dex", 0)
					or 0
				offset = -2 + (bonus / 60)
			elseif (offset > 0.5) then
				offset = 1 * nut.config.get("staminaRegenMultiplier", 1)
			else
				offset = 1.75 * nut.config.get("staminaRegenMultiplier", 1)
			end
			if (client:Crouching()) then
				offset = offset + 1
			end

			local current = client:getLocalVar("dex", 0)
			local value = math.Clamp(current + offset, 0, nut.config.get("defaultStamina", 100))

			if (current ~= value) then
				client:setLocalVar("dex", value)

				if (value == 0 and not client:getNetVar("brth", false)) then
					client:SetRunSpeed(nut.config.get("walkSpeed"))
					client:setNetVar("brth", true)

					hook.Run("PlayerStaminaLost", client)
				elseif (value >= 50 and client:getNetVar("brth", false)) then
					client:SetRunSpeed(runSpeed)
					client:setNetVar("brth", nil)
				end
			end
		end)
	end

	local playerMeta = FindMetaTable("Player")

	function playerMeta:restoreStamina(amount)
		local current = self:getLocalVar("dex", 0)
		local value = math.Clamp(current + amount, 0, nut.config.get("defaultStamina", 100))

		self:setLocalVar("dex", value)
	end
elseif (nut.bar) then
	nut.bar.add(function()
		return LocalPlayer():getLocalVar("dex", 0) / nut.config.get("defaultStamina", 100)
	end, Color(200, 200, 40), nil, "dex")
end
