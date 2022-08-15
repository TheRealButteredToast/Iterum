ITEM.name = "Recipe Hololens"
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
	{"mtsa", 6},
	{"silhypcond", 7},
	{"fusioncoil", 2},
}
ITEM.result = {
	{"hololens", 1}
}