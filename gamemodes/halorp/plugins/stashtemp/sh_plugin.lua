PLUGIN.name		= "Temporary Storage"
PLUGIN.desc		= "A non-permanent storage system"
PLUGIN.author	= "Toast"

nut.util.include("cl_tempstore.lua")

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function playerMeta:canStore(storeID)
	-- is player occuping the crafting table?
	-- is player is capable of crafting? (ex. not dead, not tied, etc...)
	-- does player has enough ingredients?
	-- has flags or perks that preventing player from crafting item?
	if (!self:Alive()) then
		return false
	end

	return true -- add some conditions
end

function playerMeta:doStore(storeID)
	-- check the condition
	-- strip the ingredients
	-- add the result into player's inventory

	

	return true
end

function entityMeta:isSTORE()
	local class = self:GetClass()

	return (class == "nut_tempstore")
end

if CLIENT then

	netstream.Hook("storeOpen", function(entity, index)
		local inventory = nut.item.inventories[index]
		local inventory2 = LocalPlayer():getChar():getInv()

		nut.gui.inv1 = inventory2:show()
		nut.gui.inv1:ShowCloseButton(true)

		local panel = inventory:show()
		panel:ShowCloseButton(true)
		panel:SetTitle("Storage")
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