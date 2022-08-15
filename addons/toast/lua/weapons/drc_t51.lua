SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-51 Carbine"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_carbine"

SWEP.Manufacturer		= "Iruiru Armory"
SWEP.InfoName			= "Carbine"
SWEP.InfoDescription	= "Sangheili-made marksman rifle which fires irradiated rods which melt into their impacted target."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_cb.vmt"
SWEP.CrosshairDynamic	= "models/vuthakral/halo/HUD/reticles/ret_cb_dyn.vmt"
SWEP.CrosshairSizeMul	= 3

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 60
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_carbine_h3.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_t51c.mdl"
SWEP.VMPos 				= Vector(0, 0, -1)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(-0.2, -1, 0)
SWEP.VMAngCrouch		= Vector(-1, -0.5, 0)
SWEP.IronSightsPos 		= Vector(0, -3, -4)
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
SWEP.Primary.Damage			= 24
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 250
SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 18
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_carbine_rod"
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.carbine_click")
SWEP.Primary.Sound 			= Sound("drc.t51_fire")
SWEP.Primary.DistSound 		= Sound("drc.t51_fire_dist")
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
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_carbine"
SWEP.Secondary.ScopeBlur 	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 50
SWEP.Secondary.ScopeScale	= 0.75
SWEP.Secondary.ScopeWidth	= 1.5
SWEP.Secondary.ScopeHeight	= 1

SWEP.Primary.LightColor 		= Color(30, 255, 30)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 100
SWEP.Primary.LightDecayTime		= 1000

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halocarbine"}
}

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
			util.Effect("drc_halo_carbine_eject", ed)
		end)
	else
		timer.Simple(0.17, function()
			local attachment = self:LookupAttachment("eject")
			local attdata = self:GetAttachment(attachment)
			ed:SetAttachment(attachment)
			ed:SetOrigin(attdata.Pos)
			util.Effect("drc_halo_carbine_eject", ed)
		end)
	end
end