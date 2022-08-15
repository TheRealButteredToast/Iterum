ITEM.name = "M739 LMG Training"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 2700
ITEM.desc = "Use to receive training to use SAW"
ITEM.category = "Item to Flag"

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.toflag = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		item.player:getChar():giveFlags('J')
		item.player:ChatPrint("I can now operate the M739 LMG!") 
		item:remove()

		return true
	end,
}