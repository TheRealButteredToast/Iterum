PLUGIN.name = "NPC Relations"
PLUGIN.author = "Bok"
PLUGIN.desc = "Updates relations based on factions"

PLUGIN.covNPC = {
	["npc_vj_halo_cov_spv3_brute_chf"] = true,
	["npc_vj_halo_cov_spv3_brute_maj"] = true,
	["npc_vj_halo_cov_spv3_brute_min"] = true,
	["npc_vj_halo_cov_spv3_brute_ult"] = true,
	["npc_vj_halo_cov_spv3_brute_wchf"] = true,
	["npc_vj_halo_cov_spv3_elite_hg_maj"] = true,
	["npc_vj_halo_cov_spv3_elite_hg_min"] = true,
	["npc_vj_halo_cov_spv3_elite_hg_ult"] = true,
	["npc_vj_halo_cov_spv3_elite_hg_zel"] = true,
	["npc_vj_halo_cov_spv3_elite_maj"] = true,
	["npc_vj_halo_cov_spv3_elite_min"] = true,
	["npc_vj_halo_cov_spv3_elite_oss"] = true,
	["npc_vj_halo_cov_spv3_elite_spc"] = true,
	["npc_vj_halo_cov_spv3_elite_ult"] = true,
	["npc_vj_halo_cov_spv3_elite_zel"] = true,
	["npc_vj_halo_cov_spv3_grunt_maj"] = true,
	["npc_vj_halo_cov_spv3_grunt_min"] = true,
	["npc_vj_halo_cov_spv3_grunt_spc"] = true,
	["npc_vj_halo_cov_spv3_grunt_ult"] = true,
	["npc_vj_halo_cov_spv3_hunter_maj"] = true,
	["npc_vj_halo_cov_spv3_hunter_min"] = true,
	["npc_vj_halo_cov_spv3_jackal_maj"] = true,
	["npc_vj_halo_cov_spv3_hunter_spc"] = true,
	["npc_vj_halo_cov_spv3_jackal_min"] = true,
	["npc_vj_halo_cov_spv3_jackal_mkm_maj"] = true,
	["npc_vj_halo_cov_spv3_jackal_mkm_min"] = true,
	["npc_vj_halo_cov_spv3_jackal_mkm_ult"] = true,
	["npc_vj_halo_cov_spv3_jackal_spc"] = true,
	["npc_vj_halo_cov_spv3_skirm_min"] = true,
	["npc_vj_halo_cov_spv3_skirm_maj"] = true,
	["npc_vj_halo_cov_spv3_phantom_turret"] = true,
	["npc_vj_halo_cov_spv3_phantom"] = true,
	["npc_vj_halo_cov_spv3_phantom_tri"] = true,
}--]]

PLUGIN.unscNPC = {
	["Brute Captain"] = true,
	["npc_cov_brute_chieftain"] = true,
	["npc_cov_brute_major"] = true,
	["npc_cov_brute_minor"] = true,
	["npc_cov_brute_stalker"] = true,
}

--[[PLUGIN.insNPC = {
	[""] = true,
}--]]

PLUGIN.polNPC = {
	["npc_optre_ueg_officer"] = true,
	["npc_optre_ueg_sergeant"] = true,
	["npc_optre_ueg_riot"] = true,
	["npc_optre_ueg_sru_officer"] = true,
	["npc_optre_ueg_sru_sergeant"] = true,
}


if (SERVER) then

	local PLUGIN = PLUGIN
	
	function PLUGIN:PlayerLoadedChar(client)
		self:UpdateRelations(client)
	end
	
	function PLUGIN:CharacterFactionTransfered(char, oldFaction, faction)
		local client = char:getPlayer()

		self:UpdateRelations(client)
	end

	function PLUGIN:PlayerSpawnedNPC(client, ent)
		for k, v in pairs(player.GetAll()) do
			self:UpdateRelations(v)
		end
	end

	function PLUGIN:UpdateRelations(client)
		local npc = ents.FindByClass("npc_*")
		local character = client:getChar()
		
		for k, v in pairs(npc) do
			client:ChatPrint(v:GetClass())
			
			if character:hasFlags('A') then
				v:AddEntityRelationship(client, D_LI, 99)
			else
				if PLUGIN.covNPC[v:GetClass()] then
					if character:hasFlags('V') then
						v:AddEntityRelationship(client, D_LI, 99)
					else
						v:AddEntityRelationship(client, D_HT, 99)
					end
				elseif PLUGIN.polNPC[v:GetClass()] then	
					if character:hasFlags('B') then
						v:AddEntityRelationship(client, D_LI, 99)
					else
						v:AddEntityRelationship(client, D_HT, 99)
					end
				--[[elseif PLUGIN.insNPC[v:GetClass()] then
					v:AddEntityRelationship(client, (self:isIns(client) and D_LI) or D_HT, 99)
				elseif PLUGIN.polNPC[v:GetClass()] then
					v:AddEntityRelationship(client, (self:isPol(client) and D_LI) or D_HT, 99)--]]
				end
			end
		end
	end
	
end
