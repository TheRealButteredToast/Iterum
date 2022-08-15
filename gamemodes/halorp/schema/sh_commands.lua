nut.command.add("roll", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		nut.chat.send(client, "roll", math.random(0, math.min(tonumber(arguments[1]) or 100, 100)))
	end
})

nut.command.add("rollstr", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		nut.chat.send(client, "roll", math.random(0, math.min(tonumber(arguments[1]) or 100, 100))+(client:getChar():getAttribs("str")["str"] or -5))
	end
})

nut.command.add("rollint", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		local rand = math.random(0, math.min(tonumber(arguments[1]) or 100, 100))
		nut.chat.send(client, "roll", math.random(0, math.min(tonumber(arguments[1]) or 100, 100))+(client:getChar():getAttribs("int")["int"] or -5))
	end
})

nut.command.add("rolldex", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		nut.chat.send(client, "roll", math.random(0, math.min(tonumber(arguments[1]) or 100, 100))+(client:getChar():getAttribs("dex")["dex"] or -5))
	end
})

nut.command.add("rollcha", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		nut.chat.send(client, "roll", math.random(0, math.min(tonumber(arguments[1]) or 100, 100))+(client:getChar():getAttribs("cha")["cha"] or -5))
	end
})

nut.command.add("rollcon", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		nut.chat.send(client, "roll", math.random(0, math.min(tonumber(arguments[1]) or 100, 100))+(client:getChar():getAttribs("con")["con"] or -5))
	end
})

nut.command.add("chardesc", {
	syntax = "<string desc>",
	onRun = function(client, arguments)
		arguments = table.concat(arguments, " ")
		if (client:IsAdmin()) then
			if (not arguments:find("%S")) then
				return client:requestString("@chgDesc", "@chgDescDesc", function(text)
					nut.command.run(client, "chardesc", {text})
				end, client:getChar():getDesc())
			end

			local info = nut.char.vars.desc
			local result, fault, count = info.onValidate(arguments)

			if (result == false) then
				return "@"..fault, count
			end

			client:getChar():setDesc(arguments)

			return "@descChanged"
		else
			return "No Permission!"
		end
	end
})

nut.command.add("jailpos", {
	adminOnly = true,
	syntax = "",
	onRun = function(client, arguments)
		local char = client:getChar()
		if (!char) then return end

		if (client:IsAdmin()) then
			table.insert(SCHEMA.prisonPositions, client:GetPos())

			return L("prisonAdded", client, name)
		end
	end,
	alias = {"감옥추가"}
})

nut.command.add("fallover", {
	syntax = "",
	onRun = function(client, arguments)
		client:notifyLocalized("Your legs prop you up...")
	end
})

nut.command.add("removelaw", {
	syntax = "<number index>",
	onRun = function(client, arguments)
		local char = client:getChar()
		if (!char) then return end

		local index = tonumber(arguments[1])
		local message = table.concat(arguments, " ", 2)

		if (!index) then
			client:notifyLocalized("Invalid Number")

			return
		end

		if (char:hasFlags("a")) then
			if (index <= 10) then
				SCHEMA.laws[index] = ""

				netstream.Start(player.GetAll(), "nutLawSync", SCHEMA.laws)
				client:notifyLocalized("Removed law " .. index .. ".")
			else
				client:notifyLocalized("Invalid Number")
			end
		end
	end,
	--alias = {"법삭제"}
})

nut.command.add("addlaw", {
	syntax = "<number index> [string law]",
	onRun = function(client, arguments)
		local char = client:getChar()
		if (!char) then return end

		local index = tonumber(arguments[1])
		local message = table.concat(arguments, " ", 2)

		if (!index) then
			client:notifyLocalized("selectRow")

			return
		end

		if (char:hasFlags("a")) then
			if (index <= 10) then
				SCHEMA.laws[index] = message

				netstream.Start(player.GetAll(), "nutLawSync", SCHEMA.laws)
				client:notifyLocalized("Added law ".. message .. " to law number " .. index .. ".")
				 
				nut.log.add(client, "rule", message)
			else
				client:notifyLocalized("Invalid Number")
			end
		end
	end,
	--alias = {"법추가"}
})

nut.command.add("mayor", {
	--syntax = "<number index> [string law]",
	onRun = function(client, arguments)
		local char = client:getChar()
		if (!char) then return end

		char:joinMayor()
	end,
	--alias = {"법추가"}
})

nut.command.add("setjailpos", {
	adminOnly = true,
	syntax = "",
	onRun = function(client, arguments)
		local char = client:getChar()
		if (!char) then return end

		if (client:IsAdmin()) then
			SCHEMA.prisonPositions = {client:GetPos()}

			return L("prisonReset", client, name)
		end
	end,
	alias = {"감옥설정"}
})

nut.chat.register("cr", {
	onCanSay =  function(speaker, text)
		return 
	end,
	onCanHear = function(speaker, listener)		
		if (speaker == listener) then return true end

		local char = listener:getChar()

		if (char) then
			if (char:hasFlags("B")) then
				return true
			end
		end	

		return false
	end,
	onChatAdd = function(speaker, text)
		chat.AddText(Color(255, 40, 40), "[911] ", nut.config.get("chatColor"), speaker:Name()..": "..text)
	end,
	prefix = {"/911", "/119", "/112"}
})

nut.command.add("unwanted", {
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local message = table.concat(arguments, " ", 2)
		local char = client:getChar()

		if (char and !client:IsAdmin()) then

			if (!char:hasFlagss("B") or !char:hasFlagss("a")) then
				client:notifyLocalized("noPerm")

				return
			end
		end

		if (IsValid(target) and target:getChar()) then
			if (!target:Alive()) then return false, "notAlive" end
			if (!target:isWanted()) then
				client:notifyLocalized("You are no longer wanted.")

				return
			end

			target:wanted(false, message, client)
		end
	end,
	alias = {"수배해제", "현상수배해제"}
})

nut.command.add("wanted", {
	syntax = "<string name> <string reason>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local message = table.concat(arguments, " ", 2)
		local char = client:getChar()

		if (char and !client:IsAdmin()) then

			if (!char:hasFlagss("B") or !char:hasFlagss("a")) then
				client:notifyLocalized("noPerm")

				return
			end
		end

		if (target and target:IsValid()) then
			if (target:isWanted()) then
				if (!target:Alive()) then return false, "notAlive" end
				client:notifyLocalized("alreadyWanted")

				return
			end

			if (IsValid(target) and target:getChar()) then
				target:wanted(true, message, client)
			end
		end
	end,
	alias = {"수배", "현상수배"}
})

nut.command.add("searchwarrant", {
	syntax = "<string name> <string reason>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local message = table.concat(arguments, " ", 2)
		local char = client:getChar()

		if (char and !client:IsAdmin()) then

			if (!char:hasFlagss("a")) then
				client:notifyLocalized("noPerm")

				return
			end
		end

		if (IsValid(target) and target:getChar()) then
			if (!target:Alive()) then return false, "notAlive" end

			if (target:getNetVar("searchWarrant", false) == true) then
				client:notifyLocalized("alreadySearch")

				return
			end

			netstream.Start(player.GetAll(), "nutSearchText", true, client, target, message)
			target:setNetVar("searchWarrant", true)

			local id = target:getChar():getID()
			timer.Create(id .. "_chewAss", 300, 1, function()
				if (IsValid(target)) then
					local char2 = target:getChar()
					
					if (char2:getID() == id) then
						target:setNetVar("searchWarrant", false)
					end
				end
			end)
		end
	end,
	alias = {"수색영장"}
})

nut.command.add("stopwarrant", {
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local char = client:getChar()

		if (char and !client:IsAdmin()) then

			if (!char:hasFlagss("a")) then
				client:notifyLocalized("noPerm")

				return
			end
		end

		if (IsValid(target) and target:getChar()) then
			if (!target:Alive()) then return false, "notAlive" end

			if (target:getNetVar("searchWarrant", false) != true) then
				client:notifyLocalized("This player has no active warrants.")

				return
			end

			netstream.Start(player.GetAll(), "nutSearchEndText", false, client, target)
			target:setNetVar("searchWarrant", nil)

			local id = target:getChar():getID()
			timer.Destroy(id .. "_chewAss")
		end
	end,
	alias = {"수색영장해제"}
})

nut.command.add("bankdeposit", {
	syntax = "<amount>",
	onRun = function(client, arguments)
		local atmEntity
		for k, v in ipairs(ents.FindInSphere(client:GetPos(), 128)) do
			if (v:isBank()) then
				atmEntity = v
				break
			end
		end

		if (IsValid(atmEntity) and hook.Run("CanUseBank", client, atmEntity)) then
			local amount = tonumber(table.concat(arguments, ""))
			local char = client:getChar()

			if (amount and amount > 0 and char) then
				amount = math.Round(amount)
				if (char:hasMoney(amount)) then
					char:addReserve(amount)
					char:takeMoney(amount)
					client:notify(L("depositMoney", client, nut.currency.get(amount)))
				else
					client:notify(L("cantAfford", client))
				end
			else
				client:notify(L("provideValidNumber", client))
			end
		else
			client:notify(L("tooFar", client))
		end
	end,
	--alias = {"입금"}
})

hook.Add("InitializedSchema", "addMoreShit", function()
	timer.Simple(0, function()
		nut.chat.register("tc", {
			onGetColor = function() return color_white end,
			onCanHear = function(speaker, listener)
				local char, char2 = speaker:getChar(), listener:getChar()
	
				if (char and char2) then
					local class, class2 = char:getFlags(), char2:getFlags()
					local classDat, classDat2 = string.Split(class, ""), string.Split(class2, "")

					if (classDat and classDat2) then
						if ((table.HasValue(classDat,"N") == table.HasValue(classDat2,"N")) or (table.HasValue(classDat,"O") == table.HasValue(classDat2,"O")) or (table.HasValue(classDat,"V") == table.HasValue(classDat2,"V")) or (table.HasValue(classDat,"I") == table.HasValue(classDat2,"I")) or (table.HasValue(classDat,"B") == table.HasValue(classDat2,"B")) or (table.HasValue(classDat,"b") == table.HasValue(classDat2,"b"))) then
							return true
						else
							return false
						end
					end
				end	
	
				return false
			end,
			onChatAdd = function(speaker, text)
				local icon = "icon16/user.png"
				local char = speaker:getChar()
				if (char) then
					local class = char:getFlags()
					local classDat = string.Split(class, "")
					if (table.HasValue(classDat,"N") or table.HasValue(classDat,"O") or table.HasValue(classDat,"V") or table.HasValue(classDat,"I")  or table.HasValue(classDat,"B") or table.HasValue(classDat,"b") ) then
						chat.AddText(Color(255, 50, 50), "[Team] ", speaker:Name(), color_white, ": "..text)
					else
						return false
					end
				end
			end,
			prefix = {"/t", "/tc", "/tea"}
		})
		
		-- Mayor Broadcast Chat Type
		nut.chat.register("broadcast", {
			onCanSay =  function(speaker, text)
				if(speaker:getChar():hasFlags("a")) then
					return true
				end
				return false
			end,
			onCanHear = function() return true end,
			onChatAdd = function(speaker, text)
				chat.AddText(Color(255, 0, 0), L"[Mayor Broadcast] ", nut.config.get("chatColor"), speaker:Name()..": "..text)
			end,
			prefix = {"/m", "/mbroad", "/broadcast"}
		})
	
		-- Advert Chat Type
		local advertPrice = 20
		local advectDelay = 20
		nut.chat.register("advert", {
			onCanSay =  function(speaker, text)
				local char = speaker:getChar()
				return (char:hasMoney(advertPrice) and char:takeMoney(advertPrice))
			end,
			onCanHear = function() return true end,
			onChatAdd = function(speaker, text)
				chat.AddText(Color(180, 255, 10), L"advert", nut.config.get("chatColor"), speaker:Name()..": "..text)
			end,
			prefix = {"/advert", "/ad", "/a"}
		})
	end)
end)

nut.command.add("bankwithdraw", {
	syntax = "<amount>",
	onRun = function(client, arguments)
		local atmEntity
		for k, v in ipairs(ents.FindInSphere(client:GetPos(), 128)) do
			if (v:isBank()) then
				atmEntity = v
				break
			end
		end

		if (IsValid(atmEntity) and hook.Run("CanUseBank", client, atmEntity)) then
			local amount = tonumber(table.concat(arguments, ""))
			local char = client:getChar()

			if (amount and isnumber(amount) and amount > 0 and char) then
				amount = math.Round(tonumber(amount))

				if (char:hasReserve(amount)) then
					char:takeReserve(amount)
					char:giveMoney(amount)
					client:notify(L("withdrawMoney", client, nut.currency.get(amount)))
				else
					client:notify(L("cantAfford", client))
				end
			else
				client:notify(L("provideValidNumber", client))
			end
		else
			client:notify(L("tooFar", client))
		end
	end,
	--alias = {"출금"}
})

nut.command.add("banktransfer", {
	syntax = "<amount>",
	onRun = function(client, arguments)
		local atmEntity
		for k, v in ipairs(ents.FindInSphere(client:GetPos(), 128)) do
			if (v:isBank()) then
				atmEntity = v
				break
			end
		end

		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			if (IsValid(atmEntity) and hook.Run("CanUseBank", client, atmEntity)) then
				local amount = table.concat(arguments, "")
				local char = client:getChar()
				local tChar = target:getChar()
				amount = math.Round(tonumber(amount))

				if (char == tChar) then
					client:notify(L("sameChar", client))
					return
				end

				if (amount and isnumber(amount) and amount > 0 and char) then
					if (char:hasReserve(amount)) then
						tChar:addReserve(amount*.95)
						char:takeReserve(amount)
					end
				else
					client:notify(L("provideValidNumber", client))
				end
			end
		else
			client:notify(L("tooFar", client))
		end
	end,
	--alias = {"송금"}
})

nut.command.add("banklongtransfer", {
	syntax = "<amount>",
	onRun = function(client, arguments)
		local atmEntity
		for k, v in ipairs(ents.FindInSphere(client:GetPos(), 128)) do
			if (v:isBank()) then
				atmEntity = v
				break
			end
		end

		if (IsValid(atmEntity) and hook.Run("CanUseBank", client, atmEntity)) then
			local amount = table.concat(arguments, "")
			local char = client:getChar()
			amount = math.Round(tonumber(amount))

			if (amount and isnumber(amount) and amount > 0 and char) then
				if (char:hasReserve(amount)) then
					-- Fee 10%
				end
			else
				client:notify(L("provideValidNumber", client))
			end
		else
			client:notify(L("tooFar", client))
		end
	end,
	--alias = {"장거리송금"}
})

-- kek
nut.command.add("savemap", {
	onRun = function(client, arguments)
		if (client:IsSuperAdmin()) then
			hook.Run("SaveData")
		end
	end,
})