
local marines = {
	"models/ishi/halo_rebirth/npc/marines/male/marine_danlin.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_eyecberg.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_heretic.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_jeffrey.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_snippy.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_alfie.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_carl.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_donnie.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_fabrice.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_gilberto.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_islambek.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_john.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_jose.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_michael.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_ray.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_rob.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_yasser.mdl",
	"models/ishi/halo_rebirth/npc/marines/male/marine_g_yohannes.mdl"
}

local Category = "Iterum NPCs"

local NPC = {	Name = "Marine",
				Class = "npc_combine_s",
				Model = table.Random(marines),
				Health = "150",
				Category = Category }

list.Set( "NPC", "npc_marine", NPC )