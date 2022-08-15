ITEM.name = "Drug Base"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.screenmat = "fasfasf"
ITEM.speedmult = 0
ITEM.healthmult = 0
ITEM.fallchance = false
ITEM.crashtime = 0
ITEM.restoretime = 0
ITEM.desc = "Drug Example"
ITEM.faction = {"",""}

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.digest = {
	name = "Injest",
	tip = "Engulf!",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		if(client:getChar().player:getDruged() or table.HasValue(item.factions,client:Team())) then
			client:Kill()
			client:notifyLocalized("You feel your heart stop...")
			return true
		end
		
		client:getChar().player:setNetVar("druged", true)
		local oH 	= client:Health()
		local oWS 	= client:GetWalkSpeed()
		local oRS 	= client:GetRunSpeed()
		local oCS 	= client:GetCrouchedWalkSpeed()
	
		client:SetHealth(oH * item.healthmult)
		client:SetWalkSpeed(oWS * item.speedmult)
		client:SetRunSpeed(oRS * item.speedmult)
		client:SetCrouchedWalkSpeed(oCS * item.speedmult)
		--[[
		function HUDPaintBackground(boo)
			if boo then
				local frameTime = FrameTime()
				local scrW, scrH = surface.ScreenWidth(), surface.ScreenHeight()
				local vignetteAlphaDelta = mathApproach(0, 0, frameTime * 30)
				surface.SetDrawColor(0, 0, 0, 175 + vignetteAlphaDelta)
				surface.SetMaterial(item.screenmat)
				surface.DrawTexturedRect(0, 0, scrW, scrH)
			end
		end--]]
		
		--HUDPaintBackground(true)
		if item.fallchance then
			local fT = 0
			local r = math.random(0,10)
			if(r >= 8) then
				fT = 60
			elseif(r >= 4 and r < 8) then
				fT = 120
			else
				fT = 180
			end
			timer.Create("fallOverGayBoy", fT, 0, function()  
				if(client:getChar().player:getNetVar("druged")) then
					nut.command.run( client, "fallover", "5" )
				else
					timer.Remove("fallOverGayBoy")
				end
			end)
		end
		
		if(item.crashtime == 0) then
			return true
		else
			timer.Create("Crash", item.crashtime, 1, function() 
				if(client:getChar().player:getNetVar("druged")) then
					client:SetHealth(oH / item.healthmult)
					client:SetWalkSpeed(oWS / item.speedmult)
					client:SetRunSpeed(oRS / item.speedmult)
					client:SetCrouchedWalkSpeed(oCS / item.speedmult)
					client:notifyLocalized("You don't feel so good...")
				end
			end)
		end
		
		if(item.restoretime == 0) then
			local r = math.random(300, 900)
			timer.Simple( r , function()
				if(client:getChar().player:getNetVar("druged")) then
					client:notifyLocalized("You feel your heart stop...")
					client:Kill()
					return true
				end
			end)
		else
			timer.Create("restore", item.restoretime, 1, function() 
				if(client:getChar().player:getNetVar("druged")) then
					client:SetHealth(oH)
					client:SetWalkSpeed(oWS)
					client:SetRunSpeed(oRS)
					client:SetCrouchedWalkSpeed(oCS)
					client:notifyLocalized("You're starting to feel better...")
					timer.Stop("fallOverGayBoy")
					client:getChar().player:setNetVar("druged", false)
				end
			end)
		end
		return true
	end,
}