nut.currency.symbol = "cR"
nut.currency.singular = ""
nut.currency.plural = ""
nut.config.language = "english"

nut.config.add("voteJob", 25, "Percentage of vote to get a job", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

ALLOWED_ENTS = {
		["prop_physics"] = true,
		["nut_item"] = true,
		["keypad"] = true,
		["gmod_lamp"] = true,
		["gmod_light"] = true,
		["gmod_button"] = true,
		["sammyservers_textscreen"] = true,
		["nut_stove"] = true,
		["nut_storage"] = true,
		["nut_arc"] = true,
		["nut_palq"] = true,
		["nut_distiller"] = true,
		["nut_fruit"] = true,
		["nut_hygen"] = true,
		["nut_lab"] = true,
		["nut_labq"] = true,
		["nut_veg"] = true,
		["nut_pal"] = true,
		["nut_watergen"] = true,
		["nut_lawboard"] = true,
	}

nut.config.add("incomeInterval", 1000, "Amount of seconds to distribute bank income.", 
	function(oldValue, newValue)
		if (timer.Exists("nutBankIncome")) then
			timer.Adjust("nutBankIncome", newValue, 0, SCHEMA.BankIncomePayload)
		end
	end, {
	data = {min = 10, max = 3600},
	category = "schema"
})

nut.config.add("incomeRate", .1, "Percentage of income.", nil, {
	data = {min = 0, max = 100},
	category = "schema"
})

nut.config.add("jailTime", 200, "Amount of seconds.", nil, {
	data = {min = 0, max = 600},
	category = "schema"
})

nut.config.add("tazeTime", 5, "The ammount of time someone is tazed for.", nil, {
	data = {min = 0, max = 600},
	category = "schema"
})