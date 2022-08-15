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
ENT.ImpactSound		= "drc.plasma_impact_reach"
ENT.ImpactEffect	= "drc_halo_bruteshot_explode"

ENT.Light			= true
ENT.LightColor		= Color(255, 20, 7)
ENT.LightBrightness	= 2.5
ENT.LightRange		= 250
ENT.LightType		= 0

ENT.SpriteMat		= "sprites/glow04_noz"
ENT.SpriteWidthMin	= 30
ENT.SpriteWidthMax	= 35
ENT.SpriteHeightMin = 30
ENT.SpriteHeightMax = 35
ENT.SpriteColor		= Color(200, 20, 20)

ENT.SpriteMat2		 = "sprites/glow04_noz"
ENT.SpriteWidth2Min	 = 10
ENT.SpriteWidth2Max	 = 10
ENT.SpriteHeight2Min = 10
ENT.SpriteHeight2Max = 10
ENT.SpriteColor2	 = Color(255, 0, 0)

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(255, 100, 30)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 40
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.25