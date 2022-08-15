AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Helium Compressor"
ENT.Author = "Toast"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup 		= RENDERGROUP_BOTH
ENT.Category = "NutScript"
ENT.invType = "ref"

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
		self:SetModel("models/valk/h3/unsc/props/generator/generator_tech.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambient/machines/machine6.wav")
		self.thump 	= CreateSound(self, "ambient/machines/thumper_amb.wav")
		self.blow	= CreateSound(self, "ambient/gas/steam_loop1.wav")
		self.suck	= CreateSound(self, "ambient/machines/city_ventpump_loop1.wav")
		self.receivers = {}
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end

		Inventory:instance({w = 3, h = 3})
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

		if(timer.Exists("refineryTimery_"..self:EntIndex())) then
			activator:notifyLocalized("Helium Iso-Cycle is currently underway with " .. math.Round(timer.TimeLeft("refineryTimery_"..self:EntIndex())) .. " seconds left.")
			return false
		end

		local inventory = self:getInv()

		if (inventory and (activator.nutNextOpen or 0) < CurTime()) then
			if (activator:getChar()) then
				activator:setAction("Opening...", 1, function()
					if (activator:GetPos():Distance(self:GetPos()) <= 200) then
						self.receivers[activator] = true
						activator.nutBagEntity = self
						
						inventory:sync(activator)
						netstream.Start(activator, "refOpen", self, inventory:getID())
					end
				end)
			end

			activator.nutNextOpen = CurTime() + 1.5
		end
	end

	function ENT:activate(client)
		if (client:canRefine()) then
			local inv = self:getInv()
			local refineableItems = inv:getItems()
			local itemsToRemove = {}
			local item = inv:getItemCount("fusioncoil")
				
			if (item == 0) then
				client:notifyLocalized("Insufficient Power Supply.")
				return false
			elseif(item > 2) then
				if(1 == (item - 2)) then
					client:notifyLocalized("Power Overload risk detected... Remove a fusion coil.")
				else
					client:notifyLocalized("Power Overload risk detected... Remove ".. item - 2 .." fusion coil.")
				end
				return false
			else
				table.insert(itemsToRemove, {"fusioncoil", item})
			end
			
			for _, q in ipairs(itemsToRemove) do
				local items = inv:getItemsOfType("fusioncoil")
				for i=1, q[2] do
					inv:removeItem(items[i].id, false)
				end
			end
			
			client:notifyLocalized("Beggining Helium Harvest Cycle ...")
			self.loopsound:Play()
			self.thump:Play()
			self.blow:Play()
			self.suck:Play()
			timer.Create("refineryTimery_"..self:EntIndex(), 600, 1, function()
				local notified = false
				for i=1, item do
					local res = "helium3"
					local rand = math.random(0,10)
					if(rand > 9) then
						inv:add(res)
						inv:add(res)
						inv:add(res)
						inv:add(res)
					elseif(rand >= 7) then
						inv:add(res)
						inv:add(res)
					else
						inv:add(res)
					end
				end
				client:notifyLocalized("Helium Harvest Cycle finished. Reseting Systems.")
				self.loopsound:Stop()
				self.thump:Stop()
				self.blow:Stop()
				self.suck:Stop()
			end)
			return true

		end
	end

	function ENT:getInv()
		return nut.item.inventories[self:getNetVar("id", 0)]
	end
	
	function ENT:OnRemove()
		self.loopsound:Stop()
		self.thump:Stop()
		self.suck:Stop()
		self.blow:Stop()
		timer.Remove("refineryTimery_"..self:EntIndex())
		
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
	
	netstream.Hook("doRefine", function(client, entity, seconds)
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

		nut.util.drawText(L"Helium Super-Compressor", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Massive Helium-3 extractor powered by fusion coils.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end