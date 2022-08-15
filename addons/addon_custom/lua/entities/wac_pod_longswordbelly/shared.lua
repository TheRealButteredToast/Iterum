
ENT.Base = "wac_pod_base"
ENT.Type = "anim"

ENT.PrintName = ""
ENT.Author = "Death/Valk"
ENT.Category = wac.aircraft.spawnCategory
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M370 Autocannon"
ENT.Ammo = 13500
ENT.FireRate = 8350
ENT.Spray = 1.8
ENT.FireOffset = Vector(60, 0, 0)


function ENT:SetupDataTables()
	self:base("wac_pod_base").SetupDataTables(self)
	self:NetworkVar("Float", 2, "SpinSpeed")
end

