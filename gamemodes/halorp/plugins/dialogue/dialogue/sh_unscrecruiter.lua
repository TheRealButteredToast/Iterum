DIALOGUE.name = "UNSC Recruitment Schpeel"

DIALOGUE.addTopic("GREETING", {
	response = "Welcome to the United Nations Space Command Automated Recruitment Center! How may I help you?",
	options = {
		"Topic01", 
		"Topic02",
		"Join",
		--"GetMoney",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("ret", {
	statement = "I see.",
	response = "Anything else I can help you with?",
	options = {
		"Topic01", 
		"Topic02",
		"Join",
		--"GetMoney",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("ret.a", {
	statement = "I've changed my mind.",
	response = "Unfortunate. Anything else I can help you with?",
	options = {
		"Topic01", 
		"Topic02",
		"Join",
		--"GetMoney",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01", {
	statement = "Why should I join the UNSC?",
	response = "Joining the UNSC gives you purpose, direction, and focus. You'll be fighting for humanity in its defense against her enemies. Nothing is more valiant than such an act.",
	options = {
		"Topic01.a", 
		"ret", 
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01.a", {
	statement = "Humanity's enemies?",
	response = "Correct. Currently the UNSC is engaged in two major armed conflicts; against the Covenant, a union of alien races fighting towards a genocidal purge of Humanity, and against various insurrectionist factions.",
	options = {
		"ret",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic02", {
	statement = "I'm interested. What should I know?",
	response = "Joining into the UNSC, you will start as a low level Marine. This posistion will demand service, competence, and capacity from you. If you are interested, please verbally confirm this desire.",
	options = {
		"Join",
		"ret.a",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Join", {
	statement = "I'd like to join the United Nations Space Command Marines.",
	response = "",
	preCallback = function(self, client, target)
		local char = client:getChar()
		if (CLIENT and client:Team() == FACTION_HUMAN and !char:hasFlags("N") and !char:hasFlags("O") and not(char:hasFlags("B") and char:hasFlags("I") and char:hasFlags("V") and char:hasFlags("A"))) then
			self.response = "Excellent! You'll receive a small starting check for the purchase of basic gear. I'll transfer you to our ship now..."
		elseif(char:hasFlags("N") or char:hasFlags("O")) then
			self.response = "You're already a member of the UNSC!"
		elseif(char:hasFlags("B")or char:hasFlags("V") or char:hasFlags("A")) then
			self.response = "You are a member of another faction. I'd suggest you leave."
		else
			self.response = "Sorry, but only Humans can join the UNSC."
		end
	end,
	postCallback = function(self, client, target)
		local char = char
		if (SERVER and client:Team() == FACTION_HUMAN and !char:hasFlags("N") and !char:hasFlags("O") and not (char:hasFlags("B") and char:hasFlags("I") and char:hasFlags("V") and char:hasFlags("A"))) then
			for k,v in ipairs(player.GetAll()) do
				if(v:getChar():hasFlags("N")) then
					v:notifyLocalized("A new player has joined the faction! They're at the spawn right now...")
					v:EmitSound("hl1/fvox/bell.wav")
				end
			end
			
			char:giveFlags("NH")
			char:setName("PVT "..char:getName())
			char:giveMoney(4000)
			client:SetPos(Vector(-1947.499390, -11516.269531, 1200.511230))
			client:SetAngles(Angle(0, -90, 0.000000))
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
	statement = "Logout",
	response = "..."
})