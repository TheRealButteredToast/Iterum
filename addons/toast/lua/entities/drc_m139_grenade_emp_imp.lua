AddCSLuaFile()

ENT.Base	= "draconic_projectile_base"
ENT.Entity	= "drc_m139_grenade"

ENT.PrintName		= "SPNKr Rocket"
ENT.Author			= "Vuthakral"

ENT.Model = "models/vuthakral/halo/weapons/m139_grenade.mdl"

ENT.ProjectileType	= "explosive"
ENT.ExplosionType	= "lua"

ENT.FuseTime	= 5

ENT.Damage 			= 150
ENT.DamageType 		= DMG_BLAST
ENT.Mass			= 2
ENT.Gravity 		= true

ENT.ExplodeShakePower = 25
ENT.ExplodeShakeTime  = 0.5	
ENT.ExplodeShakeDistance = 500

ENT.LoopingSound		= "drc.m139_flight"
ENT.ExplodeSoundNear	= "drc.m139_explode"
ENT.ExplodeSoundFar		= "drc.halofrag_dist"

ENT.ExplodePressure			= 1.5

ENT.AffectRadius	= 300

ENT.SpawnEffect		= "drc_halo_spnkr_rocket_flash"
ENT.LuaExplEffect	= "drc_halo_spnkr_rocket_explode"

ENT.EMP			= true
ENT.EMPTime		= 5
ENT.EMPSound	= "drc.pp_stun"

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(255, 255, 0)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 10
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.1