if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end

ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= wac.aircraft.spawnCategoryC
ENT.PrintName			= "GA-TL1 Longsword"
ENT.Author				= "Death/Valk"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model            = "models/valk/cea/unsc/longsword/longsword.mdl"
ENT.RotorPhModel        = "models/props_junk/sawblade001a.mdl"
ENT.RotorModel        = "models/props_junk/PopCan01a.mdl"

ENT.rotorPos        = Vector(0,0,200)
ENT.TopRotorDir        = 0
ENT.AutomaticFrameAdvance = true
ENT.EngineForce        = 300
ENT.Weight            = 80000
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 90
ENT.SmokePos        = Vector(-250,90,0)
ENT.FirePos            = Vector(0,90,260)
ENT.BurnerOffset		= Vector(0,90,260)

if CLIENT then
	ENT.thirdPerson = {
		distance = 2750,
		angle = 25
	}
end


ENT.Wheels = {
    {
        mdl = "models/valk/cea/unsc/longsword/wheel.mdl",
        pos = Vector(-45.3,430.0,-23.65),
        friction = 0,
        mass = 24000,
    },
    {
        mdl = "models/valk/cea/unsc/longsword/wheel.mdl",
        pos = Vector(-30.3,-430.0,-10.65),
        friction = 0,
        mass = 24000,

    },
    {
        mdl = "models/valk/cea/unsc/longsword/wheel.mdl",
        pos = Vector(605.9,13,-15.65),
        friction = 0,
        mass = 34000,
    },
}



ENT.Agility = {
	Thrust = 20
}

ENT.Seats = {
	{
		pos=Vector(575,36,175),
		exit=Vector(510,20,-10),
	},
	{
		pos=Vector(575,-8,175),
		exit=Vector(510,-20,-10),
		weapons={"110mm rotary cannons", "ASGM-10 Missiles"}
	}
}

ENT.Weapons = {
	["110mm rotary cannons"] = {
		class = "wac_pod_longswordbelly",
		info = {
			ShootPos = Vector(690,13,122),
			ShootOffset = Vector(60, 0, 220),
			Ammo = 13500,
		}
	},
	["ASGM-10 Missiles"] = {
		class = "wac_pod_hellfirev2",
		info = {
			Pods = {
				Vector(550, 60, 160),
				Vector(550, -60, 160),
			}
		}
	},
}

ENT.Camera = {
	model = "models/hunter/plates/plate.mdl",
	pos = Vector(690,13.3,122),
	offset = Vector(-1,0,0),
	viewPos = Vector(93, 0, 3.5),
	maxAng = Angle(125, 90, 0),
	minAng = Angle(-10, -90, 0),
	seat = 2
}




ENT.Sounds={
	Start="WAC/pelican/start.wav",
	Blades="WAC/pelican/external.wav",
	Engine="WAC/pelican/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

