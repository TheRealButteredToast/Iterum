PLUGIN.name = "Quick Inventory"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "This plugin adds Quick Inventory Key in F4."

if (CLIENT) then
	local quickInventoryPanel = nil

	netstream.Hook("quickMenu", function()
		if (quickInventoryPanel) then
			quickInventoryPanel:Remove()
		end

		local inventory = LocalPlayer():getChar():getInv()

		if (inventory) then
			if (SOUND_INVENTORY_OPEN) then
				LocalPlayer():EmitSound(unpack(SOUND_INVENTORY_OPEN))
			end

			quickInventoryPanel = inventory:show()
			quickInventoryPanel:ShowCloseButton(true)
			
			function quickInventoryPanel:OnKeyCodePressed(key)
				if (key == 94) then
					quickInventoryPanel:Remove()
				end
			end
		end
	end)
else
	function PLUGIN:ShowSpare2(client)
		if (client:getChar()) then
			netstream.Start(client, "quickMenu")
		end
	end
end
