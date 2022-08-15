
function EFFECT:Init(data)

	self.Position = data:GetOrigin()
	
	local dlight = DynamicLight()
	dlight.Pos = self.Position + Vector(0,0,16)
	dlight.Size = math.Rand(90,125)
	dlight.DieTime = CurTime() + math.Rand(6.26,6.32)
	dlight.r = 33
	dlight.g =255
	dlight.b = 0
	dlight.Brightness = math.Rand(1,2)
	dlight.Decay = 1000

end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end