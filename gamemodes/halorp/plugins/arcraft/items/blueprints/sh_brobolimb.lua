ITEM.name = "Recipe Robotic Limb"
ITEM.price = 5000
ITEM.model = "models/props_lab/bindergreen.mdl"
ITEM.isTaurus = true

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end

ITEM.requirements = {
	{"mtsa", 8},
	{"silhypcond", 10},
	{"fusioncoil", 2},
}
ITEM.result = {
	{"roboticlimb", 1}
}