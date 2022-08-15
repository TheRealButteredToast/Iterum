SWEP.Base			= "draconic_battery_base"

SWEP.HoldType			= "rpg"
SWEP.IdleSequence		= "idle"
SWEP.WalkSequence		= "idle"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "M6 G/GNR"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_gnr"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Spartan Laser"
SWEP.InfoDescription	= "Why the fuck does the laser work in singleplayer,\n and show up for other players, but not for the user in multiplayer?!"

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_sl"
SWEP.CrosshairSizeMul	= 10

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
SWEP.ViewModel			= "models/vuthakral/halo/weapons/c_hum_gnr.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_gnr.mdl"
SWEP.VMPos 				= Vector(0, 0, -1)
SWEP.VMAng 				= Vector(0, 0, 0)
SWEP.VMPosCrouch		= Vector(0.3, -2, 0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-3, -21, 1.25)
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
SWEP.HPS					= 101
SWEP.HeatLossInterval		= 0.1
SWEP.HeatLossPerInterval	= 1.85
SWEP.OverheatStrength		= 2
SWEP.OverHeatFinishPercent	= 0.88
SWEP.VentingStrength		= 4
SWEP.HeatRPMmin				= 180
SWEP.BatteryConsumPerShot	= 20

SWEP.OverheatSound			= Sound("drc.gnr_overheat")
SWEP.VentingSound			= Sound("")
SWEP.VentingStartSound		= Sound("")
SWEP.VentingStopSound		= Sound("")

SWEP.Primary.Automatic		= true
SWEP.Primary.RPM			= 60
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.SoundDistance 	= 1500

SWEP.FireModes_CanAuto	= true
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= false
SWEP.FireModes_BurstShots = 10

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
SWEP.Secondary.IronInFP		= "vuthakral/halo/weapons/spnkr/zoom_in.wav"
SWEP.Secondary.IronOutFP	= "vuthakral/halo/weapons/spnkr/zoom_out.wav"
SWEP.Secondary.Scoped		= true
SWEP.Secondary.ScopeMat		= "models/vuthakral/halo/HUD/scope_br"
SWEP.Secondary.ScopeBlur 	= true
SWEP.Secondary.ScopeBGCol 	= Color(0, 0, 0, 200)
SWEP.Secondary.IronFOV		= 60
SWEP.Secondary.ScopeScale	= 0.65

SWEP.Primary.UsesCharge = true
SWEP.Secondary.UsesCharge = false

SWEP.ChargeRate			= 3.9
SWEP.ChargeHoldDrain 	= 0.1
SWEP.ChargeType 		= "discharge"
SWEP.ChargeSound		= Sound("drc.gnr_charge")

SWEP.OCNumShots 		= 5
SWEP.OCSpread			= 0
SWEP.OCSpreadDiv		= 200
SWEP.OCKick				= 3
SWEP.OCRecoilUp			= 0.06
SWEP.OCRecoilDown		= 0.03
SWEP.OCRecoilHoriz		= 8
SWEP.OCIronRecoilMul	= 1
SWEP.OCForce			= 5
SWEP.OCDamage			= 500
SWEP.OCAPS				= 20
SWEP.OCHPS				= 420
SWEP.OCTracer			= 4
SWEP.OCTracerEffect		= "drc_halo_gnr_laser"
SWEP.OCSound 			= Sound("drc.gnr_fire")
SWEP.OCDistSound		= Sound("drc.gnr_fire_dist")
SWEP.OCProjectile 		= nil

SWEP.OCLightColor 		= Color(255, 2, 2)
SWEP.OCLightBrightness	= 0.1
SWEP.OCLightSize		= 250
SWEP.OCLightDecayTime	= 250

SWEP.AttachmentTable = {
	AmmunitionTypes = {"drc_att_bprofile_halolaser"}
}

SWEP.VElements = {
	["bar_back"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "gun", rel = "", pos = Vector(9.472, -2.763, 2.707), angle = Angle(0, 90, 90), size = Vector(0.021, 0.059, 0.021), color = Color(0, 0, 0, 212), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["bar_back+"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "gun", rel = "bar_back", pos = Vector(0.524, -0.01, -0), angle = Angle(0, -90, 90), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_gnr.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_gnr.mdl"
		end
	end
end

function SWEP:DoCustomThink()
	local chargeint = self.Weapon:GetNWInt("Charge")
	
	local col = LerpVector(chargeint/100, Vector(255, 255, 255), Vector(255, 0, 0))
	local colx = col.x
	local coly = col.y
	local colz = col.z
	
	self.VElements["bar_back+"].size = Vector(.008, .01, Lerp(chargeint, 0, chargeint / 333))
	self.VElements["bar_back+"].color = Color( colx, coly, colz )
end

function SWEP:DoCustomDeploy()
	local ply = self:GetOwner()
	
	if ply:EntIndex() == 0 && !ply:IsNPC() then
	else
		if ply:GetModel() == "models/vuthakral/halo/custom/usp/sangheili_h3.mdl" then
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_gnr.mdl"
		else
			self.ViewModel = "models/vuthakral/halo/weapons/c_hum_gnr.mdl"
		end
	end
end