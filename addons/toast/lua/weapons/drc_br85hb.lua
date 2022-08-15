SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "BR85HB"
SWEP.WepSelectIcon	 	= "vgui/entities/drchalo_br"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Battle Rifle"
SWEP.InfoDescription	= "The BR85HB is a mid-long range combat rifle tested as far back as 2525.\nThe BR85HB was not widely adopted until after the human-Covenant war."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_br.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_br_dyn.vmt"
SWEP.CrosshairNoIronFade = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel = 		"models/vuthakral/halo/weapons/c_hum_br85hb.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_br85hb.mdl"
SWEP.VMPos 				= Vector(0, 0, -1.3)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.5, -1, 0)
SWEP.VMAngCrouch		= Vector(1, 1, 0)
SWEP.IronSightsPos 		= Vector(-3.52, -4, -1.55)
SWEP.IronSightsAng 		= Vector(0, 0.25, 1)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.SprintPos			= Vector(0, 0, 0)
SWEP.SprintAng			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 0.33

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 3.12
SWEP.Primary.SpreadDiv		= 82
SWEP.Primary.Kick			= 0.26
SWEP.Primary.RecoilUp		= 0.5
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 900
SWEP.Primary.ClipSize		= 36
SWEP.Primary.DefaultClip	= 36
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_pistol_bullet"
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.br55_h2a_fire")
SWEP.Primary.DistSound 		= Sound("drc.br55hb_fire_dist")
SWEP.Primary.SoundDistance 	= 1500

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = true
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 3

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
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/drc_halo_placeholder"
SWEP.Secondary.IronFOV		= 50

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halobr"}
}

SWEP.VElements = {
	["ammo_counter"] = { type = "Quad", bone = "b_gun", rel = "", pos = Vector(1.493, 0, 5.9), angle = Angle(0, -90, 45), size = 0.009, draw_func = nil},
	["ammo_counter_00"] = { type = "Quad", bone = "b_gun", rel = "", pos = Vector(1.493, 0, 5.9), angle = Angle(0, -90, 45), size = 0.009, draw_func = nil}
}

SWEP.WElements = {
	["ammo_counterW"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.8, 1.175, -5.77), angle = Angle(-1, 85, -125), size = 0.009, draw_func = nil}
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if CLIENT then
		self.VElements["ammo_counter"].draw_func = function( weapon )
			if self:Clip1() < 10 then
				draw.SimpleText("0".. self:Clip1() .."", "343_ammocounter", 0, 8.5, Color(18,18,18,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			else
				draw.SimpleText(self:Clip1(), "343_ammocounter", 0, 8.5, Color(18,18,18,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			end
		end
		
		self.VElements["ammo_counter_00"].draw_func = function( weapon )
			draw.SimpleTextOutlined("00", "343_ammocounter", 0, 8.5, Color(18,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 2, Color(115, 186, 214,150))
		end
		
		self.WElements["ammo_counterW"].draw_func = function( weapon )
			if self:Clip1() < 10 then
				draw.SimpleTextOutlined("0".. self:Clip1() .."", "343_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			else
				draw.SimpleTextOutlined(self:Clip1(), "343_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			end
		end
	end
end