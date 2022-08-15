SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "revolver"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-25 DEP"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_pp"

SWEP.Manufacturer		= "Iruiru Armory"
SWEP.InfoName			= "Plasma Pistol"
SWEP.InfoDescription	= "A Covenant infantry firearm that is weak on its own, but often deployed in mass amounts among smaller units."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_pp.vmt"
SWEP.CrosshairSizeMul	= 3

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
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_plasmapistol.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_plasmapistol.mdl"
SWEP.VMPos 				= Vector(0, 0, -2.5)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-4.5, 0, -1.3)
SWEP.IronSightsAng 		= Vector(0, -0.55, 0)
SWEP.IronSightViewAng	= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.DisperseHeatPassively = true
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.LowerRPMWithHeat		= false
SWEP.OverheatHoldType		= "knife"
SWEP.VentingHoldType		= "slam"
SWEP.HPS					= 7
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 1.85
SWEP.OverheatStrength		= 3
SWEP.OverHeatFinishPercent	= 0.88
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 0.25

SWEP.OverheatSound			= Sound("drc.pp_oh")
SWEP.VentingSound			= Sound("")
SWEP.VentingStartSound		= Sound("drc.repeater_ventopen")
SWEP.VentingStopSound		= Sound("drc.pp_oh_exit")

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 4
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.4
SWEP.Primary.KickHoriz		= 0.1
SWEP.Primary.RecoilUp		= 0.1
SWEP.Primary.RecoilDown		= 0.1
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 4
SWEP.Primary.Damage			= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 400
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_pp_bolt" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound 			= Sound("drc.pp_fire")
SWEP.Primary.DistSound 		= Sound("drc.pr_fire_dist")
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

SWEP.Primary.UsesCharge = true
SWEP.Secondary.UsesCharge = false

SWEP.ChargeRate		= 8.2
SWEP.ChargeHoldDrain = 0.1

SWEP.ChargeType = "dualheld"

SWEP.ChargeSound		= Sound("drc.pp_charge")

SWEP.OCNumShots 		= 1
SWEP.OCSpread			= 0
SWEP.OCSpreadDiv		= 200
SWEP.OCKick				= 0.87
SWEP.OCRecoilUp			= 0.06
SWEP.OCRecoilDown		= 0.03
SWEP.OCRecoilHoriz		= 8
SWEP.OCIronRecoilMul	= 1
SWEP.OCForce			= 9
SWEP.OCDamage			= 60
SWEP.OCAPS				= 20
SWEP.OCHPS				= 999
SWEP.OCTracer			= 0
SWEP.OCSound 			= Sound("drc.pp_fireOC")
SWEP.OCDistSound		= Sound("drc.pr_fire_dist")
SWEP.OCProjectile 		= "drc_pp_ocbolt"

SWEP.Primary.LightColor 		= Color(30, 255, 30)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 150
SWEP.Primary.LightDecayTime		= 1000

SWEP.OCLightColor 		= Color(30, 255, 30)
SWEP.OCLightBrightness	= 1
SWEP.OCLightSize		= 150
SWEP.OCLightDecayTime	= 250

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_haloplasma"}
}

SWEP.VElements = {
	["OC_Flare"] = { type = "Sprite", sprite = "sprites/flashlight/glow01", bone = "b_gun", rel = "", pos = Vector(8.994, 0, 1.807), size = { x = 10, y = 10 }, color = Color(0, 255, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}

SWEP.WElements = {
	["OC_Flare"] = { type = "Sprite", sprite = "sprites/flashlight/glow01", bone = "valveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.75, 1, -4.5), size = { x = 10, y = 10 }, color = Color(0, 255, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmapistol.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmapistol.mdl"
		end
	end
end

function SWEP:DoCustomThink()
	local chargeint = self.Weapon:GetNWInt("Charge")
	
	self.VElements["OC_Flare"].size = { x = Lerp(chargeint / 100, 1, 10), y = Lerp(chargeint / 100, 1, 10) }
	self.WElements["OC_Flare"].size = { x = Lerp(chargeint / 100, 1, 20), y = Lerp(chargeint / 100, 1, 20) }
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmapistol.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmapistol.mdl"
		end
	end
end