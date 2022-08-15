AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "14.5x114mm Crate"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.Model = "models/vuthakral/halo/weapons/entities/crate_srs99.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 16
ENT.HidePopup 	= true
ENT.RemoveOnUse = true
ENT.PickupType 	= "ammostation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_srs99c", "drc_srs99d", "drc_srs99am" }