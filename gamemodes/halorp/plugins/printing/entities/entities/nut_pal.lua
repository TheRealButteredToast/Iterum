AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Credit Printer"
ENT.Author = "Toast"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup 		= RENDERGROUP_BOTH
ENT.Category = "NutScript"
ENT.invType = "farm"

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
		self:SetModel("models/toast/ports/server.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambient/levels/labs/equipment_printer_loop1.wav")
		self.receivers = {}
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end

		Inventory:instance({w = 2, h = 2})
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

		if(timer.Exists("printCycle"..self:EntIndex())) then
			activator:notifyLocalized("Cycle is underway with ".. timer.TimeLeft("printCycle"..self:EntIndex()) .. " seconds left.")
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
						netstream.Start(activator, "printOpen", self, inventory:getID())
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
			local item = inv:getItemCount("moneypaper")
				
			if (item == 0) then
				client:notifyLocalized("No credit material detected.")
				return false
			else
				table.insert(itemsToRemove, {"moneypaper", item})
			end
			
			for _, q in ipairs(itemsToRemove) do
				local items = inv:getItemsOfType("moneypaper")
				for i=1, q[2] do
					inv:removeItem(items[i].id, false)
				end
			end
			
			client:notifyLocalized("Beggining Print Cycle...")
			self.loopsound:Play()
			timer.Create("printCycle"..self:EntIndex(), 3600, 1, function()
				local notified = false
				for i=1, item do
					inv:add("moneystack")
				end
				client:notifyLocalized("Print cycle finished. Reseting Systems...")
				self.loopsound:Stop()
			end)
			return true

		end
	end

	function ENT:OnRemove()
		self.loopsound:Stop()
		timer.Remove("printCycle"..self:EntIndex())
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
	
	function ENT:OnTakeDamage( dmginfo )
		if ( not self.m_bApplyingDamage ) then
			self.m_bApplyingDamage = true
			self:TakeDamageInfo( dmginfo )
			self.m_bApplyingDamage = false
		end
		
		
		if(dmginfo:GetDamage() >= 100 or self:IsOnFire()) then
			self:setNetVar("gone", true)
			self.loopsound:Stop()
			
			nut.item.spawn("moneystack", self:GetPos(), false , self:GetAngles())
			
			local effectData = EffectData()
			effectData:SetStart(self:GetPos())
			effectData:SetOrigin(self:GetPos())
			
			self:EmitSound("ambient/explosions/explode_1.wav", 120, 200)
			util.Effect("Explosion", effectData, true, true)
			
			--util.BlastDamage( self, self or self, self:GetPos() + Vector( 0, 0, 1 ), 256, 120 )
			self:Ignite(10, 10)

			self:Remove()
		end
	end
	
	netstream.Hook("doPrint", function(client, entity, seconds)
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

		nut.util.drawText(L"Credit Printer", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Converts credit material into credits!.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end