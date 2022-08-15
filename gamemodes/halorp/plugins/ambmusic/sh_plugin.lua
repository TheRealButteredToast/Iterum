PLUGIN.name = "Ambient Music"
PLUGIN.author = "Toast"
PLUGIN.desc = "Background Tunes to keep things lively"

mselec  = { 	
						"sound/iterum/h1covdanc.mp3",
						"sound/iterum/h1gnhduni.mp3",
						"sound/iterum/h1palehorse.mp3",
						"sound/iterum/h1pejo.mp3",
						"sound/iterum/h1perchance.mp3",
						"sound/iterum/h1undcovdrk.mp3",
						"sound/iterum/h1witw.mp3",
						"sound/iterum/h2epi.mp3",
						"sound/iterum/h2final.mp3",
						"sound/iterum/h2flaw.mp3",
						"sound/iterum/h2heavpp.mp3",
						"sound/iterum/h2herehero.mp3",
						"sound/iterum/h2highchar.mp3",
						"sound/iterum/h2impend.mp3",
						"sound/iterum/h2inamb.mp3",
						"sound/iterum/h2nan.mp3",
						"sound/iterum/h2peril.mp3",
						"sound/iterum/h2remb.mp3",
						"sound/iterum/h2unheart.mp3",
						"sound/iterum/h3menu.mp3",
						"sound/iterum/h3obits.mp3",
						"sound/iterum/h3odeffrdark.mp3",
						"sound/iterum/h3ofir.mp3",
						"sound/iterum/h3omen.mp3",
						"sound/iterum/anotherrain.mp3",
						"sound/iterum/h3rele.mp3",
						"sound/iterum/hwbdhrdy.mp3",
						"sound/iterum/hwmnormet.mp3",
						"sound/iterum/hwunuqui.mp3",
						"sound/iterum/neomomb.mp3",
}	
local source = table.Random ( mselec )
if SERVER then
	AddCSLuaFile()
else
	timer.Create("random", math.random(660,1200), 0, function()    
		sound.PlayFile( source, "", 
		function( station )
			if ( IsValid( station ) ) then station:Play() end
			if LocalPlayer():Team() == FACTION_JIRAL and math.random(1,1000) > 990 then
				source = "sound/iterum/banan.mp3"
				LocalPlayer():ChatPrint("Monkey :)")
			elseif LocalPlayer():WaterLevel() >= 3 then
				source = "sound/iterum/dd64.mp3"
			else
				source = table.Random ( mselec )
			end
		end )
	end)

end

if CLIENT then
	tracker = true
	net.Receive( "SendSelection", function(leng, ply)
		recentSelection =  net.ReadInt(6)
		calcSong( recentSelection , ply )
	end )
	net.Receive( "AmbientToggle", function(leng, ply)
		if( tracker == true ) then
			timer.Pause("random")
			tracker = false
			LocalPlayer():ChatPrint("The timer is Paused.")
		else
			timer.UnPause("random")
			tracker = true
			LocalPlayer():ChatPrint("The timer is Unpaused.")
		end
	end )

	function calcSong(input, client)
		if(input == 1) then  
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: Covenant Dance")
			sound.PlayFile("sound/iterum/h1covdanc.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 2) then
			timer.Pause("random") 
			
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: Gun Pointed at Head of the Universe")
			sound.PlayFile("sound/iterum/h1gnhduni.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 3) then
			timer.Pause("random") 
			
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: Pale Horse")
			sound.PlayFile("sound/iterum/h1palehorse.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 4) then
			timer.Pause("random") 
			
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: Perilous Journey")
			sound.PlayFile("sound/iterum/h1pejo.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 5) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: Perchance to Dream")
			sound.PlayFile("sound/iterum/h1perchance.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 6) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: Under Cover of Darkness")
			sound.PlayFile("sound/iterum/h1undcovdrk.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 7) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 1: A Walk in the Woods")
			sound.PlayFile("sound/iterum/h1witw.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 8) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Epilogue")
			sound.PlayFile("sound/iterum/h2epi.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 9) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Finale")
			sound.PlayFile("sound/iterum/h2final.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 10) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Flawed Legacy")
			sound.PlayFile("sound/iterum/h2flaw.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 11) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Heavy Price Paid")
			sound.PlayFile("sound/iterum/h2heavpp.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 12) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Heretic, Hero")
			sound.PlayFile("sound/iterum/h2herehero.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 13) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: High Charity")
			sound.PlayFile("sound/iterum/h2highchar.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 14) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Impend")
			sound.PlayFile("sound/iterum/h2impend.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 15) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Inamberclad")
			sound.PlayFile("sound/iterum/h2inamb.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 16) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Ancient Machine")
			sound.PlayFile("sound/iterum/h2nan.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 17) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Peril")
			sound.PlayFile("sound/iterum/h2peril.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 18) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Rememberance")
			sound.PlayFile("sound/iterum/h2remb.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 19) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 2: Unwearied Heart")
			sound.PlayFile("sound/iterum/h2unheart.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 20) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3 ODST: Menu Music")
			sound.PlayFile("sound/iterum/h3menu.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 21) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3: Released")
			sound.PlayFile("sound/iterum/h3rele.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 22) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3 ODST: Bits and Pieces")
			sound.PlayFile("sound/iterum/h3obits.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 23) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3 ODST: Another Rain")
			sound.PlayFile("sound/iterum/anotherrain.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 24) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3 ODST: Deference for Darkness")
			sound.PlayFile("sound/iterum/h3odeffrdark.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 25) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3 ODST: Combat Mix")
			sound.PlayFile("sound/iterum/h3ofir.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 26) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo 3 ODST: The Menagerie")
			sound.PlayFile("sound/iterum/h3omen.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 27) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo Wars: Fingerprints are Broken")
			sound.PlayFile("sound/iterum/hwbdhrdy.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 28) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo Wars: Combat Mix")
			sound.PlayFile("sound/iterum/hwmnormet.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 29) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Halo Wars: Unusualy Quiet")
			sound.PlayFile("sound/iterum/hwunuqui.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == 30) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Neon Mombasa")
			sound.PlayFile("sound/iterum/neomomb.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == -8) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Dire Dire Docks")
			sound.PlayFile("sound/iterum/dd64.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		elseif(input == -3) then
			
			timer.Pause("random") 
			timer.Simple( 300 , function() timer.UnPause("random") end)
			LocalPlayer():ChatPrint("Playing Jiralhanae Theme")
			sound.PlayFile("sound/iterum/banan.mp3", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		else
			sound.PlayFile("buttons/combine_button_locked.wav", "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
		end

	end
	
else
	util.AddNetworkString( "SendSelection" )
	util.AddNetworkString( "AmbientToggle" )


	nut.command.add("mroster", {
		syntax = "",
		onRun = function(client,arguments)
			client:ChatPrint(" 1 - Halo 1: Covenant Dance \n 2 - Halo 1: Gun Pointed at Head of the Universe \n 3 - Halo 1: Pale Horse \n 4 - Halo 1: Perilous Journey \n") 
			client:ChatPrint(" 5 - Halo 1: Perchance to Dream \n 6 - Halo 1: Under Cover of Darkness \n 7 - Halo 1: A Walk in the Woods \n 8 - Halo 2: Epilogue \n")
			client:ChatPrint(" 9 - Halo 2: Finale \n 10 - Halo 2: Flawed Legacy \n 11 - Halo 2: Heavy Price Paid \n 12 - Halo 2: Heretic, Hero \n 13 - Halo 2: High Charity \n")
			client:ChatPrint(" 14 - Halo 2: Impend \n 15 - Halo 2: Inamberclad \n 16 - Halo 2: Ancient Machine \n 17 - Halo 2: Peril \n 18 - Halo 2: Rememberance \n")
			client:ChatPrint(" 19 - Halo 2: Unwearied Heart \n 20 - Halo 3: Menu Music \n 21 - Halo 3: Released \n 22 - Halo 3 ODST: Bits and Pieces \n 23 - Halo 3 ODST: Another Rain \n")
			client:ChatPrint(" 24 - Halo 3 ODST: Deference for Darkness \n 25 - Halo 3 ODST: Combat Mix \n 26 - Halo 3 ODST: The Menagerie \n 27 - Halo Wars: Fingerprints are Broken")
			client:ChatPrint(" 28 - Halo Wars: Combat Mix \n 29 - Halo Wars: Unusualy Quiet \n 30 - Neon Mombasa \n")
		end,
	})
	nut.command.add("mplay", {
		syntax = "",
		onRun = function(client, arguments)
			numb = tonumber(arguments[1])
			if(numb == nil) then return end
			if (numb  < 31 and numb > 0) or numb == -8 or numb == -3 then
				net.Start("SendSelection")
				net.WriteInt(numb, 6)
				net.Send(client)
			else
				client:ChatPrint("Invalid Entry! Number must be between 0 & 30.")
			end
		end,
	})
	nut.command.add("mstop", {
		syntax = "",
		onRun = function(client, arguments)
			client:ConCommand("stopsound")
		end,
	})
	nut.command.add("mtimtog", {
		syntax = "",
		onRun = function(client, arguments)
			net.Start("AmbientToggle")
			net.Send(client)
		end,
	
	})
end