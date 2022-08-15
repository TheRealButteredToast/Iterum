
function EFFECT:Init(data)

	self.Position = data:GetOrigin()
	
	local dlight = DynamicLight()
	dlight.Pos = self.Position + Vector(0,0,0)
	dlight.Size = math.Rand(20,22)
	dlight.DieTime = CurTime() + math.Rand(0.26,0.32)
	dlight.r = 75 
	dlight.g = 45
	dlight.b = 255
	dlight.Brightness = math.Rand(4.4,5.6)
	dlight.Decay = 10

end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end