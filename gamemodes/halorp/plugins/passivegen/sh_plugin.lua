PLUGIN.name		= "Passive Generators"
PLUGIN.author	= "Toast"
PLUGIN.desc 	= "Entities that passively generate items"

nut.util.include("cl_generator.lua")

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function entityMeta:isGenerator()
	local class = self:GetClass()

	return (class == "nut_generator" or class == "nut_hygen" or class == "nut_watergen")
end

if CLIENT then

	netstream.Hook("genOpen", function(entity, index)
		if(entity:GetClass() == "nut_watergen") then	
			if(entity:WaterLevel() < 1) then
				LocalPlayer():ChatPrint("The purifier must be in the water!")
				return false
			end
		end

		local inventory = nut.item.inventories[index]
		local inventory2 = LocalPlayer():getChar():getInv()

		nut.gui.inv1 = inventory2:show()
		nut.gui.inv1:ShowCloseButton(true)

		local panel = inventory:show()
		panel:ShowCloseButton(true)
		panel:SetTitle("Generator")
		panel:MoveLeftOf(nut.gui.inv1, 4)
		panel.OnClose = function(this)
			if (IsValid(nut.gui.inv1) and !IsValid(nut.gui.menu)) then
				nut.gui.inv1:Remove()
			end

			netstream.Start("invExit")
		end
			
		function nut.gui.inv1:OnClose()
			if (IsValid(panel) and !IsValid(nut.gui.menu)) then
				panel:Remove()
			end

			netstream.Start("invExit")
		end

		nut.gui["inv"..index] = panel
	end)
	
end