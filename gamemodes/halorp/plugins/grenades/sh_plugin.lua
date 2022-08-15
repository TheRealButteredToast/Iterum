PLUGIN.name = "Grenade Throwables"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "Grenade Throwables."

function PLUGIN:Move(client, mv)
	if client:GetMoveType() != MOVETYPE_WALK then return end

	local teargas = client:getNetVar("teargas")

	if (teargas and teargas > CurTime()) then
		local m = .25
		local f = mv:GetForwardSpeed() 
		local s = mv:GetSideSpeed() 
		mv:SetForwardSpeed( f * .005 )
		mv:SetSideSpeed( s * .005 )
	end
end

if (SERVER) then
	function PLUGIN:PlayerSpawn(client)
		client:setNetVar("teargas", 0)
	end

	function PLUGIN:PlayerDeath(client)
		client:setNetVar("teargas", 0)
	end
else
	local trg = 0
	local cur = 0
	local icon = {
		[1] = "R",
		[2] = "Z",
		[3] = "a",
		[4] = "b",
	}
	local w, h
	local lclient
	local myChar 
	function PLUGIN:HUDPaint()
		w, h = ScrW(), ScrH()
		lclient = LocalPlayer()
		myChar = lclient:getChar()
		
		if (myChar) then
			if (!lclient:Alive()) then
				return
			end
			
			local teargas = lclient:getNetVar("teargas")

			if (teargas and teargas > CurTime()) then
				trg = 120 + math.abs(math.sin( RealTime()*2 )*70)
			else
				trg = 0
			end

			cur = Lerp(FrameTime()*3, cur, trg)
			surface.SetDrawColor(255, 255, 255, cur)
			surface.DrawRect(0, 0, w, h)
			
		end
	end

	function PLUGIN:PlayerPostThink(client)
		if (client:getChar()) then
			local teargas = client:getNetVar("teargas")

			if (teargas and teargas > CurTime() and client:Alive()) then
				if (!client.nextCough or client.nextCough < CurTime()) then
					client.nextCough = CurTime() + math.random(2, 5)

					client:EmitSound( Format( "ambient/voices/cough%d.wav", math.random( 1, 4 ) ) )
				end
			end
		end
	end
end