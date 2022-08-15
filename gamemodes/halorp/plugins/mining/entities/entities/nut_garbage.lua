ENT.Type = "anim"
ENT.PrintName = "Garbage"
ENT.Author = "Toast"
ENT.Category = "Iterum"
ENT.Spawnable = true
ENT.AdminOnly = false

local a = {
	"models/valk/h3/unsc/props/dumpster/dumpsterfoundry.mdl",
	"models/rena_haloreach/dumpster.mdl",
	"models/rena_haloodst/dumpster.mdl",
	"models/toast/ports/dumpster.mdl",
}

local c = {
	"lockpick",
	"lowqual",
	"lowqualfruit",
	"lowqualveg",
	"radio",
	"rock",
	"tie",
	"wood",
	"tuna",
	"tomatosoup",
	"koi",
	"legsplint",
	"mre",
	"oats",
	"soda",
	"kpc",
	"granolabar"
}


function ENT:Initialize()
	if (SERVER) then
		self:SetModel(table.Random(a)) -- Your model here (MUSTN'T BE AN EFFECT!)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_NONE)
		self:SetUseType(SIMPLE_USE)
		self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE )
		self:SetModelScale(1)
		self:SetNetworkedBool("Usable", true)

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end
	end
end

function ENT:Use(activator)
	local chance = math.random(1, 100) 
	if self:GetNetworkedBool("Usable") == true and activator:GetPos():Distance(self:GetPos()) <= 100 then	
		activator:Freeze(true)
		self:EmitSound("doors/door_screen_move1.wav")
		timer.Simple(1, function () self:EmitSound("doors/heavy_metal_move1.wav") end)
		timer.Simple(4, function () self:EmitSound("ambient/materials/shuffle1.wav") end)
		activator:setAction("Searching...", 6, function()
			if activator:GetPos():Distance(self:GetPos()) <= 100 then
				if chance > 50 then
					activator:getChar():getInv():add(table.Random(c))
					activator:notify("You found something...")
				elseif chance < 50 then
					activator:notify("Nothing useful...")
				end
				self:SetNetworkedBool("Usable", false)
				--self:SetModelScale(0.5)
				activator:Freeze(false)
				self:EmitSound("doors/door_metal_thin_close2.wav")
				timer.Simple(math.random(180, 600), function() --Respawn time of the items
					self:SetNetworkedBool("Usable", true)
					--self:SetModelScale(1)
					--self:SetModel(b)
				end)
			else
				activator:notify("You moved too far away!")
			end
		end)
	elseif activator:GetPos():Distance(self:GetPos()) > 100 then
		activator:notify("You are too far away!")
	else
		activator:notify("This was recently searched!")
	end
end
function ENT:OnRemove()
	self:SetNetworkedBool("Usable", true)
end

if (CLIENT) then
	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		local tx, ty = drawText("Garbage", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	end
end