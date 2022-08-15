ITEM.name = "Type-50 Particle Beamrifle Training"
ITEM.model = "models/props_lab/binderredlabel.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 3220
ITEM.desc = "Use to receiver training to use beam rifles"
ITEM.category = "Item to Flag"

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.toflag = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		item.player:getChar():giveFlags('l')
		item.player:ChatPrint("I can now operate Beam Rifles!") 
		item:remove()

		return true
	end,
}