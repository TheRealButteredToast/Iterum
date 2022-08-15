local CHAR = nut.meta.character

function CHAR:getArmor()
	return self:getVar("armor", false)
end

function CHAR:setArmor(boo)
	self:setVar("armor", boo)
end

function CHAR:getArrest()
	return self:getVar("arrest", 1)
end

function CHAR:setArrest(num)
	self:setVar("arrest", num)
	hook.Run("OnArrestChanged", self, num, true)
end

function CHAR:getReserve()
	return self:getVar("reserve", 0)
end

function CHAR:setReserve(amt)
	self:setVar("reserve", amt)
	hook.Run("OnReserveChanged", self, amt, true)
end

function CHAR:addReserve(amt)
	nut.log.add(self:getPlayer(), "reserve", amt)
	self:setVar("reserve", self:getReserve() + amt)
	hook.Run("OnReserveChanged", self, amt)
end

function CHAR:takeReserve(amt)
	nut.log.add(self:getPlayer(), "reserve", -amt)
	self:setVar("reserve", self:getReserve() - amt)
	hook.Run("OnReserveChanged", self, amt)
end

function CHAR:hasReserve(amt)
	return (amt > 0 and self:getReserve() >= amt)
end

function CHAR:joinMayor()
	local client = self:getPlayer()

	if(!self:getArrest()) then
		client:notifyLocalized("You are arrested! You can't become Mayor.")
		return
	end

	if(client:getChar():getData("wanted")) then
		client:notifyLocalized("You are wanted! You can't become Mayor.")
		return
	end
	
	for k,v in pairs(player.GetAll()) do
		if(v:getChar():hasFlags("a")) then
			client:notifyLocalized("There already is a mayor!")
			return
		end
	end
	
	client.onVote = false
	if (client.nextVote and client.nextVote > CurTime()) then
		client:notifyLocalized("You need to wait before you can vote to become mayor again.")
		return
	end

	if (client.onVote) then
		client:notifyLocalized("alreadyClassVote")
		return
	end

	client.onVote = true
	client.nextVote = CurTime() + 300

	local textWant = L("jobVoteContext", client, client:Name(), L("Mayor", client))

	nut.vote.simple(textWant):next(function(context)
		client.onVote = false

		local voteTotal, voteAgree, voteSurrender, voteDisagree = unpack(context)
		local minimum = voteTotal * (nut.config.get("voteJob", 25) / 100)

		if (voteAgree >= minimum) then
			client:getChar():giveFlags("a")
			client:SetPos(Vector(-9873.359375, 488.035004, -14012.218750))
			client:SetEyeAngles(Angle(0, -90, 0))
			for k,v in ipairs(player.GetAll()) do
				if(v == client) then
					client:notifyLocalized("You have become the Mayor!")
				else
					v:notifyLocalized(client:GetName() .. " has become mayor!")
				end
			end
			
		else
			client:notifyLocalized("You were not voted into office.")
		end
	end)
end