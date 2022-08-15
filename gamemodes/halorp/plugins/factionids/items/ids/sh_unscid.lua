ITEM.name = "'s UNSC ID Card"
ITEM.desc = "UNSC Identification Device"
ITEM.model = "models/valk/h3/unsc/props/pda/pda.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Faction IDs"
ITEM.price = 360

function ITEM:onInstanced()
	local name = "'s UNSC ID Card"
	self:setData("name",name)
	self.name = name
end