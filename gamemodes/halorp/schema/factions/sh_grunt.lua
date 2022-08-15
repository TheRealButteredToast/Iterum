-- The 'nice' name of the faction.
FACTION.name = "Grunt"
-- A description used in tooltips in various menus.
FACTION.desc = "Born of many, you fight and die in the thousands at a time."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(20, 150, 15)
local GRUNT_MODELS = {
	"models/valk/haloreach/covenant/characters/grunt/grunt_player.mdl",
}
FACTION.models = GRUNT_MODELS
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_GRUNT = FACTION.index
