PLUGIN.name = "ODST VISR IFF & Night Vision System"
PLUGIN.author = "HATE Recon"
PLUGIN.desc = "Highlights enemies and friendlies within a certain distance for ODST Huds, and increases visibility in low light areas."

CreateClientConVar( "visr_enabled", 0, false, true, "Sets State of the VISR Mode for the ODST Hud. Bind to a Key of your choice." )



if CLIENT then	

hook.Add( "PreDrawHalos", "AddFriendlyHalos", function()

local INNIE = {}
local innie = 0

local COVIE = {}
local covie = 0

local POLICE = {}
local police = 0

local CIVIE = {}
local civie = 0

local Enemies = {}
local bad = 0
	
local UNSC = {}
local unsc = 0

local Neutral = {}
local civ = 0


	
local ODSTHelmets = 
{
	["unsco1"] = true,
	["unsco2"] = true,
	["unsco3"] = true,
	["unsco4"] = true,
	["unsco5"] = true,
	["unsco6"] = true,
}

local friends = {
--Halo SPV3 Allied NPCs
"npc_vj_halo_unsc_spv3_marine",
"npc_vj_halo_unsc_spv3_odst",
--Default Friendly NPC Classes

}

local enemies = {
--Combine and Default GMOD Hostile NPCs
"npc_combine",
"npc_combine_assassin",
"npc_combine_burner",
"npc_combine_commander",
"npc_combine_cscanner",
"npc_combine_elite",
"npc_combine_elite_strider",
"npc_combine_engineer",
"npc_combine_hg",
"npc_combine_medic",
"npc_combine_mine_new",
"npc_combine_overwatch",
"npc_combine_overwatch_s",
"npc_combine_prisonguard",
"npc_combine_prisonguard_s",
"npc_combine_s",
"npc_combine_shield",
"npc_combine_sniper",
"npc_combine_support",
"npc_combine_synth",
"npc_combine_synth_elite",
"npc_combine_veteran",
"npc_cscanner",
"npc_metro_arrest",
"npc_metropolice",
"npc_rollermine",
"npc_strider",
"npc_turret_ceiling",
"combine_mine",
"npc_antlion",
"npc_antlion_template_maker",
"npc_antlionguard",
"npc_barnacle",
"npc_combine_camera",
"npc_combinedropship",
"npc_combinegunship",
"npc_crabsynth",
"npc_cscanner",
"npc_fastzombie",
"npc_headcrab",
"npc_headcrab_black",
"npc_headcrab_fast",
"npc_helicopter",
"npc_manhack",
"npc_mortarsynth",
"npc_poisonzombie",
"npc_rollermine",
"npc_sniper",
"npc_stalker",
"npc_turret_ceiling",
"npc_turret_floor",
"npc_turret_ground",
"npc_zombie",
"npc_zombie_torso",
"npc_fastzombie_torso",
--Halo SPV3 Hostile NPCs
"npc_vj_halo_cov_spv3_elite_ass",
"npc_vj_halo_cov_spv3_elite_her",
"npc_vj_halo_cov_spv3_elite_hg",
"npc_vj_halo_cov_spv3_elite_maj",
"npc_vj_halo_cov_spv3_elite_min",
"npc_vj_halo_cov_spv3_elite_ult",
"npc_vj_halo_cov_spv3_elite_zel",
"npc_vj_halo_cov_spv3_grunt_maj",
"npc_vj_halo_cov_spv3_grunt_min",
"npc_vj_halo_cov_spv3_hunter_min",
"npc_vj_halo_cov_spv3_hunter_spc",
"npc_vj_halo_cov_spv3_hunter_maj",
"npc_vj_halo_cov_spv3_jackal",
--VJ Base SNPCs
"npc_vj_flood_carrier",
"npc_vj_flood_combat",
"npc_vj_flood_infection",

}

visr = visr or {}
local visr = visr

	function visr:Toggle()
		if (GetConVar("visr_enabled"):GetInt() == 0) then
			LocalPlayer():ChatPrint("VISR Enabled")
			RunConsoleCommand("visr_enabled", "1")
		elseif (GetConVar("visr_enabled"):GetInt() == 1) then
			LocalPlayer():ChatPrint("VISR Disabled")
			RunConsoleCommand("visr_enabled", "0")
		end
	end

	concommand.Add("visr", function()
		visr:Toggle()
	end)
	
if (GetConVarNumber( "visr_enabled" ) >= 1 ) then			
		if not LocalPlayer():IsValid() then return end 
		local char = LocalPlayer():getChar()
		if (!char) then return end
		local item = LocalPlayer():getChar():getInv()
	for _, item in pairs(item:getItems()) do
		if (ODSTHelmets[item.uniqueID] and item:getData("equip", true)) then	

hook.Add("Think", "VISR_NV", function()
		local light = DynamicLight(LocalPlayer():EntIndex())
			light.Pos = LocalPlayer():GetPos() + Vector(0,0,120)
			light.r = 100
			light.g = 100
			light.b = 100
			light.Brightness = 1
			light.Size = 1950
			light.Decay = 1950 * 5
			light.DieTime = CurTime() + 1
			light.Style = 0
end)
			
	for _, ply in ipairs( player.GetAll() ) do
	    
		if (ply != LocalPlayer()) then --Check if ply is equal to player and don't Draw Halo if it is.
		    
		    if (LocalPlayer():GetPos():Distance(ply:GetPos()) <= 1500) then
		        	
		        	if (ply:getChar():hasFlags("I")) then	
		        	    print("hi")
			    	    innie = innie + 1
			            INNIE[ innie ] = ply
		end
		
		  halo.Add( INNIE, Color( 255, 0, 0, 255 ), 0, 0, 2, true, false )
		        
	//	halo.Add( Players, Color(7, 105, 0, 255), 0, 0, 2, true, false )
	        end 
	    end
	end

for k,v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), 1500)) do
	
	if ( table.HasValue( enemies, v:GetClass()) == true ) then		
				bad = bad + 1
			Enemies[ bad ] = v
	end	
	if (table.HasValue( friends, v:GetClass()) == true) then
				unsc = unsc + 1
			UNSC[ unsc ] = v
	end	
	if (v:GetClass() == "npc_citizen") then
				civ = civ + 1
			Neutral[ civ ] = v
	end	
end
	if ( bad > 0 ) then
			halo.Add( Enemies, Color( 255, 0, 0, 255 ), 0, 0, 2, true, false )
	end
	if ( unsc > 0 ) then
			halo.Add( UNSC, Color(7, 105, 0, 255), 0, 0, 2, true, false )
	end
	if ( civ > 0 ) then
			halo.Add( Neutral, Color( 164, 129, 33, 255 ), 0, 0, 2, true, false )
	end
	
				end
			end
				else 
				hook.Remove("Think", "VISR_NV")
				return
		end
	end)
	
end