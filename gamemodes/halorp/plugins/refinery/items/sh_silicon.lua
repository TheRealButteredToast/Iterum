ITEM.name = "Silicon"
ITEM.desc = "Raw silicon."
ITEM.model = "models/props_debris/concrete_chunk03a.mdl"
ITEM.price = 100

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(193, 150, 7)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end