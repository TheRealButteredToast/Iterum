SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "physgun"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Aggressor Beam Minor"
SWEP.WepSelectIcon		= "vgui/entities/drchalo_sentinel"

SWEP.InfoName			= "Sentinel Beam"

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_sb.vmt"
SWEP.CrosshairSizeMul	= 50

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_sentinel.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_sentinel_minor.mdl"
SWEP.VMPos 				= Vector(0, 0, -3)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-6, -17.862, 3.94)
SWEP.IronSightsAng 		= Vector(-6.115, -6.5, 10)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1
SWEP.MoveMult = 0.25
SWEP.CMoveMult = 0.125

SWEP.HideImpacts		= true

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
SWEP.HPS					= 2
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 2
SWEP.OverheatStrength		= 1.925
SWEP.OverHeatFinishPercent	= 0.9
SWEP.VentingStrength		= 4
SWEP.BatteryConsumPerShot	= 0.3
SWEP.OverheatSound			= Sound("drc.sentinel_lockup")
SWEP.VentingSound			= Sound("drc.sentinel_overheated")
SWEP.VentingStartSound		= Sound("drc.sentinel_oh_in")
SWEP.VentingStopSound		= Sound("drc.sentinel_oh_out")

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 0.2
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.16
SWEP.Primary.KickHoriz		= 0.16
SWEP.Primary.RecoilUp		= 0.05
SWEP.Primary.RecoilDown		= 0.05
SWEP.Primary.RecoilHoriz	= 0.05
SWEP.Primary.Force			= 4
SWEP.Primary.Damage			= 2
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 1800
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_sentinel_beam_minor" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound = Sound("")
SWEP.Primary.LoopingFireSoundIn 	= Sound("drc.sentinel_firein")
SWEP.Primary.LoopingFireSound 	= Sound("drc.sentinel_fireloop")
SWEP.Primary.LoopingFireSoundOut 	= Sound("drc.sentinel_fireout")

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

SWEP.Secondary.Disabled		= true
SWEP.Secondary.Ironsights	= true
SWEP.Secondary.SightsSuppressAnim = false
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/drc_scope_focus"
SWEP.Secondary.IronFOV		= 90

SWEP.Primary.LightColor 		= Color(255, 30, 30)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 150
SWEP.Primary.LightDecayTime		= 1000

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halolaser"}
}