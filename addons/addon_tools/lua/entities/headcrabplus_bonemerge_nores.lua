AddCSLuaFile()

ENT.Type   = "anim"
function ENT:Initialize()
	if SERVER then
		self:AddEffects(bit.bor(EF_BONEMERGE,EF_BONEMERGE_FASTCULL))
	end
	self:GetParent():SetSubMaterial(0,"models/effects/vol_light001")
end