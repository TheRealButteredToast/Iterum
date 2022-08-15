--[[
This work is licensed under a Creative Commons
Attribution-ShareAlike 4.0 International License.

Created by 8bitMafia.
--]]

PLUGIN.name = "Playsound plugin"
PLUGIN.author = "CW: 8bitMafia | NS: D3ADL0RD"
PLUGIN.desc = "Allow admins to easily play music."

if (SERVER) then
	util.AddNetworkString("nsRequestSound")
	util.AddNetworkString("nsBroadcastSound")
	util.AddNetworkString("nsOpenSoundMenu")

	net.Receive("nsRequestSound", function(len, client)
		local path = net.ReadString()
		if (client:IsAdmin()) then
			net.Start("nsBroadcastSound")
			net.WriteString(path)
			net.Broadcast()
		end
	end)
end

nut.command.add("playsound", {
	adminOnly = true,
	onRun = function(client, arguments)
		net.Start("nsOpenSoundMenu")
		net.Send(client)
	end
})


local function PlaySound(path)
	surface.PlaySound("garrysmod/ui_click.wav")
	net.Start("nsRequestSound")
	net.WriteString(path)
	net.SendToServer()
end

net.Receive("nsOpenSoundMenu", function()
	local Menu = vgui.Create("DMenu")
	Menu:MakePopup()
	Menu:Center()
	local SubMenu2 = Menu:AddSubMenu("Halo 1")
	SubMenu2:AddOption("Cov. Dance", function() PlaySound("sound/iterum/h1covdanc.mp3") end)
	SubMenu2:AddOption("Gun P. at H. of t. Uni. ", function() PlaySound("sound/iterum/h1gnhduni.mp3") end)
	SubMenu2:AddOption("Pale Horse", function() PlaySound("sound/iterum/h1palehorse.mp3") end)
	SubMenu2:AddOption("Perilous Joruney", function() PlaySound("sound/iterum/h1pejo.mp3") end)
	SubMenu2:AddOption("Perchance to Dream", function() PlaySound("sound/iterum/h1perchance.mp3") end)
	SubMenu2:AddOption("Under Cover of Darkness", function() PlaySound("sound/iterum/h1undcovdrk.mp3") end)
	SubMenu2:AddOption("A Walk in the Woods", function() PlaySound("sound/iterum/h1witw.mp3") end)
	local SubMenu1 = Menu:AddSubMenu("Halo 2")
	SubMenu1:AddOption("Epilogue", function() PlaySound("sound/iterum/h2epi.mp3") end)
	SubMenu1:AddOption("Finale", function() PlaySound("sound/iterum/h2final.mp3") end)
	SubMenu1:AddOption("Flawed Legacy", function() PlaySound("sound/iterum/h2flaw.mp3") end)
	SubMenu1:AddOption("Heavy Price Paid", function() PlaySound("sound/iterum/h2heavpp.mp3") end)
	SubMenu1:AddOption("Heretic, Hero", function() PlaySound("sound/iterum/h2herehero.mp3") end)
	SubMenu1:AddOption("High Charity", function() PlaySound("sound/iterum/h2highchar.mp3") end)
	SubMenu1:AddOption("Impend", function() PlaySound("sound/iterum/h2impend.mp3") end)
	SubMenu1:AddOption("Inamberclad", function() PlaySound("sound/iterum/h2inamb.mp3") end)
	SubMenu1:AddOption("Ancient Machine", function() PlaySound("sound/iterum/h2nan.mp3") end)
	SubMenu1:AddOption("Peril", function() PlaySound("sound/iterum/h2peril.mp3") end)
	SubMenu1:AddOption("Rememberance", function() PlaySound("sound/iterum/h2remb.mp3") end)
	SubMenu1:AddOption("Unwearied Heart", function() PlaySound("sound/iterum/h2unheart.mp3") end)
	local SubMenu3 = Menu:AddSubMenu("Halo 3")
	SubMenu3:AddOption("Menu Music", function() PlaySound("sound/iterum/h3menu.mp3") end)
	SubMenu3:AddOption("Released ", function() PlaySound("sound/iterum/h3rele.mp3") end)
	local SubMenu4 = Menu:AddSubMenu("ODST")
	SubMenu4:AddOption("Bits and Pieces", function() PlaySound("sound/iterum/h3obits.mp3") end)
	SubMenu4:AddOption("Another Rain", function() PlaySound("sound/iterum/anotherrain.mp3") end)
	SubMenu4:AddOption("Deference for Darnkess", function() PlaySound("sound/iterum/h3odeffrdark.mp3") end)
	SubMenu4:AddOption("Combat Mix", function() PlaySound("sound/iterum/h3ofir.mp3") end)
	SubMenu4:AddOption("The Menagerie", function() PlaySound("sound/iterum/h3ofir.mp3") end)
	local SubMenu5 = Menu:AddSubMenu("Halo Wars")
	SubMenu5:AddOption("Fingerprints are Broken", function() PlaySound("sound/iterum/h3omen.mp3") end)
	SubMenu5:AddOption("Combat Mix", function() PlaySound("sound/iterum/hwbdhrdy.mp3") end)
	SubMenu5:AddOption("Unusually Quiet", function() PlaySound("sound/iterum/hwmnormet.mp3") end)
	Menu:AddOption("Neon Mombasa", function() PlaySound("sound/iterum/neomomb.mp3") end)
	local AuthMenu = Menu:AddOption("Only do this for Global Events!", function() end)
	AuthMenu:SetIcon("icon16/star.png")
	Menu:Open()
end)

net.Receive("nsBroadcastSound", function()
	LocalPlayer():ConCommand("stopsound")
	local path = net.ReadString()
	sound.PlayFile(path, "",function( station ) if ( IsValid( station ) ) then station:Play() end end )
end)
