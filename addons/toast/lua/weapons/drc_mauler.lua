SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "revolver"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "T-52 Mauler"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_mauler"

SWEP.Manufacturer		= "Sacred Promissory"
SWEP.InfoName			= "Mauler"
SWEP.InfoDescription	= "A Jiralhanae weapon which houses several superheated metal bolts that fragment upon being fired."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_mau.vmt"
SWEP.CrosshairSizeMul	= 1

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_mauler.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_mauler.mdl"
SWEP.VMPos 				= Vector(0, -1, -2)
SWEP.VMAng 				= Vector(-1, 0, 0)
SWEP.VMPosCrouch		= Vector(0, -2, 0)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-5.075, -5, -0.75)
SWEP.IronSightsAng 		= Vector(1, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.Primary.NumShots 		= 15
SWEP.Primary.Spread			= 20
SWEP.Primary.SpreadDiv		= 110
SWEP.Primary.Kick			= 2.96
SWEP.Primary.RecoilUp		= 0.5
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 130
SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 1 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_pistol_bullet"
SWEP.Primary.ReloadHoldType	= "pistol"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.mauler_fire")
SWEP.Primary.DistSound 		= Sound("drc.mauler_fire_dist")
SWEP.Primary.SoundDistance 	= 1500

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 1

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
SWEP.Secondary.ScopeMat		= "overlays/drc_halo_m6d"
SWEP.Secondary.IronFOV		= 75

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halomauler"}
}