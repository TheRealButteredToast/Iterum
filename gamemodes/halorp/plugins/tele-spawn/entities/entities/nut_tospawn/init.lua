include("shared.lua")
AddCSLuaFile("shared.lua")

local PLUGIN = PLUGIN

function ENT:Use(activator)

	local tpSounds = {
		"ambient/machines/teleport1.wav",
		"ambient/machines/teleport3.wav",
		"ambient/machines/teleport4.wav"
	}
	local sound = table.Random(tpSounds)
	activator:SetPos(Vector(612.587524, -2199.289063, -16194.438477))
	activator:EmitSound( sound )
	activator:SetCollisionGroup(20)
	timer.Simple(3, function() activator:SetCollisionGroup(5) end)
end