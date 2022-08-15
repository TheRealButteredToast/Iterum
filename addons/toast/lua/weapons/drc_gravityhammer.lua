SWEP.Base				= "draconic_melee_base"

SWEP.HoldType			= "melee2" -- https://wiki.garrysmod.com/page/Hold_Types
SWEP.Category			= "Draconic: Halo"
SWEP.PrintName			= "Type-2 EW/H"
SWEP.WepSelectIcon		 = "vgui/entities/drchalo_hammer"

SWEP.InfoName			= "Gravity Hammer"

SWEP.CrosshairColor		= Color(127, 220, 255, 255)
SWEP.CrosshairShadow	= true
SWEP.CrosshairStatic	= "models/vuthakral/halo/HUD/reticles/ret_hammer"
SWEP.CrosshairSizeMul	= 1

SWEP.AdminSpawnable = true
SWEP.AutoSwitchTo   = false
SWEP.Spawnable      = true
SWEP.AutoSwitchFrom = false
SWEP.FiresUnderwater= false
SWEP.Weight         = 5
SWEP.DrawCrosshair  = true
SWEP.Slot           = 0
SWEP.SlotPos        = 1
SWEP.DrawAmmo		= false

SWEP.UseHands		= true
SWEP.ViewModel 		= "models/vuthakral/halo/weapons/c_hum_hammer.mdl"
SWEP.WorldModel 	= "models/vuthakral/halo/weapons/w_hammer.mdl"
SWEP.ViewModelFOV   = 60
SWEP.VMPos 			= Vector(0, 5, -6)
SWEP.VMAng 			= Vector(0, 0, 0)
SWEP.DoesPassiveSprint = false
SWEP.SS 			= 1
SWEP.BS 			= 1

SWEP.ViewModelFlip  = false
SWEP.ShowWorldModel = true

SWEP.Primary.SwingSound		= Sound( "" )
SWEP.Primary.HitSoundWorld 	= Sound( "drc.hammer_drop" )
SWEP.Primary.HitSoundFlesh 	= Sound( "drc.hammer_drop" )
SWEP.Primary.HitSoundEnt	= Sound( "drc.hammer_drop" )
SWEP.Primary.HoldType		= "melee2"
SWEP.Primary.HoldTypeCrouch	= "melee2"
SWEP.Primary.ImpactDecal 	= "ManhackCut"
SWEP.Primary.Automatic		= false
SWEP.Primary.Damage			= 300
SWEP.Primary.DamageType		= DMG_ALWAYSGIB
SWEP.Primary.Range			= 25
SWEP.Primary.Force			= 15
SWEP.Primary.DelayMiss		= 0.72
SWEP.Primary.DelayHit 		= 0.54
SWEP.Primary.CanAttackCrouched = true
SWEP.Primary.MissActivity	= ACT_VM_HITRIGHT 
SWEP.Primary.CrouchMissActivity	= ACT_VM_HITRIGHT 
SWEP.Primary.HitDelay		= 0.2
SWEP.Primary.StartX			= 60
SWEP.Primary.EndX			= -60
SWEP.Primary.StartY			= -16
SWEP.Primary.EndY			= -4

SWEP.Primary.CanLunge			= true
SWEP.Primary.LungeAutomatic		= false
SWEP.Primary.LungeRequiresTarget= false
SWEP.Primary.LungeVelocity		= 1000
SWEP.Primary.LungeMaxDist		= 150
SWEP.Primary.LungeSwingSound	= Sound( "" )
SWEP.Primary.LungeHitSoundWorld = Sound( "drc.hammer_drop" )
SWEP.Primary.LungeHitSoundFlesh = Sound( "drc.hammer_drop" )
SWEP.Primary.LungeHitSoundEnt	= Sound( "drc.hammer_drop" )
SWEP.LungeHoldType				= "melee2"
SWEP.LungeHoldTypeCrouch		= "melee2"
SWEP.Primary.LungeImpactDecal 	= "Scorch"
SWEP.Primary.LungeMissAct		= ACT_VM_MISSCENTER
SWEP.Primary.LungeDelayMiss		= 1.3
SWEP.Primary.LungeDelayHit		= 1.2
SWEP.Primary.LungeHitDelay		= 0.26
SWEP.Primary.LungeDamage		= 300
SWEP.Primary.LungeDamageType	= DMG_BLAST
SWEP.Primary.LungeRange			= 45
SWEP.Primary.LungeForce			= 20
SWEP.Primary.LungeStartX		= 17
SWEP.Primary.LungeEndX			= -17
SWEP.Primary.LungeStartY		= 40
SWEP.Primary.LungeEndY			= -80

SWEP.Secondary.SwingSound 	 = Sound( "" )
SWEP.Secondary.HitSoundWorld = Sound( "drc.hammer_drop" )
SWEP.Secondary.HitSoundFlesh = Sound( "drc.hammer_drop" )
SWEP.Secondary.HitSoundEnt 	 = Sound( "drc.hammer_drop" )
SWEP.Secondary.HoldType		 = "melee2"
SWEP.Secondary.HoldTypeCrouch= "melee2"
SWEP.Secondary.ImpactDecal 	 = ""
SWEP.Secondary.Automatic 	 = false
SWEP.Secondary.Damage 	  	 = 300
SWEP.Secondary.DamageType	 = DMG_CLUB
SWEP.Secondary.Range       	 = 25
SWEP.Secondary.Force	   	 = 15
SWEP.Secondary.DelayMiss   	 = 0.72
SWEP.Secondary.DelayHit	   	 = 0.54
SWEP.Secondary.CanAttackCrouched = true
SWEP.Secondary.MissActivity	= ACT_VM_PRIMARYATTACK
SWEP.Secondary.CrouchMissActivity	= ACT_VM_PRIMARYATTACK
SWEP.Secondary.HitDelay		= 0.23
SWEP.Secondary.CanLunge		= false
SWEP.Secondary.Velocity		= Vector(0, 0, 0)
SWEP.Secondary.StartX		= 15
SWEP.Secondary.EndX			= -7.5
SWEP.Secondary.StartY		= -10
SWEP.Secondary.EndY			= -25

function SWEP:DoCustomMeleeImpact(att)
	local ply = self:GetOwner()
	local epos = ply:EyePos() - Vector(0, 0, 15) + ply:GetAimVector() * Vector(55, 55, 55)
	local epower = 25
	local erad = 125
	local epress = 50
	
	if att != "lungeprimary" then return end
	self:EmitSound("drc.hammer_boom")
	
	for f, v in pairs(ents.FindInSphere(epos, erad)) do
	
	local dmg2 = DamageInfo()
	dmg2:SetDamage(self.Primary.Damage / (v:GetPos()):Distance(epos) * 20)
	dmg2:SetInflictor(self)
	dmg2:SetDamageForce(self:EyeAngles():Forward())
	dmg2:SetDamagePosition(epos)
	dmg2:SetDamageType(DMG_BLAST)
	dmg2:SetAttacker(ply)
	
		if IsValid(v:GetPhysicsObject()) and !(v:IsPlayer() or v:IsNPC()) then
			v:GetPhysicsObject():SetVelocity((v:GetPos()-epos)*epress/(v:GetPos()):Distance(epos) * 25)
		elseif v:IsPlayer() or v:IsNPC() then
			if v == ply && !v:IsNPC() then v:SetVelocity((v:GetPos()-epos)*epress/(v:GetPos()):Distance(epos) * 5)
			elseif v:IsPlayer() then v:SetVelocity((v:GetPos()-epos)*epress/(v:GetPos()):Distance(epos) * 10)
			elseif v:IsNPC() then v:SetVelocity((v:GetPos()-epos)*epress/(v:GetPos()):Distance(epos) * 100) end
		end
		if v != ply then v:TakeDamageInfo(dmg2) else end
	end

	util.ScreenShake( Vector( self:GetPos() ), 100, 100, 1, 150 )
	
	local ed69 = EffectData()
	ed69:SetOrigin(epos)
	util.Effect("drc_halo_hammer_flash", ed69)
end