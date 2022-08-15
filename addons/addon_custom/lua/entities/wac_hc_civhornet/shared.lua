if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.PrintName			= "Hornet Transport"
ENT.Author				= "Toast"
ENT.Category			= "Iterum Human Aircraft"
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/hornetmdl/hornethvap.mdl"
ENT.EngineForce	= 40
ENT.Weight		= 5000
ENT.SmokePos		= Vector(-15.37,0,-2.86)
ENT.FirePos		= Vector(-30,-109,125)


ENT.TopRotor = {
	dir = 1,
	pos = Vector(-30,109,125),
	model = "models/valk/h3/unsc/hornet/hornet_blade.mdl"
}

ENT.TopRotor2 = {
	dir = -1,
	pos = Vector(-30,-109,125),
	angles = Angle(0,0,0),
	model = "models/valk/h3/unsc/hornet/hornet_blade.mdl"
}

ENT.BackRotor = {
	dir = 1,
	pos = Vector(0,0,53),
	model = "models/props_junk/PopCan01a.mdl"
}

ENT.Seats = {
	{
		pos=Vector(60,0,35),
		exit=Vector(80,40,5),
	},
	{
		pos=Vector(35,37,14),
		ang=Angle(0,70,0),
		exit=Vector(40,70,5),
	},
	{
		pos=Vector(10,40,14),
		ang=Angle(0,70,0),
		exit=Vector(10,80,5),
	},
	{
		pos=Vector(35,-37,14),
		ang=Angle(0,-70,0),
		exit=Vector(40,-70,5),
	},
	{
		pos=Vector(10,-40,14),
		ang=Angle(0,-70,0),
		exit=Vector(10,-80,5),
	},
}

ENT.Sounds = {
	Start="WAC/hornet/start.wav",
	Blades="lfs/halo/hornet_loop.wav",
	Engine="lfs/halo/hornet_lod.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="WAC/Heli/fire_alarm_tank.wav",
	LowHealth="WAC/Heli/fire_alarm.wav",
	CrashAlarm="WAC/Heli/FireSmoke.wav",
}