AddCSLuaFile()

ENT.Base	= "draconic_ammo_station"

ENT.PrintName 	= "M41 Case"
ENT.Author 		= "Vuthakral"
ENT.Information = ""
ENT.Category 	= "Draconic: Halo"

ENT.Spawnable = false
ENT.AdminOnly = false

ENT.Model = "models/squad/sf_plates/sf_plate1x1.mdl"

ENT.UseDelay 	= 0.62
ENT.ATR 		= 2
ENT.UseSound 	= "vuthakral/halo/weapons/spnkr/ammo.wav"
ENT.HidePopup 	= true
ENT.RemoveOnUse = true
ENT.PickupType 	= "ammostation"
ENT.UseSound 	= "items/ammocrate_open.wav"
ENT.DenySound 	= "doors/handle_pushbar_locked1.wav"

ENT.Whitelist = { "drc_spnkr" }