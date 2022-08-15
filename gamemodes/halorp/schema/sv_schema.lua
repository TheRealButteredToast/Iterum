local TOOL_WHITELIST = {
	["remover"] = true,
	["colour"] = true,
	["material"] = true,
	["keypad_willox"] = true,
	["fading_door"] = true,
	["button"] = true,
	["textscreen"] = true,
	["stacker"] = true,
	["precision"] = true,
	["weld"] = true,
	["camera"] = true,
	["adv_duplicator"] = true,
	["light"] = true,
	["lamp"] = true,
	["nocollide"] = true,
}

function SCHEMA:CanTool(client, trace, tool)
	local entity = trace.Entity
	
	if client:getChar():hasFlags('A') or tool == "adv_duplicator" or tool == "stacker" then
		return true
	end
	
	if TOOL_WHITELIST[tool] then
		if (entity:GetCreator() == client or entity:IsWorld()) then
			return true
		end
	end
	client:ChatPrint("You're not allowed to use this tool!")
	return false
end

nut.vote.list = nut.vote.list or {}

function nut.vote.start(title, recipient, callback)
	local d = deferred.new()
	local id = string.format("%08d", math.random(0, 99999999))

	nut.vote.list[id] = {}

	for k, v in ipairs(recipient) do
		nut.vote.list[id][v:UniqueID()] = -1
	end

	netstream.Start(recipient, "voteRequired", id, title)
	timer.Create("nutVote_"..id, 40, 1, function()
		local result = table.Copy(nut.vote.list[id])
		nut.vote.list[id] = nil

		d:resolve(result)
	end)

	return d
end

netstream.Hook("nutVote", function(client, id, response)
	if (nut.vote.list[id]) then
		nut.vote.list[id][client:UniqueID()] = tonumber(response)
	end
end)

function nut.vote.simple(title)
	local d = deferred.new()

	nut.vote.start(title, player.GetAll()):next(function(poll)
		local context = {table.Count(poll), 0, 0, 0}

		for k, v in pairs(poll) do
			if (v == 1) then
				context[2] = context[2] + 1 -- agree
			elseif (v == 0) then
				context[3] = context[3] + 1 -- surrender
			elseif (v == -1) then
				context[4] = context[4] + 1 -- disagree
			end
		end

		d:resolve(context)
	end, function(err)
		d:reject(err)
	end)

	return d
end

--[[function nut.vote.start(title, recipient, callback)
	local d = deferred.new()
	local id = string.format("%08d", math.random(0, 99999999))

	nut.vote.list[id] = {}

	for k, v in ipairs(recipient) do
		nut.vote.list[id][v:UniqueID()] = -1
	end
 
	netstream.Start(recipient, "voteRequired", id, title)
	timer.Create("nutVote_"..id, 40, 1, function()
		local result = table.Copy(nut.vote.list[id])
		nut.vote.list[id] = nil

		d:resolve(result)
	end)

	return d
end

netstream.Hook("nutVote", function(client, id, response)
	if (nut.vote.list[id]) then
		nut.vote.list[id][client:UniqueID()] = tonumber(response)
	end
end)

function nut.vote.simple(title)
	local d = deferred.new()

	nut.vote.start(title, player.GetAll()):next(function(poll)
		local context = {table.Count(poll), 0, 0, 0}

		for k, v in pairs(poll) do
			if (v == 1) then
				context[2] = context[2] + 1 -- agree
			elseif (v == 0) then
				context[3] = context[3] + 1 -- surrender
			elseif (v == -1) then
				context[4] = context[4] + 1 -- disagree
			end
		end

		d:resolve(context)
	end, function(err)
		d:reject(err)
	end)

	return d
end--]]