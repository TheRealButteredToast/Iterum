AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "Covenant Assorted Munitions (Large)"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/cov_crate_regular.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 16
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "ammostation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_mauler", "drc_t33b", "drc_needlerifle", "drc_t51", "drc_t57b", "drc_t50", "drc_bruteshot" }

function ENT:DoCustomInitialize()
	self:SetColor( Color(76, 155, 245, 255) )
end

function ENT:DoCustomUse(ply, curswep)
    if curswep:GetClass() == "drc_mauler" then
        self.UseSound = "vuthakral/halo/weapons/ma5d/ammo.wav"
	elseif curswep:GetClass() == "drc_needlerifle" then
		self.UseSound = "vuthakral/halo/weapons/needler/needle_ammo.wav"
	elseif curswep:GetClass() == "drc_t51" or curswep:GetClass() == "drc_t57b" or curswep:GetClass() == "drc_t33b" or curswep:GetClass() == "drc_t50" then
		self.UseSound = "drc.cov_carbine_ammo"
	else
		self.UseSound = ""
    end
    
    if curswep:GetClass() == "drc_mauler" then
        self.ATR = 15
    elseif curswep:GetClass() == "drc_t33b" or curswep:GetClass() == "drc_t50" then
        self.ATR = 5
	elseif curswep:GetClass() == "drc_needlerifle" then
		self.ATR = 42
	elseif curswep:GetClass() == "drc_t51" or curswep:GetClass() == "drc_t57b" then
		self.ATR = 20
	else
		self.ATR = ""
    end
end