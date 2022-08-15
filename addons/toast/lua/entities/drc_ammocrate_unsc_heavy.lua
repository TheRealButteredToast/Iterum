AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "UNSC Heavy Munitions Crate"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/unsc_crate_heavy.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 16
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "universalstation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_spnkr", "drc_m7057", "drc_m139", "drc_srs99am", "drc_srs99c", "drc_srs99d", "drc_m6d_drum", "drc_m247" }

function ENT:DoCustomUse(ply, curswep)
    if curswep:GetClass() == "drc_spnkr" then
        self.UseSound = "vuthakral/halo/weapons/spnkr/rocket_ammo.wav"
    elseif curswep:GetClass() == "drc_m139" then
        self.UseSound = "drc.frag_pickup"
	elseif curswep:GetClass() == "drc_srs99am" or curswep:GetClass() == "drc_srs99c" or curswep:GetClass() == "drc_srs99d" then
		self.UseSound = "vuthakral/halo/weapons/srs99am/sniper_ammo.wav"
	elseif curswep:GetClass() == "drc_m6d_drum" then
		self.UseSound = "vuthakral/halo/weapons/m6g/magnum_ammo.wav"
	elseif curswep:GetClass() == "drc_m247" then
		self.UseSound = "vuthakral/halo/weapons/m7smg/smg_ammo.wav"
	else
		self.UseSound = ""
    end
    
    if curswep:GetClass() == "drc_spnkr" then
        self.ATR = 2
    elseif curswep:GetClass() == "drc_m139" then
        self.ATR = 1
	elseif curswep:GetClass() == "drc_srs99am" or curswep:GetClass() == "drc_srs99c" or curswep:GetClass() == "drc_srs99d" then
		self.ATR = 20
	elseif curswep:GetClass() == "drc_m6d_drum" then
		self.ATR = 100
	elseif curswep:GetClass() == "drc_m247" then
		self.ATR = 200
    else
        self.ATR = nil
    end
	
	if curswep:GetClass() != "drc_m7057" then return end
	local vm = ply:GetViewModel()
	local anim = vm:SelectWeightedSequence(ACT_VM_RELOAD_EMPTY)
	local animdur = vm:SequenceDuration(anim)
	if curswep.Weapon:GetNWInt("LoadedAmmo") < 100 then
		curswep.Loading = true
		curswep.IdleTimer = CurTime() + animdur
		curswep:SendWeaponAnim(ACT_VM_RELOAD_EMPTY)
		
		timer.Simple(animdur, function() 
			if ply:IsValid() && curswep:IsValid() then
				curswep.Loading = false
			end
		end)
	end
end