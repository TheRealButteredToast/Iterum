PLUGIN.name		= "Farming"
PLUGIN.desc		= "A new farming system that actually works"
PLUGIN.author	= "Toast"

nut.util.include("cl_farming.lua")

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function playerMeta:canFarm(farID)
	-- is player occuping the crafting table?
	-- is player is capable of crafting? (ex. not dead, not tied, etc...)
	-- does player has enough ingredients?
	-- has flags or perks that preventing player from crafting item?
	if (!self:Alive()) then
		return false
	end

	return true -- add some conditions
end

function playerMeta:doFarm(farID)
	-- check the condition
	-- strip the ingredients
	-- add the result into player's inventory

	

	return true
end

function entityMeta:isFarm()
	local class = self:GetClass()

	return (class == "nut_veg" or class == "nut_fruit")
end

if CLIENT then

	netstream.Hook("farmOpen", function(entity, index)
		local inventory = nut.item.inventories[index]
		local inventory2 = LocalPlayer():getChar():getInv()

		nut.gui.inv1 = inventory2:show()
		nut.gui.inv1:ShowCloseButton(true)

		local panel = inventory:show()
		panel:ShowCloseButton(true)
		panel:SetTitle("Planter")
		panel:MoveLeftOf(nut.gui.inv1, 4)
		panel.OnClose = function(this)
			if (IsValid(nut.gui.inv1) and !IsValid(nut.gui.menu)) then
				nut.gui.inv1:Remove()
			end

			netstream.Start("invExit")
		end
			
		function nut.gui.inv1:OnClose()
			if (IsValid(panel) and !IsValid(nut.gui.menu)) then
				panel:Remove()
			end

			netstream.Start("invExit")
		end
		
		local actPanel = vgui.Create("DPanel")
			actPanel:SetDrawOnTop(true)
			actPanel:SetSize(100, panel:GetTall())
			actPanel.Think = function(this)
				if (!panel or !panel:IsValid() or !panel:IsVisible()) then
					this:Remove()

					return
				end

				local x, y = panel:GetPos()
				this:SetPos(x - this:GetWide() - 5, y)
			end

			local btn = actPanel:Add("DButton")
			btn:Dock(TOP)
			btn:SetText(L"Germinate")
			btn:SetColor(color_white)
			btn:DockMargin(5, 5, 5, 0)

			function btn.DoClick()
				netstream.Start("doFarm", entity, v)
				panel:Remove()
				nut.gui.inv1:Remove()
				netstream.Start("invExit")
			end

		nut.gui["inv"..index] = panel
	end)
	
end