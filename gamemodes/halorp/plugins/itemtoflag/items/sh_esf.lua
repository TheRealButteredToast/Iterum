ITEM.name = "Type-1 Sword Training"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 3000
ITEM.desc = "Use to receive training to use energy swords"
ITEM.category = "Item to Flag"

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.toflag = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		item.player:getChar():giveFlags('m')
		item.player:ChatPrint("I can now operate Energy Swords!") 
		item:remove()

		return true
	end,
}