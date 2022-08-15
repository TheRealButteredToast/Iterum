AddCSLuaFile()

ENT.Base	= "draconic_projectile_base"
ENT.Entity	= "drc_m139_grenade"

ENT.PrintName		= "Plasma Caster Grenade"
ENT.Author			= "Vuthakral"

ENT.Model = "models/Items/AR2_Grenade.mdl"
ENT.HideModel = true

ENT.ProjectileType	= "FuseAfterFirstBounce"
ENT.ExplosionType	= "lua"

ENT.FuseTime	= 1

ENT.Damage 			= 75
ENT.DamageType 		= DMG_SLOWBURN
ENT.Mass			= 5
ENT.Gravity 		= true

ENT.ExplodeShakePower = 2
ENT.ExplodeShakeTime  = 0.5	
ENT.ExplodeShakeDistance = 500

-- ENT.LoopingSound		= "drc.m139_flight"
ENT.ExplodeSoundNear	= "drc.cov_carbine_impact"
ENT.ExplodeSoundFar		= ""

ENT.ExplodePressure			= 0.1

ENT.AffectRadius	= 150

ENT.SpawnEffect		= "drc_halo_pr_muzzleflash"
ENT.LuaExplEffect	= "drc_halo_caster_poof"

ENT.SpriteMat		= "sprites/glow04_noz"
ENT.SpriteWidthMin	= 110
ENT.SpriteWidthMax	= 100
ENT.SpriteHeightMin = 80
ENT.SpriteHeightMax = 85
ENT.SpriteColor		= Color(30, 150, 255)

ENT.SpriteMat2		 = "sprites/glow04_noz"
ENT.SpriteWidth2Min	 = 10
ENT.SpriteWidth2Max	 = 10
ENT.SpriteHeight2Min = 10
ENT.SpriteHeight2Max = 10
ENT.SpriteColor2	 = Color(0, 255, 255)

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(30, 150, 255)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 40
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.3