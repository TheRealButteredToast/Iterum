
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

ENT.Name = "M247H Mounted MG"
ENT.Ammo = 3500
ENT.FireRate = 950
ENT.Spray = 1.2
ENT.FireOffset = Vector(60, 0, 0)


function ENT:SetupDataTables()
	self:base("wac_pod_base").SetupDataTables(self)
	self:NetworkVar("Float", 2, "SpinSpeed")
end

