SWEP.Base			= "draconic_gun_base"
SWEP.Gun			= "drc_br55hb"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "BR55HB"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_br"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Battle Rifle"
SWEP.InfoDescription	= "Issued in 2548, the BR55HB is a select-fire mid-long range marksman rifle."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_br.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_br_dyn.vmt"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel = 		"models/vuthakral/halo/weapons/c_hum_br55hb.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_br55hb.mdl"
SWEP.VMPos 				= Vector(-0.2, 0.5, -1.3)
SWEP.VMAng 				= Vector(0, 1.5, 0)
SWEP.VMPosCrouch		= Vector(0.5, -1, 0)
SWEP.VMAngCrouch		= Vector(1, 1, 0)
SWEP.IronSightsPos 		= Vector(-1.76, -20.76, -1.1)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.SprintPos			= Vector(0, 0, 0)
SWEP.SprintAng			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 0.33

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 3
SWEP.Primary.SpreadDiv		= 82
SWEP.Primary.Kick			= 0.36
SWEP.Primary.RecoilUp		= 0.2
SWEP.Primary.RecoilDown		= 0.1
SWEP.Primary.RecoilHoriz	= 5
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
SWEP.Primary.Sound 			= Sound("drc.br55hb_fire")
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
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_br"
SWEP.Secondary.ScopeBlur	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 50
SWEP.Secondary.ScopeScale	= 0.65

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halobr"}
}

SWEP.VElements = {
	["ammo_counter"] = { type = "Quad", bone = "b_gun", rel = "", pos = Vector(1.493, 0, 6.379), angle = Angle(0, -90, 63.881), size = 0.009, draw_func = nil}
}

SWEP.WElements = {
	["ammo_counterW"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.52, 0.74, -5.27), angle = Angle(0, 90, -107.5), size = 0.009, draw_func = nil}
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
				draw.SimpleText("0".. self:Clip1() .."", "h3_ammocounter", 0, 8.5, Color(38,187,200,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(115, 186, 214))
			else
				draw.SimpleText(self:Clip1(), "h3_ammocounter", 0, 8.5, Color(38,187,200,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(115, 186, 214,150))
			end
		end
		
		self.WElements["ammo_counterW"].draw_func = function( weapon )
			local ammo = self.Weapon:GetNWInt("LoadedAmmo")
			if ammo < 10 then
				draw.SimpleTextOutlined("0".. ammo .."", "h3_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			else
				draw.SimpleTextOutlined(ammo, "h3_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			end
		end
	end
end