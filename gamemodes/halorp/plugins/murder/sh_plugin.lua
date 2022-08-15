PLUGIN.name = "Detective Evidence"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "you've got murdered, congrats"

function PLUGIN:PlayerDeath(victim, inflictor, attacker)
    -- do not count law death
    if (IsValid(attacker) and attacker:IsPlayer()) then
        local char = attacker:getChar()

        if (char) then
            if (char:hasFlags("B") or char:hasFlags("b")) then
                return
            end
        end
        -- do not count natural death
        if (game.GetWorld() == attacker) then
            return
        end
    else
        return
    end

    -- do not count suicide
    if (attacker == victim) then
        return
    end

    if (IsPurge) then
        return
    end

    local ent = ents.Create("nut_evidence")
    ent.victim = victim
    ent.attacker = attacker
    ent.inflictor = inflictor
    ent:SetPos(victim:GetPos())
    ent:Spawn()
end

function PLUGIN:OnPlayerReportItem(item, reporter, attacker)
    if (IsValid(attacker)) then
        attacker:wanted(true, reporter:GetName().. " has found that "..attacker:GetName().." has murdered someone!", attacker)
    end

    if (IsValid(reporter)) then
        local char = reporter:getChar()

        if (char) then
            char:giveMoney(1500)
        end
    end
end