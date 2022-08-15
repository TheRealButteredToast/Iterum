if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.PrintName			= "Pelican Chin-Gun"
ENT.Author				= "Death/Valk"
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
		exit=Vector(180,3,68),
		weapons={"M370 Autocannon"}
	},
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
--Listen This is Buttered Toast Orgininal gun just redid it. Cause imma not waste time on it if you wish I'll code it from scratch
--Just being honest so no one is like OHHHHHH HE USED HIS CODEE!!!! no It's Public source designed by WAC. I just used butter's for refrence.

ENT.Weapons = {
	["M370 Autocannon"] = {
		class = "wac_pod_pelicanbellygun",
		info = {
			ShootPos = Vector(505,10,28),
			ShootOffset = Vector(60, 0, 220),
			Ammo = 8500,
		}
	},
}

ENT.Camera = {
	model = "models/hunter/plates/plate.mdl",
	pos = Vector(495,10.3,24),
	offset = Vector(-1,0,0),
	viewPos = Vector(93, 0, 3.5),
	maxAng = Angle(45, 90, 0),
	minAng = Angle(-2, -90, 0),
	seat = 2
}

ENT.WeaponAttachments = {

    gunmount1 = {
		model = "models/valk/cea/unsc/pelican/turret.mdl",
		pos = Vector(495,10,28),
		offset = Vector(2,0,0)

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