AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Quantum Relay"
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
		self:SetModel("models/valk/haloreach/covenant/props/antennae/antennaelarge.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambience/mechwhine.wav")
		self.thump 	= CreateSound(self, "ambient/atmosphere/ambience6.wav")
		self.blow	= CreateSound(self, "ambient/atmosphere/captain_room.wav")
		self.start	= CreateSound(self, "ambient/energy/whiteflash.wav")
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
			activator:notifyLocalized("Transmission Cycle is underway with " .. math.Round(timer.TimeLeft("refineryTimery_"..self:EntIndex())) .. " seconds left.")
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
			local item = inv:getItemCount("artifact1")
				
			if (item == 0) then
				client:notifyLocalized("Insufficient Power Supply.")
				return false
			else
				table.insert(itemsToRemove, {"artifact1", item})
			end
			
			for _, q in ipairs(itemsToRemove) do
				local items = inv:getItemsOfType("artifact1")
				for i=1, q[2] do
					inv:removeItem(items[i].id, false)
				end
			end
			
			client:notifyLocalized("Beggining Quantum Transmission Cycle ...")
			for k,v in ipairs(player.GetAll()) do
				v:notifyLocalized("A vast surge of energy ripples from the Covenant Ship...")
			end
			self.loopsound:Play()
			self.thump:Play()
			self.blow:Play()
			self.start:Play()
			timer.Create("refineryTimery_"..self:EntIndex(), 1200, 1, function()
				local notified = false
					inv:add("bshieldcore")
					inv:add("bshieldsuite")
					inv:add("bshieldarmor")
				client:notifyLocalized("Transmission Cycle Completed.")
				self.loopsound:Stop()
				self.thump:Stop()
				self.blow:Stop()
				self.start:Stop()
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
		self.start:Stop()
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

		nut.util.drawText(L"Quantum Relay", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Massive Relay designed to securely transmit data across potentially infinite distances.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end