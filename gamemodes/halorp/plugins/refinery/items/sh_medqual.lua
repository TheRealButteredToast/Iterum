ITEM.name = "Medium Quality Metal"
ITEM.desc = "A decent quality metal, used in more durable designs."
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.price = 60

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(153, 153, 0, 100)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end