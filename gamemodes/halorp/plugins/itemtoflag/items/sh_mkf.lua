ITEM.name = "Medical Equipment Training"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 9960
ITEM.desc = "Use to receive training to use medical equipment"
ITEM.category = "Item to Flag"

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.toflag = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		item.player:getChar():giveFlags('u')
		item.player:ChatPrint("I can now operate Medical Equipment!") 
		item:remove()

		return true
	end,
}