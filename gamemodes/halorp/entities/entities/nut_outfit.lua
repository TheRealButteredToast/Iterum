AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Outfitter"
ENT.Author = "Black Tea"
ENT.Category = "NutScript - Server"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.RenderGroup = RENDERGROUP_BOTH

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/rebel1324/outfitter.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.health = 100

		local physObj = self:GetPhysicsObject()
		if (IsValid(physObj)) then
			physObj:Wake()
		end
	end

	function ENT:OnRemove()
	end

	local fuckoff = CurTime()
	function ENT:Use(client)
		if (fuckoff and fuckoff > CurTime()) then return end
		fuckoff = CurTime() + 1
		
		local bad = {
			-- Female Marine Models
			"models/ishi/halo_rebirth/player/marines/female/marine_dominique.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_bella.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_faridah.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_hank.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_hank.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_higgins.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_kalli.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_katya.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_linda.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_miia.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_mira.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_neca.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_reid.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_snowy.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_tequila.mdl", 
			"models/ishi/halo_rebirth/player/marines/female/marine_wallaby.mdl",
			-- Female ODST Models
			"models/ishi/halo_rebirth/player/odst/female/odst_bella.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_dominique.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_faridah.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_hank.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_higgins.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_kalli.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_katya.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_linda.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_miia.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_mira.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_neca.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_reid.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_tequila.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_snowy.mdl", 
			"models/ishi/halo_rebirth/player/odst/female/odst_wallaby.mdl",
			-- Female Police Models
			"models/ishi/suno/halo_rebirth/player/innie/female/innie_dominique.mdl", 
			"models/ishi/suno/halo_rebirth/player/innie/female/innie_miia.mdl", 
			"models/ishi/suno/halo_rebirth/player/innie/female/innie_razer.mdl",
			"models/ishi/suno/halo_rebirth/player/innie/female/innie_razer.mdl",
			-- Male Marines
			"models/ishi/halo_rebirth/player/marines/male/marine_danlin.mdl",
			"models/ishi/halo_rebirth/player/marines/male/marine_eyecberg.mdl",
			"models/ishi/halo_rebirth/player/marines/male/marine_g_alfie.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_carl.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_donnie.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_fabrice.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_gilberto.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_islambek.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_john.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_jose.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_michael.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_ray.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_rob.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_yasser.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_g_yohannes.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_heretic.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_jeffrey.mdl", 
			"models/ishi/halo_rebirth/player/marines/male/marine_snippy.mdl",
			-- Male ODST Models
			"models/ishi/halo_rebirth/player/odst/male/odst_danlin.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_eyecberg.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_alfie.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_carl.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_donnie.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_fabrice.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_gilberto.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_islambek.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_john.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_jose.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_michael.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_ray.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_rob.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_yasser.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_g_yohannes.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_heretic.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_jeffrey.mdl", 
			"models/ishi/halo_rebirth/player/odst/male/odst_snippy.mdl",
			-- Male Police Models
			"models/ishi/halo_rebirth/nmpd/male/nmpd_danlin.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_eyecberg.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_eyecberg.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_carl.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_donnie.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_donnie.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_gilberto.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_islambek.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_john.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_jose.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_michael.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_ray.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_rob.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_yasser.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_g_yasser.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_heretic.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_jeffrey.mdl", 
			"models/ishi/halo_rebirth/nmpd/male/nmpd_snippy.mdl",
		}
		
		if (table.HasValue(bad,client:getChar():getModel()) or client:getChar():hasFlags('V')) then 
			client:notify("Faction Specific models cannot use the Outfitter!")
			return 
		end 
		
		netstream.Start(client, "nutOutfitShow")
	end
else
	netstream.Hook("nutOutfitShow", function()
		vgui.Create("nutOutfit")
	end)

	WORLDEMITTER = WORLDEMITTER or ParticleEmitter(Vector(0, 0, 0))

	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")

	function ENT:Draw()

		if (!self.nextEmit or self.nextEmit < CurTime()) then
			local pos = self:GetPos()
			local new = GLOW_MATERIAL
			for i = 1, 2 do
				local vc1, vc2 = self:GetRenderBounds()
				local randPos = Vector(math.random(vc1.x, vc2.x), math.random(vc1.y, vc2.y), math.random(vc1.z, vc2.z))
				local smoke = WORLDEMITTER:Add( new, pos + randPos)
				smoke:SetVelocity(randPos * math.random(2, 4))
				smoke:SetDieTime(math.Rand(.2,.4))
				smoke:SetStartAlpha(math.Rand(188,211))
				smoke:SetEndAlpha(0)
				smoke:SetStartSize(2)
				smoke:SetEndSize(2)
				smoke:SetRoll(math.Rand(180,480))
				smoke:SetRollDelta(math.Rand(-3,3))
				smoke:SetGravity( Vector( 0, 0, -200 ) )
				smoke:SetAirResistance(500)
			end
			self.nextEmit = CurTime() + .05
		end

		self:DrawModel()
	end

	function ENT:OnRemove()
	end

	function ENT:onShouldDrawEntityInfo()
		return true
	end

	function ENT:onDrawEntityInfo(alpha)
		local position = (self:LocalToWorld(self:OBBCenter()) + self:GetUp()*16):ToScreen()
		local x, y = position.x, position.y

		nut.util.drawText(L"Outfitter", x, y, ColorAlpha(nut.config.get("color"), alpha), 1, 1, nil, alpha * 0.65)
		nut.util.drawText(L"Become something New!", x, y + 16, ColorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)

	end
end