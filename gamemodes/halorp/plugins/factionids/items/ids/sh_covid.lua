ITEM.name = "'s Covenant ID Card"
ITEM.desc = "Covenant Identification Device"
ITEM.model = "models/valk/h3/covenant/props/cortanabeacon/cortanabeacon.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Faction IDs"
ITEM.price = 360

function ITEM:onInstanced()
	local name = "'s Covenant ID Card"
	self:setData("name",name)
	self.name = name
end