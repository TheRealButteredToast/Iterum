ITEM.name = "Low Quality Metal"
ITEM.desc = "A lower quality metal, still useful."
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.price = 20

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(153, 0, 0, 100)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end