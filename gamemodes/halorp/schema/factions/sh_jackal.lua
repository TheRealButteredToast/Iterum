-- The 'nice' name of the faction.
FACTION.name = "Kig-Yar"
-- A description used in tooltips in various menus.
FACTION.desc = "Born on Eayn, sailing the interstellar seas as you please."
-- A color to distinguish factions from others, used for stuff such as
-- name color in OOC chat.
FACTION.color = Color(20, 150, 15)
local JACK_MODELS = {
	"models/player/jackal.mdl"
}
FACTION.models = JACK_MODELS
-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_JACK = FACTION.index
