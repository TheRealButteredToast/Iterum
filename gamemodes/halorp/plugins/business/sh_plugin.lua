PLUGIN.name = "Business"
PLUGIN.author = "Cheesenut"
PLUGIN.desc = "Adds a menu where players can buy items."

if (SERVER) then
	function PLUGIN:OnPlayerUseBusiness(client, item)
		-- You can manipulate purchased items with this hook.
		-- does not requires any kind of return.
		-- ex) item:setData("businessItem", true)
		-- then every purchased item will be marked as Business Item.
	end
end

function PLUGIN:CanPlayerUseBusiness(client, uniqueID)
	return false
end
