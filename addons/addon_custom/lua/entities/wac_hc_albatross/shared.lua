if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"
ENT.PrintName			= "Albatross"
ENT.Author				= "Death/Valk"
ENT.Category			= "Iterum Human Aircraft"
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/valk/h3/unsc/albatross/albatross.mdl"
ENT.EngineForce	= 150
ENT.Weight		= 15000
ENT.SmokePos	= Vector(0,190,85.75)
ENT.FirePos		= Vector(0,190,85.75)

ENT.TopRotor = {
	dir = -1,
	pos = Vector(350,2,200),
	model = "models/props_junk/PopCan01a.mdl"
}

ENT.BackRotor = {
	dir = -1,
	pos = Vector(-290.5,8,305),
	model =  "models/props_junk/PopCan01a.mdl"
}



ENT.Seats = {
	{
		pos=Vector(450,11,130),
		exit=Vector(130,0,97),
	},
	
}


--	{
--		pos=Vector(15,60,80),
--		exit=Vector(-300,-40,10),
--		ang=Angle(0,-90,0),
--	}, Left side



ENT.Sounds = {
	Start="pelican/start.wav",
	Blades="pelican/engine"..math.random(1,3)..".wav",
	Engine="pelican/rotor"..math.random(1,2)..".wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="WAC/Heli/fire_alarm_tank.wav",
	LowHealth="WAC/Heli/fire_alarm.wav",
	CrashAlarm="WAC/Heli/FireSmoke.wav",
}