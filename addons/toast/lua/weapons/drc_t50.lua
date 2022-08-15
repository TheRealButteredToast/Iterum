SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-50 DER/H"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_concussion"

SWEP.Manufacturer		= "Merchants of Qikost"
SWEP.InfoName			= "Concussion Rifle"
SWEP.InfoDescription	= "Sangheili-made plasmic grenade launcher which predates the Writ of Union."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_cr.vmt"
SWEP.CrosshairSizeMul	= 1
SWEP.CrosshairCorrectY	= 0

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.MagazineEntity	= "drc_mag_crifle"

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_concussionrifle.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_crifle.mdl"
SWEP.VMPos 				= Vector(-0.3, 0, -1.5)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(1.3, -2, -1)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-8.75, -2, -2)
SWEP.IronSightsAng 		= Vector(1.5, 0, 1)
SWEP.SprintPos 			= Vector(0, 0, 0)
SWEP.SprintAng 			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 0.25

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 0

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 6
SWEP.Primary.SpreadDiv		= 60
SWEP.Primary.Kick			= 0.86
SWEP.Primary.RecoilUp		= 0.5
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 12
SWEP.Primary.Ammo			= "Grenade"
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 200
SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "ar2"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.concussion_fire")
SWEP.Primary.DistSound 		= Sound("drc.concussion_fire_dist")
SWEP.Primary.Projectile		= "drc_t50_plasma"
SWEP.Primary.ProjInheritVelocity = true
SWEP.Primary.ProjSpeed		= 1500

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 0

SWEP.Primary.CanMelee		= true
SWEP.Primary.MeleeSwingSound	= Sound( "" )
SWEP.Primary.MeleeHitSoundWorld = Sound( "weapon.ImpactHard" )
SWEP.Primary.MeleeHitSoundFlesh = Sound( "flesh.ImpactHard" )
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
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/draconic_scope"
SWEP.Secondary.IronFOV		= 90

SWEP.NPCBurstShots = 1