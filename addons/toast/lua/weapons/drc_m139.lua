SWEP.Base			= "draconic_gun_base"

SWEP.HoldType			= "ar2"
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "M319"
SWEP.WepSelectIcon 		= "vgui/entities/drchalo_m139"

SWEP.Manufacturer		= "Misriah Armory"
SWEP.InfoName			= "Grenade Launcher"
SWEP.InfoDescription	= "Dating back to 2263, the M319 is a staple in the UNSC's armory of ordnance."

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_gl.vmt"
SWEP.CrosshairSizeMul	= 12
SWEP.CrosshairCorrectY	= 0.25

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Slot				= 3
SWEP.SlotPos			= 0

SWEP.ViewModelFOV		= 54
SWEP.ViewModelFlip		= false

SWEP.UseHands			= true
SWEP.ViewModel 			= "models/vuthakral/halo/weapons/c_hum_m139.mdl"
SWEP.WorldModel			= "models/vuthakral/halo/weapons/w_m139.mdl"
SWEP.VMPos				= Vector(-1, 3, -1.4)
SWEP.VMAng 				= Vector(0, 0, -1)
SWEP.VMPosCrouch		= Vector(0, 3, -0.3)
SWEP.VMAngCrouch		= Vector(0, 0, 0)
SWEP.IronSightsPos 		= Vector(-5.3, -2, -1)
SWEP.IronSightsAng 		= Vector(-2, -2, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS = 1
SWEP.BS = 1

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 1
SWEP.FireModes_SwitchSound = Sound("Weapon_AR2.Empty")

SWEP.LoadAfterShot 			= false
SWEP.LoadAfterReloadEmpty	= false
SWEP.ManualReload			= false
SWEP.Primary.NumShots 		= 1
SWEP.Primary.IronRecoilMul	= 0.5
SWEP.Primary.Spread			= 0.01
SWEP.Primary.SpreadDiv		= 1
SWEP.Primary.Kick			= 4
SWEP.Primary.RecoilUp		= 2
SWEP.Primary.RecoilDown		= 2
SWEP.Primary.RecoilHoriz	= 15
SWEP.Primary.Force			= 0.2
SWEP.Primary.Damage			= 6
SWEP.Primary.Ammo			= "ammo_drc_halo_40mm"
SWEP.Primary.Automatic		= false
SWEP.Primary.RPM			= 60
SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.APS			= 1
SWEP.Primary.Tracer			= 0 -- https://wiki.garrysmod.com/page/Enums/TRACER
SWEP.Primary.ReloadHoldType	= "ar2"
SWEP.Primary.EmptySound		= Sound("drc.halo_mag_empty")
SWEP.Primary.Sound 			= Sound("drc.m139_fire")
SWEP.Primary.DistSound 		= Sound("drc.m139_fire_dist")
SWEP.Primary.SoundDistance 	= 1500
SWEP.Primary.Projectile			 = "drc_m139_grenade_5secbounce"
SWEP.Primary.ProjSpeed			 = 1500
SWEP.Primary.ProjInheritVelocity = true

SWEP.FireModes_CanAuto	= false
SWEP.FireModes_CanBurst = false
SWEP.FireModes_CanSemi	= true
SWEP.FireModes_BurstShots = 1

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
SWEP.Secondary.ScopeMat		= "overlays/drc_halo_placeholder"
SWEP.Secondary.IronFOV		= 90

SWEP.VElements = {
	["Screen"] = { type = "Quad", bone = "b_gun", rel = "", pos = Vector(5.53, -1.72, 5.45), angle = Angle(0, -90, 48.902), size = 0.002, draw_func = nil},
	["Screen2"] = { type = "Quad", bone = "b_gun", rel = "", pos = Vector(5.53, -2.05, 5.45), angle = Angle(0, -90, 48.902), size = 0.002, draw_func = nil}
}

-- Everything below here is custom code solely for the reach grenade launcher

SWEP.CurNade = "drc_m139_grenade_5secbounce"

function SWEP:DoCustomInitialize()
	local ply = self:GetOwner()
	self.Weapon:SetNWString("Nade", "drc_m139_grenade_5secbounce")
end

function SWEP:DoCustomThink()

	local ply = self:GetOwner()
	local vm = ply:GetViewModel()
	local ukd = ply:KeyDown(IN_USE)
	local m2p = ply:KeyPressed(IN_ATTACK2)
	local swapanim = vm:SelectWeightedSequence(ACT_VM_RELOAD)
	local swaptime = vm:SequenceDuration(swapanim)
	local str = self.Weapon:GetNWString("Nade")
	
	if self.Loading == false && (self.Weapon:Clip1() > 0 or ply:GetAmmoCount(self.Primary.Ammo) > 0) then
		if ukd && m2p then
			self:SetGrenade()
		--	vm:SendViewModelMatchingSequence(swapanim)
		--	self.Loading = true
		--	timer.Simple(swaptime, function() self.Loading = false end)
		end
	end
	
	local cn = self.CurNade
	
	if !game.IsDedicated() then
		self.VElements["Screen"].draw_func = function( weapon )
			if cn == "drc_m139_grenade_5secbounce" then
				draw.SimpleTextOutlined("EXPL", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			elseif cn == "drc_m139_grenade_imp" then
				draw.SimpleTextOutlined("EXPL", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			elseif cn == "drc_m139_grenade_emp_imp" then
				draw.SimpleTextOutlined("EMP", "reach_ammocounter", 0, 12.5, Color(170,141,17,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 0.7, Color(120, 120, 0))
			end
		end
		
		self.VElements["Screen2"].draw_func = function( weapon )
			if cn == "drc_m139_grenade_5secbounce" then
				draw.SimpleTextOutlined("5s", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			elseif cn == "drc_m139_grenade_imp" then
				draw.SimpleTextOutlined("IMP", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, Color(16, 60, 80))
			elseif cn == "drc_m139_grenade_emp_imp" then
				draw.SimpleTextOutlined("IMP", "reach_ammocounter", 0, 12.5, Color(37,141,170,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 0.7, Color(16, 60, 80))
			end
		end
	end
end

function SWEP:SetGrenade()
	local str = self.Weapon:GetNWString("Nade")

	if str == "drc_m139_grenade_5secbounce" then
		timer.Simple(0.01, function()
			self.Weapon:SetNWString("Nade", "drc_m139_grenade_imp")
		end)
		self.CurNade = str
	elseif str == "drc_m139_grenade_imp" then
		timer.Simple(0.01, function()
			self.Weapon:SetNWString("Nade", "drc_m139_grenade_emp_imp")
		end)
		self.CurNade = str
	elseif str == "drc_m139_grenade_emp_imp" then
		timer.Simple(0.01, function()
			self.Weapon:SetNWString("Nade", "drc_m139_grenade_5secbounce")
		end)
		self.CurNade = str
	end
	
	for k, v in pairs(self.PrimaryStats) do
		if k == "Projectile" then 
			self.PrimaryStats["Projectile"] = self.CurNade
		end
	end
end