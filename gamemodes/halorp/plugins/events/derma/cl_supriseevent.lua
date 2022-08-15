local w = ScrW() * 0.5
local h = ScrH() * 0.8

function popRender (title, body1, body2, body3, body4, mat)
	local RPOPBG = vgui.Create("DFrame")
	RPOPBG:CenterVertical(0.1)
	RPOPBG:CenterHorizontal(0.25)
	RPOPBG:SetSize( w, h )   
	RPOPBG:SetVisible( true ) 
	RPOPBG:SetDraggable( false ) 
	RPOPBG:ShowCloseButton( false ) 
	RPOPBG:SetTitle("")
	RPOPBG.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
		draw.RoundedBox( 16, 0, 0, w*1.008, h*1.008, Color( 128, 128, 128, 255 ) ) -- Draw a red box instead of the frame
		draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 0, 25, 75, 240 ) )
		draw.DrawText(title, "DermaLarge", 4, h/1.98, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT ) 
		if (string.len(body1) ~= 0) then draw.DrawText("⚫ " .. body1, "HudHintTextLarge", 30, h/1.8, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT ) end 
		if (string.len(body2) ~= 0) then draw.DrawText("⚫ " .. body2, "HudHintTextLarge", 30, h/1.65, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT ) end 
		if (string.len(body3) ~= 0) then draw.DrawText("⚫ " .. body3, "HudHintTextLarge", 30, h/1.5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT ) end 
		if (string.len(body4) ~= 0) then draw.DrawText("⚫ " .. body4, "HudHintTextLarge", 30, h/1.35, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT ) end
	end 

	local RPOPP = vgui.Create( "DImage", RPOPBG )
	RPOPP:CenterVertical(0.0225) 
	RPOPP:CenterHorizontal(0.0375)
	RPOPP:SetKeepAspect(true)
	RPOPP:SetSize( w*0.99, h*0.5 ) 
	RPOPP:SetImage(mat) -- iterum/reps/unscresearch

	local Button = vgui.Create("DButton", RPOPBG)
	Button:SetText( "Acknowledge" )
	Button:SetTextColor( Color(255,255,255) )
	Button:SetSize( 70, 40 )
	Button:CenterVertical(0.95)
	Button:CenterHorizontal(0.5)
	Button.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 41, 128, 185, 245 ) ) -- Draw a blue button
	end
	Button.DoClick = function()
		RPOPBG:Close()
	end
	
	RPOPBG:MakePopup()
end