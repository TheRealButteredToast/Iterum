AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Taurus Assembly Plant"
ENT.Author = "Toast"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup 		= RENDERGROUP_BOTH
ENT.Category = "NutScript"
ENT.invType = "craft"

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
		self:SetModel("models/mandrac/nitrogen_tank/nitro_large.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambient/atmosphere/city_rumble_loop1.wav")
		self.loopsound2 = CreateSound(self, "ambient/atmosphere/hole_amb3.wav")
		self.loopsound3 = CreateSound(self, "ambient/atmosphere/tone_quiet.wav")
		self.loopsound4 = CreateSound(self, "ambient/levels/canals/manhack_machine_loop1.wav")
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

		if(timer.Exists("TaurusTimer_"..self:EntIndex())) then
			activator:notifyLocalized("Impatient Coward. Wait " .. math.Round(timer.TimeLeft("TaurusTimer_"..self:EntIndex())) .. " seconds.")
			self:EmitSound("ambient/alarms/warningbell1.wav")
			return false
		end
	
		self:EmitSound("ambient/levels/canals/headcrab_canister_open1.wav")
		
		local inventory = self:getInv()

		if (inventory and (activator.nutNextOpen or 0) < CurTime()) then
			if (activator:getChar()) then
				activator:setAction("Opening...", 1, function()
					if (activator:GetPos():Distance(self:GetPos()) <= 200) then
						self.receivers[activator] = true
						activator.nutBagEntity = self
						
						inventory:sync(activator)
						netstream.Start(activator, "arcOpen", self, inventory:getID())
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
				if (v.isTaurus) then
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
							client:notifyLocalized("Insufficient Sacrifice. More.")
							self:EmitSound("ambient/alarms/warningbell1.wav")
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
					
					self.loopsound:Play()
					self.loopsound2:Play()
					self.loopsound3:Play()
					self.loopsound4:Play()
					
					for k,v in ipairs(player.GetAll()) do
						v:notifyLocalized("The ground shakes and the earth quakes... A Machine deep within the Badlands has rumbled to life within the UNSC Bunker...")
						v:EmitSound("ambient/atmosphere/terrain_rumble1.wav")
					end
					
					timer.Create("TaurusTimer_"..self:EntIndex(), 3600, 1, function()
						local notified = false
						for _, add in ipairs(blueprint.result) do
							for i=1, add[2] do
								inv:add(add[1])
							end
						end
						
						client:notifyLocalized("Acknowledged. Calculating Assembly time... Thirty Minutes")
						self:EmitSound("ambient/levels/citadel/zapper_warmup1.wav")
						self.loopsound:Stop()
						self.loopsound2:Stop()
						self.loopsound3:Stop()
						self.loopsound4:Stop()
						self.thump:Stop()
					end)
					
					return true
				else
					client:notifyLocalized("Insufficent Direction in your Life.")
					self:EmitSound("ambient/alarms/warningbell1.wav")
			
					return false
				end
			else
				client:notifyLocalized("Its Empty you Fool. Reminds me of your Brain.")
				self:EmitSound("ambient/creatures/town_scared_sob1.wav")
			end
		end
	end

	function ENT:OnRemove()
		timer.Remove("TaurusTimer_"..self:EntIndex())
		self.loopsound:Stop()
		self.loopsound2:Stop()
		self.loopsound3:Stop()
		self.loopsound4:Stop()
		
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
	
	netstream.Hook("doCraft", function(client, entity, seconds)
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

		nut.util.drawText(L"Taurus Assembly Plant", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Archaic manufacturing equipment incorpating Forerunner Technology.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end