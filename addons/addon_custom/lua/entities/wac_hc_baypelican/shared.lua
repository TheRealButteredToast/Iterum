if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.PrintName			= "Pelican Gun-Bay"
ENT.Author				= "Toast"
ENT.Category			= "Iterum Human Aircraft"
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/valk/cea/unsc/pelican/pelican.mdl"
ENT.EngineForce	= 100
ENT.Weight		= 45000
ENT.SmokePos	= Vector(0,190,85.75)
ENT.FirePos		= Vector(0,190,85.75)

ENT.TopRotor = {
	dir = -1,
	pos = Vector(200,2,200),
	model = "models/props_junk/PopCan01a.mdl"
}

ENT.BackRotor = {
	dir = -1,
	pos = Vector(-290.5,8,305),
	model =  "models/props_junk/PopCan01a.mdl"
}



ENT.Seats = {
	{
		pos=Vector(450,11,85),
		exit=Vector(180,3,62),
	},
	{
		pos=Vector(400,33,113),
		exit=Vector(274.3,-130,10),
	},
-- WIP Below
	{
		pos=Vector(95,3,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,180,0),
		weapons={"M247H Mounted HMG"}
		
	},
--WIP Above
	{
		pos=Vector(75,-52,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,90,0),
	},
		{
		pos=Vector(105,-52,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(135,-52,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(165,-52,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(197,-52,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(227,-52,73),
		exit=Vector(-300,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(73,52,73),
		exit=Vector(-300,-40,10),
		ang=Angle(0,-90,0),
    },
	{
		pos=Vector(103,52,73),
		exit=Vector(-300,-40,10),
		ang=Angle(0,-90,0),
    },
	{
		pos=Vector(133,52,73),
		exit=Vector(-300,-40,10),
		ang=Angle(0,-90,0),
    },
	{
		pos=Vector(165,52,73),
		exit=Vector(-300,-40,10),
		ang=Angle(0,-90,0),
    },
	{
		pos=Vector(195,52,73),
		exit=Vector(-300,-40,10),
		ang=Angle(0,-90,0),
    },
	{
		pos=Vector(225,52,73),
		exit=Vector(-300,-40,10),
		ang=Angle(0,-90,0),
		
    },
	
}

ENT.WeaponAttachments = {

    gunmount1 = {
		model = "models/valk/cea/unsc/pelican/chaingun.mdl",
		pos = Vector(48,2,92),
		offset = Vector(0,0,0)

	},
}


ENT.Camera = {
	model = "models/hunter/plates/plate.mdl",
	pos = Vector(53,2,89),
	offset = Vector(0,0,0),
	viewPos = Vector(-90, 0, 0),
	maxAng = Angle(45, 180, 0),
	minAng = Angle(-2, -180, 0),
	seat = 3
}

ENT.Weapons = {
	["M247H Mounted HMG"] = {
		class = "wac_pod_pelicanreargun",
		info = {
			ShootPos = Vector(0,0,77),
			ShootOffset = Vector(-30, 0, 0),
		},
	},
}

--	{
--		pos=Vector(15,60,80),
--		exit=Vector(-300,-40,10),
--		ang=Angle(0,-90,0),
--	}, Left side

local blds = {
	"pelican/engine1.wav",
	"pelican/engine2.wav",
	"pelican/engine3.wav",
	"lfs/halo/pelican_hover.wav",
	"lfs/halo/pdist.wav"
}

local engs ={
	"pelican/rotor1.wav",
	"pelican/rotor2.wav",
	"lfs/halo/pelican_loop.wav"
}

ENT.Sounds = {
	Start="pelican/start.wav",
	Blades=table.Random(blds),
	Engine=table.Random(engs),
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="WAC/Heli/fire_alarm_tank.wav",
	LowHealth="WAC/Heli/fire_alarm.wav",
	CrashAlarm="WAC/Heli/FireSmoke.wav",
}