AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "UNSC Assault Munitions Crate"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/unsc_crate_assault.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 16
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "ammostation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_dmr", "drc_ma37", "drc_ma5b", "drc_ma5c", "drc_ma5d", "drc_m90", "drc_m90_ce", "drc_m90_h2", "drc_m45", "drc_dmr", "drc_br55hb", "drc_br85hb", "drc_br85", "drc_haloonline_h2abr", "drc_haloonline_h2abr_acc", "drc_haloonline_h2abr_dmg", "drc_haloonline_h2abr_pwr", "drc_haloonline_h2abr_rng", "drc_haloonline_h2abr_rof", "drc_ftr_ma5c", "drc_haloonline_ma5d", "drc_haloonline_ma5d_acc", "drc_haloonline_ma5d_dmg", "drc_haloonline_ma5d_pwr", "drc_haloonline_ma5d_rof" }

function ENT:DoCustomUse(ply, curswep)
    if curswep:GetClass() == "drc_ma5d" then
        self.UseSound = "vuthakral/halo/weapons/ma5d/ammo.wav"
    elseif curswep:GetClass() == "drc_ma5c" or curswep:GetClass() == "drc_ma5b" or curswep:GetClass() == "drc_ma37" then
        self.UseSound = "vuthakral/halo/weapons/ma5b/ammo.wav"
	elseif curswep:GetClass() == "drc_m90" or curswep:GetClass() == "drc_m90_ce" or curswep:GetClass() == "drc_m90_h2" or curswep:GetClass() == "drc_m45" then
		self.UseSound = "vuthakral/halo/weapons/m45/shotgun_ammo.wav"
	elseif curswep:GetClass() == "drc_dmr" or curswep:GetClass() == "drc_br55hb" or curswep:GetClass() == "drc_br85hb" or curswep:GetClass() == "drc_br85" then
		self.UseSound = "vuthakral/halo/weapons/br55hb/battle_rifle_ammo.wav"
	else
		self.UseSound = ""
    end
    
    if curswep:GetClass() == "drc_ma5b" then
        self.ATR = 240
    elseif curswep:GetClass() == "drc_ma5d" or curswep:GetClass() == "drc_ma5c" or curswep:GetClass() == "drc_ma37" then
        self.ATR = 144
	elseif curswep:GetClass() == "drc_m90" or curswep:GetClass() == "drc_m90_ce" or curswep:GetClass() == "drc_m90_h2" or curswep:GetClass() == "drc_m45" then
		self.ATR = 12
	elseif curswep:GetClass() == "drc_dmr" or curswep:GetClass() == "drc_br55hb" or curswep:GetClass() == "drc_br85hb" or curswep:GetClass() == "drc_br85" then
		self.ATR = 108
    else
        self.ATR = nil
    end
end