PLUGIN.name = "Kigyar"
PLUGIN.author = "Toast"
PLUGIN.desc = "Wort wort wort"

nut.chat.register("kig", {
	onCanSay = function(speaker, text)
		if (speaker:Team() == "FACTION_JACK" || speaker:getChar():hasFlags('K')) then
			speaker:EmitSound( "jackal/jack ("..math.random(1,10)..").wav" )
			return true
		end

		speaker:ChatPrint("You do not speak Kig-Yar!") 
		return false
	end,
	onCanHear = function(speaker, listener)
		if ((listener:GetPos():DistToSqr(speaker:GetPos())) < 280 and (listener:Team() == "FACTION_SANG" || listener:Team() == "FACTION_GRUNT"  || listener:Team() == "FACTION_JIRAL" || listener:Team() == "FACTION_JACK" || speaker:getChar():hasFlags('K'))) then
			return true
		elseif((listener:GetPos():DistToSqr(speaker:GetPos())) < 280) then
			listener:ChatPrint("You hear, but do not understand Kig-Yar!") 
		end	
		
		return false
	end,
	font = "nutChatFontItalics",	
	format = "%s screeches \"%s\"",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the yell chat slightly brighter than IC chat.
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,	
	prefix = {"/kig","/kigyar","/k"}
})