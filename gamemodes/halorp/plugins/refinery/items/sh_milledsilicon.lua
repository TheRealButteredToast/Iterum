ITEM.name = "Milled Silicon"
ITEM.desc = "Silicon that has been milled into a pure concentration."
ITEM.model = "models/mechanics/solid_steel/plank_4.mdl"
ITEM.price = 300

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(176, 92, 99)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end