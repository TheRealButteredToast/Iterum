ITEM.name = "Type-51 Energy Rifle Training"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 3000
ITEM.desc = "Use to receive training to use the plasma repeater"
ITEM.category = "Item to Flag"

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.toflag = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		item.player:getChar():giveFlags('j')
		item.player:ChatPrint("I can now operate the Type-51 Energy Rifle!") 
		item:remove()

		return true
	end,
}