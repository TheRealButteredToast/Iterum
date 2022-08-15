AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "Covenant Recharging Station"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/cov_plasmacharger.mdl"

ENT.UseDelay 	= 0.62
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "batterystation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.RequiredEnt	= "drc_container_covyplasma"
ENT.RequiredEntRange = 125

ENT.Whitelist = { "drc_plasma_rifle", "drc_plasma_pistol", "drc_plasma_repeater", "drc_plasma_rifle_brute", "drc_focusrifle", "drc_t50srs", "drc_t33a" }

function ENT:DoCustomUse(ply, curswep)
	local vm = ply:GetViewModel()
	local anim = vm:SelectWeightedSequence(ACT_VM_RELOAD_EMPTY)
	local animdur = vm:SequenceDuration(anim)
	
	if !curswep.Draconic == true then return end
	
	if not table.HasValue(self.Whitelist, curswep:GetClass()) then return end
	
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