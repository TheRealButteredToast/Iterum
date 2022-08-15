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

ENT.InfoName = "High-intensity beam"
ENT.InfoDescription = ""

ENT.AttachType = "ammo"

ENT.BulletTable = {
	DamageType = DMG_BLAST,
	SplashRadius = 35,
	SplashDamageMul = 0.65,
	AmmoType = nil,
	FallbackBaseAmmoType = nil,
	ImpactDecal = "SmallScorch"
}