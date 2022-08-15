AddCSLuaFile()

ENT.Base = "nut_generator"
ENT.Type = "anim"
ENT.PrintName = "Water Purifier"
ENT.Author = "Toast"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup 		= RENDERGROUP_BOTH
ENT.Category = "NutScript"
ENT.invType = "gen"

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
		self:SetModel("models/toast/ports/watertank.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.loopsound = CreateSound(self, "ambient/machines/thumper_amb.wav")
		self.loopsound:Play()
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
				timer.Create("waterTim"..self:EntIndex(), 300, 0, function() inventory:add("water", 1) 
					if(math.random(0,1) >= 0.95) then
						inventory:add("koi", 1)
					end
				end)
				function inventory:onCanTransfer(client, oldX, oldY, x, y, newInvID)
					return hook.Run("StorageCanTransfer", inventory, client, oldX, oldY, newInvID)
				end
			end)
    end
	function ENT:OnRemove()
		self.loopsound:Stop()
		timer.Remove("waterTim"..self:EntIndex())
		    
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

		nut.util.drawText(L"Water Purifier", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Passively generates water bottles overtime.", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end