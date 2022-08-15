SCHEMA.name = "Iterum"
SCHEMA.author = "Toast"
SCHEMA.desc = "From the Ash"
SCHEMA.uniqueID = "iterum" 	-- Schema will be a unique identifier stored in the database.
							-- Using a uniqueID will allow for renaming the schema folder.

nut.vote = nut.vote or {}
nut.vote.list = nut.vote.list or {}

nut.util.includeDir("languages")
nut.util.includeDir("derma")
nut.util.includeDir("libs")
nut.util.includeDir("meta")
nut.util.includeDir("hooks")
nut.util.include("sh_config.lua")
nut.util.include("sh_configs.lua")
nut.util.include("sh_commands.lua")
nut.util.include("sv_database.lua")
nut.util.include("sv_schema.lua")

--Flags 
nut.flag.add("Q","Human Explosive Weapons.")
nut.flag.add("q","Covenant Explosive Weapons")
nut.flag.add("S", "Ability to speak Sangheili.")
nut.flag.add("K", "Ability to speak Kig-Yar.")
nut.flag.add("U", "Ability to speak Unggoy.")
nut.flag.add("N","UNSC")
nut.flag.add("O","ODST")
nut.flag.add("s","Spartan")
nut.flag.add("V","Covenant")
nut.flag.add("v","Rangers")
nut.flag.add("B","Police")
nut.flag.add("b","Militia")
nut.flag.add("A","Admin")
nut.flag.add("J","Saw")
nut.flag.add("j","Plasma Repeater")
nut.flag.add("L","Sniper")
nut.flag.add("l","Beamrifle")
nut.flag.add("M","Shotgun")
nut.flag.add("m","Covenant Melee Weapons")
nut.flag.add("H","Human Weapons")
nut.flag.add("h","Covenant Weapons")
nut.flag.add("u","Medical Equipment")
nut.flag.add("a","Mayor")

SCHEMA.laws = {
	"Money Printers are Illegal",
	"Stealing is Illegal",
	"Murder is Illegal",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
}

do
	local playerMeta = FindMetaTable("Player") 
	function playerMeta:getDigits()
		
			local name = self:Name():reverse()
			local digits = name:match("(%d+)")

			if (digits) then
				return tostring(digits):reverse()
			end
		

		return "UNKNOWN"
	end
end

-- Sounds for death, damage received, and radio beeps
for k, v in pairs(SCHEMA.beepSounds) do
	for k2, v2 in ipairs(v.on) do
		util.PrecacheSound(v2)
	end

	for k2, v2 in ipairs(v.off) do
		util.PrecacheSound(v2)
	end
end

for k, v in pairs(SCHEMA.deathSounds) do 
	for k2, v2 in ipairs(v) do
		util.PrecacheSound(v2)
	end
end

for k, v in pairs(SCHEMA.painSounds) do
	for k2, v2 in ipairs(v) do
		util.PrecacheSound(v2)
	end
end
-- End of sounds 
nut.anim.setModelClass("models/vuthakral/halo/custom/usp/sangheili_universal_player.mdl", "player")
nut.anim.setModelClass("models/vuthakral/halo/custom/usp/sangheili_universal_player_flood.mdl", "player")
nut.anim.setModelClass("models/valk/haloreach/covenant/characters/brute/brute.mdl", "player")
nut.anim.setModelClass("models/valk/haloreach/covenant/characters/grunt/grunt_player.mdl","player")
nut.anim.setModelClass("models/drem/cch/female_01.mdl","player")
nut.anim.setModelClass("models/drem/cch/female_02.mdl","player")
nut.anim.setModelClass("models/drem/cch/female_03.mdl","player")
nut.anim.setModelClass("models/drem/cch/female_04.mdl","player")
nut.anim.setModelClass("models/drem/cch/female_06.mdl","player")
nut.anim.setModelClass("models/drem/cch/female_07.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_01.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_02.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_03.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_04.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_05.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_06.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_07.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_08.mdl","player")
nut.anim.setModelClass("models/drem/cch/male_09.mdl","player")

if (SERVER) then
	if timer.Exists("CheckHookTimes") then
		timer.Remove("CheckHookTimes")
	end
end

hook.Add("Initialize", "CITYRP_LAG_FIXER", function()
	hook.Remove("PlayerTick", "TickWidgets")
	hook.Remove( "PostGameSaved", "OnCreationsSaved" )
	hook.Remove( "PopulateVehicles", "AddEntityContent" )
	hook.Remove( "PopulatePostProcess", "AddPostProcess" )
	hook.Remove( "PopulateNPCs", "AddNPCContent" )
	hook.Remove( "DupeSaveAvailable", "UpdateDupeSpawnmenuAvailable")
	hook.Remove( "DupeSaveUnavailable", "UpdateDupeSpawnmenuUnavailable")
	hook.Remove( "DupeSaved", "DuplicationSavedSpawnMenu")
	hook.Remove( "LoadGModSave", "LoadGModSave")
	hook.Remove("RenderScreenspaceEffects", "RenderColorModify")
	hook.Remove("RenderScreenspaceEffects", "RenderBloom")
	hook.Remove("RenderScreenspaceEffects", "RenderToyTown")
	hook.Remove("RenderScreenspaceEffects", "RenderTexturize")
	hook.Remove("RenderScreenspaceEffects", "RenderSunbeams")
	hook.Remove("RenderScreenspaceEffects", "RenderSobel")
	hook.Remove("RenderScreenspaceEffects", "RenderSharpen")
	hook.Remove("RenderScreenspaceEffects", "RenderMaterialOverlay")
	hook.Remove("RenderScreenspaceEffects", "RenderMotionBlur")
	hook.Remove("RenderScene", "RenderStereoscopy")
	hook.Remove("RenderScene", "RenderSuperDoF")
	hook.Remove("GUIMousePressed", "SuperDOFMouseDown")
	hook.Remove("GUIMouseReleased", "SuperDOFMouseUp")
	hook.Remove("PreventScreenClicks", "SuperDOFPreventClicks")
	hook.Remove("PostRender", "RenderFrameBlend")
	hook.Remove("PreRender", "PreRenderFrameBlend")
	hook.Remove("Think", "DOFThink")
	hook.Remove("RenderScreenspaceEffects", "RenderBokeh")
	hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
	hook.Remove("PostDrawEffects", "RenderWidgets")
	hook.Remove("PostDrawEffects", "RenderHalos")
end)