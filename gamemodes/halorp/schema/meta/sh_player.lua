local PLAYER = FindMetaTable("Player")

function PLAYER:isArrested()
	local char = self:getChar()

	if (char) then
		return char:getData("arrest")
	end

	return false
end

function PLAYER:arrest(doArrest, arrester, seconds)
	local char = self:getChar()

	if (char) then
		if (doArrest) then
			local jailTime = seconds or nut.config.get("jailTime")
			char:setData("arrest", true, nil, player.GetAll())
			self:setNetVar("jailTime", CurTime() + jailTime)

			netstream.Start(self, "nutJailTimer", jailTime)

			local id = char:getID()
			timer.Create("nutJailTimer_"..self:UniqueID(), jailTime, 1, function()
				if (self and self:IsValid()) then
					if (id == self:getChar():getID()) then
						self:arrest(false, nil)
					end
				end
			end)

			hook.Run("OnPlayerArrested", arrester, self, true)
		else
			if (self:isArrested()) then
				timer.Remove("nutJailTimer_"..self:UniqueID())
				netstream.Start(self, "nutJailTimer", 0)

				char:setData("arrest", false, nil, player.GetAll())
				self:setNetVar("jailTime", nil)

				hook.Run("OnPlayerArrested", arrester, self, false)
			end
		end
	end
end

function PLAYER:isProtected()
 	return 0
end

function PLAYER:isWanted()
	local char = self:getChar()

	if (char) then
		return char:getData("wanted")
	end

	return
end

function PLAYER:wanted(bool, reason, who, silence)
	local char = self:getChar()

	if (char) then
		if (bool) then
			char:setData("wanted", true, nil, player.GetAll())

			hook.Run("OnPlayerWanted", bool, self, reason, who, silence)
		else
			char:setData("wanted", false, nil, player.GetAll())

			hook.Run("OnPlayerWanted", bool, self, reason, who, silence)
		end
	end
end

if (SERVER) then
    function PLAYER:breakLegs(time)
        self:setNetVar("legBroken", true)
        
        local char = self:getChar()
        local charID = char:getID()

        timer.Create("breakLeg" .. self:SteamID(), time or 300, 1, function()
            if (IsValid(self)) then
                if (char) then
                    self:setNetVar("legBroken", nil)
                end
            end
        end)
    end
    function PLAYER:healLegs()
        self:setNetVar("legBroken", nil)
        timer.Remove("breakLeg" .. self:SteamID())
    end
end

function PLAYER:isLegBroken()
    return self:getNetVar("legBroken", false)
end
