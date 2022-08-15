if CLIENT then
	SWEP.PrintName = "Series 9 Portable JumpJet"
	SWEP.Author = "HATE Recon"
	SWEP.Slot = 3
	SWEP.SlotPos = 1

end

SWEP.Primary.ClipSize = 0
SWEP.Primary.DefaultClip = GetConVarNumber("jetpack_max_fuel")
SWEP.Primary.Ammo = "AirboatGun"
SWEP.DrawAmmo = true

SWEP.Secondary.Ammo			= "none"

SWEP.HoldType = "normal"
SWEP.Category = "TFG Jetpack Test"
SWEP.UseHands = false
SWEP.DrawCrosshair= false
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Primary.Automatic= false

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel						= ""	-- Weapon world model
SWEP.ShowViewModel 					= true
SWEP.ShowWorldModel 				= false

local JetActivate = Sound("hl1/fvox/activated.wav")
local JetDeactivate = Sound("hl1/fvox/deactivated.wav")

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 3)
	local JetIsOn = self.Owner:GetNWBool("JetEnabled")
	
	if SERVER then
		self.Owner:SetNWBool("JetEnabled",!JetIsOn)
		if JetIsOn then
			self.Owner:SetAmmo(GetConVarNumber("jetpack_max_fuel"), "AirboatGun")
			self.Owner:StopSound("RocketThrust")
			self.Owner:PrintMessage( HUD_PRINTCENTER, "Jetpack Deactivated" )
		elseif !JetIsOn then
			self.Owner:PrintMessage( HUD_PRINTCENTER, "Jetpack Activated" )
		end
	elseif CLIENT then
		if JetIsOn then
			surface.PlaySound(JetDeactivate)
		elseif !JetIsOn then
			surface.PlaySound(JetActivate)
		end
	end
end 

if SERVER then
	local function JetPacking()
		for k,ply in ipairs(player.GetAll()) do
			local multiplier = 3
			if game.SinglePlayer() then
				multiplier = 1
			end
			ply:LagCompensation( true )
			if ply:GetNWBool("JetEnabled") then
				if ( !ply:IsOnGround() ) then
					if (ply:GetAmmoCount("AirboatGun") > GetConVarNumber("jetpack_drain_fuel") and ply:KeyDown(IN_JUMP)) then
						ply:SetVelocity(ply:GetUp() * GetConVarNumber("jetpack_fly_power") * multiplier + ply:GetAimVector() * multiplier)
						ply:RemoveAmmo(GetConVarNumber("jetpack_drain_fuel"),"AirboatGun")
						ply:EmitSound("RocketThrust")
						if ply:GetNWFloat("NextJetEffect")<CurTime() then
							local fx = EffectData()
							fx:SetEntity(ply)
							util.Effect("jetsmoke", fx, true, true)
							ply:SetNWFloat("NextJetEffect",CurTime()+0.95)
						end
					else
						local vel = ply:GetVelocity()
						if vel.z < -10 then
							ply:EmitSound("RocketThrust")
							vel.x = 0
							vel.y = 0
							vel.z = 0 ---vel.z * GetConVarNumber("jetpack_hover_power") * multiplier / 100
							ply:SetVelocity( vel )
						end
						if ply:GetNWFloat("NextJetEffect")<CurTime() then
							local fx = EffectData()
							fx:SetEntity(ply)
							util.Effect("jetsmoke", fx, true, true)
							ply:SetNWFloat("NextJetEffect",CurTime()+0.95)
						end
					end
				elseif (ply:GetAmmoCount("AirboatGun") < GetConVarNumber("jetpack_max_fuel")) and ply:IsOnGround() then
					ply:StopSound("RocketThrust")
					ply:GiveAmmo(1, "AirboatGun", true)
				end
			end
			ply:LagCompensation( false )
		end
	end
	hook.Add("Think","Jetpush",JetPacking)
	
	local function PlayerDied(ply)
		local JetIsOn = ply:GetNWBool("JetEnabled")
		
		if JetIsOn then
			ply:SetNWBool("JetEnabled",false)
			ply:StopSound("RocketThrust")
		end
	end
	hook.Add("PlayerDeath","RemoveDeadJets",PlayerDied)
end

function SWEP:SecondaryAttack()
	return
end

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self.Owner:SetNWFloat("NextJetEffect",CurTime())
end

function SWEP:Deploy()
	self:SetNextPrimaryFire(CurTime() + .2)
	self.Owner:DrawViewModel(false)
end

function SWEP:Reload()
	return
end
