
function EFFECT:Init(data)

	self.Position = data:GetOrigin()
	
	local dlight = DynamicLight()
	dlight.Pos = self.Position + Vector(0,0,0)
	dlight.Size = math.Rand(270,270)
	dlight.DieTime = CurTime() + math.Rand(0.76,0.52)
	dlight.r = 0
	dlight.g = 161
	dlight.b = 255
	dlight.Brightness = math.Rand(0.4,0.6)
	dlight.Decay = 1000

end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end