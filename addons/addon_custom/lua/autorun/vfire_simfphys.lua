if SERVER then 
	local NAK_CONVAR = { FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE }

	CreateConVar("vfire_simfphys_compatibilitymode", "0", NAK_CONVAR, "If = 1: Don't hide Simfphys fake fire (RESPAWN VEHICLE ON TOGGLE)",0,1)
	CreateConVar("vfire_simfphys_firebeforeboom", "5", NAK_CONVAR, "Time before exploding after reaching 0 health. (-1 to disable)",-1,120)

	local function GetSimfEnginePos(self)
		local Attachment = self:GetAttachment( self:LookupAttachment( "vehicle_engine" ) )
		local pos = self:GetPos()
		
		if Attachment then
			pos = Attachment.Pos
		end
		
		if not self.EnginePos then
			local vehiclelist = list.Get( "simfphys_vehicles" )[ self:GetSpawn_List() ]
			
			if vehiclelist then
				self.EnginePos = vehiclelist.Members.EnginePos or false
			else
				self.EnginePos = false
			end
			
		elseif isvector( self.EnginePos ) then
			pos = self:LocalToWorld( self.EnginePos )
		end
		
		return pos
	end

	local function vFireSimfStartFunc()
	
		if vFireInstalled then

			hook.Add("Think", "vFireSimfphys", function() 
				if !vFireInstalled then return end
				for k,ent in pairs(ents:GetAll()) do
					if ( ent:GetClass() == "gmod_sent_vehicle_fphysics_base" ) then
					
						-- if true then return end
						
						local simf_dont_overwrite = GetConVar( "vfire_simfphys_compatibilitymode" ):GetBool()
						if simf_dont_overwrite == false then
							ent.SetOnFire = function() return end
						end
						
						if ent:GetCurHealth() == 0 then
						
							local simf_vfireboom_timer = GetConVar( "vfire_simfphys_firebeforeboom" ):GetInt()
							
							if simf_vfireboom_timer == -1 then return end
							if ent.vFireDeathCountDown then return end
							ent.vFireDeathCountDown = true
							
							timer.Simple( 0.5 , function()     --this is to make the normal duplicator not break and catch on fire after dupe (prolly save too)
								if IsValid(ent) and ent:GetCurHealth() == 0 then
									newFireBallEnt = CreateVFireBall(30, 15, ent:GetPos(), Vector(0, 50, 0), nil)
									timer.Simple( simf_vfireboom_timer , function()     
										if IsValid(ent) then
											ent:ExplodeVehicle()
										end
									end)
								else
									ent.vFireDeathCountDown = false
								end
							end)

						end
						
						if ent:GetCurHealth() <= (ent:GetMaxHealth() * 0.3) then
						
							
							if not IsValid(ent.vFireEnt) and not ent.vFireSpawned then 
								ent.vFireEnt = CreateVFire(ent, GetSimfEnginePos(ent), Vector(0, 0, 1), 15)	
								ent.vFireSpawned = true
								ent.vFireLastHealth = ent:GetCurHealth()
							end	
							
							if not !ent.vFireLastHealth and (ent.vFireLastHealth > ent:GetCurHealth()) then
								ent.vFireSpawned = false
								ent.vFireLastHealth = 0
							end
							
						else 
							ent.vFireSpawned = false
						end
						
					end
				end
			end )
			
		else
			

			timer.Simple( 8 , function()     
				PrintMessage( HUD_PRINTTALK, "[vFireSimf] vFire not detected, Simfphys will not replace default client fire with vFire!" )
			end)
			timer.Simple( 12 , function()     
				PrintMessage( HUD_PRINTTALK, "[vFireSimf] :(" )
			end)
			timer.Simple( 16 , function()     
				PrintMessage( HUD_PRINTTALK, "[vFireSimf] You don't get cookies >:(" )
			end)
			-- CRY MAMA CRIIIII! YOU HAVE UPSET THE SIMFPHYS VFIRE GOD! YOU MUST FEEL BAD MWAHAHAHAHAHAHAHAHA idfk lol
		end
	end
	
	-- vFireSimfStartFunc()
	--only run code on full server start
	hook.Add( "Initialize", "vFireSimfphysStart", vFireSimfStartFunc )

	-- yea i know my codes shit now shoooooooo 
end
