SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-52 SAR"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_focus"

SWEP.Manufacturer		= "Assembly Forges"
SWEP.InfoName			= "Focus Rifle"
SWEP.InfoDescription	= "The T-52 SAR is a weapon seldom seen by human forces, and is\n a long-range suppression weapon used by Covenant snipers."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_nr.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_pr.vmt"
SWEP.CrosshairSizeMul	= 25

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_focusrifle.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_focusrifle.mdl"
SWEP.VMPos 				= Vector(0, -3, -1.3)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-5, -9.7, -2)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.SprintPos 			= Vector(0, 0, 0)
SWEP.SprintAng 			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = true
SWEP.SS = 1
SWEP.BS = 1
SWEP.MoveMult = 0.25
SWEP.CMoveMult = 0.125

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 0

SWEP.BatteryToVec = Vector(255, 10, 0)
SWEP.BatteryFromVec = Vector(255, 255, 255)
SWEP.BatteryToVec2 = Vector(50, 200, 255)
SWEP.BatteryFromVec2 = Vector(0, 0, 0)

SWEP.DisperseHeatPassively = true
SWEP.LowerRPMWithHeat		= false
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.OverheatHoldType		= "knife"
SWEP.VentingHoldType		= "slam"
SWEP.HPS					= 5
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 1.7
SWEP.OverheatStrength		= 1.5
SWEP.OverHeatFinishPercent	= 0.7
SWEP.VentingStrength		= 4
SWEP.BatteryConsumPerShot	= 0.25
SWEP.OverheatSound			= Sound("drc.focusrifle_lockup")
SWEP.VentingSound			= Sound("drc.focusrifle_overheated")
SWEP.VentingStartSound		= Sound("drc.focusrifle_oh_in")
SWEP.VentingStopSound		= Sound("drc.focusrifle_oh_out")

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 0.2
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.36
SWEP.Primary.RecoilUp		= 0.3
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 4
SWEP.Primary.Damage			= 10
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 600
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_focus_beam" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound = Sound("")
SWEP.Primary.LoopingFireSoundIn 	= Sound("drc.focusrifle_firein")
SWEP.Primary.LoopingFireSound 	= Sound("drc.focusrifle_fireloop")
SWEP.Primary.LoopingFireSoundOut 	= Sound("drc.focusrifle_fireout")

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 0

SWEP.Primary.CanMelee		= true
SWEP.Primary.MeleeSwingSound	= Sound( "" )
SWEP.Primary.MeleeHitSoundWorld = Sound( "weapon.ImpactSoft" )
SWEP.Primary.MeleeHitSoundFlesh = Sound( "flesh.ImpactSoft" )
SWEP.Primary.MeleeHitSoundEnt 	= Sound( "weapon.ImpactHard" )
SWEP.Primary.MeleeImpactDecal 	= ""
SWEP.Primary.MeleeDamage		= 25
SWEP.Primary.MeleeDamageType	= DMG_CLUB
SWEP.Primary.MeleeRange			= 16.5
SWEP.Primary.MeleeForce			= 13
SWEP.Primary.MeleeDelayMiss		= 1
SWEP.Primary.MeleeDelayHit 		= 1
SWEP.Primary.MeleeMissActivity	= ACT_VM_HITCENTER 

SWEP.Secondary.Ironsights	= true
SWEP.Secondary.SightsSuppressAnim = true
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/t51c/carbine_zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/t51c/carbine_zoom_out.wav"
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_beamrifle"
SWEP.Secondary.ScopeBlur 	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 20
SWEP.Secondary.ScopeScale	= 0.8
SWEP.Secondary.ScopeWidth	= 2
SWEP.Secondary.ScopeHeight	= 1

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_haloplasma"}
}