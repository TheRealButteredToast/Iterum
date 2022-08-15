ITEM.name = "Armor Debugger"
ITEM.desc = "Administrative Item - Sets the users armor status to unequipped"
ITEM.model = "models/maxofs2d/hover_rings.mdl"

ITEM.functions.Debugger = {
	name = "Debug",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		
		client:getChar():setArmor(false)
		client:SetArmor(0)
		client:ChatPrint("Armor Data set to False")
		client:EmitSound("items/ammo_pickup.wav", 80)	
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item.player:getChar():getArmor() == true)
	end
}