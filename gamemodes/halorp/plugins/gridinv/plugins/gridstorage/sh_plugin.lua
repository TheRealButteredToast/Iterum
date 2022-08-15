PLUGIN.name = "Grid Storage"
PLUGIN.author = "Cheesenut"
PLUGIN.desc = "Storage of items inside a grid."

local INV_TYPE_ID = "grid"

STORAGE_DEFINITIONS = STORAGE_DEFINITIONS or {}
STORAGE_DEFINITIONS = STORAGE_DEFINITIONS or {}
STORAGE_DEFINITIONS["models/mandrac/water_storage/water_storage_small.mdl"] = {
	name = "UNSC Faction Storage",
	desc = "A high-tech storage system holding valuable items.",
	flag = "N",
	invType = INV_TYPE_ID,
	invData = {
		w = 8,
		h = 8
	}
}

STORAGE_DEFINITIONS["models/mandrac/hydrogen_tank/hydro_tank_large.mdl"] = {
	name = "Civilian Faction Storage",
	desc = "A high-tech storage system holding valuable items.",
	flag = "B",
	invType = INV_TYPE_ID,
	invData = {
		w = 8,
		h = 8
	}
}

STORAGE_DEFINITIONS["models/mandrac/hw_tank/hw_tank_large.mdl"] = {
	name = "Covenant Faction Storage",
	desc = "A high-tech storage system holding valuable items.",
	flag = "V",
	invType = INV_TYPE_ID,
	invData = {
		w = 8,
		h = 8
	}
}

if (CLIENT) then
	function PLUGIN:StorageOpen(storage)
		-- Number of pixels between the local inventory and storage inventory.
		local PADDING = 4

		if (
			not IsValid(storage) or
			storage:getStorageInfo().invType ~= INV_TYPE_ID
		) then
			return
		end

		-- Get the inventory for the player and storage.
		local localInv =
			LocalPlayer():getChar() and LocalPlayer():getChar():getInv()
		local storageInv = storage:getInv()
		if (not localInv or not storageInv) then
			return nutStorageBase:exitStorage()
		end

		-- Show both the storage and inventory.
		local localInvPanel = localInv:show()
		local storageInvPanel = storageInv:show()
		storageInvPanel:SetTitle(L(storage:getStorageInfo().name))

		-- Allow the inventory panels to close.
		localInvPanel:ShowCloseButton(true)
		storageInvPanel:ShowCloseButton(true)

		-- Put the two panels, side by side, in the middle.
		local extraWidth = (storageInvPanel:GetWide() + PADDING) / 2
		localInvPanel:Center()
		storageInvPanel:Center()
		localInvPanel.x = localInvPanel.x + extraWidth
		storageInvPanel:MoveLeftOf(localInvPanel, PADDING)

		-- Signal that the user left the inventory if either closes.
		local firstToRemove = true
		localInvPanel.oldOnRemove = localInvPanel.OnRemove
		storageInvPanel.oldOnRemove = storageInvPanel.OnRemove

		local function exitStorageOnRemove(panel)
			if (firstToRemove) then
				firstToRemove = false
				nutStorageBase:exitStorage()
				local otherPanel =
					panel == localInvPanel and storageInvPanel or localInvPanel
				if (IsValid(otherPanel)) then otherPanel:Remove() end
			end
			panel:oldOnRemove()
		end

		hook.Run("OnCreateStoragePanel", localInvPanel, storageInvPanel, storage)

		localInvPanel.OnRemove = exitStorageOnRemove
		storageInvPanel.OnRemove = exitStorageOnRemove
	end
end
