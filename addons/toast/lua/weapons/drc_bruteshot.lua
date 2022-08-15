SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "physgun"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-25 GL"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_bruteshot"

SWEP.Manufacturer		= "Sacred Promissory"
SWEP.InfoName			= "Brute Shot"
SWEP.InfoDescription	= "The T-25 GL is a Jiralhanae grenade launcher that was first encountered in 2531.\n Adorned with a sadistic blade, these weapons have seen use mostly among higher-ranking individuals."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= false
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_bs.vmt"
SWEP.CrosshairSizeMul	= 1000
SWEP.CrosshairCorrectY	= -1

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_bruteshot.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_bruteshot.mdl"
SWEP.VMPos 				= Vector(0, -4, -2)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(1.3, -2, -1)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(0, -4, 0)
SWEP.IronSightsAng 		= Vector(-3, 0, 3)
SWEP.DoesPassiveSprint = true
SWEP.SS = 1
SWEP.BS = 1

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 0

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 0.1
SWEP.Primary.SpreadDiv		= 1000
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
SWEP.Primary.ReloadHoldType	= "physgun"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.bruteshot_fire")
SWEP.Primary.DistSound 		= Sound("drc.bruteshot_fire_dist")
SWEP.Primary.Projectile		= "drc_bruteshot_grenade"
SWEP.Primary.ProjInheritVelocity = false
SWEP.Primary.ProjSpeed		= 2250

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

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/v_m7_h3.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_bruteshot.mdl"
		end
	end
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/v_m7_h3.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_bruteshot.mdl"
		end
	end
end