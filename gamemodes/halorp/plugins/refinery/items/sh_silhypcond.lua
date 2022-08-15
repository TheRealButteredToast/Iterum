ITEM.name = "Silicon Hyper Conductor"
ITEM.desc = "Fabricated Silicon wafers boasting a regular distance of 4 Femtometers."
ITEM.model = "models/valk/cea/unsc/props/cortanachip/cortanachip.mdl"
ITEM.price = 600

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(252, 252, 20)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end