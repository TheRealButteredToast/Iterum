PLUGIN.name		= "Drugs"
PLUGIN.desc		= "A new drug system that actually works"
PLUGIN.author	= "Toast"

nut.util.include("cl_lab.lua")

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function playerMeta:getDruged()
	return (self:getNetVar("druged")) or false
end

function playerMeta:addDrug(bool)
	self:setNetVar("druged", bool)
end

function playerMeta:canLab(drugID)
	-- is player occuping the crafting table?
	-- is player is capable of crafting? (ex. not dead, not tied, etc...)
	-- does player has enough ingredients?
	-- has flags or perks that preventing player from crafting item?
	if (!self:Alive()) then
		return false
	end

	return true -- add some conditions
end

function playerMeta:doProcess(drugID)
	-- check the condition
	-- strip the ingredients
	-- add the result into player's inventory

	

	return true
end

function entityMeta:isLAB()
	local class = self:GetClass()

	return (class == "nut_lab" or class == "nut_distiller")
end

if CLIENT then

	netstream.Hook("labOpen", function(entity, index)
		local inventory = nut.item.inventories[index]
		local inventory2 = LocalPlayer():getChar():getInv()

		nut.gui.inv1 = inventory2:show()
		nut.gui.inv1:ShowCloseButton(true)

		local panel = inventory:show()
		panel:ShowCloseButton(true)
		panel:SetTitle("Labratory")
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
			btn:SetText(L"Refine")
			btn:SetColor(color_white)
			btn:DockMargin(5, 5, 5, 0)

			function btn.DoClick()
				netstream.Start("doProcess", entity, v)
				panel:Remove()
				nut.gui.inv1:Remove()
				netstream.Start("invExit")
			end

		nut.gui["inv"..index] = panel
	end)
else
	local PLUGIN = PLUGIN
	
	function PLUGIN:CharacterPreSave(character)
		local savedDrug = character.player:getDruged()
		character:setData("druged", savedDrug)
	end

	function PLUGIN:PlayerLoadedChar(client, character, lastChar)
		if (character:getData("druged")) then
			client:setNetVar("druged", character:getData("druged"))
		else
			client:setNetVar("druged", false)
		end
	end

	function PLUGIN:PlayerDeath(client)
		client:setNetVar("druged", false)
	end

	function PLUGIN:PlayerSpawn(client)
		client:setNetVar("druged", false)
	end
end