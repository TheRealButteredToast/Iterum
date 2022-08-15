SWEP.Base			= "draconic_gun_base"
SWEP.Gun			= "drc_dmr"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "M392 DMR"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_dmr"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "DMR"
SWEP.InfoDescription	= "Having been adopted in 2512, the M392 is a marksman rifle in use by all branches of the UNSC."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_br.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_br.vmt"
SWEP.CrosshairSizeMul	= 1.5

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_dmr.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_dmr.mdl"
SWEP.VMPos 				= Vector(0, 0, -1)
SWEP.VMAng 				= Vector(0, 1, 0)
SWEP.VMPosCrouch		= Vector(-0.2, -1, 0)
SWEP.VMAngCrouch		= Vector(-1, -0.5, 0)
SWEP.IronSightsPos 		= Vector(0, -3, -4)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.SprintPos			= Vector(0, 0, 0)
SWEP.SprintAng			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 0.33

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 0

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 1.62
SWEP.Primary.SpreadDiv		= 90
SWEP.Primary.Kick			= 0.36
SWEP.Primary.RecoilUp		= 0.5
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 26
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 180
SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 15
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_ar_bullet"
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.dmr_fire")
SWEP.Primary.DistSound 		= Sound("drc.dmr_fire_dist")
SWEP.Primary.SoundDistance 	= 1500

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
SWEP.Secondary.IronFOV		= 50
SWEP.Secondary.ScopeScale	= 0.65

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_haloar"}
}

SWEP.VElements = {
	["ammo_counter"] = { type = "Quad", bone = "b_gun", rel = "", pos = Vector(1.651, 0, 5.95), angle = Angle(0, -90, 90), size = 0.0032, draw_func = nil}
}

SWEP.WElements = {
	["ammo_counterW"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.04, 1.18, -5.4), angle = Angle(0, 90, -78.5), size = 0.0032, draw_func = nil}
}

function SWEP:DrawCustom2DScopeElements()
	local w = ScrW()
	local h = ScrH()
	
	local ratio = w/h
	
	local ss = 4 * self.Secondary.ScopeScale
	local sw = self.Secondary.ScopeWidth
	local sh = self.Secondary.ScopeHeight
	
	local wi = w / 10 * ss
	local hi = h / 10 * ss
	
	surface.SetDrawColor(Color(0, 0, 0, 255))
	surface.SetMaterial(Material("models/vuthakral/halo/HUD/scope_elements/br_e1"))
	surface.DrawTexturedRectUV( wi * 1.4, h/2 * 1.1, hi * sw, hi / 2, 0, 0, 1, 1 )
	
	surface.SetMaterial(Material("models/vuthakral/halo/HUD/scope_elements/br_e2"))
	surface.DrawTexturedRectUV( w/2 - hi / 2 * 1.65, h/2 - (hi / 2 * 0.2), hi * sw, hi / 2 * 0.4, 0, 0, 1, 1 )
	surface.DrawTexturedRectUV( w/2 - hi / 6, h/2 - (hi / 2 * 0.2), hi * sw, hi / 2 * 0.4, 1, 0, 0, 1 )
	
	surface.SetMaterial(Material("models/vuthakral/halo/HUD/scope_elements/br_e3"))
	surface.DrawTexturedRectUV( w/2 - hi / 16, hi * 1.775, wi / 14, hi, 0, 1, 1, 0 )
	surface.DrawTexturedRectUV( w/2 - hi / 17, hi * 1.1, wi / 14, hi, 1, 0, 0, 1 )
end

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if CLIENT then
		self.VElements["ammo_counter"].draw_func = function( weapon )
			if self:Clip1() < 10 then
				draw.SimpleTextOutlined("0 ".. self:Clip1() .."", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			else
				draw.SimpleTextOutlined(self:Clip1(), "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			end
		end
		
		self.WElements["ammo_counterW"].draw_func = function( weapon )
			if self:Clip1() < 10 then
				draw.SimpleTextOutlined("0".. self:Clip1() .."", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			else
				draw.SimpleTextOutlined(self:Clip1(), "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			end
		end
	end
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/v_m7_h3.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_dmr.mdl"
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
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_dmr.mdl"
		end
	end
end