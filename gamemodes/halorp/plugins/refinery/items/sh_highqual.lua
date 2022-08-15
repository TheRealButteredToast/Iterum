ITEM.name = "High Quality Metal"
ITEM.desc = "A high quality metal, extremly useful."
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.price = 180

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(76, 153, 0, 100)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end