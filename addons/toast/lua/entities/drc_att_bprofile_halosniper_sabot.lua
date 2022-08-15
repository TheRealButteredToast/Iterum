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

ENT.InfoName = "14.5x114mm APFSDS"
ENT.InfoDescription = "Standard ammunition for this weapon."

ENT.AttachType = "ammo"

ENT.BulletTable = {
	Damage = 1,
	PvPDamageMul = 1,
	PvEDamageMul = 1,
	EvPDamageMul = 1,
	EvEDamageMul = 1,
	DamageType = DMG_SNIPER,
	MaterialDamageMuls = {
		MAT_ANTLION = 0.86,
		MAT_BLOODYFLESH = 0.9,
		MAT_ZOMBIEFLESH = 0.25,
		MAT_PAPER = 2,
		MAT_EGGSHELL = 5,
		MAT_FLESH = 1.4,
		MAT_WATERMELON = 6.9,
		MAT_ALIENFLESH = 1.2,
		MAT_VENT = 3,
		MAT_METAL = 1.3,
		MAT_SOLIDMETAL = 1.02,
		MAT_METAL_BARREL = 1.3,
		MAT_FLOATING_METAL_BARREL = 1.3,
		MAT_METAL_BOX = 1.3,
		MAT_COMPUTER = 1.4,
		MAT_CONCRETE = 1,
		MAT_RUBBER = 1,
		MAT_DIRT = 0.8,
		MAT_ROCK = 1.7,
		MAT_SAND = 0.8,
		MAT_FOLIAGE = 0.6,
		MAT_WOOD = 1.6,
		MAT_WOOD_CRATE = 2,
		MAT_WOOD_FURNITURE = 2,
		MAT_WOOD_SOLID = 1.2,
		MAT_CARDBOARD = 5,
		MAT_TILE = 3,
		MAT_PORCELAIN = 3,
		MAT_GLASS = 5,
		MAT_ICE = 8,
		MAT_WARPSHIELD = 1,
	},
	AmmoType = "XBowBolt",
	FallbackBaseAmmoType = "XBowBolt",
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