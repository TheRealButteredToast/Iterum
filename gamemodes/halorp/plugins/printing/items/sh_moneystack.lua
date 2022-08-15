ITEM.name = "Credit Stack"
ITEM.desc = "A stack of 1000 cR."
ITEM.model = "models/ishi/halo_rebirth/props/human/tac_pad.mdl"
ITEM.price = 1000
ITEM.functions = ITEM.functions or {}
ITEM.functions.redeem = {
	name = "Cash-In",
	tip = "Money! - Mr. Krabs",
	icon = "icon16/brick.png",
	onRun = function(item)
		item.player:getChar():giveMoney(1000)
	end,
}