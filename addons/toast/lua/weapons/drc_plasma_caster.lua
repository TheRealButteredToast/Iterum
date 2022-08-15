SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-53 PBL"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_pp"

SWEP.Manufacturer		= "Merchants of Qikost"
SWEP.InfoName			= "Plasma Caster"
SWEP.InfoDescription	= "Considered an 'elegant refinement' on the T-50 DER/H,\n the T-53 PBL is a sangheili-made munitions launcher."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_pc"
SWEP.CrosshairSizeMul	= 2
SWEP.CrosshairCorrectY	= 0
SWEP.CrosshairNoIronFade = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 1
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_plasmacaster.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_caster.mdl"
SWEP.VMPos 				= Vector(-5, -8, -2)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-8.75, -9, -2.9)
SWEP.IronSightsAng 		= Vector(0, 0, 1.5)
SWEP.IronSightViewAng	= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(5, 4, 1.67)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.SprintPos 			= Vector(2, 1, 1.5)
SWEP.SprintAng 			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.IronRecoilMul	= 0.5
SWEP.Primary.Spread			= 1
SWEP.Primary.SpreadDiv		= 10
SWEP.Primary.Kick			= 3.2
SWEP.Primary.KickHoriz		= 1.5
SWEP.Primary.RecoilUp		= 0.7
SWEP.Primary.RecoilDown		= 20
SWEP.Primary.RecoilHoriz	= 15
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 6
SWEP.Primary.Ammo			= "SMG1_Grenade"
SWEP.Primary.Automatic		= false
SWEP.Primary.Delay			= 0.115
SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.APS			= 1
SWEP.Primary.RPM			= 258
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound 			= Sound("drc.PlasmaCaster_fire")
SWEP.Primary.DistSound 		= Sound("drc.concussion_fire_dist")
SWEP.Primary.SoundDistance 	= 1500
SWEP.Primary.Projectile		= "drc_casterbolt"
SWEP.Primary.ProjSpeed		= 750

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

SWEP.Secondary.Ironsights	= true
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/t51c/carbine_zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/t51c/carbine_zoom_out.wav"
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/draconic_scope"
SWEP.Secondary.IronFOV		= 90

SWEP.Primary.UsesCharge = true
SWEP.Secondary.UsesCharge = false

SWEP.ChargeRate		= 15.2
SWEP.ChargeHoldDrain = 0

SWEP.ChargeType 		= "dualheld"
SWEP.ChargeSound		= Sound("drc.PlasmaCaster_charge")

SWEP.OCNumShots 		= 2
SWEP.OCSpread			= 0
SWEP.OCSpreadDiv		= 200
SWEP.OCKick				= 3.2
SWEP.OCKickHoriz		= 1.5
SWEP.OCRecoilUp			= 0.7
SWEP.OCRecoilDown		= 20
SWEP.OCRecoilHoriz		= 15
SWEP.OCIronRecoilMul	= 1
SWEP.OCForce			= 9
SWEP.OCDamage			= 12
SWEP.OCAPS				= 1
SWEP.OCHPS				= 999
SWEP.OCTracer			= 0
SWEP.OCRPM				= 60
SWEP.OCSound 			= Sound("drc.PlasmaCaster_fire_oc")
SWEP.OCDistSound		= Sound("drc.pr_fire_dist")
SWEP.OCProjectile 		= "drc_castergrenade"
SWEP.OCProjSpeed		= 1250

SWEP.Primary.LightColor 		= Color(30, 255, 255)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 150
SWEP.Primary.LightDecayTime		= 1000

SWEP.OCLightColor 		= Color(30, 255, 255)
SWEP.OCLightBrightness	= 1
SWEP.OCLightSize		= 150
SWEP.OCLightDecayTime	= 250

SWEP.VElements = {
	["OC_Flare1"] = { type = "Sprite", sprite = "sprites/flashlight/glow01", bone = "b_gun", rel = "", pos = Vector(19.402, 0, 3.579), size = { x = 10, y = 10 }, color = Color(0, 213, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["OC_Flare2"] = { type = "Sprite", sprite = "sprites/flashlight/glow01", bone = "b_gun", rel = "", pos = Vector(26.674, 0, 3.579), size = { x = 10, y = 10 }, color = Color(0, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["ammo2"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "b_gun", rel = "", pos = Vector(2.634, -0.138, 7.431), angle = Angle(-34.096, 0, 0), size = Vector(0.009, 0.032, 0.014), color = Color(0, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["ammo3"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "b_gun", rel = "", pos = Vector(2.579, -0.031, 7.302), angle = Angle(-34.096, 0, 0), size = Vector(0.009, 0.032, 0.014), color = Color(0, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["ammo1"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "b_gun", rel = "", pos = Vector(2.634, 0.072, 7.431), angle = Angle(-34.096, 0, 0), size = Vector(0.009, 0.032, 0.014), color = Color(0, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["ammo0"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "b_gun", rel = "", pos = Vector(2.634, -0.355, 7.431), angle = Angle(-34.096, 0, 0), size = Vector(0.009, 0.032, 0.014), color = Color(0, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["ammo4"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "b_gun", rel = "", pos = Vector(2.579, -0.247, 7.302), angle = Angle(-34.096, 0, 0), size = Vector(0.009, 0.032, 0.014), color = Color(0, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["OC_Flare1"] = { type = "Sprite", sprite = "sprites/flashlight/glow01", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(26.627, 1.259, -9.186), size = { x = 10, y = 5.539 }, color = Color(0, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["OC_Flare2"] = { type = "Sprite", sprite = "sprites/flashlight/glow01", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(21.034, 0.54, -8.028), size = { x = 10, y = 3.636 }, color = Color(0, 201, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}

function SWEP:DoCustomThink()
	local ply = self:GetOwner()
	local chargeint = self.Weapon:GetNWInt("Charge")
	
	self.VElements["OC_Flare1"].size = { x = Lerp(chargeint / 100, 1, 10), y = Lerp(chargeint / 100, 1, 10) }
	self.VElements["OC_Flare2"].size = { x = Lerp(chargeint / 100, 1, 10), y = Lerp(chargeint / 100, 1, 10) }
	self.WElements["OC_Flare1"].size = { x = Lerp(chargeint / 100, 1, 20), y = Lerp(chargeint / 100, 1, 20) }
	self.WElements["OC_Flare2"].size = { x = Lerp(chargeint / 100, 1, 20), y = Lerp(chargeint / 100, 1, 20) }
	
	if self:Clip1() == 5 then
		self.VElements["ammo0"].color = Color(0, 255, 255, 255)
		self.VElements["ammo1"].color = Color(0, 255, 255, 255)
		self.VElements["ammo2"].color = Color(0, 255, 255, 255)
		self.VElements["ammo3"].color = Color(0, 255, 255, 255)
		self.VElements["ammo4"].color = Color(0, 255, 255, 255)
	elseif self:Clip1() == 4 then
		self.VElements["ammo1"].color = Color(0, 255, 255, 0)
	elseif self:Clip1() == 3 then
		self.VElements["ammo3"].color = Color(0, 255, 255, 0)
	elseif self:Clip1() == 2 then
		self.VElements["ammo2"].color = Color(0, 255, 255, 0)
	elseif self:Clip1() == 1 then
		self.VElements["ammo4"].color = Color(0, 255, 255, 0)
	elseif self:Clip1() == 0 then
		self.VElements["ammo0"].color = Color(0, 255, 255, 0)
	end
	
	if not ply:IsPlayer() then return end
	local vm = ply:GetViewModel()
	
	
	if self.SightsDown == true then
		vm:SetBodygroup(1, 1)
		self:SetBodygroup(1, 1)
	else
		vm:SetBodygroup(1, 0)
		self :SetBodygroup(1, 0)
	end
end