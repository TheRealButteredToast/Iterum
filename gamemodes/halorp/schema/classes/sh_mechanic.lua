CLASS.name = "Mechanic"
CLASS.salary = 15

CLASS.weapons = {
	"weapon_simrepair",
	"halorepair_tool",
}

CLASS.color = Color(84, 84, 84)

function CLASS:onSet(client)
	for k, v in ipairs(self.weapons) do
		client:Give(v)
	end
end

function CLASS:onCanBe(client)
	local char = client:getChar()
	
	if !char:hasFlags('N') and !char:hasFlags('V') and !char:hasFlags('B') and !char:hasFlags('a') then
		return true
	else
		return false
	end
end

CLASS_MECHANIC = CLASS.index