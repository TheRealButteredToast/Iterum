AddCSLuaFile()

--[[     I M P O R T A N T

Please, go to the GitHub wiki for this, and not just rip settings from the base as reference.
https://github.com/Vuthakral/Draconic_Base/wiki

It contains all of the settings, explanations on how to use them, tutorials, helpful links, etc.

--]]

ENT.Type = "anim"
ENT.Base = "draconic_attachment_base"

ENT.PrintName 	= "Standard"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic"

ENT.Spawnable = false
ENT.AdminOnly = false

ENT.InfoName = "7.62x51mm FMJ"
ENT.InfoDescription = "Standard ammunition for this weapon."

ENT.AttachType = "ammo"

ENT.BulletTable = {
	Damage = 1,
	PvPDamageMul = 1,
	PvEDamageMul = 1,
	EvPDamageMul = 1,
	EvEDamageMul = 1,
	DamageType = DMG_BULLET,
	MaterialDamageMuls = {
		MAT_BLOODYFLESH = 1.1,
		MAT_ZOMBIEFLESH = 0.8,
		MAT_FLESH = 0.95,
		MAT_WATERMELON = 5,
		MAT_ALIENFLESH = 0.9,
		MAT_METAL = 0.62,
		MAT_COMBINE_METAL = 0.62,
		MAT_SOLIDMETAL = 0.42,
		MAT_METALPANEL = 0.62,
		MAT_METAL_BARREL = 0.62,
		MAT_FLOATING_METAL_BARREL = 0.62,
		MAT_METAL_BOX = 0.8,
		MAT_GRATE = 0.62,
		MAT_COMPUTER = 0.62,
		MAT_ROCK = 0.6,
		MAT_FOLIAGE = 2,
		MAT_WOOD = 1.5,
		MAT_WOOD_CRATE = 1.1,
		MAT_WOOD_FURNITURE = 1.4,
		MAT_CARDBOARD = 3,
		MAT_TILE = 1.5,
		MAT_PORCELAIN = 1.7,
		MAT_GLASS = 2,
		MAT_ICE = 4,
		MAT_WARPSHIELD = 1
	},
	AmmoType = "AR2",
	FallbackBaseAmmoType = "AR2",
	Force = 1,
	Kick = 1,
	KickHoriz = 1,
	Spread = 1,
	SpreadDiv = 1,
	IronRecoilMul = 1,
	RecoilUp = 1,
	RecoilDown = 1,
	RecoilHoriz = 1,
	ClipSizeMul = 1
}