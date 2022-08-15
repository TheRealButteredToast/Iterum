ITEM.name = "Milled Titanium Super Alloy"
ITEM.desc = "Extremely Pure Titanium reserved for the most Demanding Purposes."
ITEM.model = "models/mechanics/roboticslarge/a1.mdl"
ITEM.price = 1000

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(128, 0, 128)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end