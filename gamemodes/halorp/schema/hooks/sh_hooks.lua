function SCHEMA:CanPlayerSitAnywhere(client)
	if (client:isArrested()) then
		return false
	end
end

function SCHEMA:CanUseBank(client, atmEntity)
	return true
end

function SCHEMA:PlayerSpawnProp(client)
	return true -- TODO: Add an option to this
end

function SCHEMA:InitializedSchema()
	-- Initialize Salary Timer.
	if (SERVER) then
		timer.Create("nutSalary", nut.config.get("wageInterval", 180), 0, SCHEMA.SalaryPayload)
		timer.Create("nutBankIncome", nut.config.get("incomeInterval", 180), 0, SCHEMA.BankIncomePayload)
	else
		-- 커맨드 번역
	end

end

function SCHEMA:PhysgunPickup(client, entity)
	if (ALLOWED_ENTS[entity:GetClass()]) then
		if (entity:CPPIGetOwner() == client) then
			return true
		end
	end
end

function SCHEMA:PhysgunFreeze(weapon, phys, entity, client)
	if (ALLOWED_ENTS[entity:GetClass()]) then
		if (entity:CPPIGetOwner() == client) then
			return true
		end
	end
end

function SCHEMA:PlayerDoMelee(client, hit)
	if (CLIENT) then return end
	
	if (client:getChar()) then
		client:getChar():updateAttrib("str", 0.002)
	end
end

function SCHEMA:CanTool(client, trace, tool, ENT)
	local entity = trace.Entity
	
	if (IsValid(entity)) then
		if (ALLOWED_ENTS[entity:GetClass()]) then
			if (entity:CPPIGetOwner() == client) then
				return true
			end
		end
	end
end

function SCHEMA:Move(client, movedata)
	if client:GetMoveType() != MOVETYPE_WALK then return end
    local char = client:getChar()

    if (char) then
        if (client:isLegBroken()) then
            local speed = movedata:GetMaxSpeed() * .4
            movedata:SetMaxSpeed( speed )
            movedata:SetMaxClientSpeed( speed )
        end
    end
end