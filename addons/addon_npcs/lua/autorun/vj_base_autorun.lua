VJBASE_VERSION = "2.15.2"
VJBASE_GETNAME = "VJ Base"

-- Shared --
AddCSLuaFile("autorun/vj_menu_spawninfo.lua")
AddCSLuaFile("autorun/vj_base_autorun.lua")
AddCSLuaFile("autorun/vj_controls.lua")
AddCSLuaFile("autorun/vj_globals.lua")
AddCSLuaFile("autorun/vj_convars.lua")
AddCSLuaFile("autorun/vj_files.lua")
AddCSLuaFile("autorun/vj_files_language.lua")
AddCSLuaFile("autorun/vj_files_particles.lua")
AddCSLuaFile("autorun/vj_menu_main.lua")
AddCSLuaFile("autorun/vj_menu_properties.lua")

-- Client --
AddCSLuaFile("autorun/client/vj_menu_main_client.lua")
AddCSLuaFile("autorun/client/vj_menu_plugins.lua")
AddCSLuaFile("autorun/client/vj_menu_snpc.lua")
AddCSLuaFile("autorun/client/vj_menu_weapon.lua")

-- Modules --
AddCSLuaFile("includes/modules/ai_vj_schedule.lua")
AddCSLuaFile("includes/modules/ai_vj_task.lua")
//AddCSLuaFile("includes/modules/sound_vj_track.lua")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Main Hooks / Functions ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	hook.Add("AddToolMenuTabs", "VJ_CREATETOOLTAB", function()
		spawnmenu.AddToolTab("DrVrej", "DrVrej", "vj_base/icons/vrejgaming.png") // "icon16/plugin.png"
		spawnmenu.AddToolCategory("DrVrej", "Main Menu", "#vjbase.menu.tabs.mainmenu")
		spawnmenu.AddToolCategory("DrVrej", "SNPCs", "#vjbase.menu.tabs.settings.snpc")
		spawnmenu.AddToolCategory("DrVrej", "Weapons", "#vjbase.menu.tabs.settings.weapon")
		spawnmenu.AddToolCategory("DrVrej", "HUDs", "#vjbase.menu.tabs.settings.hud")
		spawnmenu.AddToolCategory("DrVrej", "Tools", "#vjbase.menu.tabs.tools")
		spawnmenu.AddToolCategory("DrVrej", "SNPC Configures", "#vjbase.menu.tabs.configures.snpc")
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Outdated GMod Version Check ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if SERVER && !isfunction(FindMetaTable("NPC").AutoMovement) then
	timer.Simple(1, function()
		if !VJBASE_GMOD_OUTDATED then
			VJBASE_GMOD_OUTDATED = true
			timer.Create("VJ_WARN_GModOutdated", 2, 0, function()
				PrintMessage(HUD_PRINTTALK, "--- Outdated version of Garry's Mod detected! ---")
				PrintMessage(HUD_PRINTTALK, "Opt out of the Chromium branch!")
			end)
		end
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ SLV Base Check ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (SLVBase) then
	timer.Simple(1, function()
		if !VJ_WARN_SLVBase then
			if CLIENT then
				chat.AddText(Color(255,100,0),"Confliction Detected!",
				Color(0,255,0)," VJ Base ",
				Color(0,200,200),"is being overridden by another addon!")
				chat.AddText(Color(0,200,200),"Incompatible Addons: http://steamcommunity.com/sharedfiles/filedetails/?id=1129493108")

				VJ_WARN_SLVBase = vgui.Create("DFrame")
				VJ_WARN_SLVBase:SetTitle("ERROR!")
				VJ_WARN_SLVBase:SetSize(790,560)
				VJ_WARN_SLVBase:SetPos((ScrW()-VJ_WARN_SLVBase:GetWide())/2, (ScrH()-VJ_WARN_SLVBase:GetTall())/2)
				VJ_WARN_SLVBase:MakePopup()
				VJ_WARN_SLVBase.Paint = function()
					draw.RoundedBox(8, 0, 0, VJ_WARN_SLVBase:GetWide(), VJ_WARN_SLVBase:GetTall(), Color(200,0,0,150))
				end

				local VJURL = vgui.Create("DHTML", VJ_WARN_SLVBase)
				VJURL:SetPos(VJ_WARN_SLVBase:GetWide()*0.005, VJ_WARN_SLVBase:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbaseconflict")
			elseif SERVER then
				timer.Create("VJ_WARN_SLVBase", 5, 0, function()
					print("VJ Base is being overridden by another addon! Incompatible Addons: http://steamcommunity.com/sharedfiles/filedetails/?id=1129493108")
				end)
			end
		end
	end)
end

if CLIENT then print("NB Offline") else print("NB Online") end