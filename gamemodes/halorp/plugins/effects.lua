PLUGIN.name = "First Person Effects"
PLUGIN.author = "Black Tea (fixed by Zoephix)"
PLUGIN.desc = "This plugin adds more effects on First Person Perspective."

NUT_CVAR_EFFECTS = CreateClientConVar("nut_fpeffects", 1, true, true)

local langkey = "english"
do
	local langTable = {
		toggleEffects = "Toggle First Person Effects",
	}

	table.Merge(nut.lang.stored[langkey], langTable)
end

if (CLIENT) then
	local ft
	local waterMaterial, waterFraction = "effects/water_warp01", 0
	local healthFactor, ppTab
	local clmp = math.Clamp
	local client
	function PLUGIN:HUDPaint()
		client = LocalPlayer()
		ft = FrameTime()

		if (client:CanAddEffects()) then
			if (client:WaterLevel() <= 2) then
				waterFraction = clmp(waterFraction - ft*.2, 0, .2)
			else
				waterFraction = clmp(waterFraction + ft, 0, .2)
			end

			if (waterFraction > 0) then
				DrawMaterialOverlay(waterMaterial, waterFraction)
			end
		end
	end

	local playerMeta = FindMetaTable("Player")
	function playerMeta:CanAddEffects()
		local entity = Entity(self:getLocalVar("ragdoll", 0))
		local ragdoll = self:GetRagdollEntity()

		if (
			NUT_CVAR_EFFECTS:GetBool() and
			!self:ShouldDrawLocalPlayer() and
			IsValid(self) and
			self:getChar() and
			!self:getNetVar("actAng") and
			!IsValid(entity) and
			LocalPlayer():Alive()
			) then
			return true
		end
	end

	function PLUGIN:SetupQuickMenu(menu)
		 local button = menu:addCheck(L"toggleEffects", function(panel, state)
		 	if (state) then
		 		RunConsoleCommand("nut_fpeffects", "1")
		 	else
		 		RunConsoleCommand("nut_fpeffects", "0")
		 	end
		 end, NUT_CVAR_EFFECTS:GetBool())

		 menu:addSpacer()
	end
end
