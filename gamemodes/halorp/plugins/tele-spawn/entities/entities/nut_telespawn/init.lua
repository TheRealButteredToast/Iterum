include("shared.lua")
AddCSLuaFile("shared.lua")

local PLUGIN = PLUGIN

function ENT:Use(activator)
	if(activator:getChar():hasFlags('A') == true) then
		activator:SetPos(Vector(-15850.524414, 15906.852539, -16206.015625))
	elseif(activator:getChar():hasFlags('N') == true) then
		activator:SetPos(Vector(-1954.128540, -11522.259766, 1192.184937))
	elseif(activator:getChar():hasFlags('V') == true) then
		activator:SetPos(Vector(-8433.337891, 11077.038086, -1460.187988))
	elseif(activator:getChar():hasFlags('B') == true) then
		activator:SetPos(Vector(-7275.988281, -3997.241699, -14733.468750))	-- Police
	elseif(activator:getChar():hasFlags('b') == true) then
		activator:SetPos(Vector(-7334.904297, -3980.489014, -14742.469727))	-- Militia
	else
		activator:SetPos(Vector(2032.682983, 1148.700073, -14800.036133))
	end
	
	local tpSounds = {
		"ambient/machines/teleport1.wav",
		"ambient/machines/teleport3.wav",
		"ambient/machines/teleport4.wav"
	}
	local sound = table.Random(tpSounds)
	
	activator:EmitSound( sound )
	activator:SetCollisionGroup(20)
	timer.Simple(3, function() activator:SetCollisionGroup(5) end)
end