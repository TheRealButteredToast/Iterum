ITEM.name = "Spawn an Entity"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = "Based"
ITEM.price = 0
ITEM.color = "dog"
ITEM.category = "Spawnable Entities"
ITEM.quantity = 2
ITEM.wac = false
 
-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		local count = 0 
		for i,e in pairs(ents.GetAll()) do 
			if(e:GetClass() == item.spawnent) then
				local a,b = e:CPPIGetOwner()
				if(b == item:getOwner():UniqueID()) then
					count = count + 1
				end
			end
			
			
			if(count >= item.quantity) then
				client:notifyLocalized("You cannot spawn more than " .. item.quantity ..  " of these entities.")
				return false
			end
		end
		
		if(item:getOwner() == nil) then
			client:notifyLocalized("Deploy it from your inventory!")
			return false
		end
		local pos = client:GetEyeTrace().HitPos
		if(pos:DistToSqr(client:GetPos()) >= 12000) then
			pos = client:EyePos() + client:GetAimVector() * 400
		end
		
		if item.wac then
			local grd = ents.Create( item.spawnent )
			grd:SetPos( pos )
			grd:SetAngles(client:GetAngles())
			if(item.skin and isnumber(item.skin) == true) then grd:SetSkin(item.skin) end
			grd:Spawn()
			grd:CPPISetOwner(item:getOwner())
			item:remove()
			
			if (item.entConfigure) then
				item:entConfigure(grd)
			end
			
			if item.color != "dog" then
				grd:SetColor(item.color)
			end
			
			return true
		end
		
		if(item.spawnsent) then
			simfphys.SpawnVehicleSimple(item.spawnsent, pos + Vector(0,0,100) , client:GetAngles() )
			item:remove()
			return true
		end
		
		local grd = ents.Create( item.spawnent )
		grd:SetPos( pos + Vector(0,0,100) )
		grd:SetAngles(client:GetAngles())
		if(item.skin and isnumber(item.skin) == true) then grd:SetSkin(item.skin) end
		grd:Spawn()
		grd:CPPISetOwner(item:getOwner())
		item:remove()
		
		
		if (item.entConfigure) then
			item:entConfigure(grd)
		end
		
		
		return true
	end,
}