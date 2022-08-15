SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-57B Carbine"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_t57b"

SWEP.Manufacturer		= "???"
SWEP.InfoName			= "Carbine"
SWEP.InfoDescription	= "One of the newest nonhuman rifles on the battlefield.\n Not much is yet known about this weapon."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_cb.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_cb_dyn.vmt"
SWEP.CrosshairSizeMul	= 3
SWEP.CrosshairNoIronFade = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_carbine_h5.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_t57b.mdl"
SWEP.VMPos 				= Vector(0, 0, -1)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(-0.2, -1, 0)
SWEP.VMAngCrouch		= Vector(-1, -0.5, 0)
SWEP.IronSightsPos 		= Vector(-4.1, 0, -2.34)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

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
SWEP.Primary.Damage			= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 300
SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_carbine_rod_h5"
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.carbine_click")
SWEP.Primary.Sound 			= Sound("drc.t57b_fire")
SWEP.Primary.DistSound 		= Sound("drc.t51c_fire_dist")
SWEP.Primary.SoundDistance 	= 1500

SWEP.Primary.CanMelee		= true
SWEP.Primary.MeleeSwingSound	= Sound( "" )
SWEP.Primary.MeleeHitSoundWorld = Sound( "" )
SWEP.Primary.MeleeHitSoundFlesh = Sound( "" )
SWEP.Primary.MeleeHitSoundEnt 	= Sound( "" )
SWEP.Primary.MeleeImpactDecal 	= ""
SWEP.Primary.MeleeDamage		= 12
SWEP.Primary.MeleeDamageType	= DMG_CLUB
SWEP.Primary.MeleeRange			= 16.5
SWEP.Primary.MeleeForce			= 5
SWEP.Primary.MeleeDelayMiss		= 0.9
SWEP.Primary.MeleeDelayHit 		= 0.9
SWEP.Primary.CanAttackCrouched = false
SWEP.Primary.MeleeMissActivity	= ACT_VM_HITCENTER 

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 0

SWEP.Primary.CanMelee			= true
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
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/t51c/carbine_zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/t51c/carbine_zoom_out.wav"
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/drc_halo_placeholder"
SWEP.Secondary.IronFOV		= 60


SWEP.Primary.LightColor 		= Color(30, 200, 200)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 100
SWEP.Primary.LightDecayTime		= 1000

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halocarbine"}
}

function SWEP:DoCustomThink()
	local ply = self:GetOwner()
	
	if not ply:IsPlayer() then return end
	local vm = ply:GetViewModel()
	
	
	if self.SightsDown == true then
		vm:SetBodygroup(1, 1)
	else
		vm:SetBodygroup(1, 0)
	end
end

function SWEP:DoCustomReloadStartEvents()
	local ply = self:GetOwner()

	if not CLIENT then return end
	local ed = EffectData()
			
	if LocalPlayer() == ply then
		local vm = LocalPlayer():GetViewModel()
		timer.Simple(0.17, function()
			local attachment = vm:LookupAttachment("eject")
			local attdata = vm:GetAttachment(attachment)
			ed:SetAttachment(attachment)
			ed:SetOrigin(attdata.Pos)
			util.Effect("drc_halo_carbine_eject_h5", ed)
		end)
	else
		timer.Simple(0.17, function()
			local attachment = self:LookupAttachment("eject")
			local attdata = self:GetAttachment(attachment)
			ed:SetAttachment(attachment)
			ed:SetOrigin(attdata.Pos)
			util.Effect("drc_halo_carbine_eject_h5", ed)
		end)
	end
end