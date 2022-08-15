
local odst = {
	"models/ishi/halo_rebirth/npc/odst/male/odst_danlin.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_eyecberg.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_heretic.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_jeffrey.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_snippy.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_alfie.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_carl.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_donnie.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_fabrice.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_gilberto.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_islambek.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_john.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_jose.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_michael.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_ray.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_rob.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_yasser.mdl",
	"models/ishi/halo_rebirth/npc/odst/male/odst_g_yohannes.mdl"
}

local Category = "Iterum NPCs"

local NPC = {	Name = "ODST",
				Class = "npc_combine_s",
				Model = table.Random(odst),
				Health = "150",
				Category = Category }

list.Set( "NPC", "npc_odst", NPC )