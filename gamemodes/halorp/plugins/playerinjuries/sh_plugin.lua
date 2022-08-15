PLUGIN.name = "Hitmarkers and Hitsounds"
PLUGIN.author = "Toast"
PLUGIN.desc = "IF you hit a player, play a sound. If you hit him in the head, play a cool sound."

if SERVER then
	AddCSLuaFile()
	
	util.AddNetworkString( "HitMarkerNoti" )
	
else
	net.Receive( "HitMarkerNoti", function(leng, ply)
		playHitSound( net.ReadInt(3) )
	end )
	
	function playHitSound( num )
		if(num == 1) then
			sound.PlayFile("sound/hitmarker/hitmarkerhead.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end)
		elseif (num == 0) then
			sound.PlayFile("sound/hitmarker/hitmarker.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end)
		end
	end

end

nut.util.include("sv_hooks.lua")
nut.util.include("sv_drowning.lua")
