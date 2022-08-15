AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()
	self.Entity:SetModel( self.Model )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use( activator, caller )
	if ( activator:IsPlayer() and self.pod.Stage == 0 ) then
		if self.pod.PlayerUsing == nil then
			activator:EnterVehicle( self.pod.Seat )
			activator:SetNetworkedBool( "odstpodman", false )
			activator:SetNetworkedBool( "odstisinpod", true )
			activator:SetNetworkedEntity( "odstpodin", self.pod )
			activator:SetNetworkedInt(  "odstpodstat",  1 )
			self.pod.PlayerUsing = activator
			self.pod.plyhealth = activator:Health()
			self.pod.NextExit = CurTime() + 0.5
			activator:SetNetworkedInt(  "odstpodf1",  self.pod.PodFuel1 )
			activator:SetNetworkedInt(  "odstpodf2",  self.pod.PodFuel2 )
		end
	end
end

function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then
		return
	end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create( "odst_pod_door" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	ent.Owner = ply
end