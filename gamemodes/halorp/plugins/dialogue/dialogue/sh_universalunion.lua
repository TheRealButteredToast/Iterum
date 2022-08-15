DIALOGUE.name = "Immigration Schpeel"

DIALOGUE.addTopic("GREETING", {
	response = "Welcome to Asphodel! How may I help You?",
	options = {
		"Topic01", 
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic01", {
	statement = "What's there to know about Asphodel?",
	response = "A few things are important to know before you head out into the broader world. Factions, such as the UNSC, Covenant, and Civlian Government, dominate the general landscape. Working with, or against, them will drive most of your activity.",
	options = {
		"Activity",
		"Factions",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Activity", {
	statement = "What do you mean by Activity?",
	response = "Asphodel is still a relatively new colony, so many industries are run by small groups of Civilians who take up shop in the local warehouses. Whether its mining, manufacturing, refining, farming, or harvesting passive resources someone has to manually do the task. These tasks take time and resources, which may be hard to come by. Since you're new, I'd suggest teaming up with fellow Asphodelians or joining a faction. If you do want to go solo, the market place can be accessed through subway stairs you'll find on the far end of the plaza. Buying a cheap car, a mining laser, and a refinery, you can get yourself on a track to self-sufficiency. Do be aware of the danges of mining though.",
	options = {
		"DangersofMining",
		"OtherIndustries",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("DangersofMining", {
	statement = "What do you mean by Dangers?",
	response = "Most mining is done in the surface rocks of the Badlands. This area is filled with largely unexplored and war-torn terrain. Large cliffs, deep caverns, valleys and lakes dot the badlands. The sheer quantity of resources makes it a hotbed for conflict, raiders, and petty theft. Some areas also pose natural dangers, whether from perilous drops or inhospitable conditions like toxic air. More developed mining techniques use aircraft to reach the astroids in orbit. There, resources can be mined, and the danger is generally reduced to fights between UNSC and Covenant assets.",
	options = {
		"Factions",
		"OtherIndustries",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("OtherIndustries", {
	statement = "Tell me about the other industries.",
	response = "Asphodel is a hotbed of conflict and distruption. As such, the colony has become very self-reliant. Most notably mining, but there are other key aspects. Refineries turn said minerals into useful alloys. Self-Contained farming equipment produce fruits and vegetables. Hydrogen generators, water pumps, and Helium pumps passively generate their respective materials. ARC Machines are used in tandem with blueprints to turn raw materials into useful items. ARC Machines are used to manufacture vehicles, weapons, or even other machines.",
	options = {
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Factions", {
	statement = "Tell me more about the factions",
	response = "Currently the UNSC and Covenant are trapped in a stalemate. Advanced ruins dot the Badlands, forcing the Covenant to want to occupy, rather than glass, the planet. Meanwhile, the UNSC took heavy losses in previous orbital engagements and has been focused on contesting Covenant operations. A UNSC frigates wreck can be found scattered across the Badlands, as well as large pieces of its hull still in orbit. The Asphodelian Government was lightly armed before the Covenant arrived, as the colony and UEG have not always been on friendly terms. As such, the Government maintains a fairly well armed Milita capable of securing the City against most Covenant and UNSC actions.",
	options = {
		"HowToJoin",
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("HowToJoin", {
	statement = "How do I join a faction?",
	response = "Asphodel has attempted to remain as neutral as possible in the broader conflict. Covenant species have found refuge from the tyrannical structure of their homeworlds, and Human settlers have found refuge from the war. As such, all species have come to call Asphodel home. In exchange for their service in the planetary campaign, the Covenant has offered membership and forgivess to Unggoy, Sangheili, Kig-Yar, and Jiralhene. Manpower is always welcomed by the UNSC. That said, all factions can be joined by finding recruiters around the city. Interacting with the recruiter will automatically transfer you into the faction. However, to leave a faction you will require additional assistance and need a genuine reason.",
	options = {
		"Topic03",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("Topic03", {
	statement = "I have other questions.",
	response = "What would you like to know?",
	options = {
		"Activity",
		"Factions",
		"GOODBYE"
	}
})

DIALOGUE.addTopic("GOODBYE", {
	statement = "I have no more questions, bye!",
	response = "Welcome and Goodluck!"
})