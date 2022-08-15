netstream.Hook("nutLawSync", function(data)
	SCHEMA.laws = data
end)

local function CanDisplayCursor()
	return (RewardsMainWindow or (nut.vote.list and table.Count(nut.vote.list) > 0))
end

-- Sounds?
netstream.Hook("voicePlay", function(sounds, volume, index)
	if (index) then
		local client = Entity(index)

		if (IsValid(client)) then
			nut.util.emitQueuedSounds(client, sounds, nil, nil, volume)
		end
	else
		nut.util.emitQueuedSounds(LocalPlayer(), sounds, nil, nil, volume)
	end
end)

function SCHEMA:LoadFonts(font)
	font = "Consolas"
	surface.CreateFont("nutATMTitleFont", {
		font = font,
		extended = true,
		size = 72,
		weight = 1000
	})
	
	surface.CreateFont("nutATMFont", {
		font = font,
		extended = true,
		size = 36,
		weight = 1000
	})

	surface.CreateFont("nutATMFontBlur", {
		font = font,
		extended = true,
		size = 36,
		blursize = 6,
		weight = 1000
	})
end

function SCHEMA:CanPlayerViewInventory()
	if (IsValid(LocalPlayer():getNetVar("searcher"))) then
		return true
	end
end

local jailTimer = CurTime()
local jailTime = 0

local function addJailTimer(time)
end

netstream.Hook("nutJailTimer", function(time)
end)

local gap = 4
local perc = 0
function SCHEMA:drawJailed(w, h)
	if (jailTimer > CurTime()) then
		local bw, bh = w/3, 20
		local bx, by = w/2 - bw/2, h/3
		perc = (jailTimer - CurTime()) / jailTime

		surface.SetDrawColor(255, 255, 255, 15)
		surface.DrawRect(bx, by, bw, bh)
		surface.DrawOutlinedRect(bx, by, bw, bh)

		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawRect(bx + gap, by + gap, (bw - gap*2)*perc, bh - gap*2)

		draw.SimpleText(L("arrested"), "ChatFont", bx + 2, by - bh - 5, color_white, 3, 2)
	end
end

function SCHEMA:HUDPaint()
	local w, h = ScrW(), ScrH()

	self:drawJailed(w, h)
end

surface.CreateFont("nutJailBig", {
	font = font,
	size = ScreenScale(8),
	extended = true,
	weight = 500
})

netstream.Hook("nutJailChat", function(arrester, arrested)
	CHAT_CLASS = {font = "nutJailBig"}
		local name = arrester:Name()
		local name2 = arrested:Name()

		chat.AddText(L("arrestNotify", name, name2, nut.config.get("jailTime")))
	CHAT_CLASS = nil
end)

surface.CreateFont("nutWantedBig", {
	font = font,
	size = ScreenScale(8),
	extended = true,
	weight = 500
})

netstream.Hook("nutWantedText", function(bool, a, b, c)
	CHAT_CLASS = {font = "nutWantedBig"}
		if (bool) then
			chat.AddText(Color(200, 10, 10), L("wantedNotify", b:Name(), c))
		else
			chat.AddText(Color(200, 10, 10), L(b:Name() .." is no longer wanted."))
		end
	CHAT_CLASS = nil
end)

netstream.Hook("nutSearchText", function(a, b, c)
	CHAT_CLASS = {font = "nutJailBig"}
		chat.AddText(color_white, L("warrantNofity", b:Name(), c:Name()))
	CHAT_CLASS = nil
end)

netstream.Hook("nutSearchEndText", function(a, b, c)
	CHAT_CLASS = {font = "nutJailBig"}
		chat.AddText(color_white, L("warrantEndNofity", c:Name(), b:Name()))
	CHAT_CLASS = nil
end)

function SCHEMA:DrawEntityInfo()
	if (LocalPlayer():InVehicle() != true) then
		if (IsValid(entity)) then
			if (entity:IsVehicle()) then
				if (entity:CPPIGetOwner()) then
					local position = (entity:LocalToWorld(entity:OBBCenter())):ToScreen()
					local x, y = position.x, position.y

					nut.util.drawText(L"vehicleName", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
					nut.util.drawText(L("vehicleOwner", entity:CPPIGetOwner():Name()), x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
				end
			end
		end
	end
end