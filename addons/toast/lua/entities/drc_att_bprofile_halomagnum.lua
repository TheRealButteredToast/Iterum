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

ENT.InfoName = "12.7x40mm"
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
		MAT_ANTLION = 1.5,
		MAT_BLOODYFLESH = 1.2,
		MAT_EGGSHELL = 1,
		MAT_FLESH = 1.1,
		MAT_WATERMELON = 5,
		MAT_ALIENFLESH = 1.1,
		MAT_METAL = 0.62,
		MAT_COMBINE_METAL = 0.92,
		MAT_SOLIDMETAL = 0.92,
		MAT_METALPANEL = 1.05,
		MAT_ROCK = 1.3,
		MAT_SAND = 0.8,
		MAT_FOLIAGE = 2,
		MAT_WOOD = 1.6,
		MAT_WOOD_CRATE = 1.4,
		MAT_WOOD_FURNITURE = 1.4,
		MAT_CARDBOARD = 3,
		MAT_TILE = 1.5,
		MAT_PORCELAIN = 1.7,
		MAT_GLASS = 5,
		MAT_ICE = 5
	},
	AmmoType = "Pistol",
	FallbackBaseAmmoType = "Pistol",
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