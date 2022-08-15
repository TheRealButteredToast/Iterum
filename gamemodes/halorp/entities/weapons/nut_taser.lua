AddCSLuaFile()

local TAZE_TIME = nut.config.get("tazeTime")

if (CLIENT) then
	SWEP.PrintName = "Taser"
	SWEP.Slot = 2
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Category = "Nutscript"
SWEP.Author = "AngryBaldMan"
SWEP.Instructions = ""
SWEP.Purpose = ""
SWEP.Drop = false

SWEP.ViewModelFlip = false
SWEP.Primary.ClipSize = 0
SWEP.Primary.Ammo = ""
SWEP.Secondary.ClipSize = 0
SWEP.Secondary.Ammo = ""

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = Model("models/weapons/custom/taser.mdl")
SWEP.WorldModel = Model("models/weapons/custom/w_taser.mdl")
SWEP.UseHands = true

--SWEP.WElements = {
--	["element_name"] = { type = "Model", model = "models/weapons/custom/w_taser.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.593, 0.15, 6.357), angle = Angle(180, -110.818, 6.171), size = Vector(1.013, 1.013, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
--}

function SWEP:Initialize()
	self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()
	self.Owner:LagCompensation(true)
	local trace = self.Owner:GetEyeTrace()
	self.Owner:LagCompensation(false)

	if not IsValid(trace.Entity) or (self.Owner:EyePos():Distance(trace.Entity:GetPos()) > 400) or (not trace.Entity:IsPlayer()) then
		self:SetNextPrimaryFire(CurTime() + 2)
		return
	end

	self.Weapon:EmitSound("Weapon_StunStick.Activate")
	self.BaseClass.ShootEffects(self)

	if SERVER then
		
		if IsValid(trace.Entity) and trace.Entity:IsPlayer() and trace.Entity:getChar():hasFlags("B") then
			self.Owner:notifyLocalized("You can't taze other cops!")
			return
		elseif IsValid(trace.Entity) and trace.Entity:IsPlayer() and trace.Entity:getChar():getArmor() then
			self.Owner:notifyLocalized("The tazer barely shocks them...")
			return
		end
	
		self.Owner:notifyLocalized("You have stunned someone!")
		trace.Entity:setAction("Unstunning", TAZE_TIME)
		
		self.Weapon:EmitSound("weapons/stunstick/stunstick_impact"..math.random(1, 2)..".wav")
		
		trace.Entity:Freeze(true)
		trace.Entity:setAction("Unstunning", TAZE_TIME)
		trace.Entity:notifyLocalized("You have been stunned!")
		trace.Entity:Stun()
		timer.Simple(nut.config.get("tazeTime"), function() 
		trace.Entity:Freeze(false)
		trace.Entity:Unstun()
		end)
	end
	self:SetNextPrimaryFire(CurTime() + 5)
end

function SWEP:SecondaryAttack()
end

if (CLIENT) then
	function SWEP:GetViewModelPosition( pos, ang )
		local pos = pos*1
		pos = pos + ang:Right() * -9
		pos = pos + ang:Forward() * -5
		return pos, ang
	end
end