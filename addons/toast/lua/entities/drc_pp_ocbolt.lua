AddCSLuaFile()

ENT.Base	= "draconic_projectile_base"
ENT.Entity	= "drc_pp_ocbolt"

ENT.PrintName		= "Overcharged plasma pistol bolt"
ENT.Author			= "Vuthakral"

ENT.Model = "models/Items/AR2_Grenade.mdl"

ENT.Damage 	= 50
ENT.Mass	= 1
ENT.Force	= 5
ENT.Gravity = false
ENT.ProjectileType	= "point"

ENT.EMP			= true
ENT.EMPTime		= 5
ENT.EMPSound	= "drc.pp_stun"

ENT.Light			= true
ENT.LightColor		= Color(0, 255, 0)
ENT.LightBrightness	= 2.5
ENT.LightRange		= 250
ENT.LightType		= 0

ENT.SpriteMat		= "sprites/glow04_noz"
ENT.SpriteWidthMin	= 30
ENT.SpriteWidthMax	= 35
ENT.SpriteHeightMin = 30
ENT.SpriteHeightMax = 35
ENT.SpriteColor		= Color(20, 200, 20)

ENT.SpriteMat2		 = "sprites/glow04_noz"
ENT.SpriteWidth2Min	 = 10
ENT.SpriteWidth2Max	 = 10
ENT.SpriteHeight2Min = 10
ENT.SpriteHeight2Max = 10
ENT.SpriteColor2	 = Color(0, 255, 0)

ENT.TrailMat		= "effects/draconic_halo/hunter_beam"
ENT.TrailColor		= Color(0, 255, 0)
ENT.TrailAdditive	= true
ENT.TrailStartWidth	= 40
ENT.TrailEndWidth	= 0
ENT.TrailLifeTime	= 0.25

ENT.ImpactSound		= "drc.plasma_impact_reach"
ENT.ImpactEffect	= "drc_halo_pp_impact_oc"

ENT.HideModel = true