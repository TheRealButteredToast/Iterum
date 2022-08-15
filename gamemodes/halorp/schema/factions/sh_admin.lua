-- The 'nice' name of the faction.
FACTION.name = "Administrator"
-- A description used in tooltips in various menus.
FACTION.desc = "Servants of the living, so that one day you too may live."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(102, 0, 204)
local CITIZEN_MODELS = {
	"models/drem/cch/female_01.mdl"
}
FACTION.isDefault = false
FACTION.models = CITIZEN_MODELS
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_ADMIN = FACTION.index
