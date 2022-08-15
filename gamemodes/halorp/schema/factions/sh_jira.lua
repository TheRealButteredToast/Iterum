-- The 'nice' name of the faction.
FACTION.name = "Jiralhanae"
-- A description used in tooltips in various menus.
FACTION.desc = "Doisac is the past, only the Future lies ahead."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(20, 150, 15)
local JIRAL_MODELS = {
	"models/valk/haloreach/covenant/characters/brute/brute.mdl"
}
FACTION.models = JIRAL_MODELS
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_JIRAL = FACTION.index
