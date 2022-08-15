include('shared.lua')

local Thrustertex = Material("models/odst/pod/thruster_sprite")
local Thrustertexb = Material( "effects/strider_muzzle" )
local Thrustertexc = Material( "models/odst/pod/thruster_spriteb" )
function ENT:Draw()
	self.Entity:DrawModel()
	local podpos = self:GetPos()
	local vish = util.GetPixelVisibleHandle()
	local scroll = CurTime() * -20
	scroll = scroll * 0.9

	local function topthrus(stage)
		if stage == 0 || stage == 3 || stage == 5 || stage == nil then
			return
		end

		topspritepos = Vector(0,0,110)
		thruspos1 = Vector(0,0,100)
		thruspos2 = Vector(0,0,185)

		topspritepos:Rotate (self.Entity:GetAngles())
		local topsprite = podpos + topspritepos
		local visibile  = util.PixelVisible( topsprite, 1, vish )
		if (visibile) then
			render.SetMaterial( Thrustertex )
			render.DrawSprite( topsprite, 500, 500, Color(255,255,255,255) )
		end

		thruspos1:Rotate (self.Entity:GetAngles())
		thruspos2:Rotate (self.Entity:GetAngles())
		local thrus1 = podpos + thruspos1
		local thrus2 = podpos + thruspos2

		render.SetMaterial( Thrustertexb )
		render.StartBeam( 2 )
			render.AddBeam( thrus1, 100, scroll, Color( 0, 255, 255, 255) )
			render.AddBeam( thrus2, 100, scroll, Color( 0, 255, 255, 0) )
		render.EndBeam()
	end

	local function bottomthrus()
		render.SetMaterial( Thrustertexc )

		local bs1pos = Vector(15,25,-40)
		bs1pos:Rotate (self.Entity:GetAngles())
		local bs1 = podpos + bs1pos
		local visibile  = util.PixelVisible( bs1, 1, vish )
		if (visibile) then
			render.DrawSprite( bs1, 200, 200, Color(255,255,255,255) )
		end 

		local bs2pos = Vector(15,-25,-40)
		bs2pos:Rotate (self.Entity:GetAngles())
		local bs2 = podpos + bs2pos
		local visibile  = util.PixelVisible( bs2, 1, vish )
		if (visibile) then
			render.DrawSprite( bs2, 200, 200, Color(255,255,255,255) )
		end 

		local bs3pos = Vector(-15,25,-40)
		bs3pos:Rotate (self.Entity:GetAngles())
		local bs3 = podpos + bs3pos
		local visibile  = util.PixelVisible( bs3, 1, vish )
		if (visibile) then
			render.DrawSprite( bs3, 200, 200, Color(255,255,255,255) )
		end 

		local bs4pos = Vector(-15,-25,-40)
		bs4pos:Rotate (self.Entity:GetAngles())
		local bs4 = podpos + bs4pos
		local visibile  = util.PixelVisible( bs4, 1, vish )
		if (visibile) then
			render.DrawSprite( bs4, 200, 200, Color(255,255,255,255) )
		end 
	end

	if self:GetNetworkedBool( "odstpodman" ) == true then
		topthrus(self:GetNetworkedInt( "odstpodstat" ))
	end

	if self:GetNetworkedInt( "odstpodstat" ) == 4 && ( LocalPlayer():GetNetworkedInt( "odstpodf1" ) > 0 )  then
		bottomthrus()
	end
end