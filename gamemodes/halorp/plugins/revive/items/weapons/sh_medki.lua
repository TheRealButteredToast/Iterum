ITEM.name = "Medical Kit"
ITEM.desc = "Medical Device for Medical People."
ITEM.model = "models/Items/HealthKit.mdl"
ITEM.class = "weapon_medkit"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 9920

ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		local items = client:getChar():getInv():getItems()

		client.carryWeapons = client.carryWeapons or {}
		
		if(!item.player:getChar():hasFlags('u')) then
			client:ChatPrint("I don't know how to operate Medical Equipment...") 
			return false
		end
		
		for k, v in pairs(items) do
			if (v.id != item.id) then
				if (
					v.isWeapon and
					client.carryWeapons[item.weaponCategory] and
					v:getData("equip")
			 	) then
					client:notifyLocalized("weaponSlotFilled")
					return false
				end
			end
		end
		
		if (client:HasWeapon(item.class)) then
			client:StripWeapon(item.class)
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
			timer.Simple(0, function()
				client:SelectWeapon(weapon:GetClass())
			end)
			client.carryWeapons[item.weaponCategory] = weapon
			client:EmitSound("items/ammo_pickup.wav", 80)

			-- Remove default given ammo.
			local ammoCount =  client:GetAmmoCount(weapon:GetPrimaryAmmoType())
			if (
				ammoCount == weapon:Clip1() and
				item:getData("ammo", 0) == 0
			) then
				client:RemoveAmmo(weapon:Clip1(), weapon:GetPrimaryAmmoType())
			end
			item:setData("equip", true)

			weapon:SetClip1(item:getData("ammo", 0))

			if (item.onEquipWeapon) then
				item:onEquipWeapon(client, weapon)
			end
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}