ITEM.name = "Uniform Base"
ITEM.desc = "Uniform."
ITEM.category = "Uniforms"
ITEM.model = "models/props_c17/BriefCase001a.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.equipped = false
ITEM.value = nil
ITEM.isEquipment = true
ITEM.atr = nil
ITEM.requirements = nil
ITEM.reqMols = nil
ITEM.prohibiters = nil
ITEM.bgn = 0
ITEM.bgv = 0
ITEM.bgs = ""
ITEM.bgsr= ""
ITEM.isK = false
ITEM.skin = 0
ITEM.outfitCategory = "uniform"

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
ITEM.functions.Unwear = { -- sorry, for name order.
	name = "Take Off",
	tip = "equipTip",
	icon = "icon16/cross.png",
	onRun = function(item)
		item:removePart(item.player)
		local client = item.player
		local char = client:getChar()
		
		client:Freeze(false)
		if item.value != nil then client:SetArmor(client:Armor()-item.value) end
		if item.atr != nil then
			for k,v in pairs (item.atr) do
				client:getChar():updateAttrib(tostring(k), -v)
			end
		end
		client:ChatPrint(item.name.." taken off.")
		item.equipped = false
		item.player:EmitSound("items/ammo_pickup.wav", 80)
		
		-- Bodygroup & Skin Aspect
		if(item.isK == true) then
			item.player:SetSkin(0)
		end
		
		if(item.bgv != 0) then
			item.player:SetBodygroup(item.bgn, 0)
		end
		
		if( item.bgs != "") then
			item.player:SetBodyGroups(item.bgsr)
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") == true and item.player:IsFrozen() == false)
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Wear = {
	name = "Wear",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local items = char:getInv():getItems()
		
		if item.prohibiters != nil then
			if table.HasValue(item.prohibiters,char:getModel()) then client:notify("This Uniform does not fit you!") return false end	-- Makesure theyre the not a bad model
		end
		
		if item.reqMols != nil then
			if !table.HasValue(item.reqMols,char:getModel()) then client:notify("This Uniform does not fit you!") return false end	-- Makesure they are the right model
		end
		
		local switch = true
		
		for k, v in pairs(items) do
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if item.requirements != nil then 
					if table.HasValue(item.requirements, v.uniqueID) and v.equipped then 
						switch = false end 
					if switch then item.player:notify("Missing Required Item!") return false end
				end
				
				if (v.outfitCategory == item.outfitCategory and itemTable:getData("equip")) then
					client:notifyLocalized("Already wearing an incompatible item!")

					return false
				end
			end
		end
		
		client:Freeze(true)
		item:setData("equip", true)
		item.equipped = true
		
		client:setAction("Equiping...", 6, function()
			client:Freeze(false)
			if item.value != nil then client:SetArmor(client:Armor()+item.value) end
			
			client:ChatPrint(item.name.." equipped.")
			client:EmitSound("items/ammo_pickup.wav", 80)
			
			if( item.bgs != "") then
				client:SetBodyGroups(item.bgs)
				if item.isK == true then
					client:SetSkin(item.skin)
				end
			elseif(item.isK == true) then
				client:SetSkin(item.skin)
			elseif(item.bgv != 0) then
				client:SetBodygroup(item.bgn,item.bgv)
			end
			if(item.atr != nil) then
				for k,v in pairs (item.atr) do
					char:updateAttrib(tostring(k), v)
				end
			end
		end)			
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true and item.player:IsFrozen() == false )
	end
}

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end

	return true
end