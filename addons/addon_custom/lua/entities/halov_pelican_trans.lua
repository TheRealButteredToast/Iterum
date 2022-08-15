ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.Base = "haloveh_base"
ENT.Type = "vehicle"

ENT.PrintName = "D77H-TCI Pelican Transport"
ENT.Author = "Toast"
--- BASE AUTHOR: Liam0102 ---
ENT.Category = "Halo Vehicles: UNSC"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

ENT.EntModel = "models/valk/cea/unsc/pelican/pelican.mdl"
ENT.Vehicle = "halov_pelican_trans"
ENT.StartHealth = 5000;
ENT.Allegiance = "UNSC";

ENT.DoorsModel = "models/valk/cea/unsc/pelican/pelican.mdl"
ENT.ClosedModel = "models/valk/cea/unsc/pelican/pelican.mdl"

list.Set("HaloVehicles", ENT.PrintName, ENT);

if SERVER then

ENT.NextUse = {Doors = CurTime(),Use = CurTime(),Fire = CurTime(),Switch=CurTime(),};

AddCSLuaFile();
function ENT:SpawnFunction(pl, tr)
	local e = ents.Create("halov_pelican_trans");
	e:SetPos(tr.HitPos + Vector(0,0,20));
	e:SetAngles(Angle(0,pl:GetAimVector():Angle().Yaw+0,0));
	e:Spawn();
	e:Activate();
	return e;
end

function ENT:Initialize()

	self:SetNWInt("Health",self.StartHealth);
	
	self.WeaponLocations = {
        Left = self:GetPos()+self:GetForward()*125+self:GetUp()*75+self:GetRight()*-154,
        Right = self:GetPos()+self:GetForward()*125+self:GetUp()*75+self:GetRight()*160,
    }
    self.WeaponsTable = {};
	
	self.BoostSpeed = 2000;
	self.ForwardSpeed = 2000;
	self.UpSpeed = 500;
	self.AccelSpeed = 10;
	self.CanBack = false;
	self.CanStrafe = true;
	self.Cooldown = 2;
	self.CanShoot = false;
	self.HasDoors = true;
	self.Hover = true;
	self.Doors = false;
	
	self.ExitModifier = {x=0,y=170,z=70};
	--testexit-- self.ExitModifier = {x=20.5,y=345,z=70};
	self.PilotOffset = {x=0,y=444,z=86};

    self.PilotVisible = true;
    self.PilotPosition = {x=0,y=444,z=87}
	self.SeatPos = {
            
		{self:GetPos()+self:GetForward()*207+self:GetUp()*70+self:GetRight()*60,self:GetAngles()+Angle(0,90,-7)},
		{self:GetPos()+self:GetForward()*176+self:GetUp()*70+self:GetRight()*60,self:GetAngles()+Angle(0,90,-7)},
		{self:GetPos()+self:GetForward()*145.5+self:GetUp()*70+self:GetRight()*60,self:GetAngles()+Angle(0,90,-7)},
		{self:GetPos()+self:GetForward()*114.5+self:GetUp()*70+self:GetRight()*60,self:GetAngles()+Angle(0,90,-7)},
		{self:GetPos()+self:GetForward()*83.5+self:GetUp()*70+self:GetRight()*60,self:GetAngles()+Angle(0,90,-7)},
            
		{self:GetPos()+self:GetForward()*207+self:GetUp()*70+self:GetRight()*-60,self:GetAngles()+Angle(0,-90,-7)},
		{self:GetPos()+self:GetForward()*176+self:GetUp()*70+self:GetRight()*-60,self:GetAngles()+Angle(0,-90,-7)},
		{self:GetPos()+self:GetForward()*145.5+self:GetUp()*70+self:GetRight()*-60,self:GetAngles()+Angle(0,-90,-7)},
		{self:GetPos()+self:GetForward()*114.5+self:GetUp()*70+self:GetRight()*-60,self:GetAngles()+Angle(0,-90,-7)},
		{self:GetPos()+self:GetForward()*83.5+self:GetUp()*70+self:GetRight()*-60,self:GetAngles()+Angle(0,-90,-7)},
	}
	self:SpawnSeats();
	self.HasLookaround = true;
	self.BaseClass.Initialize(self);
	
	self:ToggleDoors()
end

function ENT:SpawnSeats()
	self.Seats = {};
	for k,v in pairs(self.SeatPos) do
		local e = ents.Create("prop_vehicle_prisoner_pod");
		e:SetPos(v[1]);
		e:SetAngles(v[2]+Angle(0,-90,0));
		e:SetParent(self);		
		e:SetModel("models/nova/airboat_seat.mdl");
		e:SetRenderMode(RENDERMODE_TRANSALPHA);
		e:SetColor(Color(255,255,255,0));	
		e:Spawn();
		e:Activate();
		e:SetUseType(USE_OFF);
		e:GetPhysicsObject():EnableMotion(false);
		e:GetPhysicsObject():EnableCollisions(false);
		e.IsHALOV_Pelican_transSeat = true;
		e.HALOV_Pelican = self;
		self.Seats[k] = e;
	end

end
    
function ENT:Enter(p)
    self.BaseClass.Enter(self,p);
end
    
function ENT:Exit(kill)
    local p = self.Pilot;
	self.NextUse.Doors = CurTime() + 1 -- Base already calls ToggleDoors, but we only want to call it on the inverse of the standard, so we befuddle then...
	self.BaseClass.Exit(self,kill);
	if !self.Doors then
		self.NextUse.Doors = CurTime() - 1	-- Unbeffudle, assuming the doors are in the open state [false, in our case]
		self:ToggleDoors()
	end
end
	
function ENT:ToggleDoors()
	if(self.NextUse.Doors < CurTime()) then
		if(self.Doors) then
			self:SetBodygroup(2,1)
			self.Doors = false;
		else
			self.Doors = true;
			self:SetBodygroup(2,0)
		end
		self:SetNWBool("Doors",self.Doors);
		if(IsValid(self.Pilot)) then
			self.Pilot:SetNWBool("HALO_Doors",self.Doors);
		end
		self.NextUse.Doors = CurTime() + 1;
	end
end

hook.Add("PlayerEnteredVehicle","HALOV_Pelican_transSeatEnter", function(p,v)
	if(IsValid(v) and IsValid(p)) then
		if(v.IsHALOV_PelicanSeat_trans) then
			p:SetNetworkedEntity("HALOV_Pelican_trans",v:GetParent());
            p:SetNetworkedEntity("HALOV_Pelican_trans_Seat",v);
		end
	end
end);

hook.Add("PlayerLeaveVehicle", "HALOV_Pelican_transSeatExit", function(p,v)
	if(IsValid(p) and IsValid(v)) then
		if(v.IsHALOV_PelicanSeat_trans) then
            if(v.HALOV_Pelican_transFrontSeat) then
                local self = v:GetParent();
                p:SetPos(self:GetPos()+self:GetForward()*270+self:GetUp()*170);
            else
                p:SetPos(v:GetPos()+v:GetForward()*37+v:GetUp()*5+v:GetRight()*0);
            end
			p:SetNetworkedEntity("HALOV_Pelican_trans",NULL);
            p:SetNetworkedEntity("HALOV_Pelican_trans_Seat",NULL);
		end
	end
end);

function ENT:Passenger(p)
	if(self.NextUse.Use > CurTime()) then return end;
	for k,v in pairs(self.Seats) do
		if(v:GetPassenger(1) == NULL) then
			p:EnterVehicle(v);
			return;			
		end
	end
end


function ENT:Use(p)
	if(not self.Inflight) then
		if(!p:KeyDown(IN_WALK)) then
            local min = self:GetPos()+self:GetForward()*300+self:GetUp()*60+self:GetRight()*-50;
            local max = self:GetPos()+self:GetForward()*450+self:GetUp()*150+self:GetRight()*50
            for k,v in pairs(ents.FindInBox(min,max)) do
               if(v == p) then
                    self:Enter(p);
                    break;
                end
            end	
		else
			self:Passenger(p);
		end
	else
		if(p != self.Pilot) then
			self:Passenger(p);
		end
	end
end
end

if CLIENT then
	
	ENT.CanFPV = true;
	ENT.Sounds={
		Engine=Sound("vehicles/pelican_fly.wav"),
    }
	
	function ENT:Initialize()
		self.Emitter = ParticleEmitter(self:GetPos());
		self.BaseClass.Initialize(self);
	end
	
	function ENT:Effects()
		local p = LocalPlayer();
		local roll = math.Rand(-45,45);
		local normal = (self.Entity:GetRight() * -1):GetNormalized();
		local FWD = self:GetRight();
		local id = self:EntIndex();
		if(!self:GetNWBool("Doors")) then
			for k,v in pairs(self.HALOV_Pelican_transFEnginePos) do

				local heatwv = self.Emitter:Add("sprites/heatwave",v+FWD*25);
				heatwv:SetVelocity(normal*2);
				heatwv:SetDieTime(0.01);
				heatwv:SetStartAlpha(255);
				heatwv:SetEndAlpha(255);
				heatwv:SetStartSize(30);
				heatwv:SetEndSize(25);
				heatwv:SetColor(255,255,255);
				heatwv:SetRoll(roll);
				
				local blue = self.FXEmitter:Add("sprites/bluecore",v+FWD*25)
				blue:SetVelocity(normal)
				blue:SetDieTime(0.05)
				blue:SetStartAlpha(95)
				blue:SetEndAlpha(20)
				blue:SetStartSize(20)
				blue:SetEndSize(1)
				blue:SetRoll(roll)
				blue:SetColor(255,255,255)

			end
		else
			for k,v in pairs(self.HALOV_Pelican_transEnginePos) do

				local heatwv = self.Emitter:Add("sprites/heatwave",v+FWD*25);
				heatwv:SetVelocity(normal*2);
				heatwv:SetDieTime(0.01);
				heatwv:SetStartAlpha(255);
				heatwv:SetEndAlpha(255);
				heatwv:SetStartSize(30);
				heatwv:SetEndSize(25);
				heatwv:SetColor(255,255,255);
				heatwv:SetRoll(roll);
				
				local blue = self.FXEmitter:Add("sprites/bluecore",v+FWD*25)
				blue:SetVelocity(normal)
				blue:SetDieTime(0.05)
				blue:SetStartAlpha(95)
				blue:SetEndAlpha(20)
				blue:SetStartSize(20)
				blue:SetEndSize(1)
				blue:SetRoll(roll)
				blue:SetColor(255,255,255)

			end
		end
	end
	
	function ENT:Think()
		local p = LocalPlayer();
		local Flying = self:GetNWBool("Flying".. self.Vehicle);
		if(Flying) then
			self.HALOV_Pelican_transFEnginePos = {
				self:GetPos()+self:GetForward()*-500+self:GetUp()*280+self:GetRight()*85,
				self:GetPos()+self:GetForward()*-500+self:GetUp()*280+self:GetRight()*-130,
				
				self:GetPos()+self:GetForward()*35+self:GetUp()*212+self:GetRight()*-215,
				self:GetPos()+self:GetForward()*35+self:GetUp()*212+self:GetRight()*165,
			}
			self.HALOV_Pelican_transEnginePos = {
				self:GetPos()+self:GetForward()*-435+self:GetUp()*140+self:GetRight()*85,
				self:GetPos()+self:GetForward()*-435+self:GetUp()*140+self:GetRight()*-130,
				
				self:GetPos()+self:GetForward()*45+self:GetUp()*80+self:GetRight()*-215,
				self:GetPos()+self:GetForward()*45+self:GetUp()*80+self:GetRight()*165,
			}
			self:Effects();
		end
		self.BaseClass.Think(self)
	end
	
	local View = {}
	local lastpos, lastang;
	local function HALOV_Pelican_transCalcView()
		
		local p = LocalPlayer();
		local self = p:GetNWEntity("halov_pelican_trans",NULL)
        local flying = p:GetNWBool("FlyingHALOV_Pelican_trans");
		local pos,face;
        if(flying) then
            if(IsValid(self)) then
                local fpvPos = self:GetPos()+self:GetRight()*0+self:GetForward()*443+self:GetUp()*106;
                if(LightSpeed == 2 and !self:GetFPV()) then
                    pos = lastpos;
                    face = lastang;

                    View.origin = pos;
                    View.angles = face;
                else
                    pos = self:GetPos()+self:GetUp()*650+LocalPlayer():GetAimVector():GetNormal()*-1300;			
                    face = ((self:GetPos() + Vector(0,0,100))- pos):Angle()
                    View =  HALOVehicleView(self,1000,450,fpvPos,true);
                end

                lastpos = pos;
                lastang = face;

                return View;
            end
        else
            local v = p:GetNWEntity("HALOV_PelicanSeat",NULL);
            if(IsValid(v)) then
                if(v:GetThirdPersonMode()) then
                    return HALOVehicleView(self,1100,450,fpvPos);
                end
            end
        end
	end
	hook.Add("CalcView", "HALOV_Pelican_transView", HALOV_Pelican_transCalcView)
end