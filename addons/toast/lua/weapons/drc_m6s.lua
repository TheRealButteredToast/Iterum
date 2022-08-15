SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "revolver"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "M6C/SOCOM"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_m6s"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Automag"
SWEP.InfoDescription	= "Special-issue variant of the M6C most commonly distributed to ODSTs."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_m6.vmt"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 1
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_m6s.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_m6s.mdl"
SWEP.VMPos 				= Vector(0, 2, -1)
SWEP.VMAng 				= Vector(-1, 0, 0)
SWEP.VMPosCrouch		= Vector(0, -2, 0)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(3, -5, 1)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 6.5
SWEP.Primary.SpreadDiv		= 180
SWEP.Primary.Kick			= 0.36
SWEP.Primary.RecoilUp		= 0.1
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 5
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 19
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 360
SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.ReloadTimeEmpty= 1
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_pistol_bullet_sil"
SWEP.Primary.ReloadHoldType	= "pistol"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.m6s_fire")
SWEP.Primary.DistSound 		= Sound("")
SWEP.Primary.SoundDistance 	= 1500

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
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
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/br55hb/zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/br55hb/zoom_out.wav"
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_br"
SWEP.Secondary.ScopeBlur 	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 38
SWEP.Secondary.ScopeScale	= 0.65

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halomagnum"}
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_m6s.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_m6s.mdl"
		end
	end
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_m6s.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_m6s.mdl"
		end
	end
end