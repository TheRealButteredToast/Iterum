
local nmpd = {
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_danlin.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_eyecberg.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_heretic.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_jeffrey.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_snippy.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_alfie.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_carl.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_donnie.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_fabrice.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_gilberto.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_islambek.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_john.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_jose.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_michael.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_ray.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_rob.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_yasser.mdl",
	"models/ishi/halo_rebirth/npc/nmpd/male/nmpd_g_yohannes.mdl"
}

local Category = "Iterum NPCs"

local NPC = {	Name = "NMPD",
				Class = "npc_combine_s",
				Model = table.Random(nmpd),
				Health = "150",
				Category = Category }

list.Set( "NPC", "npc_nmpd", NPC )