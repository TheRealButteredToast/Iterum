if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.PrintName			= "Falcon"
ENT.Author				= "Death"
ENT.Category			= "Iterum Human Aircraft"
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/falcon/hvapfalcon.mdl"
ENT.EngineForce	= 65
ENT.Weight		= 8000
ENT.SmokePos		= Vector(-89.32,0,116.79)
ENT.FirePos		= Vector(22,126,135)

ENT.TopRotor = {
	dir = 1,
	pos = Vector(22,126,135),
	model = "models/falcon/falcon_rotor_right.mdl"
}

ENT.TopRotor2 = {
	dir = 1,
	pos = Vector(22,-126,135),
	angles = Angle(0,0,0),
	model = "models/falcon/falcon_rotor_right.mdl"
}

ENT.BackRotor = {
	dir = 1,
	pos = Vector(0,0,18),
	model = "models/props_junk/PopCan01a.mdl"
}

ENT.Seats = {
	{
		pos=Vector(115.55,0,35),
		exit=Vector(115.55,80,10),
	},
	{
		pos=Vector(50,21.8,30),
		exit=Vector(50,100,10),
		ang=Angle(0,180,0),
	},
	{
		pos=Vector(50,-21.8,30),
		exit=Vector(50,-100,10),
		ang=Angle(0,180,0),
	},
	{
		pos=Vector(-25,-35,25),
		exit=Vector(-50,-100,10),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(-25,35,25),
		exit=Vector(-50,100,10),
		ang=Angle(0,90,0),
	},
}

ENT.Sounds = {
	Start="WAC/pelican/start.wav",
	Blades="WAC/falcon/external.wav",
	Engine="WAC/falcon/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="WAC/Heli/fire_alarm_tank.wav",
	LowHealth="WAC/Heli/fire_alarm.wav",
	CrashAlarm="WAC/Heli/FireSmoke.wav",
}
