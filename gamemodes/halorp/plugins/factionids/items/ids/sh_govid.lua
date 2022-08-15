ITEM.name = "'s Asphodel Government ID Card"
ITEM.desc = "Government Identification Device"
ITEM.model = "models/freeman/w_police_citation.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Faction IDs"
ITEM.price = 360

function ITEM:onInstanced()
	local name = "'s Asphodel Government ID Card"
	self:setData("name",name)
	self.name = name
end