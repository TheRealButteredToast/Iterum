AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
//include('shared.lua')

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	if self.Entity:HasSpawnFlags(1) then
		self.Entity:GetPhysicsObject():EnableMotion( false )
	end
end

function ENT:Use( activator, caller )
end

function ENT:Think()
	if self.Pod != nil then
		local selfpos = self.Entity:GetPos()
		local selfang = self.Entity:GetAngles()
		local linepos1 = Vector(0, 0, -30)
		local linepos2 = Vector(0, 0, -2000)
		linepos1:Rotate (selfang)
		linepos2:Rotate (selfang)
		local pos5 = selfpos + linepos1
		local pos25 = selfpos + linepos2
		local tracedata = {}
		tracedata.start = pos5	
		tracedata.endpos = pos25
		tracedata.filter = self.	Entity
		local trace = util.TraceLine(tracedata)
		if trace.Hit == false then
			self.Pod.canlaunch = true
		elseif trace.Hit == true then
			self.Pod.canlaunch = false
		end
	end

	if self.Pod == nil and CurTime() > self.NextRespawn then
		local selfpos = self.Entity:GetPos()
		local selfang = self.Entity:GetAngles()
		local linepos1 = Vector(0, 0, 10)
		local linepos2 = Vector(0, 0, -50)
		linepos1:Rotate (selfang)
		linepos2:Rotate (selfang)
		local pos5 = selfpos + linepos1
		local pos25 = selfpos + linepos2
		local tracedata = {}
		tracedata.start = pos5
		tracedata.endpos = pos25
		tracedata.filter = self.Entity
		local trace = util.TraceLine(tracedata)
		if trace.Hit == false then
			local podvector = Vector( 0, 1, 0 )
			podvector:Rotate( self.Entity:GetAngles() )
			local pod = ents.Create( "insertionpod" )
			pod:SetPos( podvector + self.Entity:GetPos() )
			pod:SetAngles( Angle( ( -self.Entity:GetAngles().p ), ( self.Entity:GetAngles().y + 180), ( -self.Entity:GetAngles().r ) ))
			pod:Spawn()
			pod:SetParent(self.Entity)
			pod:Spawn()
			constraint.Weld(self.Entity, pod, 0, 0, 0, true)
			pod.Bay = self.Entity
			self.Pod = pod
		end
	end
end

function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then
		return
	end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create( "insertionpod_launcher" )
	ent:SetPos( SpawnPos + Vector( 0, 0, 200 ) )
	ent:Spawn()
	ent:Activate()
	ent.Owner = ply
	undo.Create("Pod Launcher")
		undo.AddEntity(ent)
		undo.SetPlayer(ply)
	undo.Finish()
end