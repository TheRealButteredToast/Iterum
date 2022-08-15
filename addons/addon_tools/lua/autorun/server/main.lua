CreateConVar("headcrabplus_settings_takeovernpcs", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("headcrabplus_settings_takeoverplayers", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("headcrabplus_settings_removeattacker", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("headcrabplus_settings_bonemerge", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("headcrabplus_settings_enable_zombines", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("headcrabplus_settings_zombine_player", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

hcp_sabrean_zombine = {
	["models/combine_soldier_prisonguard.mdl"] = {zombie = "npc_zombine", skin = 2},
	["models/combine_soldier.mdl"] = {zombie = "npc_zombine", skin = 4},
	["models/player/combine_soldier_prisonguard.mdl"] = {zombie = "npc_zombine", skin = 2},
	["models/player/zombie_soldier.mdl"] = {zombie = "npc_zombine", skin = 4},
	["models/player/combine_super_soldier.mdl"] = {zombie = "npc_zombine", skin = 3},
	["models/combine_super_soldier.mdl"] = {zombie = "npc_zombine", skin = 3},
	["models/player/combine_elite_original.mdl"] = {zombie = "npc_zombine", skin = 3},
	["models/player/combine_soldier_original.mdl"] = {zombie = "npc_zombine", skin = 4},
	["models/player/combine_soldier_prisonguard_original.mdl"] = {zombie = "npc_zombine", skin = 2},
	["models/bloocobalt/combine/combine_04.mdl"] = {zombie = "npc_zombine", skin = 4},
	["models/player/combine_soldier.mdl"] = {zombie = "npc_zombine", skin = 4},
}

local hcp_prisonguard_check = {
	["models/combine_soldier.mdl"] = true,
	["models/player/combine_soldier_original.mdl"] = true,
	["models/player/combine_soldier.mdl"] = true,
}

local hcp_mounted_addons = {}

local function CheckForAddonInstalled(id)
	if hcp_mounted_addons[id] == true then return true end // Don't worry about checking even more if its already been deemed mounted.
	for k,v in pairs(engine.GetAddons()) do
		if tonumber(v.wsid) == id and v.mounted == true then hcp_mounted_addons[id] = true  return true end
	end
	return false
end

hook.Add( "PlayerSpawnedNPC", "headcrabplus_setup_init", function(ply, ent)
	ent.OwningPly=ply
end)

local function DeleteHooks()
	hook.Remove("DoPlayerDeath", "headcrabplus_playerdeath")
	hook.Remove("DoPlayerDeath", "headcrabplus_npcdeath")
	hook.Remove("EntityTakeDamage", "headcrabplus_damage_modifier")
	hook.Remove("EntityTakeDamage", "headcrabplus_poison_counter")
	hook.Remove("OnEntityCreated", "headcrabplus_health_modifier")
end

hook.Add("OnNPCKilled", "headcrabplus_npcdeath", function(npc, inflictor, attacker)
	local re_zombie, re_skin = nil, nil
	npc.PoisonBites = nil
	
	if npc.IsHeadcrabPlus and npc.boneMerge and npc.boneMerge:IsValid() then 
		local bModel = npc:GetModel()
		local deathragdoll = ents.Create("prop_ragdoll")
		deathragdoll:SetModel(npc.boneMerge:GetModel())
		deathragdoll:SetPos(npc:GetPos())
		deathragdoll:SetAngles(npc:GetAngles())
		deathragdoll:Spawn()
		for k, v in pairs(npc.boneMerge:GetBodyGroups()) do
			deathragdoll:SetBodygroup( v.id, npc.boneMerge:GetBodygroup(v.id))
		end
		deathragdoll:SetSkin(npc.boneMerge:GetSkin())
		deathragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		deathragdoll:Fire("fade", nil, 120)
		
		--Thanks to @MaxShadow--
		for i = 0, deathragdoll:GetPhysicsObjectCount() do
			local physobj = deathragdoll:GetPhysicsObjectNum(i)
			if IsValid(physobj) and (physobj) then
				local pos, ang = npc:GetBonePosition(npc:TranslatePhysBoneToBone(i))
				physobj:SetPos(pos)
				physobj:SetAngles(ang)
				physobj:EnableMotion(true)
			end
		end
		
		npc.boneMerge:Remove()
		npc:SetModel("models/props_junk/watermelon01_chunk02c.mdl")
		npc:Remove()
		SafeRemoveEntityDelayed(npc, 0.2)
		return
	end
	
	if GetConVar("headcrabplus_settings_takeovernpcs"):GetInt() == 0 then return end
		
	if !IsValid(attacker) or attacker:IsPlayer() then return end
	if npc:GetClass() == "npc_zombie" or npc:GetClass() == "npc_fastzombie" or npc:GetClass() == "npc_poisonzombie" then return end
	if not attacker:GetClass() == "npc_headcrab" and attacker:GetClass() == "npc_headcrab_fast" and attacker:GetClass() == "npc_headcrab_black" then return end
	if not npc:LookupBone("ValveBiped.Bip01_Head1") then return end
	
	local model = npc:GetModel()
	local pos = npc:GetPos()
	
	if attacker:GetClass() == "npc_headcrab" then zombie = "npc_zombie"
	elseif attacker:GetClass() == "npc_headcrab_fast" then zombie = "npc_fastzombie"
	elseif attacker:GetClass() == "npc_headcrab_black" or attacker:GetClass() == "npc_headcrab_poison" then zombie = "npc_poisonzombie"
	else return end
	
	if !zombie then return end
	if attacker:GetClass() == "npc_headcrab" and (GetConVar("headcrabplus_settings_enable_zombines"):GetInt() == 1) then
		if hcp_sabrean_zombine[model] and !hcp_sabrean_zombine[npc:GetClass()] then
			re_zombie = hcp_sabrean_zombine[model].zombie
			re_skin = hcp_sabrean_zombine[model].skin
			if hcp_prisonguard_check[model] == true and npc:GetSkin() == 1 then re_skin = 1 end
		end
		
		if !hcp_sabrean_zombine[model] and hcp_sabrean_zombine[npc:GetClass()] then
			re_zombie = hcp_sabrean_zombine[npc:GetClass()].zombie
			re_skin = hcp_sabrean_zombine[npc:GetClass()].skin
		end
	end
	
	local zombieEnt=ents.Create(re_zombie or zombie)
	zombieEnt:SetPos(pos)
	zombieEnt:SetSkin(re_skin or 100)
	zombieEnt:Spawn()
	zombieEnt:Activate()
	zombieEnt.IsHeadcrabPlus = true
	zombieEnt.OnRemove = function() end
	if zombieEnt:GetClass() == "npc_poisonzombie" then
		for k,v in pairs(zombieEnt:GetBodyGroups()) do
			if v.id == 1 then continue end
			zombieEnt:SetBodygroup(v.id, 0)
		end
		zombieEnt:SetKeyValue("crabcount", 0)
	end
	
	if attacker.OwningPly then 
		undo.Create("Zombified-Headcrab")
			undo.AddEntity(zombieEnt)
			undo.SetPlayer(attacker.OwningPly)
		undo.Finish()
		attacker.OwningPly:AddCleanup("npcs", zombieEnt)
		attacker.OwningPly:AddCount("npcs", zombieEnt)
	end
	
	if GetConVar("headcrabplus_settings_bonemerge"):GetInt() == 1 and !re_zombie then
	local boneMerge
	if zombie == "npc_poisonzombie" then boneMerge=ents.Create("headcrabplus_bonemerge_nores_p") else boneMerge=ents.Create("headcrabplus_bonemerge") end
	boneMerge:SetParent(zombieEnt)
	boneMerge:SetModel(model)
	boneMerge:Spawn()
	zombieEnt.boneMerge = boneMerge
	
	for k, v in pairs(npc:GetBodyGroups()) do
		boneMerge:SetBodygroup( v.id, npc:GetBodygroup(v.id))
	end
	
	boneMerge:SetSkin(npc:GetSkin())
	
	if zombie == "npc_poisonzombie" then
		for i=1,boneMerge:GetBoneCount() do
			boneMerge:ManipulateBoneScale(i, Vector(1.6,1.6,1.6))
		end
	end
	end
	
	npc:SetModel("models/props_junk/watermelon01_chunk02c.mdl")
	npc:Remove()
	SafeRemoveEntityDelayed(npc, 0.2)
	if GetConVar("headcrabplus_settings_removeattacker"):GetInt() == 1 and attacker:GetClass() != "npc_poisonzombie" and !scripted_ents.IsBasedOn(attacker:GetClass(),"npc_poisonzombie") then attacker:Remove() end
end)

hook.Add("DoPlayerDeath", "headcrabplus_playerdeath", function(ply, attacker, dmg)
	local re_zombie, re_skin = nil, nil
	ply.PoisonBites = nil
	
	if GetConVar("headcrabplus_settings_takeoverplayers"):GetInt() == 0 then return end
	if !IsValid(attacker) or attacker:IsPlayer() then return end
	if not attacker:GetClass() == "npc_headcrab" and attacker:GetClass() == "npc_headcrab_fast" and attacker:GetClass() == "npc_headcrab_black" then return end
	
	local model
	if pk_pills then
		if pk_pills.getMappedEnt(ply) and pk_pills.getMappedEnt(ply):GetPuppet():LookupBone("ValveBiped.Bip01_Head1") then model = pk_pills.getMappedEnt(ply):GetPuppet():GetModel()  pk_pills.getMappedEnt(ply):Remove()
		elseif !pk_pills.getMappedEnt(ply) then model = ply:GetModel() else return end
	else model = ply:GetModel() end
	local pos = ply:GetPos()
	
	if attacker:GetClass() == "npc_headcrab" then zombie = "npc_zombie"
	elseif attacker:GetClass() == "npc_headcrab_fast" then zombie = "npc_fastzombie"
	elseif attacker:GetClass() == "npc_headcrab_black" or attacker:GetClass() == "npc_headcrab_poison" then zombie = "npc_poisonzombie"
	else return end
	
	if !zombie then return end
	if attacker:GetClass() == "npc_headcrab" and (GetConVar("headcrabplus_settings_enable_zombines"):GetInt() == 1) then
		if hcp_sabrean_zombine[model] and !hcp_sabrean_zombine[ply:GetClass()] then
			re_zombie = hcp_sabrean_zombine[model].zombie
			re_skin = hcp_sabrean_zombine[model].skin
			if hcp_prisonguard_check[model] == true and ply:GetSkin() == 1 then re_skin = 1 end
		end
		
		if !hcp_sabrean_zombine[model] and hcp_sabrean_zombine[ply:GetClass()] then
			re_zombie = hcp_sabrean_zombine[ply:GetClass()].zombie
			re_skin = hcp_sabrean_zombine[ply:GetClass()].skin
		end
	end
	
	local zombieEnt=ents.Create(re_zombie or zombie)
	zombieEnt:SetPos(pos)
	zombieEnt:SetSkin(re_skin or 100)
	zombieEnt:Spawn()
	zombieEnt:Activate()
	zombieEnt.IsHeadcrabPlus = true
	zombieEnt.OnRemove = function() end
	if zombieEnt:GetClass() == "npc_poisonzombie" then
		for k,v in pairs(zombieEnt:GetBodyGroups()) do
			if v.id == 1 then continue end
			zombieEnt:SetBodygroup(v.id, 0)
		end
		zombieEnt:SetKeyValue("crabcount", 0)
	end
	
	if attacker.OwningPly then 
		undo.Create("Zombified-Headcrab")
			undo.AddEntity(zombieEnt)
			undo.SetPlayer(attacker.OwningPly)
		undo.Finish()
		attacker.OwningPly:AddCleanup("npcs", zombieEnt)
		attacker.OwningPly:AddCount("npcs", zombieEnt)
	end
	
	if GetConVar("headcrabplus_settings_bonemerge"):GetInt() == 1 and !re_zombie then
	local boneMerge
	if zombie == "npc_poisonzombie" then boneMerge=ents.Create("headcrabplus_bonemerge_nores_p") else boneMerge=ents.Create("headcrabplus_bonemerge") end
	boneMerge:SetParent(zombieEnt)
	boneMerge:SetModel(model)
	boneMerge:Spawn()
	zombieEnt.boneMerge = boneMerge
	
	for k, v in pairs(ply:GetBodyGroups()) do
		boneMerge:SetBodygroup( v.id, ply:GetBodygroup(v.id))
	end
	
	boneMerge:SetSkin(ply:GetSkin())
	
	if zombie == "npc_poisonzombie" then
		for i=1,boneMerge:GetBoneCount() do
			boneMerge:ManipulateBoneScale(i, Vector(1.6,1.6,1.6))
		end
	end
	end
	
	if GetConVar("headcrabplus_settings_removeattacker"):GetInt() == 1 and attacker:GetClass() != "npc_poisonzombie" then attacker:Remove() end
	return false
end)

--Thanks to @MaxShadow for supplying the code snippet to stop zombies from splitting.
hook.Add("EntityTakeDamage","headcrabplus_zombie_nosplit",function(target, dmg)
	if (target:IsValid() and target.IsHeadcrabPlus and target.boneMerge and target.boneMerge:IsValid() and target:GetClass() == "npc_zombie" and dmg:GetDamage() >= target:GetMaxHealth()/2) and (dmg:IsDamageType(DMG_BLAST) or dmg:IsDamageType(DMG_CRUSH) or dmg:IsDamageType(DMG_SLASH)) then
		dmg:SetDamageType(DMG_GENERIC)
	end
end)