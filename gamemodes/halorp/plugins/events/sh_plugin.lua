PLUGIN.name = "Predesigned Events"
PLUGIN.author = "Toast"
PLUGIN.desc = "Ooo kill em"

if CLIENT then

	net.Receive( "POPENT", function(leng, ply)
		popRender(net.ReadString(), net.ReadString(), net.ReadString(), net.ReadString(), net.ReadString(), net.ReadString())
	end )
	
else
	AddCSLuaFile()
	util.AddNetworkString( "POPENT" )
end

nut.command.add("popup", {
	adminOnly = true,
	syntax = "<Title> <Body1> <Body2> <Body3> <Body4> <Material>",
	onRun = function(client, arguments)
	
		if((isstring(arguments[1]) ~= false and isstring(arguments[2]) ~= false and isstring(arguments[3]) ~= false and isstring(arguments[4]) ~= false and isstring(arguments[5]) ~= false and isstring(arguments[6]) ~= false) and client:getChar():hasFlags('A') == true ) then
			net.Start("POPENT")
			net.WriteString(arguments[1])
			net.WriteString(arguments[2])
			net.WriteString(arguments[3])
			net.WriteString(arguments[4])
			net.WriteString(arguments[5])
			net.WriteString(arguments[6])
			net.Broadcast()
		elseif(client:getChar():hasFlags('A') == true) then
			client:ChatPrint("Invalid Entry.")
		else
			client:ChatPrint("You are not an admin.")
			
		end
		
	end,
})

nut.command.add("begin", {
	adminOnly = true,
	onRun = function()
		local hostile1 = ents.Create("npc_combine_s")
		hostile1:SetPos( Vector(-262.820099, 1042.522827, 2520.031250) )
		hostile1:Spawn()
		
		local hostile2 = ents.Create("npc_combine_s")
		hostile2:SetPos( Vector(-766.027222, 718.390320, 2520.031250) )
		hostile2:Spawn()
	end
})  