AddCSLuaFile()

ENT.Base	= "draconic_projectile_base"
ENT.Entity	= "drc_needler_needle"

ENT.PrintName		= "needle_t33"
ENT.Author			= "Vuthakral"

ENT.Model = "models/vuthakral/halo/weapons/w_needle.mdl"

ENT.Damage 	= 3
ENT.Mass	= 1
ENT.Force	= 5
ENT.Gravity = false
ENT.ProjectileType	= "supercombine"
ENT.ExplosionType	= "lua"

ENT.SuperCombineRequirement		= 7
ENT.SuperDamage					= 100
ENT.SuperDamageType 			= DMG_BLAST
ENT.SuperCombineType 			= "lua"
ENT.SuperExplodePressure		= 5
ENT.SuperExplodeShakePower 		= 5
ENT.SuperExplodeShakeTime  		= 0.5	
ENT.SuperExplodeShakeDistance 	= 500


ENT.ExplodeSoundNear	= "drc.Needler_explosion"
ENT.ExplodeSoundFar		= ""

ENT.ENearSC	= "drc.Needler_supercombine"

ENT.ExplodeShakePower 		= 0
ENT.ExplodeShakeTime  		= 0	
ENT.ExplodeShakeDistance 	= 0

ENT.FuseTime	= 5
ENT.ExplodePressure			= 0

ENT.AffectRadius	= 10
ENT.SuperAffectRadius	= 35

ENT.SpawnEffect		= nil
ENT.Effect			= nil
ENT.LuaExplEffect	= "drc_halo_nr_impact"
ENT.LuaExplEffect	= "drc_halo_nr_impact"
ENT.SuperLuaExplEffect	= "drc_halo_ne_sc"

ENT.SpriteMat		= "sprites/glow04_noz"
ENT.SpriteWidthMin	= 50
ENT.SpriteWidthMax	= 40
ENT.SpriteHeightMin = 10
ENT.SpriteHeightMax = 15
ENT.SpriteColor		= Color(255, 0, 255)

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(255, 0, 255)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 10
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.3