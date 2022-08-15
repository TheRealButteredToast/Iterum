ITEM.name = "Armor Base"
ITEM.desc = "Armor."
ITEM.category = "Armor"
ITEM.model = "models/props_lab/bindergraylabel01b.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.equipped = false
ITEM.value = nil
ITEM.multi = 0.75
ITEM.isEquipment = true
ITEM.atr = {}
ITEM.subItems = {}
ITEM.models = {}	-- Models to set the player to
ITEM.badModels = {}	-- Models the player can NOT be
ITEM.pastModel = ""	-- Saves the players last model for when they uneqip

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(110, 255, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		else
			surface.SetDrawColor(255,255,204)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

function ITEM:getOldModel()
	return self:getData("pastModel")
end

function ITEM:removePart(client)
	self:setData("equip", false)
end

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip") and item.player:IsFrozen() == false) then
		item:removePart(item.player)
	end
end)

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	onRun = function(item)
		item:removePart(item.player)
		local client = item.player
		local char = client:getChar()
		local items = char:getInv():getItems()
		
		for k, v in pairs(items) do
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				if item.subItems != {} then
					if table.HasValue(item.subItems, v.uniqueID) and v.equipped then
						client:notify("Unequipping Child Items...")
						if v.value != nil then client:SetArmor(client:Armor()-v.value) end
						v.equipped = false
						v:setData("equip",false)
						for k,v in pairs (v.atr) do
							char:updateAttrib(tostring(k), -v)
						end
					end
				end
			end
		end
		
		client:Freeze(false)
		if item:getOldModel() != "" then char:setModel( item:getOldModel() ) end	-- Set the player as their old model
		if item.value != nil then client:SetArmor(client:Armor()-item.value) end
		for k,v in pairs (item.atr) do
			client:getChar():updateAttrib(tostring(k), -v)
		end
		client:ChatPrint("Armor taken off.")
		client:getChar():setArmor(false)
		item.equipped = false
		item.player:EmitSound("items/ammo_pickup.wav", 80)
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") == true and item.player:IsFrozen() == false)
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local items = char:getInv():getItems()
		if char:getArmor() or item:getData("equip") then
			client:notify("You're already wearing armor!")
			return false
		end 
		
		if table.HasValue(item.badModels,char:getModel()) then client:notify("This set does not fit you!") return false end	-- Makesure theyre the right model
		
		for k, v in pairs(items) do
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				if item.prohibiters != {} then
					if (itemTable.pacData and  item.equipped == true and itemTable:getData("equip") and table.HasValue(item.prohibiters, v.uniqueID)) then
						client:notify("Cannot equip! Missing Requirement, Already Wearing Armor, or Wearing an Incompatible Item!")

						return false
					end
				end
			end
		end
		
		client:Freeze(true)
		item:setData("equip", true)
		client:getChar():setArmor(true)
		item.equipped = true
	
		for k,v in pairs (item.atr) do
			char:updateAttrib(tostring(k), v)
		end
		
		client:setAction("Equiping...", 8, function()
			client:Freeze(false)
			if item.value != nil then client:SetArmor(item.value) end
			if item.models != {} then 
				item.pastModel = char:getModel() 
				item:setData("pastModel",item.pastModel)
				char:setModel(table.Random(item.models)) 
			end	-- Save the players original model and then give them the appropraite model
			
			client:ChatPrint("Armor equipped.")
			client:EmitSound("items/ammo_pickup.wav", 80)
		end)			
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true and item.player:IsFrozen() == false)
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end

	return true
end