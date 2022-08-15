PLUGIN = PLUGIN

PLUGIN.name = "Revive Redux"
PLUGIN.author = "_FR_Starfox64 (NS 1.0), Neon (NS 1.1), HATE Recon"
PLUGIN.desc = "Medics can revive dead players to full HP, while all can revive at partial HP."
     
nut.command.add("respawn", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function (client, arguments)
	local target
		if arguments[1] == nil then
			target = client 
		end	
		if !target then
			target = nut.command.findPlayer(client, arguments[1])
		end
		if target == nil then
			client:notifyLocalized("Cannot find the target...")
			return
		end
		if target:getChar() then
			local check, pos
			for k,v in ipairs(ents.FindByClass("prop_ragdoll")) do
				if (IsValid(v.player) and v.player == target) then
					check = true
					pos = v:GetPos()
				end
			end
			if check then
				target:UnSpectate()
				target:Spawn()
				target:SetPos(pos)
				target:notify("You were revived!")
				client:notify(target:getChar():getName() .." was revived!")
			else
				client:notify(target:getChar():getName() .." cannot be revived.")
			end
		end
	end
})

if CLIENT then
	local owner, w, h, ceil, ft, clmp
	ceil = math.ceil
	clmp = math.Clamp
	local aprg, aprg2 = 0, 0
	function PLUGIN:HUDPaint()
		owner = LocalPlayer()
		ft = FrameTime()
		w, h = ScrW(), ScrH()

		if (owner:getChar()) then
			if (owner:Alive()) then
				if (aprg != 0) then
					aprg2 = clmp(aprg2 - ft*1.3, 0, 1)
					if (aprg2 == 0) then
						aprg = clmp(aprg - ft*.7, 0, 1)
					end
				end
			else
				if (aprg2 != 1) then
					aprg = clmp(aprg + ft*.5, 0, 1)
					if (aprg == 1) then
						aprg2 = clmp(aprg2 + ft*.4, 0, 1)
					end
				end
			end
		end

		if (IsValid(nut.char.gui) and nut.gui.char:IsVisible() or !owner:getChar()) then
			return
		end

		surface.SetDrawColor(25, 0, 0, ceil((aprg^.5) * 155))
		surface.DrawRect(-1, -1, w+2, h+2)
		--local tx, ty = nut.util.drawText("You're critically wounded!", w/2, h/10, ColorAlpha(color_white, aprg2 * 255), 1, 1, "nutDynFontMedium", aprg2 * 255)
	end
	
	
	
	surface.CreateFont( "ReviveText", {
	 font = "Trebuchet MS",
	 size = 25,
	 weight = 500,
	 blursize = 0,
	 scanlines = 0,
	 antialias = true
	} )

	hook.Add("HUDPaint", "DrawDeadPlayers", function()
		if (LocalPlayer():getChar()) then
			for k, v in pairs(ents.FindByClass("prop_ragdoll")) do
				if IsValid(v) and v.isDeadBody and ( LocalPlayer():GetPos():DistToSqr(v:GetPos()) <= 16000) then
					local Pos = v:GetPos():ToScreen()
					draw.RoundedBox(0, Pos.x, Pos.y, 10, 40, Color(175, 100, 100))
					draw.RoundedBox(0, Pos.x - 15, Pos.y + 15, 40, 10, Color(175, 100, 100))

					draw.SimpleText("Time Left to Revive: "..math.Round(v:GetNWFloat("Time") - CurTime()), "ReviveText", Pos.x, Pos.y - 20, Color(249, 255, 239), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			end
		end
	end)
	
	netstream.Hook("nut_DeadBody", function( index )
		local ragdoll = Entity(index)

		if IsValid(ragdoll) then
			ragdoll.isDeadBody = true
		end
	end)
else
	local Corpses = {}
	
	function PLUGIN:PlayerSpawn( client )
		client:UnSpectate()
		if not client:getChar() then 
			return 
		end

		if IsValid(Corpses[client]) then
			Corpses[client]:Remove()
		end
	end

	--[[
		Purpose: Called when the player has died with a valid character.
	--]]

	function PLUGIN:DoPlayerDeath( client, attacker, dmg )
		if not client:getChar() then 
			return 
		end
		Corpses[client] = ents.Create("prop_ragdoll")
		Corpses[client]:SetPos(client:GetPos())
		Corpses[client]:SetModel(client:GetModel())
		Corpses[client]:Spawn()
		Corpses[client]:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		local phys = Corpses[client]:GetPhysicsObject()
		if phys and phys:IsValid() then
			phys:ApplyForceCenter(client:GetVelocity() * 15);
		end
		Corpses[client].player = client
		Corpses[client]:SetNWFloat("Time", CurTime() + nut.config.deathTime)
		Corpses[client]:SetNWBool("Body", true)

		timer.Simple(0.5, function()
			netstream.Start(nil, "nut_DeadBody", Corpses[client]:EntIndex())
		end)

		hook.Run("GenerateEvidences", client, Corpses[client], attacker, dmg)
		client:Spectate(OBS_MODE_CHASE)
		client:SpectateEntity(Corpses[client])
		timer.Simple(0.01, function()
			if(client:GetRagdollEntity() != nil and client:GetRagdollEntity():IsValid()) then
				client:GetRagdollEntity():Remove()
			end
		end)
	end
	function RevivePlayer(client)
		local check, pos
		for k,v in ipairs(ents.FindByClass("prop_ragdoll")) do
			if (IsValid(v.player) and v.player == client) then
				check = true
				pos = v:GetPos()
				
				break
			end
		end
		if !check then return end
		
		pos:Add(Vector(0,0,50))
		
		client:UnSpectate()
		client:Spawn()
		client:SetPos(pos)
	end
	
	
	function PLUGIN:KeyRelease(client, key)
		if (key == IN_USE) then
			local tr = util.TraceLine({
			 start  = client:GetShootPos(),
			 endpos = client:GetShootPos() + client:GetAimVector() * 84, -- How close the body must be inorder to revive in Source Units (1 SU = 1 Inch I think)
			 filter = client,
			 mask   = MASK_SHOT
			})
			if tr.Hit and IsValid(tr.Entity) and IsValid(tr.Entity.player) then
				if (client:KeyDown(IN_WALK)) then
					client:ConCommand("say /charsearch")
					return
				end
				local entity = tr.Entity
				entity.nutBeingGetUp = true
				entity.player:setAction("You got revived...", 6) -- 6 = How long Revive takes in seconds

				client:setAction("You are reviving ".. entity.player:getChar():getName(), 6) -- Change the # to that number ^
				client:doStaredAction(entity, function()
					entity.nutBeingGetUp = false
					RevivePlayer(entity.player)
					entity.player:SetHealth(40)
				end, 6, function() -- Change the # here too
					if (IsValid(entity)) then
						entity.nutBeingGetUp = false
						entity.player:setAction()
					end

					if (IsValid(client)) then
						client:setAction()
					end
				end)				
			end
		end
	end
end