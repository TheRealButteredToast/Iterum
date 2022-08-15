SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "smg"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "T-55 DER/A"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_coned"

SWEP.Manufacturer		= "My Ass"
SWEP.InfoName			= "Storm Rifle"
SWEP.InfoDescription	= "This weapon isn't done and won't be until we get Halo 4 or 5 animation extraction."

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 2
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_stormrifle.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/c_hum_stormrifle.mdl"
SWEP.VMPos 				= Vector(0, -2, -2)
SWEP.VMAng 				= Vector(0, -90, 0)
SWEP.IronSightsPos 		= Vector(0, 0, 0)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.IronSightViewAng	= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.InfAmmo				= false

SWEP.DisperseHeatPassively = true
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.LowerRPMWithHeat		= false
SWEP.OverheatHoldType		= "knife"
SWEP.VentingHoldType		= "slam"
SWEP.HPS					= 3
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 0.85
SWEP.OverheatStrength		= 5
SWEP.OverHeatFinishPercent	= 0.8
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 0.1

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 12
SWEP.Primary.SpreadDiv		= 200
SWEP.Primary.Kick			= 0.36
SWEP.Primary.RecoilUp		= 0.3
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 4
SWEP.Primary.Damage			= 10
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 600
SWEP.Primary.Tracer			= 1 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "smg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound = Sound("drc.pr_fire")

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
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "overlays/draconic_scope"
SWEP.Secondary.IronFOV		= 50

SWEP.NPCBurstShots = 4

SWEP.VElements = {
	["heat_gauge"] = { type = "Model", model = "models/vuthakral/halo/weapons/stormrifle_heat_gauge.mdl", bone = "gun", rel = "", pos = Vector(-14.152, -3.945, 7.296), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = true, material = "", skin = 0, bodygroup = {} }
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	if CLIENT then
		if ply != LocalPlayer() then return end
		ply:ChatPrint("THIS WEAPON IS UNFINISHED AND IS WHY IT IS NOT LISTED IN THE SPAWN MENU.")
	end
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_stormrifle.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_stormrifle.mdl"
		end
	end
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_stormrifle.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_stormrifle.mdl"
		end
	end
end