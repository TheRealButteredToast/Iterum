ITEM.name = "ID Card"
ITEM.desc = "Faction Identification Device"
ITEM.model = "models/valk/h3/unsc/props/pda/pda.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Faction IDs"
--ITEM.faction = {FACTION_CP, FACTION_ADMIN}
ITEM.price = 10

ITEM.functions.Assign = { -- sorry, for name order.
	name = "Assign",
	tip = "Assign this ID to yourself!",
	icon = "icon16/arrow_in.png",
	onRun = function(item)
		local name = item.player:getChar():getName()..item:getName()
		item:setData("name",name)
		item.name = name
		
		return false
	end,
	onCanRun = function(item)
		local name = item:getName()
		return (name == "'s Covenant ID Card" or name == "'s UNSC ID Card" or name == "'s Asphodel Government ID Card")
	end
}

function ITEM:getName()
	return self:getData("name")
end