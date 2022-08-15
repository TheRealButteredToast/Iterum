include("shared.lua")

function ENT:Think()
	self:base("wac_pl_base").Think(self)
	self:attachmentThink()
end
ENT.thirdPerson = {
	distance = 2750,
	angle=15
}
