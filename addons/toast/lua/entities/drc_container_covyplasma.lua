AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "Plasma Battery"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/cov_plasmacharger_battery.mdl"

ENT.UseDelay 	= 0.62
ENT.HidePopup 	= true
ENT.RemoveOnUse = false
ENT.PickupType 	= "stationrequirement"
ENT.UseSound 	= ""
ENT.DenySound 	= ""

ENT.Destroyable	= true
ENT.MaxHealth	= 25
ENT.SpawnHealth	= 25
ENT.BreakEffect	= "drc_halo_plasmabattery_explode"
ENT.BreakSound	= "drc.cov_damage_large"
ENT.DamageDelay	= 0.15

ENT.ExplodeDamage 	= 250
ENT.ExplodePressure	= 15
ENT.DamageType		= DMG_BLAST
ENT.AffectRadius	= 150

function ENT:DoCustomBreak()
	if SERVER then
		SafeRemoveEntity(self)
	end
end