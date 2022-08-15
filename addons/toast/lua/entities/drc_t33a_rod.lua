AddCSLuaFile()

ENT.Base	= "draconic_projectile_base"
ENT.Entity	= "drc_spnkr_rocket"

ENT.PrintName		= "SPNKr Rocket"
ENT.Author			= "Vuthakral"

ENT.Model = "models/vuthakral/halo/weapons/fuelrod_rod.mdl"

ENT.ProjectileType	= "lua_explosive"

ENT.Damage 			= 150
ENT.DamageType 		= DMG_BLAST
ENT.Mass			= 500
ENT.Gravity 		= true

ENT.ExplodeShakePower = 25
ENT.ExplodeShakeTime  = 0.5	
ENT.ExplodeShakeDistance = 500

ENT.LoopingSound		= "drc.fuelrod_flight"
ENT.ExplodeSoundNear	= "drc.t33a_explode"
ENT.ExplodeSoundFar		= "drc.plasmagrenade_explode_dist"

ENT.ExplodePressure			= 5

ENT.AffectRadius	= 300

ENT.SpawnEffect		= "drc_halo_fuelrod_flash"
ENT.LuaExplEffect	= "drc_halo_fuelrod_explode"

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(255, 255, 0)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 35
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.15

ENT.SpriteMat		= "sprites/glow04_noz"
ENT.SpriteWidthMin	= 20
ENT.SpriteWidthMax	= 25
ENT.SpriteHeightMin = 20
ENT.SpriteHeightMax = 25
ENT.SpriteColor		= Color(200, 200, 20)

ENT.Light			= true
ENT.LightColor		= Color(150, 100, 0)
ENT.LightBrightness	= 2.5
ENT.LightRange		= 250
ENT.LightType		= 0