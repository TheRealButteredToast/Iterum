ATTRIBUTE.name = "Dexterity"
ATTRIBUTE.desc = "Affects all movement related Stats."

function ATTRIBUTE:onSetup(client, value)
	client:SetRunSpeed(nut.config.get("runSpeed", 235) + value)
end