SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "rpg"
SWEP.CrouchHoldType		= "rpg"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "SPNKr Rocket Launcher"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_spnkr"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Rocket Launcher"
SWEP.InfoDescription	= "The M41 SSR is a weapon as old as it is powerful.\n So effective on the battlefield that when the M57 came, the M41 was not replaced."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_rl.vmt"
SWEP.CrosshairSizeMul	= 1500

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 4
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 54
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_spnkr.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_spnkr.mdl"
SWEP.VMPos				= Vector(0, 1, 0)
SWEP.VMAng 				= Vector(0, 0, -1)
SWEP.VMPosCrouch		= Vector(0, -4, 1.4)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(0, 0, 0)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.SprintPos			= Vector(0, 0, 0)
SWEP.SprintAng			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = true
SWEP.SS = 0.8
SWEP.BS = 0.3

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 1
SWEP.FireModes_SwitchSound = Sound("Weapon_AR2.Empty")

SWEP.MagazineEntity	= "drc_mag_spnkr"

SWEP.LoadAfterShot 			= false
SWEP.LoadAfterReloadEmpty	= false
SWEP.ManualReload			= false
SWEP.Primary.NumShots 		= 1
SWEP.Primary.IronRecoilMul	= 0.5
SWEP.Primary.Spread			= 1
SWEP.Primary.SpreadDiv		= 10000
SWEP.Primary.Kick			= 7.2
SWEP.Primary.RecoilUp		= 2
SWEP.Primary.RecoilDown		= 2
SWEP.Primary.RecoilHoriz	= 15
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 6
SWEP.Primary.Ammo			= "RPG_Round"
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 60
SWEP.Primary.ClipSize		= 2
SWEP.Primary.DefaultClip	= 2
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 1 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "rpg"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.SPNKr_fire")
SWEP.Primary.DistSound 		= Sound("drc.SPNKr_fire_dist")
SWEP.Primary.SoundDistance 	= 1500
SWEP.Primary.Projectile			 = "drc_spnkr_rocket"
SWEP.Primary.ProjSpeed			 = 2000
SWEP.Primary.ProjInheritVelocity = false

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

SWEP.Secondary.Ironsights	= true
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/spnkr/zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/spnkr/zoom_out.wav"
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_launcher"
SWEP.Secondary.ScopeBlur 	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 50
SWEP.Secondary.ScopeScale	= 0.71