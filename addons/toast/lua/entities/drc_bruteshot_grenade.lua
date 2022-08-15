AddCSLuaFile()

ENT.Base	= "draconic_projectile_base"
ENT.Entity	= "drc_bruteshot_grenade"

ENT.PrintName		= "Brute Shot Grenade"
ENT.Author			= "Vuthakral"

ENT.Model = "models/Items/AR2_Grenade.mdl"
ENT.HideModel = true

ENT.ProjectileType	= "lua_explosive"

ENT.Damage 	= 37
ENT.DamageType 		= DMG_BLAST
ENT.Mass	= 1
ENT.Gravity = true

ENT.ExplodeShakePower = 25
ENT.ExplodeShakeTime  = 0.5	
ENT.ExplodeShakeDistance = 500

ENT.LoopingSound		= "drc.bruteshot_grenade_flight"
ENT.ExplodeSoundNear	= "drc.bruteshot_explode"
ENT.ExplodeSoundFar		= "drc.bruteshot_explode_dist"

ENT.ExplodePressure			= 1.5

ENT.AffectRadius	= 150

ENT.Effect			= nil
ENT.LuaExplEffect	= "drc_halo_bruteshot_explode"

ENT.Light			= true
ENT.LightColor		= Color(150, 200, 0)
ENT.LightBrightness	= 2.5
ENT.LightRange		= 200
ENT.LightType		= 0

ENT.SpriteMat		= "sprites/glow04_noz"
ENT.SpriteWidthMin	= 15
ENT.SpriteWidthMax	= 10
ENT.SpriteHeightMin = 10
ENT.SpriteHeightMax = 15
ENT.SpriteColor		= Color(150, 100, 20)

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(150, 255, 0)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 10
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.1