SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "revolver"
SWEP.IdleSequence		= "idle"
SWEP.WalkSequence		= "idle"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-25 'Blood Hand' DER"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_plasmarifle"

SWEP.Manufacturer		= "Sacred Promissory"
SWEP.InfoName			= "Plasma Rifle"
SWEP.InfoDescription	= "A weapon crafted in secret by the order of the Prophet of Truth in preparation for the Great Schism."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_pr.vmt"
SWEP.CrosshairSizeMul	= 1.3
SWEP.CrosshairNoIronFade = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_plasmarifle_bloodhand.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_plasmarifle_red.mdl"
SWEP.VMPos 				= Vector(0, 0, 0)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(0, 0, 0)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.IronSightViewAng	= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.SprintPos			= Vector(0, 3, 0)
SWEP.SprintAng			= Vector(-5, 0, -15)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.DisperseHeatPassively 		= true
SWEP.CanOverheat				= true
SWEP.CanVent					= false
SWEP.LowerRPMWithHeat			= true
SWEP.OverheatHoldType			= "knife"
SWEP.VentingHoldType			= "slam"
SWEP.HPS						= 3
SWEP.HeatLossInterval			= 0.1
SWEP.HeatLossPerInterval		= 0.85
SWEP.OverheatStrength			= 4
SWEP.OverHeatFinishPercent		= 0.7
SWEP.VentingStrength			= 4
SWEP.HeatRPMAlterThreshold		= 10
SWEP.HeatRPMAlterThresholdMax	= 40
SWEP.HeatRPMmin					= 620
SWEP.BatteryConsumPerShot		= 0.25

SWEP.OverheatSound			= Sound("drc.plasmarifle_overheat")
SWEP.VentingSound			= Sound("")
SWEP.VentingStartSound		= Sound("drc.repeater_ventopen")
SWEP.VentingStopSound		= Sound("drc.plasmarifle_overheat_end")

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 12
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.4
SWEP.Primary.KickHoriz		= 0.1
SWEP.Primary.RecoilUp		= 0.1
SWEP.Primary.RecoilDown		= 0.1
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 4
SWEP.Primary.Damage			= 24
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 360
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.TracerEffect	= "drc_halo_pr_bolt_red" -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound 			= Sound("drc.pr_fire")
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
SWEP.Primary.MeleeHitDelay		= 0.2
SWEP.Primary.MeleeStartX		= 30
SWEP.Primary.MeleeEndX			= -30
SWEP.Primary.MeleeStartY		= 35
SWEP.Primary.MeleeEndY			= -35

SWEP.Secondary.Disabled		= true
SWEP.Secondary.Ironsights	= true
SWEP.Secondary.Scoped		= false
SWEP.Secondary.ScopeMat		= "overlays/draconic_scope"
SWEP.Secondary.IronFOV		= 90

SWEP.Primary.LightColor 		= Color(255, 30, 30)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 150
SWEP.Primary.LightDecayTime		= 1000

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_haloplasma"}
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmarifle_bloodhand.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmarifle_bloodhand.mdl"
		end
	end
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmarifle_bloodhand.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_plasmarifle_bloodhand.mdl"
		end
	end
end