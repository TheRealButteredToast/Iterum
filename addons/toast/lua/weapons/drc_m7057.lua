SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "crossbow"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "M7057 Defoliant Projector"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_flamethrower"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Flamethrower"
SWEP.InfoDescription	= "A short-range fortification destroyer & demoralisation tool."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_sg.vmt"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 80
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_m7057.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_m7057.mdl"
SWEP.VMPos 				= Vector(0, 0, 0)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(1.3, -2, -1)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-4, -4, 2)
SWEP.IronSightsAng 		= Vector(-5, 0, -15)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.WeaponIdleLoopSound 	= ("drc.m7057_idle")

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 0

SWEP.DisperseHeatPassively = true
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.LowerRPMWithHeat		= false
SWEP.OverheatHoldType		= "knife"
SWEP.VentingHoldType		= "slam"
SWEP.HPS					= 3
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 0.85
SWEP.OverheatStrength		= 2
SWEP.OverHeatFinishPercent	= 0.7
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 0.25

SWEP.OverheatSound			= Sound("drc.plasmarifle_overheat")
SWEP.VentingSound			= Sound("")
SWEP.VentingStartSound		= Sound("")
SWEP.VentingStopSound		= Sound("")

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 6
SWEP.Primary.SpreadDiv		= 60
SWEP.Primary.Kick			= 0.86
SWEP.Primary.RecoilUp		= 0.5
SWEP.Primary.RecoilDown		= 0.3
SWEP.Primary.RecoilHoriz	= 25
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 12
SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 600
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "shotgun"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("")
SWEP.Primary.LoopingFireSoundIn 	= Sound("")
SWEP.Primary.LoopingFireSound 	= Sound("drc.m7057_fire")
SWEP.Primary.LoopingFireSoundOut 	= Sound("")
SWEP.Primary.DistSound 		= Sound("")
SWEP.Primary.Projectile		= "drc_fire_small"
SWEP.Primary.ProjInheritVelocity = false
SWEP.Primary.ProjSpeed		= 600

SWEP.Primary.CanMelee		= true
SWEP.Primary.MeleeSwingSound	= Sound( "" )
SWEP.Primary.MeleeHitSoundWorld = Sound( "weapon.ImpactHard" )
SWEP.Primary.MeleeHitSoundFlesh = Sound( "flesh.ImpactHard" )
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

SWEP.VElements = {
	["temp"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "frame gun", rel = "", pos = Vector(2.051, 2.834, 5.58), angle = Angle(0, 63.62, 34.766), size = Vector(0.009, 0.009, 0.254), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["ammo"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "frame gun", rel = "", pos = Vector(1.907, 3.68, 5.51), angle = Angle(0, 62.361, 25.226), size = Vector(0.017, 0.017, 0.246), color = Color(5, 150, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}

function SWEP:DoCustomThink()
	local heat = self.Weapon:GetNWInt("Heat")
	
	local col = LerpVector(heat/100, Vector(5, 150, 255), Vector(255, 0, 0))
	local colx = col.x
	local coly = col.y
	local colz = col.z
	
	self.VElements["temp"].size = Vector(.008, .01, Lerp(heat, 0, heat / 430))
	self.VElements["temp"].color = Color( colx, coly, colz )
	
	self.VElements["ammo"].size = Vector(.02, .02, Lerp(self.Weapon:Clip1(), 0, self.Weapon:Clip1() / 430))
end