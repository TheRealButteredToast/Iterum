AddCSLuaFile()

ENT.Type   = "anim"
function ENT:Initialize()
	if SERVER then
		self:AddEffects(bit.bor(EF_BONEMERGE,EF_BONEMERGE_FASTCULL))
	end
	self:GetParent():SetSubMaterial(0,"models/effects/vol_light001")
	self:AddCallback("BuildBonePositions",self.CallBack)
end

function ENT:CallBack(boneCount)
	local boneId = self:LookupBone("ValveBiped.Bip01_Head1")
	if !boneId then return end
	local matrix = self:GetBoneMatrix(boneId)
	if !matrix then return end
	matrix:Scale(Vector(0.8,0.8,0.8))
	matrix:Rotate(Angle(-90,130,0))
	self:SetBoneMatrix(boneId,matrix)
end