SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-50 SRS"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_beamrifle"

SWEP.Manufacturer		= "Assembly Forges"
SWEP.InfoName			= "Beam Rifle"
SWEP.InfoDescription	= "Covenant sniper rifle with a very light footprint."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_bm.vmt"
SWEP.CrosshairSizeMul	= 50

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
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_t50srs.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_t50srs.mdl"
SWEP.VMPos 				= Vector(0, 1, -3)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(0, 0, 0)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.IronSightViewAng	= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.DoesPassiveSprint = true
SWEP.SS = 1
SWEP.BS = 1

SWEP.DisperseHeatPassively = true
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.LowerRPMWithHeat		= false
SWEP.OverheatHoldType		= "knife"
SWEP.VentingHoldType		= "slam"
SWEP.HPS					= 40
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 1.25
SWEP.OverheatStrength		= 4
SWEP.OverHeatFinishPercent	= 0.7
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 10

SWEP.BatteryToVec2 = Vector(255, 20, 20)
SWEP.BatteryFromVec2 = Vector(20, 150, 255)

SWEP.OverheatSound			= Sound("drc.T50SRS_lockup")
SWEP.VentingSound			= Sound("drc.T50SRS_oh_loop")
SWEP.VentingStartSound		= Sound("")
SWEP.VentingStopSound		= Sound("drc.T50SRS_oh_out")

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 0.1
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.4
SWEP.Primary.KickHoriz		= 0.1
SWEP.Primary.RecoilUp		= 0.1
SWEP.Primary.RecoilDown		= 0.1
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 4
SWEP.Primary.Damage			= 95
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 200
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_t50srs_beam" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.SRS50_Click")
SWEP.Primary.Sound 			= Sound("drc.srs50_fire")
SWEP.Primary.DistSound 		= Sound("drc.srs50_fire_dist")
SWEP.Primary.SoundDistance 	= 1500

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
SWEP.Primary.MeleeHitDelay		= 0.2

SWEP.Secondary.Ironsights	= true
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/t51c/carbine_zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/t51c/carbine_zoom_out.wav"
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_beamrifle"
SWEP.Secondary.ScopeBlur 	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 10
SWEP.Secondary.ScopeScale	= 0.8
SWEP.Secondary.ScopeWidth	= 2
SWEP.Secondary.ScopeHeight	= 1

SWEP.Primary.LightColor 		= Color(150, 40, 200)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 150
SWEP.Primary.LightDecayTime		= 1000

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_haloplasma"}
}

function SWEP:DoCustomPrimaryAttackEvents()
	self:EmitSound("drc.SRS50_Rotate")
end