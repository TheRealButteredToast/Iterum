local PANEL = {}

local FADE_TIME = 5
local VOLUME = 0.25

function PANEL:Init()
	if (nut.menuMusic) then
		nut.menuMusic:Stop()
		nut.menuMusic = nil
		timer.Remove("nutMusicFader")
	end

	self:SetVisible(false)

	nut.menuMusicIsLocal = false
	timer.Remove("nutMusicFader")

	local mselec  = { 	
						"http://halorp.bigboysintown.site.nfoservers.com/public/garrysmod/sound/music/1.mp3",
						"http://halorp.bigboysintown.site.nfoservers.com/public/garrysmod/sound/music/2.mp3",
						"http://halorp.bigboysintown.site.nfoservers.com/public/garrysmod/sound/music/3.mp3",
						"http://halorp.bigboysintown.site.nfoservers.com/public/garrysmod/sound/music/r.mp3",
						"http://halorp.bigboysintown.site.nfoservers.com/public/garrysmod/sound/music/hcs.mp3",
						"http://halorp.bigboysintown.site.nfoservers.com/public/garrysmod/sound/music/for.mp3",
					}	
	local source = table.Random ( mselec )
	if (not source:find("%S")) then return end

	if (source:find("http")) then
		sound.PlayURL(source, "noplay", function(music, errorID, fault)
			if (music) then
				music:SetVolume(VOLUME)
				nut.menuMusic = music
				nut.menuMusic:Play()
			else
				MsgC(Color(255, 50, 50), errorID.." ")
				MsgC(color_white, fault.."\n")
			end
		end)
	else
		nut.menuMusicIsLocal = true
		nut.menuMusic = CreateSound(LocalPlayer(), source)
		nut.menuMusic:PlayEx(VOLUME, 100)
	end
end

function PANEL:OnRemove()
	local music = nut.menuMusic
	if (not music) then return end

	local fraction = 1
	local start, finish = RealTime(), RealTime() + FADE_TIME

	timer.Create("nutMusicFader", 0.1, 0, function()
		if (nut.menuMusic) then
			fraction = 1 - math.TimeFraction(start, finish, RealTime())
			if (music.ChangeVolume) then
				music:ChangeVolume(fraction * VOLUME, 0.1)
			elseif (music.SetVolume) then
				music:SetVolume(fraction * VOLUME)
			end

			if (fraction <= 0) then
				music:Stop()
				nut.menuMusic = nil

				timer.Remove("nutMusicFader")
			end
		else
			timer.Remove("nutMusicFader")
		end
	end)
end

vgui.Register("nutCharBGMusic", PANEL, "DPanel")
