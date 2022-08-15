
function EFFECT:Init( data )
	
	local vOffset = data:GetOrigin()
		self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
		self.Magnitude = data:GetMagnitude()
	self.Emitter = ParticleEmitter( self.Origin )

	local emitter = ParticleEmitter( vOffset )

				for i=1,5 do 
			local Flash = self.Emitter:Add( "effects/binary_muzzle", self.Origin )
			if (Flash) then
				Flash:SetVelocity( VectorRand()*50 )
				Flash:SetAirResistance( 20055 )
				Flash:SetDieTime( 1.5 )
				Flash:SetStartAlpha( 20 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( 10 )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(0,0) )
				Flash:SetGravity( Vector( math.Rand(-100, 100) * self.Scale, math.Rand(-100, 100) * self.Scale, math.Rand(0, -100) ) ) 	
				Flash:SetRollDelta( math.Rand(-2,2) )
				Flash:SetColor( 255, 153, 0)	
			end
		end


		for i=1,2 do 
			local particle = emitter:Add( "effects/binary_muzzle", vOffset )

				particle:SetVelocity( 0 * data:GetNormal() )
				particle:SetAirResistance( 11110 )

				particle:SetDieTime( 0.1000 )

				particle:SetStartAlpha( math.Rand(0, 55) )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( 20 * i )
				particle:SetEndSize( 5 * i )

				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

				particle:SetColor( 255, 153, 0)	
				particle:SetGravity( Vector( math.Rand(-100, 100) * self.Scale, math.Rand(-100, 100) * self.Scale, math.Rand(0, -100) ) ) 		
		end
		
	
			local particle = emitter:Add( "effects/binary_muzzle", vOffset )

				particle:SetVelocity( 0 * data:GetNormal() + 20 * VectorRand() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( math.Rand(0.3, 0.2) )
				particle:SetStartAlpha( math.Rand(0, 55) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.random(10,30) )
				particle:SetEndSize( 100 )

				particle:SetColor( 255, 153, 0)	
				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

	emitter:Finish()
				Sound( "", self.Origin,75, 100)
	
end

function EFFECT:Think( )

	return false
end

function EFFECT:Render()

end
