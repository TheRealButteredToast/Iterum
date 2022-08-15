-- The 'nice' name of the faction.
FACTION.name = "Human"
-- A description used in tooltips in various menus.
FACTION.desc = "Born on Earth, Dead where you stand."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(20, 150, 15)
local CITIZEN_MODELS = {
	"models/drem/cch/female_01.mdl",
	"models/drem/cch/female_02.mdl",
	"models/drem/cch/female_03.mdl",
	"models/drem/cch/female_04.mdl",
	"models/drem/cch/female_06.mdl",
	"models/drem/cch/female_07.mdl",
	"models/drem/cch/male_01.mdl",
	"models/drem/cch/male_02.mdl",
	"models/drem/cch/male_03.mdl",
	"models/drem/cch/male_04.mdl",
	"models/drem/cch/male_05.mdl",
	"models/drem/cch/male_06.mdl",
	"models/drem/cch/male_07.mdl",
	"models/drem/cch/male_08.mdl",
	"models/drem/cch/male_09.mdl",
}
FACTION.models = CITIZEN_MODELS
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_HUMAN = FACTION.index
