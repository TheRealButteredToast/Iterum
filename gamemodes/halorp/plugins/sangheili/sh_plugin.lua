PLUGIN.name = "Sangheili"
PLUGIN.author = "Toast"
PLUGIN.desc = "Wort wort wort"

nut.chat.register("sangheili", {
	onCanSay = function(speaker, text)
		if (speaker:Team() == "FACTION_SANG" || speaker:getChar():hasFlags('S')) then
			speaker:EmitSound( "sangheili/"..math.random(1,12)..".wav" )
			return true
		end

		speaker:ChatPrint("You do not speak sangheili!") 
		return false
	end,
	onCanHear = function(speaker, listener)
		if ((listener:GetPos():DistToSqr(speaker:GetPos())) < 280 and (listener:Team() == "FACTION_SANG" || listener:Team() == "FACTION_GRUNT"  || listener:Team() == "FACTION_JIRAL" || listener:Team() == "FACTION_JACK" || speaker:getChar():hasFlags('S'))) then
			return true
		elseif((listener:GetPos():DistToSqr(speaker:GetPos())) < 280) then
			listener:ChatPrint("You hear, but do not understand Sangheili!") 
		end	

		return false
	end,
	font = "nutChatFontItalics",	
	format = "%s worts \"%s\"",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the yell chat slightly brighter than IC chat.
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,	
	prefix = {"/sang","/s","/sangheili"}
})