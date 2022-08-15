CLASS.name = "Hobo"
CLASS.salary = 0

CLASS.color = Color(139,69,19)

CLASS.weapons = {
	"weapon_bugbait",
}

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

CLASS_HOBO = CLASS.index