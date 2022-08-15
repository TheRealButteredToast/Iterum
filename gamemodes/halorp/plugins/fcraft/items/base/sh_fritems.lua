ITEM.name = "Faction Item"
ITEM.desc = "Faction Research Item that will Drop if you Die."
ITEM.category = "Faction Research Item"
ITEM.model = "models/weapons/w_pistol.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.isFRP = true

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(128, 0, 128, 1)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

hook.Add("PlayerDeath", "nutStripClip", function(client)
	local inventory = client:getChar() and client:getChar():getInv()
	if (not inventory) then return end
	for k, v in pairs(inventory:getItems()) do
		if (v.isFRP) then
			nut.item.spawn( v.uniqueID, client:GetShootPos(), function() v:remove() end, Angle(), v.data )
		end
	end
end)