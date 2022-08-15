CreateConVar("hcp_dmg_headcrab", 5, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_dmg_headcrab_fast", 5, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_dmg_zombie", 10, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_dmg_zombie_poison", 10, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_dmg_zombie_fast", 6, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_dmg_zombine", 10, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

//lua_run print(player.GetAll()[1]:GetEyeTrace().Entity:Health())
CreateConVar("hcp_health_headcrab", 10, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_health_headcrab_fast", 10, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_health_headcrab_poison", 35, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_health_zombie", 50, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_health_zombie_poison", 175, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_health_zombie_fast", 50, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
CreateConVar("hcp_health_zombine", 100, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

//lua_run print(player.GetAll()[1]:GetEyeTrace().Entity:GetClass())
hook.Add("EntityTakeDamage", "headcrabplus_damage_modifier", function(target, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker == nil then return end
	
	local class = attacker:GetClass()
	
	if class == "npc_headcrab" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_headcrab"):GetInt())
	end
	
	if class == "npc_headcrab_fast" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_headcrab_fast"):GetInt())
	end
	
	if class == "npc_zombie" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_zombie"):GetInt())
	end
	
	if class == "npc_poisonzombie" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_zombie_poison"):GetInt())
	end
	
	if class == "npc_fastzombie" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_zombie_fast"):GetInt())
	end
	
	if class == "npc_fastzombie" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_zombie_fast"):GetInt())
	end
	
	if class == "npc_zombine" then
		dmginfo:SetDamage(GetConVar("hcp_dmg_zombine"):GetInt())
	end
end)

hook.Add( "InitPostEntity", "headcrabplus_health_modifier_init", function()
	for k,ent in pairs(ents.GetAll()) do
		local class = ent:GetClass()
	
		timer.Simple(0.1, function()
		if !IsValid(ent) then return end
	
		if class == "npc_headcrab" then
		ent:SetHealth(GetConVar("hcp_health_headcrab"):GetInt())
		end
	
		if class == "npc_headcrab_fast" then
			ent:SetHealth(GetConVar("hcp_health_headcrab_fast"):GetInt())
		end
	
		if class == "npc_headcrab_black" then
			ent:SetHealth(GetConVar("hcp_health_headcrab_poison"):GetInt())
		end
	
		if class == "npc_fastzombie" then
			ent:SetHealth(GetConVar("hcp_health_zombie_fast"):GetInt())
		end
	
		if class == "npc_zombie" then
			ent:SetHealth(GetConVar("hcp_health_zombie"):GetInt())
		end
	
		if class == "npc_poisonzombie" then
			ent:SetHealth(GetConVar("hcp_health_zombie_poison"):GetInt())
		end
	
		if class == "npc_fastzombie" then
			ent:SetHealth(GetConVar("hcp_health_zombie_fast"):GetInt())
		end
		
		if class == "npc_zombine" then
			ent:SetHealth(GetConVar("hcp_health_zombine"):GetInt())
		end
		end)
	end

end )

hook.Add( "OnEntityCreated", "headcrabplus_health_modifier", function( ent )
	if !ent:IsNPC() then return end
	local class = ent:GetClass()
	
	timer.Simple(0.1, function()
	if !IsValid(ent) then return end
	
	if class == "npc_headcrab" then
		ent:SetHealth(GetConVar("hcp_health_headcrab"):GetInt())
	end
	
	if class == "npc_headcrab_fast" then
		ent:SetHealth(GetConVar("hcp_health_headcrab_fast"):GetInt())
	end
	
	if class == "npc_headcrab_black" then
		ent:SetHealth(GetConVar("hcp_health_headcrab_poison"):GetInt())
	end
	
	if class == "npc_fastzombie" then
		ent:SetHealth(GetConVar("hcp_health_zombie_fast"):GetInt())
	end
	
	if class == "npc_zombie" then
		ent:SetHealth(GetConVar("hcp_health_zombie"):GetInt())
	end
	
	if class == "npc_poisonzombie" then
		ent:SetHealth(GetConVar("hcp_health_zombie_poison"):GetInt())
	end
	
	if class == "npc_fastzombie" then
		ent:SetHealth(GetConVar("hcp_health_zombie_fast"):GetInt())
	end
	
	if class == "npc_zombine" then
			ent:SetHealth(GetConVar("hcp_health_zombine"):GetInt())
	end
	end)
end )