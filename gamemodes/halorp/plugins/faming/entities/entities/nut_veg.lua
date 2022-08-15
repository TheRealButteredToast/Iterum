AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Vegetable Pot"
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
		self:SetModel("models/iterum/vegpot.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambient/machines/electric_machine.wav")
		self.cycle2 = CreateSound(self, "ambient/levels/canals/water_rivulet_loop2.wav")
		self.cycle3 = CreateSound(self, "ambient/levels/canals/waterleak_loop1.wav")
		self.receivers = {}
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end

		Inventory:instance({w = 4, h = 4})
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
	
		if(timer.Exists("farmCycle1"..self:EntIndex())) then
			activator:notifyLocalized("Germination Cycle is underway with ".. timer.TimeLeft("farmCycle1"..self:EntIndex()) .. " seconds left.")
			return false
		elseif(timer.Exists("farmCycle2"..self:EntIndex())) then
			activator:notifyLocalized("Terranean Growth Cycle is underway with ".. timer.TimeLeft("farmCycle2"..self:EntIndex()) .. " seconds left.")
			return false
		elseif(timer.Exists("farmCycle3"..self:EntIndex())) then
			activator:notifyLocalized("Sanitization and Harvest Cycle is underway with ".. timer.TimeLeft("farmCycle3"..self:EntIndex()) .. " seconds left.")
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
						netstream.Start(activator, "farmOpen", self, inventory:getID())
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
			local item = inv:getItemCount("vegpod")
				
			if (item == 0) then
				client:notifyLocalized("No vegetable pods detected.")
				return false
			else
				table.insert(itemsToRemove, {"vegpod", item})
			end
			
			for _, q in ipairs(itemsToRemove) do
				local items = inv:getItemsOfType("vegpod")
				for i=1, q[2] do
					inv:removeItem(items[i].id, false)
				end
			end
			
			client:notifyLocalized("Beggining Germination Cycle...")
			self.loopsound:Play()
			timer.Create("farmCycle1"..self:EntIndex(), 120, 1, function()
				local notified = false
				client:notifyLocalized("Germination finished. Beggining Terranean Growth Cycle...")
				self.loopsound:Stop()
				self.cycle2:Play()
				self:SetBodygroup(1,1)
				timer.Create("farmCycle2"..self:EntIndex(), 120, 1, function()
					local notified = false
					client:notifyLocalized("Terranean Growth Cycle finished. Beggining Sanitization and Harvest Cycle...")
					self.cycle2:Stop()
					self.cycle3:Play()
					timer.Create("farmCycle3"..self:EntIndex(), 120, 1, function()
						local notified = false
						for i=1, item do
							local res
							local rand = math.random(0,10)
							if(rand > 8) then
								res = "highqualveg"
							elseif(rand < 5) then
								res = "medqualveg"
							else
								res = "lowqualveg"
							end
							inv:add(res)
						end
						self:SetBodygroup(1,0)
						client:notifyLocalized("Farm cycle finished. Reseting Systems...")
						self.cycle3:Stop()
					end)
				end)
			end)
			return true

		end
	end

	function ENT:OnRemove()
		self.loopsound:Stop()
		self.cycle2:Stop()
		self.cycle3:Stop()
		
		timer.Remove("farmCycle1"..self:EntIndex())
		timer.Remove("farmCycle2"..self:EntIndex())
		timer.Remove("farmCycle3"..self:EntIndex())
		
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
	
	netstream.Hook("doFarm", function(client, entity, seconds)
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

		nut.util.drawText(L"Traxus Farming System Type 3v", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Automated farming system for vegetables.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end