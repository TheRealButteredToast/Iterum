AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "CIVARC Machine"
ENT.Author = "Toast"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup 		= RENDERGROUP_BOTH
ENT.Category = "NutScript"
ENT.invType = "fcraft"

Inventory = FindMetaTable("GridInv")
nut.item.inventories = nut.inventory.instances

if (SERVER) then

local function ItemCanEnterForEveryone(inventory, action, context)
	if (action == "transfer") then
		return true
	end
end

local function CanReplicateItemsForEveryone(inventory, action, context)
	if (action == "repl") then
		return true
	end
end

	function ENT:Initialize()
		self:SetModel("models/mandrac/resource_cache/huge_cache.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambient/machines/machine3.wav")
		self.loopsound:Play()
		self.receivers = {}
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end

		Inventory:instance({w = 8, h = 8})
			:next(function(inventory)
				self:setInventory(inventory)
				inventory:addAccessRule(ItemCanEnterForEveryone)
				inventory:addAccessRule(CanReplicateItemsForEveryone)
				inventory.noBags = false
				function inventory:onCanTransfer(client, oldX, oldY, x, y, newInvID)
					return hook.Run("StorageCanTransfer", inventory, client, oldX, oldY, newInvID)
				end
			end)
	end
	
	function ENT:setInventory(inventory)
		if (inventory) then
			self:setNetVar("id", inventory:getID())

			inventory.onAuthorizeTransfer = function(inventory, client, oldInventory, item)
				if (IsValid(client) and IsValid(self) and self.receivers[client]) then
					return true
				end
			end

			inventory.getReceiver = function(inventory)
				local receivers = {}

				for k, v in pairs(self.receivers) do
					if (IsValid(k)) then
						receivers[#receivers + 1] = k
					end
				end

				return #receivers > 0 and receivers or nil
			end
		end
	end
	
	function ENT:Use(activator)
		if (self:getNetVar("gone")) then
			return
		end

		local inventory = self:getInv()

		if (inventory and (activator.nutNextOpen or 0) < CurTime()) then
			if (activator:getChar()) then
				activator:setAction("Opening...", 1, function()
					if (activator:GetPos():Distance(self:GetPos()) <= 200) then
						self.receivers[activator] = true
						activator.nutBagEntity = self
						
						inventory:sync(activator)
						netstream.Start(activator, "farcOpen", self, inventory:getID(), "123", "Civilian FARC Machine")
					end
				end)
			end

			activator.nutNextOpen = CurTime() + 1.5
		end
	end

	function ENT:activate(client)
		if (client:canCraft()) then
			local blueprint
			local blurprintNum = 0
			local inv = self:getInv()
			local craftableItems = inv:getItems()

			for k, v in pairs(craftableItems) do
				if (v.isFBlueprint) then
					blueprint = v
					blurprintNum = blurprintNum + 1
				end
			end
			-- this part is for generic crafting
			if (blueprint) then
				if (blurprintNum == 1) then
					local itemsToRemove = {}
					for _, req in ipairs(blueprint.requirements) do
						local item = inv:getItemCount(req[1])
						
						if (item < req[2]) then
							client:notifyLocalized("More ingredients required.")
							return false
						else
							table.insert(itemsToRemove, {req[1], req[2]})
						end
					end
					
					for _, q in ipairs(itemsToRemove) do
						local items = inv:getItemsOfType(q[1])
						for i=1, q[2] do
							inv:removeItem(items[i].id, false)
						end
					end

					for _, add in ipairs(blueprint.result) do
						for i=1, add[2] do
							inv:add(add[1])
						end
					end

					return true
				else
					if (blurprintNum > 1) then
						client:notifyLocalized("Please insert a singular blueprint.")
					end

					return false
				end
			else
				client:notifyLocalized("Nothing to Craft.")
			end
		end
	end

	function ENT:OnRemove()
		self.loopsound:Stop()
		
		local index = self:getNetVar("id")

		if (!nut.shuttingDown and !self.nutIsSafe and index) then
			local item = nut.item.inventories[index]

			if (item) then
				nut.item.inventories[index] = nil

				nut.db.query("DELETE FROM nut_items WHERE _invID = "..index)
				nut.db.query("DELETE FROM nut_inventories WHERE _invID = "..index)

				hook.Run("StorageItemRemoved", self, item)
			end
		end
	end

	function ENT:getInv()
		return nut.item.inventories[self:getNetVar("id", 0)]
	end
	
	netstream.Hook("doFCraft", function(client, entity, seconds)
		local distance = client:GetPos():Distance(entity:GetPos())
		
		if (entity:IsValid() and client:IsValid() and client:getChar() and
			distance < 700) then
			entity:activate(client)
		end
	end)
else
	function ENT:Draw()
		self:DrawModel()
	end
	
	function ENT:onShouldDrawEntityInfo()
		return true
	end

	function ENT:onDrawEntityInfo(alpha)
		local position = (self:LocalToWorld(self:OBBCenter()) + self:GetUp()*16):ToScreen()
		local x, y = position.x, position.y

		nut.util.drawText(L"Civilian FARC Machine", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Special Purpose ARC Machine designed for experimental and unstable designs.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end