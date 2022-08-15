ITEM.name = "Book"
ITEM.desc = "Test Book to raise intelligence."
ITEM.price = 1000
ITEM.model = "models/props_lab/binderblue.mdl"

-- Inventory drawing
if (CLIENT) then
	-- Draw camo if it is available.
	function ITEM:paintOver(item, w, h)
		surface.SetDrawColor(128, 0, 128, 100)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end

function ITEM:onInstanced()
	local nameT = {
		"Physics",
		"Mathmatics",
		"Aerospace",
		"Medical",
		"Kinesiology",
		"Computer Science",
		"Calculus",
		"Art",
		"Design",
		"Digital Arts",
		"Applied Mathmatics",
		"Biochemistry",
		"Chemistry",
		"Astronomy",
		"Botany",
		"Genetics",
		"Geology",
		"Nursing",
		"Physiology",
		"Psychology",
		"Statistics",
		"Atmospheric",
		"Ecology",
		"Environmental",
		"Resource Management",
		"Economics",
		"Management",
		"Leadership",
		"Informatics",
		"Administration",
		"Aeronautics",
		"Materials Science",
		"Anthropology",
		"Classical",
		"Interstellar Geography",
		"Human History",
		"Philosophy",
		"Linguistics",
		"Poltical Science",
		"Rhetoric",
		"Sociology"
	}
	local modelT = {
		"models/props_lab/binderblue.mdl",
		"models/props_lab/bindergraylabel01a.mdl",
		"models/props_lab/bindergreen.mdl",
		"models/props_lab/binderredlabel.mdl"
	}
	
	local nameN = table.Random(nameT).." Book"
	local modelN = table.Random(modelT)
	
	self:setData("name",nameN)
	self.name = nameN
	
	self:setData("model",modelN)
	self.model = modelN
end

function ITEM:getName()
	return self:getData("name")
end

function ITEM:getModel()
	return self:getData("model")
end

ITEM.functions.Use = {
	onRun = function(item)
		local client = item.player
		
		local sndTbl = {
			"vo/k_lab/al_hmm.wav",
			"vo/k_lab/al_seeifitworks.wav",
			"vo/k_lab/al_uhoh01.wav",
			"vo/k_lab/ba_forgetthatthing.wav",
			"vo/k_lab/ba_guh.wav",
			"vo/k_lab/br_significant.wav",
			"vo/k_lab/ba_sarcastic02.wav",
			"vo/k_lab/ba_cantlook.wav",
			"vo/k_lab/al_buyyoudrink01.wav",
			"vo/k_lab/al_allrightdoc.wav",
			"vo/k_lab/al_heydoc.wav"
		}
		
		sound = table.Random(sndTbl)
		client:EmitSound(sound)
		
		item:remove()
		
		client:setAction("Reading...", 10,function()
			client:getChar():updateAttrib("int", 0.5)
			client:ChatPrint("You have read the book!")
		end)
		

		return false
	end,
	onCanRun = function(item)
		return !IsValid(item.entity)
	end
}