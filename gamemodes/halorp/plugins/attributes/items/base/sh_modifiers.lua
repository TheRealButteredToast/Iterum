ITEM.name = "Modifier Base"
ITEM.desc = "Modifier."
ITEM.category = "Modifier"
ITEM.model = "models/props_lab/bindergraylabel01b.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 10000000000
ITEM.equipped = false
ITEM.atr = {}
ITEM.isEquipment = true
ITEM.prohibiters = nil
ITEM.requirements = nil

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		else
			surface.SetDrawColor(255, 255, 255)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

function ITEM:removePart(client)
	self:setData("equip", false)
end

-- On item drop, unequip
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:removePart(item.player)
	end
end)

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.UnModify = { 
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	onRun = function(item)
		item:removePart(item.player)
		local client = item.player
		local char = client:getChar()
		
		for k,v in pairs (item.atr) do
			char:updateAttrib(tostring(k), -v)
		end
		
		client:ChatPrint("Modifier unequipped.")
		item.equipped = false
		item.player:EmitSound("items/ammo_pickup.wav", 80)
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") == true)
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Modify = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local items = char:getInv():getItems()
		
		local switch = true
		for k, v in pairs(items) do
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if item.requirements != nil then 
					if table.HasValue(item.requirements, v.uniqueID) and v.equipped then 
						switch = false end 
					if switch then item.player:notify("Missing Required Item!") return false end
				end
				
				if item.prohibiters != nil then
					if (((item.equipped == true or itemTable:getData("equip")) and table.HasValue(item.prohibiters, v.uniqueID))) then
						item.player:notify("Already Equipping Incompatible Item!")
						return false
					end
				end
			end
		end
		
		item:setData("equip", true)
			
		for k,v in pairs (item.atr) do
			char:updateAttrib(tostring(k), v)
		end

		client:ChatPrint("Modifier equipped.")
		client:EmitSound("items/ammo_pickup.wav", 80)	
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end

	return true
end