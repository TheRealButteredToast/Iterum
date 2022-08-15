DIALOGUE.name = "Covenant Recruitment Schpeel"

DIALOGUE.addTopic("GREETING", {
	response = "Brother! Have you come to continue our journey?",
	options = {
		"Topic01", 
		"Topic02",
		"Join",
		--"GetMoney",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("ret", {
	statement = "I understand now.",
	response = "Of course. So tell me brother, are you ready to begin?",
	options = {
		"Topic02",
		"Join",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01", {
	statement = "Journey?",
	response = "Of course, have you forgotten? The prophets guide us down the blessed path, and this path demands we purge the universe of human scum!",
	options = {
		"Topic01.a", 
		"ret", 
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01.a", {
	statement = "Prophets? Blessed Path?",
	response = "Surely you are joking! The leaders of the Covenant, of course. The blessed path is the way of the warrior, the only way to reach the great beyond.",
	options = {
		"ret",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic02", {
	statement = "I have come to serve. How may I do so?",
	response = "Upon joining the Covenant, you will serve your superiors in battle and duty. Through your sacrifice, be it of energy or blood, you will tred the blessed path.",
	options = {
		"Join",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Join", {
	statement = "I am yours to command.",
	response = "",
	preCallback = function(self, client, target)
		local char = client:getChar()
		if (CLIENT and client:Team() != FACTION_HUMAN and !char:hasFlags("V") and not (char:hasFlags("B") and char:hasFlags("I") and char:hasFlags("N") and char:hasFlags("O") and char:hasFlags("A"))) then
			self.response = "Make haste then, I shall send you unto the cruiser into the training center; where you will prepare you for your journey."
		elseif(char:hasFlags("N")) then
			self.response = "You're already a member of the Covenant! Begone, go to your duties."
		elseif(char:hasFlags("B") or char:hasFlags("I") or char:hasFlags("N") or char:hasFlags("O") or char:hasFlags("A")) then
			self.response = "You're a member of another faction! Leave this place you mongrel."
		else
			self.response = "Human scum cannot join the Covenant."
		end
	end,
	postCallback = function(self, client, target)
		local char = client:getChar()
		if (SERVER and client:Team() != FACTION_HUMAN and !char:hasFlags("V") and not (char:hasFlags("B") and char:hasFlags("N") and char:hasFlags("O") and char:hasFlags("A"))) then
			for k,v in ipairs(player.GetAll()) do
				if(v:getChar():hasFlags("V")) then
					v:notifyLocalized("A new player has joined the faction! They're at the spawn right now...")
					v:EmitSound("hl1/fvox/bell.wav")
				end
			end
			
			char:giveFlags("Vh")
			char:giveMoney(4000)
			local race = char:getFaction()
				if(race == FACTION_SANG or  race ==FACTION_JIRAL) then
					char:setName("Initiate "..char:getName())
				elseif(race == FACTION_JACK) then
					char:setName("Scavenger "..char:getName())
				else
					char:setName("Minor "..char:getName())
				end
			client:SetPos(Vector(-8415.162109, 11059.120117, -1463.390869))
			client:SetAngles(Angle(0, -90, 0))
		end
	end,
	options = {
		"GOODBYE"
	}
})

--[[
DIALOGUE.addTopic("", {
	statement = "",
	response = "",
	options = {
		"",
		"GOODBYE"
	}
})
--]]

--[[DIALOGUE.addTopic("GetMoney", {
	statement = "Hey, can I get some money?",
	response = "",
	preCallback = function(self, client, target)
		if (CLIENT) then
			self.response = "Okay "..client:GetName().." here is 50 "..nut.currency.plural.."."
		end
	end,
	postCallback = function(self, client, target)
		if (SERVER) then
			client:getChar():giveMoney(50)
		end
	end,
	options = {
		"GOODBYE"
	}
})--]]

DIALOGUE.addTopic("GOODBYE", {
	statement = "I have not come to serve, nor do I have any other questions.",
	response = "So be it. Know you may be tread upon by those who walk the path."
})