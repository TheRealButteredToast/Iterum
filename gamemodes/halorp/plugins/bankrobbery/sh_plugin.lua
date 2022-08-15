local PLUGIN = PLUGIN
PLUGIN.name = "Bank Robbery Plugin"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "This plugin allows people to rob the bank."

PLUGIN.lastRaid = RealTime()
PLUGIN.reward = 10000
PLUGIN.holdTime = 200
PLUGIN.grabTime = 30
PLUGIN.doorTime = 100
PLUGIN.penalty = 2000

nut.bankrob = nut.bankrob or {}

nut.config.add("raidGovernment", true, "WiP", nil, {
	category = "raid"
})

nut.config.add("raidWanted", true, "Wanted player when they steal the money", nil, {
	category = "raid"
})

nut.config.add("raidLaws", 5, "Amount of police needed to steal the bank money.", nil, {
	data = {min = 1, max = 10},
	category = "raid"
})

nut.config.add("raidTimer", 100, "Amount of time needed to convert the money to the funt", nil, {
	data = {min = 1, max = 900},
	category = "raid"
})

nut.config.add("raidMoneyWorth", 500, "Amount of money steal per use on Bank Reserve", nil, {
	data = {min = 1, max = 5000},
	category = "raid"
})

nut.config.add("raidSpawn", 5500, "Respawn time of the Bank Reserve.", nil, {
	data = {min = 1, max = 20000},
	category = "raid"
})


nut.config.add("rewardKill", 10, ".", nil, {
	data = {min = 1, max = 360},
	category = "raid"
})

nut.config.add("rewardArrest", 20, ".", nil, {
	data = {min = 1, max = 360},
	category = "raid"
})



if (CLIENT) then
	local gradient = nut.util.getMaterial("vgui/gradient-l")
	
	function PLUGIN:HUDPaint()
		local client = LocalPlayer()
		
		if (client and client:getChar() and client:getStolenMoney() > 0) then
			local tx, ty = nut.util.drawText("You are robbing the bank!", 36, 40, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, "nutBigFont")
			local a, b = nut.util.drawText("Time To Loot: " .. math.Round(math.max(0, client:getNetVar("rTimer") - CurTime())) .. " seconds", 40, 40 + ty*.9, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, "nutMediumFont")
			a, b = a + tx, b + ty*.9
			tx, ty = nut.util.drawText("Loot Amount: " .. nut.currency.get(client:getStolenMoney()), 40, 40 + b, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, "nutMediumFont")
		end
	end	
else
	function PLUGIN:SaveData()
		local entTable = {}
		local class
		for k, v in ipairs(ents.GetAll()) do
			class = v:GetClass():lower()
			if (class == "nut_bankreserve") then
				table.insert(entTable, {
					class = class,
					pos = v:GetPos(),
					ang = v:GetAngles()
				})
			end
		end

		self:setData(entTable)
	end

	function PLUGIN:LoadData()
		local entTable = self:getData(entTable) or {}
		
		for k, v in ipairs(entTable) do
			local ent = ents.Create(v.class or "nut_bankreserve")
			ent:SetPos(v.pos)
			ent:SetAngles(v.ang)
			ent:Spawn()
			ent:Activate()
		end
	end

	function PLUGIN:OnPlayerStealMoney(client, reserve)
		if (!nut.config.get("raidWanted")) then return end

		if (!client:isWanted()) then
			nut.log.add(client, "robbery")
			client:wanted(true, "Bank Robbery!", client)
		end		
	end

	function PLUGIN:PlayerDisconnect(client)
		if (client and client:IsValid()) then
			client:resetStealing()
		end
	end

	function PLUGIN:CanDoRobbery(client)
		if (!client or !client:IsValid()) then return end

		local char = client:getChar()

		if (char) then

			if (char:hasFlags("B")) then
				return false, "lawClass"
			end
		else
			return false, "notNormal"
		end

		-- get police
		local laws = 0

		for k, v in ipairs(player.GetAll()) do
			local char = v:getChar()

			if (char) then

				if (char:hasFlags("B")) then
					laws = laws + 1
				end
			end
		end

		if (laws < nut.config.get("raidLaws", 5)) then
			return false, "lowLaw"
		end

		return true
	end

	function PLUGIN:OnPlayerFailedRobbery(client)
		nut.log.add(client, "robberyB")
		client:notifyLocalized("robberyFailed")
	end

	function PLUGIN:OnPlayerRobberyDone(client, reward)
		nut.log.add(client, "robberyA")
		client:notifyLocalized("robberyFinished")
	end
end


local PLAYER = FindMetaTable("Player")

function PLAYER:getStolenMoney()
	return self:getNetVar("rMoney", 0)
end

if (SERVER) then
	function PLUGIN:PlayerDeath(victim, inflictor, attacker)
		if (victim and victim:IsValid() and victim:getStolenMoney() > 0) then
			hook.Run("OnPlayerFailedRobbery", victim)
			victim:resetStealing()
		end
		
		if (IsValid(victim) and IsValid(attacker)) then 
			if (victim:IsPlayer() and attacker:IsPlayer()) then
				local robChar, lawChar = victim:getChar(), attacker:getChar()

				if (robChar and lawChar and victim:getStolenMoney() > 0) then
					if (lawChar:hasFlags("B")) then
						local reward = math.Round(victim:getStolenMoney() * (nut.config.get("rewardKill", 10) / 100))
						lawChar:giveMoney(reward)
						lawChar:notifyLocalized("robKilled", reward)
					end
				end
			end
		end
	end

	function PLUGIN:OnPlayerArrested(arrester, arrested, isArrest)
		if (arrested and arrested:IsValid() and isArrest and arrested:getStolenMoney() > 0) then
			hook.Run("OnPlayerFailedRobbery", arrested)
			arrested:resetStealing()
		end
		
        if (IsValid(arrester) and IsValid(arrested)) then
			if (arrester:IsPlayer() and arrested:IsPlayer()) then
				local robChar, lawChar = arrested:getChar(), arrester:getChar()
				if (robChar and lawChar and arrested:getStolenMoney() > 0) then
					if (lawChar:hasFlags("B")) then
						local reward = math.Round(victim:getStolenMoney() * (nut.config.get("rewardArrest", 20) / 100))
						lawChar:giveMoney(reward)
						lawChar:notifyLocalized("robArrested", reward)
					end
				end
			end
		end
	end

	function PLAYER:setStolenMoney(amount, noTimer)
		local char = self:getChar()

		if (!char) then return end

		if (amount > 0 and !noTimer) then
			local time = nut.config.get("raidTimer", 100)

			self:setNetVar("rTimer", CurTime() + time)

			local timerChar = char:getID()
			timer.Create(self:UniqueID() .. "_robTimer", time, 1, function()
				if (self and self:IsValid()) then
					if (self:getChar():getID() == timerChar) then
						self:doneStealing()
					end
				end
			end)
		end

		self:setNetVar("rMoney", amount)
	end

	function PLAYER:addStolenMoney(amount, noTimer)
		local char = self:getChar()

		if (!char) then return end

		if (amount > 0 and !noTimer) then
			local time = nut.config.get("raidTimer", 100)

			self:setNetVar("rTimer", CurTime() + time)

			local timerChar = char:getID()
			timer.Create(self:UniqueID() .. "_robTimer", time, 1, function()
				if (self and self:IsValid()) then
					if (self:getChar():getID() == timerChar) then
						self:doneStealing()
					end
				end
			end)
		end

		self:setNetVar("rMoney", self:getNetVar("rMoney", 0) + amount)
	end

	function PLAYER:destoryTimer()
		timer.Remove(self:UniqueID() .. "_robTimer")
	end

	function PLAYER:resetStealing()
		self:setStolenMoney(0)
		self:destoryTimer()

		local done = true
		for k, v in ipairs(player.GetAll()) do
			if (self:getStolenMoney() > 0) then
				done = false
				break
			end
		end

		if (done) then
			hook.Run("OnBankRobberyCompletelyFailed")
		end
	end	

	function PLAYER:doneStealing()
		local reward = self:getStolenMoney()
		local char = self:getChar()

		if (char and reward > 0) then
			char:giveMoney(reward)

			if (nut.config.get("raidWanted")) then
				char:setData("wanted", false, nil, player.GetAll())
			end	
		end

		hook.Run("OnPlayerRobberyDone", self, reward)

		self:resetStealing()
	end

	function PLAYER:failedStealing()
		self:resetStealing()
	end
end