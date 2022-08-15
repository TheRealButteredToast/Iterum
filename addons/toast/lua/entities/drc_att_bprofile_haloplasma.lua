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

ENT.InfoName = "High-temperature plasma"
ENT.InfoDescription = ""

ENT.AttachType = "ammo"

ENT.BulletTable = {
	Damage = 1,
	PvPDamageMul = 1,
	PvEDamageMul = 1,
	EvPDamageMul = 1,
	EvEDamageMul = 1,
	DamageType = DMG_BURN,
	MaterialDamageMuls = {
		MAT_PAPER = 3,
		MAT_WATERMELON = 5,
		MAT_PLASTIC = 1.5,
		MAT_PLASTIC_BARREL = 1.3,
		MAT_GRATE = 0.65,
		MAT_COMPUTER = 1.2,
		MAT_RUBBER = 0.7,
		MAT_DIRT = 0.5,
		MAT_ROCK = 0.3,
		MAT_SAND = 0.7,
		MAT_FOLIAGE = 2,
		MAT_SLOSH = 0,
		MAT_GRASS = 3,
		MAT_WOOD = 1.7,
		MAT_WOOD_CRATE = 1.7,
		MAT_WOOD_FURNITURE = 1.4,
		MAT_WOOD_SOLID = 1.5,
		MAT_CARDBOARD = 6,
		MAT_SNOW = 5,
		MAT_GLASS = 0.5,
		MAT_ICE = 10
	},
	AmmoType = nil,
	FallbackBaseAmmoType = nil,
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