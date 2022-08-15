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

ENT.InfoName = "5x23mm"
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
		MAT_BLOODYFLESH = 0.7,
		MAT_ZOMBIEFLESH = 0.7,
		MAT_FLESH = 0.85,
		MAT_WATERMELON = 1.2,
		MAT_ALIENFLESH = 0.85,
		MAT_METAL = 0.7,
		MAT_COMBINE_METAL = 0.57,
		MAT_SOLIDMETAL = 0.5,
		MAT_METALPANEL = 0.85,
		MAT_GRATE = 0.6,
		MAT_COMPUTER = 0.78,
		MAT_CARDBOARD = 2,
		MAT_TILE = 1.2,
		MAT_PORCELAIN = 1.2,
		MAT_GLASS = 1.3,
		MAT_ICE = 1.5
	},
	AmmoType = "SMG1",
	FallbackBaseAmmoType = "SMG1",
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