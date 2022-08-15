SIGNAL_DEATH = 1
SIGNAL_CHAR = 2
SIGNAL_JOB = 3
SIGNAL_INITLOAD = 4

-- Returns the modifier received from the players faction
local function facStatApplier(client, char)

	-- Get players faction
	local fac = char:getFaction()
	
	-- Logic to find the correct modifiers
	-- Do not change! We cannot use client:Team() as the clients team has not been set to their characters yet
	if(fac == 3) then		-- Humans
		if char:getChoice() then
			local choice = string.lower(char:getChoice())
			char:setAttrib(choice, (char:getAttribs(choice)[choice] or 0)+2)
		end
	elseif(fac == 2) then	-- Grunts
		char:setAttrib("str", (char:getAttribs("str")["str"] or 0)-1)
		char:setAttrib("dex", (char:getAttribs("dex")["dex"] or 0)+2)
		char:setAttrib("int", (char:getAttribs("int")["int"] or 0)-2)
	elseif(fac == 4) then	-- Jackals
		char:setAttrib("str", (char:getAttribs("str")["str"] or 0)-1)
		char:setAttrib("dex", (char:getAttribs("dex")["dex"] or 0)+3)
		char:setAttrib("int", (char:getAttribs("int")["int"] or 0)-1)
	elseif(fac == 6) then 	-- Elites
		char:setAttrib("str", (char:getAttribs("str")["str"] or 0)+2)
		char:setAttrib("con", (char:getAttribs("con")["con"] or 0)+1)
		char:setAttrib("dex", (char:getAttribs("dex")["dex"] or 0)+1)
	elseif(fac == 5) then	-- Brutes
		char:setAttrib("str", (char:getAttribs("str")["str"] or 0)+3)
		char:setAttrib("con", (char:getAttribs("con")["con"] or 0)+2)
		char:setAttrib("int", (char:getAttribs("int")["int"] or 0)-2)
	end
end

function SCHEMA:OnCharCreated(client, char)
    if (char) then
	    local inv = char:getInv()

	    local charCount = table.Count(client.nutCharList)
		
		facStatApplier(client, char)
		
	    char:giveFlags("ept")
	    char:setMoney(5000)
	end
end

function SCHEMA:PlayerInitialSpawn(client)
	--gui.OpenURL("https://youtube.com/playlist?list=PLFbWvuU8gYCzIZ7xTiXrQUL9PZTCWFVkR")
	netstream.Start(client, "nutLawSync", SCHEMA.laws)
end

-- Sounds
function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)
	if (client:isRunning() and client:Team() == FACTION_SANG) then
		client:EmitSound("npc/iterum/movement/elite/move ("..math.random(1, 7)..").wav", volume * 100)
		return true
	elseif(client:isRunning() and client:Team() == FACTION_JACK) then
		client:EmitSound("npc/iterum/movement/jackal/move ("..math.random(1, 9)..").wav", volume * 100)
		return true
	elseif(client:isRunning() and client:Team() == FACTION_GRUNT) then
		client:EmitSound("npc/iterum/movement/grunt/move ("..math.random(1, 6)..").wav", volume * 100)
		return true
	end
end

function SCHEMA:GetPlayerPainSound(client)
	if(client:Team() == FACTION_GRUNT or client:Team() == FACTION_JACK or client:Team() == FACTION_SANG) then
		local sounds = self.painSounds[client:Team()]
		
		return table.Random(sounds)
	end
end

function SCHEMA:GetPlayerDeathSound(client)
	if(client:Team() == FACTION_GRUNT or client:Team() == FACTION_JACK or client:Team() == FACTION_SANG) then
		local sounds = self.deathSounds[client:Team()]
		
		return table.Random(sounds)
	end
end
-- End Sounds

--[[ Anonymous Messages?
function SCHEMA:PlayerMessageSend(client, chatType, message, anonymous, receivers)
	if (!nut.voice.chatTypes[chatType]) then
		return
	end

	for _, definition in ipairs(nut.voice.getClass(client)) do
		local sounds, message = nut.voice.getVoiceList(definition.class, message)

		if (sounds) then
			local volume = 80

			if (chatType == "w") then
				volume = 60
			elseif (chatType == "y") then
				volume = 150
			end
			
			if (definition.onModify) then
				if (definition.onModify(client, sounds, chatType, message) == false) then
					continue
				end
			end

			if (definition.isGlobal) then
				netstream.Start(nil, "voicePlay", sounds, volume)
			else
				netstream.Start(nil, "voicePlay", sounds, volume, client:EntIndex())

				if (chatType == "radio" and receivers) then
					for k, v in pairs(receivers) do
						if (receivers == client) then
							continue
						end

						netstream.Start(nil, "voicePlay", sounds, volume * 0.5, v:EntIndex())
					end
				end
			end

			return message
		end
	end
end
--]]

-- Salary Timer Payload
function SCHEMA:SalaryPayload()
	for k, v in ipairs(player.GetAll()) do
		local char = v:getChar()

		-- If faction has default salary, give them the salary.
		if (char) then
			local class = char:getClass()
			local classInfo = nut.class.list[class]

			if (classInfo) then
				local amount = classInfo.salary or 1

				if (hook.Run("CanPlayerReceiveSalary", v) == false) then
					return false
				end

				char.player:notify(L("reserveSalary", v, nut.currency.get(amount)))

				char:addReserve(amount)
			end
			
			if(char:hasFlags('B') or char:hasFlags('N') or char:hasFlags('V') or char:hasFlags('O') or char:hasFlags('b')) then
				local amount = 20
				
				if (hook.Run("CanPlayerReceiveSalary", v) == false) then
					return false
				end

				char.player:notify(L("reserveSalary", v, nut.currency.get(amount)))

				char:addReserve(amount)
			end
			
			if(char:hasFlags('a')) then
				local amount = 40
				
				if (hook.Run("CanPlayerReceiveSalary", v) == false) then
					return false
				end

				char.player:notify(L("reserveSalary", v, nut.currency.get(amount)))

				char:addReserve(amount)
			end
		end
	end
end

-- Bank Interest Timer Payload
function SCHEMA:BankIncomePayload()
	for k, v in ipairs(player.GetAll()) do
		local char = v:getChar()

		-- If faction has default salary, give them the salary.
		if (char) then
			local charFaction = char:getFaction()
			local faction = nut.faction.indices[charFaction]

			if (faction.salary) then
				if (hook.Run("CanPlayerGetBankIncome", v) == false) then
					return false
				end

				local profit = math.Round(char:getReserve() * (math.abs(nut.config.get("incomeRate", 1) / 100)))

				char.player:notify(L("reserveIncome", v, nut.currency.get(profit)))
				char:addReserve(profit)
			end
		end
	end
end

-- This hook returns whether player can receive the salary or not.
function SCHEMA:CanPlayerReceiveSalary(client)
	local char = client:getChar()

	if (!char.player:Alive()) then
		return false, char.player:notify(L("salaryRejected", client))	
	end
end

-- Helps the PlayerSpawn function get attribute values
local function attributeGetter(client, name)
	-- Get ATR Value
	local value = client:getChar():getAttribs(name)[name]
	-- If the value is nil, then we return 0
	if(value == nil) then
		return 0
	-- Otherwise, return the value
	else
		return value
	end
end

-- Returns the modifier received from an attribute
local function attStatGetter(client, name)
	local value = client:getChar():getAttribs(name)[name]
	local modifier
	
	if value == nil then value = 0 end
	
	-- The Logic
	if(value < 2) then modifier = -5
	elseif(value < 4) then modifier = -4
	elseif(value < 6) then modifier = -3
	elseif(value < 8) then modifier = -2
	elseif(value < 10) then modifier = -1
	elseif(value < 12) then modifier = 0
	elseif(value < 14) then modifier = 1
	elseif(value < 16) then modifier = 2
	elseif(value < 18) then modifier = 3
	elseif(value < 20) then modifier = 4
	elseif value < 22 then modifier = 5 
	elseif value < 24 then modifier = 6
	else modifier = 7 end
	
	return modifier
end

-- Handles all functions that run upon player spawning
function SCHEMA:PlayerSpawn(client)
	local char = client:getChar()
	
	if(char == nil) then return end
	
	-- Handles descritpion updating, and necessarily all the good stuff that comes with it
	local humanStat = ""
	if(client:Team() == FACTION_HUMAN) then
		humanStat = " | Bonus Choice: "..(char:getChoice() or "No Selection!")
	end
	
	char:setDesc("Strength: ("..attributeGetter(client, "str")..","..attStatGetter(client,"str")..") | Constitution: ("..attributeGetter(client, "con")..","..attStatGetter(client,"con")..") | Intellect: ("..attributeGetter(client, "int")..","..attStatGetter(client,"int")..") | Charisma: ("..attributeGetter(client, "cha")..","..attStatGetter(client,"cha")..") | Dexterity: ("..attributeGetter(client, "dex")..","..attStatGetter(client,"dex")..")"..humanStat)
	
	if (char) then
		if (client.deadChar and client.deadChar == char:getID() and char.lostMoney and char.lostMoney > 10) then
			client:notify(L("hospitalPrice", client, nut.currency.get(char.lostMoney)))
		end
		
		if(char:hasFlags("a")) then
			char:takeFlags("a")
			for k,v in ipairs(player.GetAll()) do
				if(v == client) then
					client:notifyLocalized("You are no longer the Mayor!")
				else
					v:notifyLocalized("The mayor has died!")
				end
			end
		end
		char:setData("b_leg", false)
		
		local armoritems = {
			["combatarmorbasic"] = true,
			["combatarmoradapt"] = true,
			["combatarmoradvanced"] = true,
			['combatarmormarine'] = true,
			["combatarmorodst"] = true,
			["combatarmorspartan"] = true,
		}
		
		local item = client:getChar():getInv()
		for _, item in pairs(item:getItems()) do
			if (armoritems[item.uniqueID] and item:getData("equip", true)) then
				item:call("EquipUn",client,item)
				item:setData("equip", false)
				char:setArmor(false)
			end
		end
		
		client.deadChar = nil
	end
end

-- This hook enforces death penalty for dead players.
function SCHEMA:PlayerDeath(client, inflicter, attacker)
	local char = client:getChar()
	local class = char:getClass()
    local classData = nut.class.list[class] or nut.class.list[1]
	
	if (char) then
		hook.Run("ResetVariables", client, SIGNAL_DEATH)

		-- money penalty
		if (nut.config.get("deathMoney", true) and !law ) then
			client.deadChar = char:getID()
			char.lostMoney = math.Round(char:getMoney() * (0.5))
			if ( char.lostMoney > 10 ) then
				char:giveMoney(-char.lostMoney)
				else
			end
		end
		
		local armoritems = {
			["combatarmorbasic"] = true,
			["combatarmoradapt"] = true,
			["combatarmoradvanced"] = true,
			['combatarmormarine'] = true,
			["combatarmorodst"] = true,
			["combatarmorspartan"] = true,
		}
		
		local item = client:getChar():getInv()
		for _, item in pairs(item:getItems()) do
			if (armoritems[item.uniqueID] and item:getData("equip", true)) then
				item:call("EquipUn",client,item)
				item:setData("equip", false)
				char:setArmor(false)
			end
		end

	end
end

local saveEnts = {
	["nut_atm"] = true,
}

function SCHEMA:SaveData()
	self:saveJail()
	local savedEntities = {}

	for k, v in ipairs(ents.GetAll()) do
		local class = v:GetClass():lower()

		if (class:find("bingle") and v:GetNWBool("fuckoff")) then
			table.insert(savedEntities, {
				class = class, 
				pos = v:GetPos(),
				ang = v:GetAngles(),
				text = v:GetText(),
				font = v:GetFont(),
				type = v:GetType(),
				fontsize = v:GetFontSize(),
				outsize = v:GetOutSize(),
				animspeed = v:GetAnimSpeed(),
				neon = v:GetNeon(),
				colback = v:GetColorBack(),
				coltext = v:GetColorText(),
				colout = v:GetColorOut(),
			})
			
			continue
		end
			
		if (saveEnts[class]) then
			table.insert(savedEntities, {
				class = class, 
				pos = v:GetPos(),
				ang = v:GetAngles(),
			})
		end
	end

	-- Save Map Entities
	self:setData(savedEntities)

	-- Save schema variables.
	--self:setData(schemaData, true, true)
end

-- Load Data.
function SCHEMA:LoadData()
	-- Load Map Entities
	self:loadJail()
	local savedEntities = self:getData() or {}
	
	for k, v in ipairs(savedEntities) do
		local ent = ents.Create(v.class)
		ent:SetPos(v.pos)
		ent:SetAngles(v.ang)
		ent:Spawn()
		ent:Activate()

		local phys = ent:GetPhysicsObject()
		if (IsValid(phys)) then
			phys:Wake()
			phys:EnableMotion()
		end

		if (ent.isNotiboard) then
			ent:SetText(v.text)
			ent:SetFont(v.font)
			ent:SetType(v.type)
			ent:SetFontSize(v.fontsize)
			ent:SetOutSize(v.outsize)
			ent:SetAnimSpeed(v.animspeed)
			ent:SetNeon(v.neon)
			ent:SetColorBack(v.colback)
			ent:SetColorText(v.coltext)
			ent:SetColorOut(v.colout)
			ent:SetNWBool("fuckoff", true)
		end
	end

	-- Load Schema Variables.
	-- self:loadData(true, true)
end

function SCHEMA:PlayerLoadedChar(client, netChar, prevChar)
	if (prevChar) then
		hook.Run("PlayerHitCharacterDodge", client, netChar, prevChar)
		hook.Run("ResetVariables", client, SIGNAL_CHAR)

		for k, v in ipairs(ents.GetAll()) do
			if (v:GetPersistent()) then continue end
			if (v:GetNWBool("fuckoff")) then continue end

			if (v:CPPIGetOwner() == client) then
				v:Remove()
			end
		end

		client:notifyLocalized("cleanupChar")
	end

	local char = client:getChar()

	if (char) then
		if (char:getArrest()) then
			return
		else
			client:setNetVar("jailTime", nil)
		end
	end
end

function SCHEMA:PlayerUse(client)
	if (client:isArrested()) then return end
end

function SCHEMA:PlayerDisconnected(client)
	if (IsValid(client.nutRagdoll)) then
		client.nutRagdoll:Remove()
	end
	
	for k, v in ipairs(ents.GetAll()) do
		if (v:GetPersistent()) then continue end
		if (v:GetNWBool("fuckoff")) then continue end
		
		if (v:CPPIGetOwner() == client) then
			v:Remove()
		end
	end

	hook.Run("PlayerHitDisconnect", client)
end

function SCHEMA:OnPlayerArrested(arrester, arrested, isArrest)
	if (isArrest) then
		if (IsValid(arrester)) then
			nut.log.add(arrester, "arrest")
			arrester:notify("You have arrested " .. arrested:Nick() .. " for " .. nut.config.get("jailTime") ..  " seconds." )
		end
		if (IsValid(arrested)) then
			nut.log.add(arrested, "arrested")
			arrested:notify("You have been arrested for " .. nut.config.get("jailTime") ..  " seconds." )
			arrested:Spawn()
			arrested:SetPos( Vector( 2924.674316, -3200.367920, -119.968750 ) )
			arrested:setAction("Releasing", nut.config.get("jailTime"))
			arrested:StripWeapons()
            timer.Create(arrested:UniqueID() .. "_jailTimer", nut.config.get("jailTime"), 1, function()
				if(IsValid(arrest))	then
					arrested:Spawn()
					arrested:notify("You have been released from prison")
					arrested:arrest(false)
				end
            end)
		end
	else
		if (IsValid(arrester)) then
			nut.log.add(arrester, "unarrest")
		end
		if (IsValid(arrested)) then
			nut.log.add(arrested, "unarrested")
		end
	end

	if (isArrest) then
		local char = arrested:getChar()
		local inv = char:getInv():getItems()

		if (char:getData("wanted")) then
			char:setData("wanted", false, nil, player.GetAll())
		end

		for k, v in ipairs(inv) do
			if (v:getData("equip")) then
				v:setData("equip", nil)
			end
		end

		local prison = SCHEMA.prisonPositions

		arrested:StripWeapons()

		if (#prison > 0) then
			arrested:SetPos(table.Random(prison))
		end

		if (arrested:isWanted()) then
			char:setData("wanted", false, nil, player.GetAll())
		end

		hook.Run("PlayerHitArrested", arrester, arrested, isArrest)
	else
		if (arrester) then
			local pos = arrested:GetPos()

			arrested:Spawn()
			arrested:SetPos(pos)
		else
			arrested:Spawn()
		end
	end
end

function SCHEMA:CanBeArrested(client)
	if (client:isArrested()) then
		return false
	end

	return true
end

function SCHEMA:OnPlayerWanted(bool, wanted, reason, who, silence)
	if (silence) then return end
	
	if (bool) then
		nut.log.add(wanted, "wanted", who, reason)
	else
		nut.log.add(who, "unwanted")
	end
	
	netstream.Start(player.GetAll(), "nutWantedText", bool, who, wanted, reason)
end

function SCHEMA:saveJail()
	nut.data.set("jailpos", self.prisonPositions)
end

function SCHEMA:loadJail()
	self.prisonPositions = nut.data.get("jailpos")
end

function SCHEMA:PlayerStaminaLost(client)
	local char = client:getChar()
	char:updateAttrib("end", 0.008)
	char:updateAttrib("stm", 0.004)
end

function SCHEMA:OnPlayerPurchaseDoor(client, entity, purchase, childFunc)
	client.properties = client.properties or {}

	client.properties[entity] = purchase and true or nil

	childFunc(nil, entity, function(child)
		client.properties[child] = purchase and true or nil
	end)
end 

function SCHEMA:ResetVariables(client, signal)
	local char = client:getChar()

	-- on player changed the character/dead
	if (signal != SIGNAL_JOB) then
		-- Reset Collected Garbages

		-- Reset Wanted Status
		char:setData("wanted", false, nil, player.GetAll())

		-- Reset Search Warrant Status
		client:setNetVar("searchWarrant", false)
		timer.Remove(client:getChar():getID() .. "_chewAss")
		
		-- Heal broken legs. (it's abusive shit, I know.)
        client:healLegs()
	end

	if (signal == SIGNAL_CHAR) then
		-- remove all properties when the player changed the character.
		if (client.properties) then
			for entity, bool in pairs(client.properties) do
				entity:removeDoorAccessData()
			end
		end

		client.properties = {}
	end
end

function SCHEMA:OnPlayerHeal(item, client, target, amount, seconds)
	-- heal all weird shits on the character's body.
	do
		target:healLegs()
	end
end

local meta = FindMetaTable("Player")
 
function meta:Stun()
    --if not IsValid(self) then return false end
    self.Stunned = true
    self:setNetVar("Stunned", true)
    umsg.Start("StunEffect", self)
        umsg.String("1")
    umsg.End()
end
 
function meta:Unstun()
    --if not IsValid(self) then return false end
    self.Stunned = false
    self:setNetVar("Stunned", false)
    umsg.Start("StunEffect", self)
        umsg.String("0")
    umsg.End()
end

local function savereserve(char)
	nut.db.updateTable({
		_reserve = char:getReserve()
	}, nil, "reserve", "_charID = "..char:getID())
end

function SCHEMA:OnReserveChanged(char)
	savereserve(char)
end

do
		local MYSQL_CREATE_TABLES = [[
CREATE TABLE IF NOT EXISTS `nut_reserve` (
	`_charID` int(11) NOT NULL,
	`_reserve` int(11) unsigned DEFAULT NULL,
	PRIMARY KEY (`_charID`)
);
		]]
		local SQLITE_CREATE_TABLES = [[
CREATE TABLE IF NOT EXISTS `nut_reserve` (
	`_charID` INTEGER PRIMARY KEY,
	`_reserve` INTEGER
);
		]]

		function SCHEMA:OnLoadTables()
			if (nut.db.object) then
				-- This is needed to perform multiple queries since the string is only 1 big query.
				local queries = string.Explode(";", MYSQL_CREATE_TABLES)

				nut.db.query(queries[1])
			else
				nut.db.query(SQLITE_CREATE_TABLES)
			end
		end

		function SCHEMA:CharacterPreSave(char)
			savereserve(char)
		end

		function SCHEMA:CharacterLoaded(id)
			-- legacy support
			-- for modernRP users
			local char = nut.char.loaded[id]
			local legacy = false

			if (char:getData("reserve")) then
				local restore = char:getData("reserve", 0)

				char:setReserve(tonumber(restore))
				char:setData("reserve", nil)
				legacy = true
			end

			nut.db.query("SELECT _reserve FROM nut_reserve WHERE _charID = "..id, function(data)
				if (data and #data > 0) then
					for k, v in ipairs(data) do
						local money = tonumber(v._reserve)

						if (!legacy) then
							char:setReserve(money)
						end
					end
				else
					nut.db.insertTable({
						_reserve = 0,
						_charID = id,
					}, function(data)
						if (!legacy) then
							char:setReserve(0)
						end
					end, "reserve")
				end
			end)

		end

	    function SCHEMA:PreCharDelete(client, char)
	    	nut.db.query("DELETE FROM nut_reserve WHERE _charID = "..char:getID())
	    	nut.db.query("DELETE FROM nut_arrest WHERE _charID = "..char:getID())
	    end

end

function SCHEMA:CanItemBeTransfered(itemObject, curInv, inventory)
	-- Abnormal Null ItemObject Request
	if (!itemObject) then
		if (SERVER) then
			for k, v in ipairs(player.GetAll()) do
				curInv:sync(v, true)
				inventory:sync(v, true)
			end
		end

		if (CLIENT) then
			nut.gui.inv1:Remove()
		end
	end

	-- if item is actually transferred to player's inventory.
    if (inventory and curInv) then
		local a = curInv.owner
		local b = inventory.owner

		local owner, newowner

		for k, v in ipairs(player.GetAll()) do
			local char = v:getChar()

			if (char) then
				if (char:getID() == a) then
					owner = v
				elseif (char:getID() == b) then
					newowner = v
				end
			end
		end 
		
		if (IsValid(owner)) then
			if (IsValid(owner:getNetVar("searcher"))) then
				return false
			end
		end

		if (IsValid(newowner)) then
			if (IsValid(newowner:getNetVar("searcher"))) then
				return false
			end
		end

		if (inventory.vars) then
			if not (curInv == inventory) then
				if (itemObject and itemObject.isBag) then
					-- there is no point for recursive search.
					for itemID, invItem in pairs(inventory:getItems(true)) do
						if (invItem.outfitCategory == itemObject.outfitCategory) then
							return false, "sameTypeBagExists"
						end
					end
				end
			end
        end
    end
end