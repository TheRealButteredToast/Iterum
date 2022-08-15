DIALOGUE.name = "Hub Schpeel"

DIALOGUE.addTopic("GREETING", {
	response = "Welcome to the Hub!",
	options = {
		"Topic01", 
		"Topic02",
		--"GetMoney",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01", {
	statement = "What is this place?",
	response = "The Hub is a centerplace funded by the Asphodelian Government to help new immigrants to get familiar with commonly used basic equipment. While the equipment is free to use, it's imporant to remember that other players will have access to the ARCs, Refineries, and Temporary storages.",
	options = {
		"Further01",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Further01", {
	statement = "Tell me about the equipment.",
	response = "The Hub has four different kinds of tech. The taller machines are refineries, they break down rocks into metals. The longer machines are ARCs, they can craft almost anything. The wooden crates temporarily store anything you put in them, and the metal crate will permanently store materials.",
	options = {
		"PuchaseInfo",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("PuchaseInfo", {
	statement = "Can I buy these?",
	response = "Inside the market place, vendors will sell you what you want. If they're out of stock, you can always ask around and buy one off of or teaming up with someone.",
	options = {
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic02", {
	statement = "Who do you work for?",
	response = "I work for the Asphodel Immigration Services, a subsection of the Asphodel Government. My job is to help integrate new arrivals to the city.",
	options = {
		"Topic03",
		"Further02",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Further02", {
	statement = "Tell me about the Asphodelian Government.",
	response = "The Government is consisted of two branches, the Police and the Executive Office. The Police maintain order and enforce rules set by the Executive Office. The Executive Office is made up of a Mayor who is voted into office by the citizens of Asphodel.",
	options = {
		"Furhter03",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Furhter03", {
	statement = "Can I join the Asphodel Government?",
	response = "Yes. If you're interested in joining the police, you can ask any officer how to join, or goto the police station. You can become mayor by running for mayor using the /bemayor chat command. If you're voted into office, you can then become mayor.",
	options = {
		"Topic03",
		"GOODBYE"
	}
})
--[[
DIALOGUE.addTopic("", {
	statement = "",
	response = "",
	options = {
	
	}
})
--]]
DIALOGUE.addTopic("Topic03", {
	statement = "I have other questions.",
	response = "What would you like to know?",
	options = {
		"Topic01",
		"Topic02",
		"GOODBYE"
	}
})

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
	statement = "Goodbye.",
	response = "Enjoy your visit!"
})