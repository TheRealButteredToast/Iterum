SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Ma5B"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_ma5c"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Assault Rifle"
SWEP.InfoDescription	= "Adopted as a standard weapon in 2525, the Ma5B ICWS is an automatic\n rifle employed by the UNSC Marine Corps."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_smg.vmt"
SWEP.CrosshairSizeMul	= 1.3

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel = 		"models/vuthakral/halo/weapons/c_hum_ma5b.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_ma5b.mdl"
SWEP.VMPos 				= Vector(0, 0, 0)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.5, -1, 0)
SWEP.VMAngCrouch		= Vector(0, 1, 0)
SWEP.IronSightsPos 		= Vector(-3.75, 0, -0.2)
SWEP.IronSightsAng 		= Vector(2.5, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 6
SWEP.Primary.SpreadDiv		= 60
SWEP.Primary.Kick			= 0.36
SWEP.Primary.KickHoriz		= 0.1
SWEP.Primary.RecoilUp		= 0.04
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 7
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 900
SWEP.Primary.ClipSize		= 60
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_ar_bullet" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "ar2"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.ma5b_fire")
SWEP.Primary.DistSound 		= Sound("drc.ma5c_fire_dist")
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

SWEP.Secondary.Disabled		= true
SWEP.Secondary.Ironsights	= true
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/draconic_scope"
SWEP.Secondary.IronFOV		= 90

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_haloar"}
}

SWEP.VElements = {
	["ammo_counterV"] = { type = "Quad", bone = "frame gun", rel = "", pos = Vector(4.69, 0, 6.96), angle = Angle(0, -90, 72.402), size = 0.01, draw_func = nil}
}

SWEP.WElements = {
	["ammo_counterW"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.925, 0.9, -6.7), angle = Angle(0, 90, -100), size = 0.01, draw_func = nil}
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if CLIENT then
		self.VElements["ammo_counterV"].draw_func = function( weapon )
			if self:Clip1() < 10 then
				draw.SimpleTextOutlined("0".. self:Clip1() .."", "ce_ammocounter", 0, 28.5, Color(38,86,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(115, 186, 214))
			else
				draw.SimpleTextOutlined(self:Clip1(), "ce_ammocounter", 0, 28.5, Color(38,87,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(115, 186, 214,150))
			end
		end
		
		self.WElements["ammo_counterW"].draw_func = function( weapon )
		local ammo = self.Weapon:GetNWInt("LoadedAmmo")
			if ammo < 10 then
				draw.SimpleTextOutlined("0".. ammo .."", "ce_ammocounter", 0, 28.5, Color(38,86,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(115, 186, 214))
			else
				draw.SimpleTextOutlined(ammo, "ce_ammocounter", 0, 28.5, Color(38,87,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(115, 186, 214,150))
			end
		end
	end
end
