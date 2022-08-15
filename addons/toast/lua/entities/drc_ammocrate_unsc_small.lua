AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "UNSC Small Arms Munitions Crate"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/unsc_crate_small.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 16
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "ammostation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_m7", "drc_m7s", "drc_m6c", "drc_m6s", "drc_m6d", "drc_m6g", "drc_sas10", "drc_haloonline_m6h_dmg", "drc_haloonline_m6h_pwr", "drc_haloonline_m7", "drc_haloonline_m7_acc", "drc_haloonline_m7_dmg", "drc_haloonline_m7_mag", "drc_haloonline_m7_pwr", "drc_haloonline_m7_rof" }

function ENT:DoCustomUse(ply, curswep)
    if curswep:GetClass() == "drc_m7" or curswep:GetClass() == "drc_m7s" then
        self.UseSound = "vuthakral/halo/weapons/m7smg/smg_ammo.wav"
    elseif curswep:GetClass() == "drc_m6c" or curswep:GetClass() == "drc_m6s" or curswep:GetClass() == "drc_m6d" or curswep:GetClass() == "drc_m6g" or curswep:GetClass() == "drc_sas10" then
        self.UseSound = "vuthakral/halo/weapons/m6g/magnum_ammo.wav"
	else
		self.UseSound = ""
    end
    
    if curswep:GetClass() == "drc_m7" then
        self.ATR = 180
    elseif curswep:GetClass() == "drc_m7s" then
        self.ATR = 144
	elseif curswep:GetClass() == "drc_m6c" or curswep:GetClass() == "drc_m6d" or curswep:GetClass() == "drc_sas10" then
		self.ATR = 36
	elseif curswep:GetClass() == "drc_m6g" then
		self.ATR = 24
    else
        self.ATR = 0
    end
end