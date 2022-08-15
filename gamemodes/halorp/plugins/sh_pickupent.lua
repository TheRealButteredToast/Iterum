local PLUGIN = PLUGIN
PLUGIN.name = "Pickup Ents"
PLUGIN.author = "Toast"
PLUGIN.desc = "Allows players to pickup their deployed entities."

local allowed = {
	"nut_ref",
	"nut_arc",
	"nut_distiller",
	"nut_fruit",
	"nut_hygen",
	"nut_lab",
	"nut_stash",
	"nut_stove",
	"nut_tempstore",
	"nut_veg",
	"nut_watergen",
	"nut_ammo",
	"odst_pod_launcher",
	"nut_lithofab",
	"nut_mill",
}

if CLIENT then
	hook.Add("Move", "pickupThatCan", function()
		if(input.WasKeyPressed(KEY_F2) and !timer.Exists("f2DelayTim")) then	--https://wiki.facepunch.com/gmod/Enums/KEY
			local client = LocalPlayer()
			if(client:GetEyeTrace().HitPos:DistToSqr(client:GetPos()) <= 10000) then
				local ent = client:GetEyeTrace().Entity
				
				if(ent == nil) then
					client:ChatPrint("You have to be looking at an entity!")
					return false
				end

				if(!ent:IsScripted()) then
					--client:ChatPrint("You have to be looking at a valid entity!")
					return false
				end
				
				if(ent:GetClass() == "gmod_sent_vehicle_fphysics_base" or string.find(ent:GetClass(),"lunasflightschool")) then
					client:ChatPrint("Contact an Admin to have them return the item to your inventory.")
				end
				
				if(table.HasValue(allowed, ent:GetClass())) then
					timer.Create("f2DelayTim",2, 1, function() end)
					net.Start("pickupDatHoe")
					net.WriteEntity(ent)
					net.SendToServer()
				else
					client:ChatPrint("This cannot be picked up.")
				end
			end
		end
	end)
else

	function getUID(ent)
		if(ent:GetClass() == "nut_ref") then
			return "refinery"
		elseif(ent:GetClass() == "nut_arc") then
			return "arcmachine"
		elseif(ent:GetClass() == "nut_distiller") then
			return "distiller"
		elseif(ent:GetClass() == "nut_fruit") then
			return "fruitpot"
		elseif(ent:GetClass() == "nut_hygen") then
			return "hydrogenerator"
		elseif(ent:GetClass() == "nut_lab") then
			return "labratory"
		elseif(ent:GetClass() == "nut_stash") then
			return "storage"
		elseif(ent:GetClass() == "nut_stove") then
			return "stove"
		elseif(ent:GetClass() == "nut_veg") then
			return "vegpot"
		elseif(ent:GetClass() == "nut_watergen") then
			return "waterpurifier"
		elseif(ent:GetClass() == "nut_ammo") then
			return "ammoprod"
		elseif(ent:GetClass() == "nut_tempstore") then
			return "tempstore"
		elseif(ent:GetClass() == "odst_pod_launcher") then
		    return "odstpodl"
		elseif(ent:GetClass() == "nut_lithofab") then
		    return "lithofab"
		elseif(ent:GetClass() == "nut_mill") then
		    return "mill"
		else
			return nil
		end
	end

	util.AddNetworkString("pickupDatHoe")
	net.Receive("pickupDatHoe",function (len, ply)
		local ent = net.ReadEntity()
		local a,b = ent:CPPIGetOwner()
		if(b != ply:UniqueID()) then
			ply:notifyLocalized("You don't own this!")
			return false
		end
		local uniqueID = getUID(ent)
		
		ply:getChar():getInv():add(uniqueID)
			:next(function(res)
				if (res.error) then
					ply:notifyLocalized("This item cannot fit in your inventory!")
					return false
					--nut.item.spawn(uniqueID, ply:getItemDropPos())
				else
					ent:Remove()
					ply:notifyLocalized("Item added to your inventory.")
				end
			end)
	end)
end