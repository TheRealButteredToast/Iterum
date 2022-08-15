-- The 'nice' name of the faction.
FACTION.name = "Sangheili"
-- A description used in tooltips in various menus.
FACTION.desc = "Born on Sangheilios, Dead where the prophets demand."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(20, 150, 15)
local SANG_MODELS = {
	"models/vuthakral/halo/custom/usp/sangheili_universal_player.mdl"
}
FACTION.models = SANG_MODELS
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_SANG = FACTION.index
