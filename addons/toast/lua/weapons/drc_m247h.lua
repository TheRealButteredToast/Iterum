SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "physgun"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "M247H"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_repeater"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Machine gun"
SWEP.InfoDescription	= "UNFINISHED UNFINISHED UNFINISHED UNFINISHED UNFINISHED"

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_re.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_re_dyn.vmt"
SWEP.CrosshairSizeMul	= 1.5
SWEP.CrosshairNoIronFade = true

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 80
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_m247h.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_plasmarepeater.mdl"
SWEP.VMPos 				= Vector(-5, 0, 5)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(1, 0, -1)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.SprintPos 			= Vector(0, 0, 0)
SWEP.SprintAng 			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.InfAmmo				= false

SWEP.DisperseHeatPassively 	= true
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.LowerRPMWithHeat		= true
SWEP.OverheatHoldType		= "physgun"
SWEP.VentingHoldType		= "physgun"
SWEP.HPS					= 3.5
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 1
SWEP.OverheatStrength		= 2
SWEP.OverHeatFinishPercent	= 0.17
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 0.5

SWEP.OverheatSound			= Sound("")
SWEP.VentingSound			= Sound("drc.repeater_ventloop")
SWEP.VentingStartSound		= Sound("drc.repeater_ventopen")
SWEP.VentingStopSound		= Sound("drc.repeater_ventclose")

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 12
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.36
SWEP.Primary.RecoilUp		= 0.3
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 8
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 600
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_ar_bullet" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound 			= Sound("drc.repeater_fire")
SWEP.Primary.DistSound 		= Sound("drc.repeater_fire_dist")
SWEP.Primary.SoundDistance 	= 1500

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 2

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
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/draconic_scope"
SWEP.Secondary.IronFOV		= 90

SWEP.Thirdperson	= true

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}