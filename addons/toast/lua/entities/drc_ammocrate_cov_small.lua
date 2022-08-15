AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "Covenant Assorted Munitions (Small)"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/cov_crate_small.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 16
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "universalstation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_plasma_pistol", "drc_needler", "drc_spiker" }

function ENT:DoCustomInitialize()
	self:SetColor( Color(76, 155, 245, 255) )
end

function ENT:DoCustomUse(ply, curswep)
	if curswep:GetClass() == "drc_plasma_pistol" then
		self.UseSound = "drc.T50SRS_melee1"
	elseif curswep:GetClass() == "drc_needler" then
		self.UseSound = "vuthakral/halo/weapons/needler/needle_ammo.wav"
	elseif curswep:GetClass() == "drc_spiker" then
		self.UseSound = "drc.spiker_ammo"
	else
		self.UseSound = ""
    end
    
    if curswep:GetClass() == "drc_spiker" then
        self.ATR = 80
	elseif curswep:GetClass() == "drc_needler" then
		self.ATR = 40	
	elseif curswep:GetClass() == "drc_t51" or curswep:GetClass() == "drc_t57b" then
		self.ATR = 20
	else
		self.ATR = 0
    end
	
	if curswep:GetClass() != "drc_plasma_pistol" then return end
	local vm = ply:GetViewModel()
	local anim = vm:SelectWeightedSequence(ACT_VM_DRAW)
	local animdur = vm:SequenceDuration(anim)
	if curswep.Weapon:GetNWInt("LoadedAmmo") < 100 then
		curswep.Loading = true
		curswep.IdleTimer = CurTime() + animdur
		curswep:SendWeaponAnim(ACT_VM_DRAW)
		
		timer.Simple(animdur, function() 
			if ply:IsValid() && curswep:IsValid() then
				curswep.Loading = false
			end
		end)
	end
end