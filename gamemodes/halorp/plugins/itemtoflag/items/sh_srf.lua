ITEM.name = "SRS-99C S2AMB Training"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 2580
ITEM.desc = "Use to receive training to use snipers"
ITEM.category = "Item to Flag"

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.toflag = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		item.player:getChar():giveFlags('L')
		item.player:ChatPrint("I can now operate the SRS-99C!") 
		item:remove()

		return true
	end,
}