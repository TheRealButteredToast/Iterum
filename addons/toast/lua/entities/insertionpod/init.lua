AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	if (self.Entity.Door == nil) then
		local doormodel = ents.Create( "insertionpod_door" )
		doormodel:SetPos( self.Entity:GetPos() )
		doormodel:SetAngles(self.Entity:GetAngles())
		doormodel:Spawn()
		doormodel:GetPhysicsObject():SetMass( 1 )
		doormodel:GetPhysicsObject():EnableDrag(  false )
		doormodel:SetParent(self.Entity)
		constraint.Weld(self.Entity, doormodel, 0, 0, 0, true)
		doormodel.pod = self.Entity
		self.Door = doormodel
		constraint.NoCollide( self.Entity, doormodel, 0, 0 )
	end
	if (self.Seat == nil) then
		local seat = ents.Create( "prop_vehicle_prisoner_pod" )
		seat:SetModel( "models/Nova/airboat_seat.mdl" ) 
		local seatoff = Vector( 0, 5, 32 )
		seatoff:Rotate (self:GetAngles())
		seat:SetPos( self.Entity:GetPos() + seatoff )
		seat:SetAngles(self:GetAngles() + Angle( 0, 0, -10 ))
		seat:SetKeyValue("vehiclescript", "scripts/vehicles/prisoner_pod.txt")
		seat:SetKeyValue("limitview", 0)
		seat:Spawn()
		seat:Activate()
		local seatTB = seat:GetTable()
		seatTB.HandleAnimation = function (vec, ply)
			return ply:SelectWeightedSequence( ACT_HL2MP_SIT ) 
		end 
		seat:SetTable(seatTB)
		seat.HPType = "Vehicle"
		seat.APPos = Vector(-20,0,-46)
		seat.APAng = Angle(0,0,180)
		seat:SetParent(self.Entity)
		constraint.Weld(self.Entity, seat, 0, 0, 0, true)
		self.Seat = seat
		self.Seat:SetColor( 255, 255, 255, 0 )
	end
	if (self.Entity.R == nil) then
		local rmodel = ents.Create( "odst_pod_r" )
		rmodel:SetPos( self.Entity:GetPos() )
		rmodel:SetAngles(self.Entity:GetAngles())
		rmodel:Spawn()
		rmodel:GetPhysicsObject():SetMass( 1 )
		rmodel:SetParent(self.Entity)
		rmodel.pod = self.Entity
		constraint.Weld(self.Entity, rmodel, 0, 0, 0, true)
		self.R = rmodel
		constraint.NoCollide( self.Entity, rmodel, 0, 0 )
	end
	if (self.Entity.L == nil) then
		local lmodel = ents.Create( "odst_pod_l" )
		lmodel:SetPos( self.Entity:GetPos() )
		lmodel:SetAngles(self.Entity:GetAngles())
		lmodel:Spawn()
		lmodel:GetPhysicsObject():SetMass( 1 )
		lmodel:SetParent(self.Entity)
		lmodel.pod = self.Entity
		constraint.Weld(self.Entity, lmodel, 0, 0, 0, true)
		self.L = lmodel
		constraint.NoCollide( self.Entity, lmodel, 0, 0 )
	end
	self.podsound = CreateSound( self.Entity, self.ChuteSnds )
end

--------dev functions

function ENT:showbox( posone, postwo )
	local effectdata = EffectData()
	effectdata:SetStart( postwo )
	effectdata:SetOrigin( posone )
	effectdata:SetScale( 1 )
	util.Effect( "HelicopterMegaBomb", effectdata )
end

--------

function ENT:landcheck()
	local podang = self.Entity:GetAngles()
	local podphys = self.Entity:GetPhysicsObject()
	local boxpos1 = Vector( -15, -15, -30 )
	local boxpos2 = Vector( 15, 15, -10 )
	boxpos1:Rotate (self.Entity:GetAngles())
	boxpos2:Rotate (self.Entity:GetAngles())
	local boxmin = boxpos1 + self.Entity:GetPos()
	local boxmax = boxpos2 + self.Entity:GetPos()
	local scanbox = ents.FindInBox( boxmin, boxmax )
	local parentent = nil
	local skipw = false
	for k, v in pairs( scanbox ) do
		if v != self.Entity && v != self.Entity.Door && v != self.Entity.Chute && v:GetPhysicsObject():IsValid() then
			if skipw == false && v:IsWorld() then
				skipw = true
				parentent = v
			elseif parentent == nil && skipw == false then
				parentent = v
			elseif skipw == false then
				if !parentent:IsWorld() && !v:IsWorld() && v:GetPhysicsObject():IsValid() && parentent:GetPhysicsObject():IsValid() then
					if parentent:GetPhysicsObject():GetVolume() < v:GetPhysicsObject():GetVolume() then
						parentent = v
					end
				end
			end
		end
	end

	if podang.p > -15 && podang.p < 15 && podang.r > -15 && podang.r < 15 then
		if parentent != nil && parentent:IsValid() then
			if parentent:IsWorld() then
				podphys:EnableMotion( false )
				self:SetNetworkedInt(  "odstpodstat",  5 )
				sound.Play( self.LandSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
				self.Stage = 6
			else
				timer.Simple(0, function()  
					constraint.Weld( self.Entity, parentent, 0, 0, 0, true )
				end)
				self.ParentEnt = parentent
				self:SetNetworkedInt(  "odstpodstat",  5 )
				sound.Play( self.LandSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
				self.Stage = 6
			end
		end
	end
end

function ENT:playerexit()
	local plyuse = self.PlayerUsing
	if plyuse != nil and CurTime() > self.NextExit then
		local spawnvector = Vector( 0, 100, 20 )

		local selfpos = self.Entity:GetPos()
		local selfang = self.Entity:GetAngles()
		local linepos1 = Vector(20, 0, 50)
		local linepos2 = Vector(100, 0, 50)
		linepos1:Rotate (selfang)
		linepos2:Rotate (selfang)
		local pos5 = selfpos + linepos2
		local pos25 = selfpos + linepos2
		local tracedata = {}
		tracedata.start = pos5
		tracedata.endpos = pos25
		tracedata.filter = self.Entity
		local trace = util.TraceLine(tracedata)

		local selfpos = self.Entity:GetPos()
		local selfang = self.Entity:GetAngles()
		local linepos1 = Vector(20, 0, 50)
		local linepos2 = Vector(0, 100, 50)
		linepos1:Rotate (selfang)
		linepos2:Rotate (selfang)
		local pos5 = selfpos + linepos2
		local pos25 = selfpos + linepos2
		local tracedata = {}
		tracedata.start = pos5
		tracedata.endpos = pos25
		tracedata.filter = self.Entity
		local trace2 = util.TraceLine(tracedata)

		if trace.Hit == true then
			spawnvector = Vector( 100, 0, 20 )
		elseif trace2.Hit == true then
			spawnvector = Vector( -100, 0, 20 )
		end
		spawnvector:Rotate (self.Entity:GetAngles())
		plyuse:ExitVehicle()
		plyuse:SetNetworkedBool( "odstisinpod", false )
		plyuse:SetNetworkedEntity( "odstpodin", nil )
--		plyuse:Spawn()
		plyuse:SetPos( self.Entity:GetPos() + spawnvector )
		plyuse:SetEyeAngles( Angle( 0, self.Entity:GetAngles().y + 90, 0) )
		plyuse:SetHealth( self.plyhealth )
		self.PlayerUsing = nil
	end
end

function ENT:podslowdown()
	local podphys = self.Entity:GetPhysicsObject()
	local podspeed = podphys:GetVelocity().z
	local slowspeed = nil
	local stblzspeed = nil
	if self.Stage == 3 then
		slowspeed = -1000 - podspeed
		stblzspeed = 2000
	end
	if self.PodFuel1 > 0 then
		if self.Stage == 5 || self.Stage == 6 then
			slowspeed = -100 - podspeed
			stblzspeed = 500
			self.PodFuel1 = self.PodFuel1 - self.FuelUse1
		end
		if slowspeed > 1 then
			local podslowdown = Vector( 0,0, 18 * slowspeed )
			podslowdown:Rotate (self.Entity:GetAngles())
			podphys:ApplyForceCenter( podslowdown )
		end
		local podstabalizeup = Vector(0,0,20)
		podstabalizeup:Rotate (self.Entity:GetAngles())
		podphys:ApplyForceOffset( Vector( 0, 0, stblzspeed ), podstabalizeup )
		local podstabalizedown = Vector(0,0,-20)
		podstabalizedown:Rotate (self.Entity:GetAngles())
		podphys:ApplyForceOffset( Vector( 0, 0, -stblzspeed ), podstabalizedown )
		----stops rotation of the pod when it is upright
		local anglevelo = podphys:GetAngleVelocity()
		local podang = self.Entity:GetAngles()
		if (podang.p > -2 && podang.p < 2 && podang.r > -2 && podang.r < 2) then
			podphys:AddAngleVelocity(Vector( -anglevelo.x, -anglevelo.y, 0))
		end
		self.PlayerUsing:SetNetworkedInt(  "odstpodf1",  self.PodFuel1 )
	end
end

function ENT:playercontrol()
	if self.PlayerUsing != nil then
		local playerriding = self.PlayerUsing
		local podphysobject = self.Entity:GetPhysicsObject()

		if playerriding:KeyDown( IN_FORWARD ) && self.PodFuel2 > 0 then
			local movedirection = Vector( 0, 10000, 0 )
			movedirection:Rotate (self.Entity:GetAngles())
			podphysobject:ApplyForceCenter( movedirection )
			self.PodFuel2 = self.PodFuel2 - self.FuelUse2
		end

		if playerriding:KeyDown( IN_BACK ) && self.PodFuel2 > 0 then
			local movedirection = Vector( 0, -10000, 0 )
			movedirection:Rotate (self.Entity:GetAngles())
			podphysobject:ApplyForceCenter( movedirection )
			self.PodFuel2 = self.PodFuel2 - self.FuelUse2
		end

		if playerriding:KeyDown( IN_MOVELEFT ) && self.PodFuel2 > 0 then
			local movedirection = Vector( -10000, 0, 0 )
			movedirection:Rotate (self.Entity:GetAngles())
			podphysobject:ApplyForceCenter( movedirection )	
			self.PodFuel2 = self.PodFuel2 - self.FuelUse2
		end

		if playerriding:KeyDown( IN_MOVERIGHT ) && self.PodFuel2 > 0 then
			local movedirection = Vector( 10000, 0, 0 )
			movedirection:Rotate (self.Entity:GetAngles())
			podphysobject:ApplyForceCenter( movedirection )
			self.PodFuel2 = self.PodFuel2 - self.FuelUse2
		end
		self.PlayerUsing:SetNetworkedInt(  "odstpodf2",  self.PodFuel2 )
	end
end

function ENT:Think()
----other functions

	if self.PlayerUsing != nil then
		if self.PlayerUsing:Alive() == false then
			sound.Play( self.LandSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
			self.Stage = 7
		end
		if self.PlayerUsing:Health() < 1 && self.PlayerUsing:Alive() == true then
			self.PlayerUsing:Kill()
		end
		if self.PlayerUsing:KeyDown( IN_RELOAD ) and self.NextOverride < CurTime() then
			if self.Override == false then
				self:SetNetworkedBool( "odstpodman", true )
				self.Override = true
			else
				self:SetNetworkedBool( "odstpodman", false )
				self.Override = false
			end
			self.NextOverride = CurTime() + 0.5
		end
	end
----stage functions
		if self.Stage == 0 then
			if self.PlayerUsing != nil then
				self:SetNetworkedInt(  "odstpodstat",  1 )
				if ( self.PlayerUsing:KeyDown( IN_ATTACK ) and self.canlaunch == true) then
					self.NextSkip = CurTime() + 0.6
					self.Entity:SetParent()
					self.Entity:Spawn()
					self.Entity:SetModel( self.Model )
					constraint.RemoveConstraints( self.Entity, "Weld" )
					constraint.Weld(self.Entity, self.Chute, 0, 0, 0, true)
					local doormodel = ents.Create( "insertionpod_door" )
					local rmodel = ents.Create( "odst_pod_r" )
					local lmodel = ents.Create( "odst_pod_l" )
					self.Door:Remove()
					self.Door = doormodel
					self.R:Remove()
					self.R = rmodel
					self.L:Remove()
					self.L = lmodel
					self.StopPush = CurTime() + 0.5
					if self.Entity.Bay != nil then
						self.Entity.Bay.Pod = nil
						self.Entity.Bay.NextRespawn = CurTime() + 3
						self.Entity.Bay = nil
					end
					self:SetNetworkedInt(  "odstpodstat",  2 )
					sound.Play( self.LaunchSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
					self.Stage = 1
				end
				if self.PlayerUsing:KeyDown( IN_USE ) then
					self:playerexit()
				end
			end
		end
---- stage 1
		if self.Stage == 1 then
			self.PlayerUsing:EnterVehicle(self.Seat)
			if self.StopPush > CurTime() then
				local movedirection = Vector( 0, 0, -8000 )
				movedirection:Rotate (self.Entity:GetAngles())
				self.Entity:GetPhysicsObject():ApplyForceCenter( movedirection )
			end
			if self.Override == true then
				if self.PlayerUsing:KeyDown( IN_ATTACK ) and self.NextSkip < CurTime() then
					self.NextSkip = CurTime() + 0.5
					self.Stage = 2
				end
				self:playercontrol()
			else
				local selfpos = self.Entity:GetPos()
				local selfang = self.Entity:GetAngles()
				local pos5 = selfpos + Vector(0, 0, -20)
				local pos25 = selfpos + Vector(0, 0, -5000)
				local tracedata = {}
				tracedata.start = pos5
				tracedata.endpos = pos25
				local trace = util.TraceLine(tracedata)
				if trace.Hit == true and trace.Entity:GetClass() != "insertionpod_launcher"  then
					self.Stage = 2
				end
			end
		end
---- stage 2
		if self.Stage == 2 then
			self.PlayerUsing:EnterVehicle(self.Seat)
			self:SetNetworkedInt(  "odstpodstat",  3 )
----
			local chutemodel = ents.Create( "odst_pod_chute" )
			chutemodel:SetPos( self.Entity:GetPos() )
			chutemodel:SetAngles(self.Entity:GetAngles())
			chutemodel:Spawn()
			chutemodel:GetPhysicsObject():SetMass( 1 )
			chutemodel:SetParent(self.Entity)
			chutemodel:Spawn()
			constraint.Weld(self.Entity, chutemodel, 0, 0, 0, true)
			chutemodel.pod = self.Entity
			self.Chute = chutemodel
			constraint.NoCollide( self.Entity, chutemodel, 0, 0 )
----
			self.podsound = CreateSound( self.Entity, self.ChuteSnds )
			self.podsound:Play()
			self.Stage = 3
		end
---- stage 3
		if self.Stage == 3 then
			self.PlayerUsing:EnterVehicle(self.Seat)
			self:podslowdown()
			if self.Override == true then
				if self.PlayerUsing:KeyDown( IN_ATTACK ) and self.NextSkip < CurTime() then
					self.NextSkip = CurTime() + 0.5
					self.Stage = 4
				end
				self:playercontrol()
			else
				local selfpos = self.Entity:GetPos()
				local selfang = self.Entity:GetAngles()
				local pos5 = selfpos + Vector(0, 0, -20)
				local pos25 = selfpos + Vector(0, 0, -2000)
				local tracedata = {}
				tracedata.start = pos5
				tracedata.endpos = pos25
				local trace = util.TraceLine(tracedata)
				if trace.Hit == true then
					self.Stage = 4
				end
			end
		end
---- stage 4
		if self.Stage == 4 then
			self.PlayerUsing:EnterVehicle(self.Seat)
			self:SetNetworkedInt(  "odstpodstat",  4 )
			self.Chute:SetParent()
			constraint.RemoveConstraints( self.Chute, "Weld" )
			self.Chute:Remove()

			local chutemodel = ents.Create( "prop_ragdoll" )
			chutemodel:SetModel( "models/odst/pod/drop_pod_chute.mdl" )
			chutemodel:SetPos( self.Entity:GetPos() )
			chutemodel:SetAngles(self.Entity:GetAngles())
			chutemodel:Spawn()
			self.Chute = chutemodel

			self.Entity.CRemoveTime = CurTime() + odstcrtime
			self.podsound:Stop()
			self.podsound = CreateSound( self.Entity, self.ThrusSnds )
			self.podsound:Play()
			self.Stage = 5
		end
---- stage 5
		if self.Stage == 5 then
			self.PlayerUsing:EnterVehicle(self.Seat)
			if self.Override == false && self.Chute:IsValid() then
				self:podslowdown()
			end
			if self.Entity.CRemoveTime < CurTime() then
				if self.Chute:IsValid() then
					self.Chute:Remove()
				end
			end

			if self.Override == true then
				if self.PlayerUsing:KeyDown( IN_ATTACK ) and self.NextSkip < CurTime() then
					self.NextSkip = CurTime() + 0.5
					self:SetNetworkedInt(  "odstpodstat",  5 )
					self.Stage = 6
				end
				if self.PlayerUsing:KeyDown( IN_SPEED ) then
					self:podslowdown()
				end
				self:playercontrol()
			end
		end
---- stage 6
		if self.Stage == 6 then
			if self.CoverGone == false then
				self.PlayerUsing:EnterVehicle(self.Seat)
			end
			self.podsound:Stop()
			welds = constraint.FindConstraints( self.Entity, "weld" )
			if !welds[2] != nil && self.Entity:GetPhysicsObject():IsMoveable()  then
				if self.Override == false then
					self:podslowdown()
				elseif self.PlayerUsing:KeyDown( IN_ATTACK ) then
					self:podslowdown()
				end
			end
			if self.PlayerUsing != nil then
				if self.Entity.CRemoveTime < CurTime() then
					if self.Chute:IsValid() then
						self.Chute:Remove()
					end
				end
				if self.Entity:WaterLevel() == 3 && self.Override == false then
					if self.Override == true && self.Entity:WaterLevel() == 3 == true && self.PlayerUsing:KeyDown( IN_ATTACK ) == true then
						self.Entity:SetModel( self.Model )
						local doormodel = ents.Create( "insertionpod_door" )
						local rmodel = ents.Create( "odst_pod_r" )
						local lmodel = ents.Create( "odst_pod_l" )
						doormodel:SetPos( self.Entity:GetPos() )
						doormodel:SetAngles(self.Entity:GetAngles())
						doormodel:Spawn()
						doormodel.pod = self.Entity
						rmodel:SetPos( self.Entity:GetPos() )
						rmodel:SetAngles(self.Entity:GetAngles())
						rmodel:Spawn()
						lmodel:SetPos( self.Entity:GetPos() )
						lmodel:SetAngles(self.Entity:GetAngles())
						lmodel:Spawn()
						self.Door = doormodel
						self.R = rmodel
						self.L = lmodel
						local movedirection = Vector( 0, 1000, 0 )
						movedirection:Rotate (self.Entity:GetAngles())
						self.Door:GetPhysicsObject():SetVelocity( movedirection )
						self.R:GetPhysicsObject():SetVelocity( movedirection )
						self.L:GetPhysicsObject():SetVelocity( movedirection )
						sound.Play( self.HatchSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
						self.CoverGone = true
					end
					local doormodel = ents.Create( "insertionpod_door" )
					local rmodel = ents.Create( "odst_pod_r" )
					local lmodel = ents.Create( "odst_pod_l" )
					self.NextSkip = CurTime() + 0.6
					self.Entity:SetParent()
					self.Entity:SetModel( self.Model )
					constraint.RemoveConstraints( self.Entity, "Weld" )
					constraint.Weld(self.Entity, self.Chute, 0, 0, 0, true)
					self.Door:Remove()
					self.Door = doormodel
					self.R:Remove()
					self.R = rmodel
					self.L:Remove()
					self.L = lmodel
					self.StopPush = CurTime() + 0.5
				end
				if self.PlayerUsing:KeyDown( IN_ATTACK ) && self.NextSkip < CurTime() && self.CoverGone == false then
					self.Entity:SetModel( self.Model )
					local doormodel = ents.Create( "insertionpod_door" )
					local rmodel = ents.Create( "odst_pod_r" )
					local lmodel = ents.Create( "odst_pod_l" )
					doormodel:SetPos( self.Entity:GetPos() )
					doormodel:SetAngles(self.Entity:GetAngles())
					doormodel:Spawn()
					doormodel.pod = self.Entity
					rmodel:SetPos( self.Entity:GetPos() )
					rmodel:SetAngles(self.Entity:GetAngles())
					rmodel:Spawn()
					lmodel:SetPos( self.Entity:GetPos() )
					lmodel:SetAngles(self.Entity:GetAngles())
					lmodel:Spawn()
					self.Door = doormodel
					self.R = rmodel
					self.L = lmodel
					local movedirection = Vector( 0, 1000, 0 )
					movedirection:Rotate (self.Entity:GetAngles())
					self.Door:GetPhysicsObject():SetVelocity( movedirection )
					self.R:GetPhysicsObject():SetVelocity( movedirection )
					self.L:GetPhysicsObject():SetVelocity( movedirection )
					sound.Play( self.HatchSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
					self.CoverGone = true
				end
				if self.PlayerUsing:KeyDown( IN_ATTACK2 ) && self.NextSkip < CurTime() && self.CoverGone == false then
					self.Entity:SetModel( self.Model )
					local doormodel = ents.Create( "insertionpod_door" )
					local rmodel = ents.Create( "odst_pod_r" )
					local lmodel = ents.Create( "odst_pod_l" )
					doormodel:SetPos( self.Entity:GetPos() )
					doormodel:SetAngles(self.Entity:GetAngles())
					doormodel:Spawn()
					doormodel.pod = self.Entity
					rmodel:SetPos( self.Entity:GetPos() )
					rmodel:SetAngles(self.Entity:GetAngles())
					rmodel:Spawn()
					lmodel:SetPos( self.Entity:GetPos() )
					lmodel:SetAngles(self.Entity:GetAngles())
					lmodel:Spawn()
					self.Door = doormodel
					self.R = rmodel
					self.L = lmodel
					local movedirection = Vector( 0, 100, 0 )
					movedirection:Rotate (self.Entity:GetAngles())
					self.Door:GetPhysicsObject():SetVelocity( movedirection )
					self.R:GetPhysicsObject():SetVelocity( movedirection )
					self.L:GetPhysicsObject():SetVelocity( movedirection )
					sound.Play( self.HatchSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
					self.CoverGone = true
				end
				if self.PlayerUsing:KeyDown( IN_USE ) and self.CoverGone == true then
					self:playerexit()
					self.Entity.RemoveTime = CurTime() + odstrtime
					self.Entity.CRemoveTime = CurTime() + odstcrtime
					self.Stage = 7
				end
			end
		end
---- stage 7
		if self.Stage == 7 then
			self.podsound:Stop()
			local plyuse = self.PlayerUsing
			if plyuse != nil then
				plyuse:UnSpectate()
				plyuse:SetParent()
				plyuse:SetNetworkedBool( "odstisinpod", false )
				plyuse:SetNetworkedEntity( "odstpodin", nil )
				if self.Door != nil then
					self.Door:SetParent()
				end
				self.Entity:SetParent()
				constraint.RemoveConstraints( self.Entity, "Weld" )
				self.Entity.RemoveTime = CurTime() + 30
				self.Entity.PlayerUsing = nil
			end
			if self.Entity.Bay != nil then
				self.Entity.Bay.Pod = nil
				self.Entity.Bay.NextRespawn = CurTime() + 3
				self.Entity.Bay = nil
			end
			if self.Entity.CRemoveTime < CurTime() then
				if self.Chute != nil then
					if self.Chute:IsValid() then
						self.Chute:Remove()
					end
				end
			end
			if self.Entity.RemoveTime < CurTime() then
				if self.Door != nil then
					self.Door:Remove()
				end
				if self.R != nil then
					self.R:Remove()
				end
				if self.L != nil then
					self.L:Remove()
				end
				if self.Seat != nil then
					self.Seat:Remove()
				end
				self.Entity:Remove()
			end
		end
		self.Entity:NextThink( CurTime() )
		return true
	end

	function ENT:Touch( hitEnt )
	end

	function ENT:Remove()
		if self.Chute != nil then
			if self.Chute:IsValid() then
				self.Chute:Remove()
			end
		end
		self.Door:Remove()
		self.R:Remove()
		self.L:Remove()
		self.Seat:Remove()
	end


	function ENT:SpawnFunction( ply, tr )
		if ( !tr.Hit ) then
			return
		end
		local SpawnPos = tr.HitPos + tr.HitNormal * 16
		local ent = ents.Create( "odst_drop_pod" )
		ent:SetPos( SpawnPos )
		ent:Spawn()
		ent:Activate()
		ent.Owner = ply
	end

	function ENT:OnTakeDamage( dmg )
		if dmg:GetInflictor():GetClass() != "odst_drop_pod" then
			if self.Stage > 0 && self.Stage < 7 then
				local oldhealth = self.Entity.PodHealth
				self.Entity.PodHealth = oldhealth - dmg:GetDamage()
			end
		end
	end

	function ENT:PhysicsCollide( data, physobj )
		local podang = self.Entity:GetAngles()
		local podphys = self.Entity:GetPhysicsObject()
		local coldelta = data.OurOldVelocity:Length() - self.Entity:GetVelocity():Length()
		if self.PlayerUsing != nil && self.Stage > 0 && (data.HitEntity:GetPhysicsObject():GetMass() > 100 || data.HitEntity:IsWorld() ) then
			if podang.p > -30 && podang.p < 30 && podang.r > -30 && podang.r < 30 then
				local plyin = self.PlayerUsing
				local plyhealth = plyin:Health()
				if coldelta > 700 then
					plyin:SetHealth( plyhealth - 0 ) --sets the damage for when you land too fast
					self.plyhealth = plyhealth - 0
				elseif coldelta > 650 then
					plyin:SetHealth( plyhealth - 0 )
					self.plyhealth = plyhealth - 0
				elseif coldelta > 500 then
					plyin:SetHealth( plyhealth - 0 )
					self.plyhealth = plyhealth - 0
				elseif coldelta > 550 then
					plyin:SetHealth( plyhealth - 0 )
					self.plyhealth = plyhealth - 0
				end
			else
				local plyin = self.PlayerUsing
				local plyhealth = plyin:Health()
				if coldelta > 550 then
					plyin:SetHealth( plyhealth - 100 )
					self.plyhealth = plyhealth - 100
				elseif coldelta > 450 then
					plyin:SetHealth( plyhealth - 75 )
					self.plyhealth = plyhealth - 75
				elseif coldelta > 350 then
					plyin:SetHealth( plyhealth - 50 )
					self.plyhealth = plyhealth - 50
				elseif coldelta > 300 then
					plyin:SetHealth( plyhealth - 25 )
					self.plyhealth = plyhealth - 25
				end
			end
		end
		if self.Stage == 1 && data.HitEntity:GetClass() != "insertionpod_launcher" && self.Override == false then
			self.Stage = 2
		end
		if data.HitNormal.z > 0.5 || data.HitNormal.z < -0.5 then
			if podang.p > -30 && podang.p < 30 && podang.r > -30 && podang.r < 30 then
				if self.Stage == 5 || self.Stage == 6 then
				if data.DeltaTime > 0.9 then
					local effectdata = EffectData()
						effectdata:SetOrigin( self.Entity:GetPos() )
						effectdata:SetScale( 1 )
					util.Effect( "odstdroppodland", effectdata )
				end
					if data.HitEntity:IsWorld() then
						podphys:EnableMotion( false )
						self:SetNetworkedInt(  "odstpodstat",  5 )
						sound.Play( self.LandSnds[ math.random( 1, 3 ) ], self:GetPos(), 100, 100 )
						self.Stage = 6
					else
						self:landcheck()
					end
				end
			end
		end
	end
	
	local odstpodseat = false
local UsesThirdPersonView = false
local odstpod = NULL

local MaxDist = 2000
local MinDist = 100
local MoveSmooth = 0.05
local AngSmooth = 0.05
local wasTurnedOn = false
local view = {}

local viewLastPos = Vector(0,0,0)
local viewLastAng = Angle(0,0,0)

function odstpod_ThirdPersonView(ply, position, angles, fov)
	if !ply:Alive() then return end
	if ply:GetActiveWeapon() == "Camera" then return end
	if GetViewEntity() != ply then return end

	odstpod = LocalPlayer():GetVehicle()
	if IsValid(odstpod) then
		odstpodent= odstpod:GetNetworkedEntity( "odstpodParent" )
		UsesThirdPersonView =  ply:GetNetworkedInt( "UseodstpodThirdPersonView" )	
	else
		odstpodent = NULL
		UsesThirdPersonView = 0
	end


	if IsValid(odstpodent) and UsesThirdPersonView != 0 then
		if wasTurnedOn == false then
			wasTurnedOn = true
			viewLastPos = position
			viewLastAng = angles			
		end	
		
		if UsesThirdPersonView == 1 then

			local wantedAng = angles
			wantedAng.p = wantedAng.p - odstpodent:GetAngles().p		
			local wantedPos = odstpodent:GetPos() + wantedAng:Forward() * -500
			
			local Trace = {}
			Trace.start = odstpodent:GetPos()
			Trace.endpos = wantedPos
			Trace.mask = MASK_NPCWORLDSTATIC
			local tr = util.TraceLine(Trace)
					
			if tr.Hit then
				wantedPos = tr.HitPos + tr.HitNormal * 10
			end	
	
			view.origin = wantedPos
			view.angles = angles
			view.fov = fov
			return view			
		elseif UsesThirdPersonView == 2 then


			local newPos = odstpodent:GetPos() + odstpodent:GetForward() * -600 + odstpodent:GetUp() * 200
			
			local Trace = {}
			Trace.start = odstpodent:GetPos()
			Trace.endpos = newPos
			Trace.mask = MASK_NPCWORLDSTATIC
			local tr = util.TraceLine(Trace)
			
			if tr.Hit then
				newPos = tr.HitPos + tr.HitNormal * 10
			end				
			
			local dist = viewLastPos:Distance( newPos )
			local lerpy = math.Clamp(  0.5 * dist * FrameTime() * MoveSmooth, 0,1)
			newPos = LerpVector( lerpy, viewLastPos, newPos)
			lerpy = math.Clamp(  50 * FrameTime() * AngSmooth, 0,1)
			local newAng = LerpAngle( lerpy, viewLastAng, AirVehicleEnt:GetAngles() )

			view.origin = newPos
			view.angles = newAng
			viewLastPos = newPos
			viewLastAng = newAng
			view.fov = fov			
			return view		
		end
	else
		wasTurnedOn = false
	end
end
hook.Add("CalcView", "odstpod_ThirdPersonView", odstpod_ThirdPersonView)

function ENT:CheckForViewChange( ply )
	if ply:KeyDown( IN_RELOAD ) and (ply.odstpod_ThirdPersonViewDel == nil or ply.odstpod_ThirdPersonViewDel < CurTime()) then
		ply.odstpod_ThirdPersonViewDel = CurTime() + 0.5
		if ply.odstpod_ThirdPersonView then
			ply.odstpod_ThirdPersonView = false
			ply:SetNetworkedBool( "UseodstpodThirdPersonView", 0)	
		else
			ply.odstpod_ThirdPersonView = true
			ply:SetNetworkedBool( "UseodstpodThirdPersonView", 2)
		end
	end		
end
	

