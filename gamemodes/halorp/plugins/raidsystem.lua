PLUGIN.name = "Raid System"
PLUGIN.author = "Toast"
PLUGIN.desc = "Allow admins to easily launch raids."

if (SERVER) then
	util.AddNetworkString("nsOpenRaidMenu")
	util.AddNetworkString("nsRaidServerSide")
	net.Receive("nsRaidServerSide", function(len, client) -- This is the Real Deal
		local raided = net.ReadString()
		local raider = net.ReadString()
		if (client:IsAdmin()) then
			print(client:GetName().." has authorized a Raid for the "..raider.." against the "..raided.."!")
			if raided == "UNSC" then
				local sb = ents.Create("nut_spwnblocker")
				sb:SetPos(Vector(-1740.992676, -11578.766602, 1159.928467))
				sb:SetAngles(Angle(90, 90, 0))
				sb:Spawn()
				
				local storages = {}
				for _,v in ipairs(ents.GetAll()) do
					if v:GetClass() == "nut_storage" then
						local def = v:getStorageInfo()
						if def then
							if def.flag == "N" then
								v:SetNWBool("raid",true)
								table.insert(storages,v)
							end
						end
					end
				end
				
				timer.Simple(600,function() sb:Remove() for _,v in ipairs(storages) do v:SetNWBool("raid",false) end storages = nil end)
			elseif raided == "Covenant" then
				local sb = ents.Create("nut_spwnblocker")
				sb:SetPos(Vector(-8102.204590, 11205.715820, -1487.968750))
				sb:SetAngles(Angle(90, 90, 0))
				sb:Spawn()
				
				local storages = {}
				for _,v in ipairs(ents.GetAll()) do
					if v:GetClass() == "nut_storage" then
						local def = v:getStorageInfo()
						if def then
							if def.flag == "V" then
								v:SetNWBool("raid",true)
								table.insert(storages,v)
							end
						end
					end
				end
				
				timer.Simple(600,function() sb:Remove() for _,v in ipairs(storages) do v:SetNWBool("raid",false) end storages = nil end)
			elseif raided == "Government" then
				local sb = ents.Create("nut_spwnblocker")
				sb:SetPos(Vector(-8804.058594, -4332.897461, -14795.412109))
				sb:SetAngles(Angle(90, 0, 0))
				sb:Spawn()
				
				local sb2 = ents.Create("nut_spwnblocker")
				sb2:SetPos(Vector(-8804.372070, -4352.505371, -14365.975586))
				sb2:SetAngles(Angle(90, 0, 0))
				sb2:Spawn()
				
				local sb3 = ents.Create("nut_spwnblocker")
				sb3:SetPos(Vector(-7052.977051, -2951.078613, -14031.844727))
				sb3:SetAngles(Angle(90, 90, 0))
				sb3:Spawn()
				
				local storages = {}
				for _,v in ipairs(ents.GetAll()) do
					if v:GetClass() == "nut_storage" then
						local def = v:getStorageInfo()
						if def then
							if def.flag == "B" then
								v:SetNWBool("raid",true)
								table.insert(storages,v)
							end
						end
					end
				end
				
				timer.Simple(600,function() sb:Remove() sb2:Remove() sb3:Remove() for _,v in ipairs(storages) do v:SetNWBool("raid",false) end storages = nil end)
			end
		end
	end)
end

nut.command.add("raidsystem", {
	adminOnly = true,
	onRun = function(client, arguments)
		net.Start("nsOpenRaidMenu")
		net.Send(client)
	end
})

local function RaidInit(raided,raider,rrn,rdn)
	surface.PlaySound("garrysmod/ui_click.wav")
	client = LocalPlayer()
	--[[if rrn != 0 and rdn != 0 then
		if rrn >=4 and rdn >= 4 then
			if rrn > rdn then
				if rrn - rdn > 2 then 
					client:ChatPrint("The Factions are too Unbalanced!")
					return
			else
				if rdn - rrn > 2 then
					else
						client:ChatPrint("The Factions are too Unbalanced!")
						return
					end
				end
			end
		else
			client:ChatPrint("Both factions must have more than Four people on!")
		end
	else
		client:ChatPrint("One of the factions has Zero players on!")
		return
	end
	--]]
	client:ChatPrint("Raid Approved! Spawns will be blocked, Faction Storage Unlocked, and a Server Log Created!")
	net.Start("nsRaidServerSide")
	net.WriteString(raided)
	net.WriteString(raider)
	net.SendToServer()
end

-- This is all Client Side
net.Receive("nsOpenRaidMenu", function(client)
	local un = 0
	local cn = 0
	local pn = 0
	local client = LocalPlayer()
	
	-- Does not count bots!
	for k,v in ipairs(player.GetAll()) do
		local character = v:getChar()
		if character:hasFlags('N') or character:hasFlags('O') then
			un = un + 1
		elseif character:hasFlags('V') then
			cn = cn + 1
		elseif character:hasFlags('B') or character:hasFlags('b') then
			pn = pn + 1
		end
	end
	
	local Menu = vgui.Create("DMenu")
	Menu:MakePopup()
	Menu:Center()
	local SubMenu1 = Menu:AddSubMenu("UNSC["..un.."] is Raiding...")
	SubMenu1:AddOption("Covenant["..cn.."]", function() RaidInit("Covenant","UNSC",un,cn) end)
	SubMenu1:AddOption("Government["..pn.."]", function() RaidInit("Government","UNSC",un,pn) end)
	local SubMenu2 = Menu:AddSubMenu("Covenant["..cn.."] is Raiding...")
	SubMenu2:AddOption("UNSC["..un.."]", function() RaidInit("UNSC","Covenant",cn,un) end)
	SubMenu2:AddOption("Government["..pn.."]", function() RaidInit("Government","Covenant",cn,pn) end)
	local SubMenu4 = Menu:AddSubMenu("Government["..pn.."] is Raiding...")
	SubMenu4:AddOption("Covenant["..cn.."]", function() RaidInit("Covenant","Government",pn,cn) end)
	SubMenu4:AddOption("UNSC["..un.."]", function() RaidInit("UNSC","Government",pn,un) end)
	local AuthMenu = Menu:AddOption("Raids will ony be approved if both factions have members online and are within two members of each other!", function() end)
	AuthMenu:SetIcon("icon16/star.png")
	Menu:Open()
end)