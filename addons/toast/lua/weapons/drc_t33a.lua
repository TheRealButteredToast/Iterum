SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "rpg"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "T33-A Fuel Rod"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_fuelrod"

SWEP.Manufacturer		= "Assembly Forges"
SWEP.InfoName			= "Plasma Cannon"
SWEP.InfoDescription	= "Covenant shoulder-fired plasma mortar."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_fr_ce.vmt"
SWEP.CrosshairSizeMul	= 1.5

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.AutoSwitchTo		= false
SWEP.Weight				= 1
SWEP.DeploySpeed		= 1

SWEP.Slot				= 4
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_t33a.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_t33a.mdl"
SWEP.VMPos 				= Vector(0.15, 0, -0.5)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(0, 0, 0)
SWEP.IronSightsAng 		= Vector(0, 0, 0)
SWEP.IronSightViewAng	= Vector(0, 0, 0)
SWEP.PassivePos 		= Vector(2, 3, 0)
SWEP.PassiveAng 		= Vector(-15, 25, 0)
SWEP.DoesPassiveSprint = true
SWEP.SS = 1
SWEP.BS = 1

SWEP.DisperseHeatPassively = true
SWEP.CanOverheat			= true
SWEP.CanVent				= false
SWEP.LowerRPMWithHeat		= false
SWEP.OverheatHoldType		= "knife"
SWEP.VentingHoldType		= "slam"
SWEP.HPS					= 25
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 0.85
SWEP.OverheatStrength		= 4
SWEP.OverHeatFinishPercent	= 0.7
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 3.57

SWEP.BatteryToVec2 = Vector(255, 20, 20)
SWEP.BatteryFromVec2 = Vector(20, 150, 255)

SWEP.OverheatSound			= Sound("drc.plasmarifle_overheat")
SWEP.VentingSound			= Sound("")
SWEP.VentingStartSound		= Sound("drc.repeater_ventopen")
SWEP.VentingStopSound		= Sound("drc.plasmarifle_overheat_end")

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 3

SWEP.Primary.NumShots 		= 1
SWEP.Primary.Spread			= 0.1
SWEP.Primary.SpreadDiv		= 1
SWEP.Primary.Kick			= 7.2
SWEP.Primary.RecoilUp		= 2
SWEP.Primary.RecoilDown		= 2
SWEP.Primary.RecoilHoriz	= 15
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 120
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 1 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "rpg"
SWEP.Primary.EmptySound		= Sound("drc.plasma_empty")
SWEP.Primary.Sound 			= Sound("drc.t33a_fire")
SWEP.Primary.DistSound 		= Sound("drc.SPNKr_fire_dist")
SWEP.Primary.SoundDistance 	= 1500
SWEP.Primary.Projectile			 = "drc_t33a_rod"
SWEP.Primary.ProjSpeed			 = 1500
SWEP.Primary.ProjInheritVelocity = false

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

SWEP.NPCBurstShots = 1

SWEP.Primary.LightColor 		= Color(0, 255, 0)
SWEP.Primary.LightBrightness	= 1
SWEP.Primary.LightSize			= 250
SWEP.Primary.LightDecayTime		= 1000

SWEP.VElements = {
	["ammo"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "frame gun", rel = "", pos = Vector(5.35, -1.66, 0.811), angle = Angle(90, -0.538, 0), size = Vector(0.009, 0.009, 1.72), color = Color(20, 255, 20, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["heat"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "frame gun", rel = "", pos = Vector(-0.044, -1.673, 0.142), angle = Angle(-90, -0.908, -1.078), size = Vector(0.009, 0.009, 0.763), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}

function SWEP:DoCustomThink()
	local heat = self.Weapon:GetNWInt("Heat")
	
	local col = LerpVector(heat/100, Vector(25, 0, 255), Vector(255, 0, 0))
	local colx = col.x
	local coly = col.y
	local colz = col.z
	
	self.VElements["heat"].size = Vector(.008, .01, Lerp(heat, 0, heat / 140))
	self.VElements["heat"].color = Color( colx, coly, colz )
	
	self.VElements["ammo"].size = Vector(.008, .01, Lerp(self.Weapon:Clip1(), 0, self.Weapon:Clip1() / 75))
end