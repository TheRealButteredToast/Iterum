DIALOGUE.name = "Police Recruitment Schpeel"

DIALOGUE.addTopic("GREETING", {
	response = "Interested in Joining the Asphodel Police?",
	options = {
		"Topic01", 
		"Topic02",
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
		--"GetMoney",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01", {
	statement = "Why should I become a police officer?",
	response = "Joining the police force gives you an opportunity to defend Asphodel from all her enemies, both foreign and domestic. You will be responsible for apprehending suspects, saving lives, and keeping the streets safe.",
	options = {
		"Topic01.a", 
		"ret", 
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01.a", {
	statement = "Foreign and Domestic?",
	response = "Yes. Asphodel's size and proximity to resources has attracted a large amount of criminal activity. As for foreign threats, the UNSC and Covenant both have overlapping goals. Unfortunately, we find ourselves in their crosshairs.",
	options = {
		"ret",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic02", {
	statement = "I'm interested. What should I know?",
	response = "Good! You should know that it is expected you learn how to operate your tazer, stun baton, and primary weapon. Any further questions can be brought to an officer. You will have to complete a short quiz before you can enlist.",
	options = {
		"q1",
		"ret.a",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q1", {
	statement = "I'm ready for the quiz.",
	response = "Alright, first question. You're patrolling down the sidewalk, and you hear gun shots. What do you do?",
	options = {
		"q1w1",
		"q2",
		"q1w2",
		"q1w3"
	}
})

DIALOGUE.addTopic("q1w1", {
	statement = "I pull out my gun, run over, and shoot anyone who poses a threat.",
	response = "Wrong answer. You will more than likely kill a bystand who was merely responding to the situation before you arrived. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q1w2", {
	statement = "I radio for backup, and wait for support.",
	response = "Wrong answer. In the time you spent waiting, the suspects got away. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q1w3", {
	statement = "I carefully, safely, and strategically approach the danger zone. I carefully assess the situation before I shoot anyone dangerous.",
	response = "Wrong answer. You took too long to approach the situation and the suspects were able to get away without a trace being left behind. Not only that, but you end up shooting a well-armed good samaritan who was securing the area. Think that one over.",
	options = {
		"GOODBYE"
	} 
})

DIALOGUE.addTopic("q2", {
	statement = "I radio for backup as I made my way to the situation area. I attempt to apprehend any suspects, but keep my safety in mind.",
	response = "Correct! You should always have backup on the way incase of an emergency, and try to limit any damage done to bystanders and yourself. Next Question: You are investigating a relatively insignificant situation that occured between two civilians, as you do this, you see a distress call made by the mayor in the Badlands. Your superior is rallying officers to respond. What do you do?",
	options = {
		"q2w1",
		"q2w2",
		"q3",
		"q2w3"
	}
})

DIALOGUE.addTopic("q2w1", {
	statement = "I drop my case and hurry back to the station. Once there, I join up with any fellow officers as we make way to the badlands.",
	response = "Wrong answer. The case you left behind spirals into a bigger problem, and one of the civilains kills the other one. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q2w2", {
	statement = "I radio to my superior and ask if I should drop my case. I do not act until I hear a response.",
	response = "Wrong answer. By the time you receive a response, you have to walk to the Badlands and the situation is resolved. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q2w3", {
	statement = "I finish the case, and then respond to the call.",
	response = "Wrong answer. You took too long wrapping up the case, and your fellow officers take casualties due to being undermanned. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q3", {
	statement = "I get the Civilians contact information to resolve the situation later. I then make my way with the other officers",
	response = "Correct! Understand that some situations are more urgent than others, and be adaptive enough to drop what you need to respond to emergencies. Next Question: A Covenant strike force is currently attacking a private warehouse to retrieve some items of importance. Officers are acquiring heavier weaponry and are preparing to respond. Your officer sends you and a fellow officer to scout out the Covenant forces, and attempt to stall them so they cannot get away before the main force arrives. During your approach, a Covenant soldier sees your partner and opens fire. He is struck twice in the leg. He limps off to cover, and seems to be stable. How do you proceed?",
	options = {
		"q4",
		"q3w1",
		"q3w2",
		"q3w3"
	}
})

DIALOGUE.addTopic("q3w1", {
	statement = "I stand my ground and protect the wounded officer. I stay with him until the main force arrives.",
	response = "Wrong answer. The main force needs intel on how many Covenant there are, and for them to be stalled. Your inaction led to an inadequte response and unnecessary casualties. Not only that, but the Covenant were able to get away. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q3w2", {
	statement = "I radio to my superior and let him know my partner is wounded. Then, I carefully navigate the city and assasinate the Covenant soldier who shot him.",
	response = "Wrong answer. You spent too much time getting revenge. Now, the main force has no intel and a smaller window of opportunity to engage the Covenant. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q3w3", {
	statement = "I radio to my suprior and carry on with the mission alone.",
	response = "Wrong answer. In your heroism you forgot to realize you are one man engaging a Covenant strike force. Vastly outnumbered and out-gunned, you are mercilessly slaughtered long before the main force arrives. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q4", {
	statement = "I alert my superior that my partner is wounded. I ensure he is safe. Then I gather as much intel as I can, being careful to avoid direct conflict.",
	response = "Correct! You need to adapt your plans to the situation as it evolves. Sometimes, you have to make the best out of what you're given, and this includes taking less or more risks. Next Question: An Insurgent cell has occupied the space station tethered to Asphodel. They are facilitating a massive weapons and drug trade scheme which begins flooding Asphodel's streets. The mayor orders the police to retake the station, and your superior shares his plan; Two units will simultaneously engage the station. One will go up the elevator with heavy weaponry, and the other will be flown in through the hangar. You are assigned with the elevator unit, and as you prepare to go up, you see the second unit be ambushed in the airport. Your fellow officers look to you for how to act, what do you do?",
	options = {
		"q5",
		"q4w1",
		"q4w2",
		"q4w3"
	}
})

DIALOGUE.addTopic("q4w1", {
	statement = "I order the operation to continue and send the elevator up.",
	response = "Wrong answer. Your unit is easily slaughtered due to the fact that you were outgunned and outmanned. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q4w2", {
	statement = "I disband the operation entirely and assault the airfield as fast as I can maneuver my unit.",
	response = "Wrong answer. In your haste an Insurgent ends up sending the heavy weaponry up the elevator. The Insurgents then hijack Police equipment and add it to their defenses. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q4w3", {
	statement = "I split my unit in half, one to continue the assault, one to rescue the airfield unit.",
	response = "Wrong answer. Both of your units are easily repulsed as they are undergunned and undermanned. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q5", {
	statement = "I have some officers unload the heavy weaponry off the elevator and send the rest of them to help the second unit. After this, we launch the operation.",
	response = "Correct! You cannot leave behind anything of use to the enemy in your haste. But you also must rescue the second unit. In doing so, you optimally prepare for the long-term victory rather than the short-term success. Final Question: Insurgents have taken the Mayor hostage and he is being held in the Insurgent base. A massive infiltration unit is dispatched to rescue the mayor, and in the process huge casualties are taken. However, the operation succeeds. Once the Police unit arrives to the surface, they find themselves surrounded by Covenant forces. The Covenant demand complete surrender of the city in exchange for the unit's lives. The Covenant give the surrounded police ten minutes to decide their fate. You were on base duty and guarding the bank vault. You receive a radio from your superior and he fills you in. He tells you the following: 'Goto the UNSC base as fast as you can, and tell Commander Retreson the situation. Tell him I sent you requesting urgent assistance.' You do as told. However, there's a catch. Commander Retreson says he will help, on one condition. The Police force must subordinate itself to the UNSC. Asphodel will still be an independent city, but the police force will serve the UNSC instead of the mayor. What do you do?",
	options = {
		"q5w1",
		"q5w2",
		"qj",
		"q5w3"
	}
})

DIALOGUE.addTopic("q5w1", {
	statement = "I deny the terms and demand he saves the mayor.",
	response = "Wrong answer. You are laughed out, and the police unit is slaughtered.. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q5w2", {
	statement = "I wholeheartedly accept the terms.",
	response = "Wrong answer. With the Police subordinate to the UNSC, the Mayor is removed from office and Asphodel is brought under UNSC occupation. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("q5w3", {
	statement = "I attempt to bargain for a compromise.",
	response = "Wrong answer. You spent so much time bargaining, that the timer ran out and the unit was slaughtered. Think that one over.",
	options = {
		"GOODBYE"
	}
})

DIALOGUE.addTopic("qj", {
	statement = "I tell the commander that I do not have the authority to do that. However, I will support him in any post-situation negotiations.",
	response = "Correct! You cannot overstep your authority and must remember your posistion. Sometimes uncertain conditions are better than certain but authoritarian resolutions. You have successfully completed the Asphodel Police Department Quiz. Please continue to enlist.",
	options = {
		"Join"
	}
})

DIALOGUE.addTopic("Join", {
	statement = "I'd like to enlist.",
	response = "",
	preCallback = function(self, client, target)
		local char = client:getChar()
		if (CLIENT and char:hasFlags("O") and char:hasFlags("N") and char:hasFlags("V") and char:hasFlags("A")) then
			self.response = "Excellent! You'll receive a small starting check for the purchase of basic gear. I'll send you to the station, once you get there find the armory..."
		elseif(char:hasFlags("B")) then
			self.response = "You're already a member of the Police!"
		else
			self.response = "You're a member of another faction! You can't become a police officer until you leave that faction!"
		end
	end,
	postCallback = function(self, client, target)
		if SERVER then
			local char = client:getChar()
			if !(char:hasFlags("B") or char:hasFlags("O") or char:hasFlags("N") or char:hasFlags("V") or char:hasFlags("A")) then
				for k,v in ipairs(player.GetAll()) do
					if v:getChar():hasFlags("B") then
						v:notifyLocalized("A new player has joined the faction! They're at the spawn right now...")
						v:EmitSound("hl1/fvox/bell.wav")
					end
				end
				
				char:giveFlags("B")
				char:setName("Officer "..char:getName())
				char:giveMoney(4000)
				client:SetPos(Vector(-7299.438477, -3986.121582, -14777.683594))
				client:SetAngles(Angle(0, 160, 0))
			end
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
	statement = "Goodbye",
	response = "Til' next time!"
})