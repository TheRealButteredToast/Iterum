SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "pistol"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-33 GML"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_needler"

SWEP.Manufacturer		= "Sacred Promissory"
SWEP.InfoName			= "Needler"
SWEP.InfoDescription	= "The T-33 GML is a Covenant weapon which hurls razor-sharp crystals at a target which\n detonate shortly after impact.."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_ne.vmt"
SWEP.CrosshairSizeMul	= 3
SWEP.CrosshairNoIronFade = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_needler.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_needler.mdl"
SWEP.VMPos 				= Vector(0, 2, -1)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-6.5, 2, -2)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 6
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.21
SWEP.Primary.RecoilUp		= 0.15
SWEP.Primary.RecoilDown		= 0.05
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 20
SWEP.Primary.Ammo			= "AR2"
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 510
SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "ar2"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.needler_fire")
SWEP.Primary.SoundDistance 	= 1500
SWEP.Primary.Projectile		= "drc_needler_needle"

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
SWEP.Secondary.IronFOV		= 80

SWEP.Primary.LightColor 		= Color(255, 2, 255)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 150
SWEP.Primary.LightDecayTime		= 1000

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_needler.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_needler.mdl"
		end
	end
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_needler.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_needler.mdl"
		end
	end
end

function SWEP:DoCustomReloadEndEvents()
	if !game.IsDedicated() && self:IsValid() then self:EmitSound("drc.Needler_reload_end") end
end