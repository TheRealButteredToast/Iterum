
OUTFIT_DATA = {
	-- Females
	["models/drem/cch/female_01.mdl"] = {uid = "efemale", skins = 4},
	["models/drem/cch/female_02.mdl"] = {uid = "efemale", skins = 4},
	["models/drem/cch/female_03.mdl"] = {uid = "efemale", skins = 4},
	["models/drem/cch/female_04.mdl"] = {uid = "efemale", skins = 4},
	["models/drem/cch/female_06.mdl"] = {uid = "efemale", skins = 4},
	["models/drem/cch/female_07.mdl"] = {uid = "efemale", skins = 4},
	-- Males
	["models/drem/cch/male_01.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_02.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_03.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_04.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_05.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_06.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_07.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_08.mdl"] = {uid = "emale", skins = 4},
	["models/drem/cch/male_09.mdl"] = {uid = "emale", skins = 4},
	-- Elites
	["models/vuthakral/halo/custom/usp/sangheili_universal_player.mdl"] = {uid = "elite", skins = 2},
	-- Grunts
	["models/valk/haloreach/covenant/characters/grunt/grunt_player.mdl"] = {uid = "grunt", skins = 5},
	-- Jackals
	["models/player/jackal.mdl"] = {uid = "jackal", skins = 2},
	-- Brutes
	["models/valk/haloreach/covenant/characters/brute/brute.mdl"] = {uid = "brute"},
}

OUTFIT_REGISTERED = {
	efemale = {
		{
			name = "face",	
			outfits = function(entity)
				local faces = {}
				local mdl = entity:GetModel()
				local woo = OUTFIT_DATA[mdl:lower()]
				if (!woo) then return faces end
				local facemaps = woo.skins

				for i = 1, facemaps do
					table.insert(faces, {data = (i - 1), name = "facemap", price = 9500})
				end

				return faces
			end,
			func = function(entity, outfit, orig)
				if (outfit) then
					local facemap = tonumber(outfit.data)

					if (facemap) then
						entity:SetSkin(facemap)
					end
				end
			end,			
		},
		{
			bodygroup = 1,
			name = "Body",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 9000},
				{data = 4, name = "bodygroup", price = 9000},
				{data = 5, name = "bodygroup", price = 9000},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Hands",		
			bodygroup = 2,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,
		},
	},
	emale = {
		{
			name = "face",	
			outfits = function(entity)
				local faces = {}
				local mdl = entity:GetModel()
				local woo = OUTFIT_DATA[mdl:lower()]
				if (!woo) then return faces end
				local facemaps = woo.skins

				for i = 1, facemaps do
					table.insert(faces, {data = (i - 1), name = "facemap", price = 9500})
				end

				return faces
			end,
			func = function(entity, outfit, orig)
				if (outfit) then
					local facemap = tonumber(outfit.data)

					if (facemap) then
						entity:SetSkin(facemap)
					end
				end
			end,		
		},
		{
			bodygroup = 1,
			name = "Torso",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 9000},
				{data = 4, name = "bodygroup", price = 9000},
				{data = 5, name = "bodygroup", price = 9000},
				{data = 6, name = "bodygroup", price = 13500},
				{data = 7, name = "bodygroup", price = 13500},
				{data = 8, name = "bodygroup", price = 13500},
				{data = 9, name = "bodygroup", price = 13500},
				{data = 10, name = "bodygroup", price = 13500},
				{data = 11, name = "bodygroup", price = 13500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Hands",		
			bodygroup = 2,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 3,
			name = "Beanies",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,				
		},
		{
			bodygroup = 4,
			name = "Pack",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 9000},
				{data = 5, name = "bodygroup", price = 9000},
				{data = 6, name = "bodygroup", price = 9000},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
	},
	elite = {
		{
			name = "Head",	
			outfits = function(entity)
				local faces = {}
				local mdl = entity:GetModel()
				local woo = OUTFIT_DATA[mdl:lower()]
				if (!woo) then return faces end
				local facemaps = woo.skins

				for i = 1, facemaps do
					table.insert(faces, {data = (i - 1), name = "facemap", price = 100000})
				end

				return faces
			end,
			func = function(entity, outfit, orig)
				if (outfit) then
					local facemap = tonumber(outfit.data)

					if (facemap) then
						entity:SetSkin(facemap)
					end
				end
			end,		
		},
		{
			bodygroup = 2,
			name = "Undersuit",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
				{data = 3, name = "bodygroup", price = 13500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 3,
			name = "Helmet",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
				{data = 8, name = "bodygroup", price = 4500},
				{data = 9, name = "bodygroup", price = 4500},
				{data = 10, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 4,
			name = "Torso",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Shoulders",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
				{data = 8, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				if (bodygroup) then
					entity:SetBodygroup(5, bodygroup)
					entity:SetBodygroup(6, bodygroup)
				end
			end,		
		},
		{
			name = "Forearms",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				if (bodygroup) then
					entity:SetBodygroup(7, bodygroup)
					entity:SetBodygroup(8, bodygroup)
				end
			end,		
		},
		{
			bodygroup = 9,
			name = "Hands",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 10,
			name = "Pelvis",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 11,
			name = "Thighs",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 12,
			name = "Calves",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 13,
			name = "Feet",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 14,
			name = "Decals",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			bodygroup = 15,
			name = "Back",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
	},
	grunt = {
		{
			name = "Sheen",	
			outfits = function(entity)
				local faces = {}
				local mdl = entity:GetModel()
				local woo = OUTFIT_DATA[mdl:lower()]
				if (!woo) then return faces end
				local facemaps = woo.skins

				for i = 1, facemaps do
					table.insert(faces, {data = (i - 1), name = "facemap", price = i*10000})
				end

				return faces
			end,
			func = function(entity, outfit, orig)
				if (outfit) then
					local facemap = tonumber(outfit.data)

					if (facemap) then
						entity:SetSkin(facemap)
					end
				end
			end,		
		},
		{
			bodygroup = 1,
			name = "Helmet",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
				{data = 3, name = "bodygroup", price = 13500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Backpack",		
			bodygroup = 2,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
				{data = 3, name = "bodygroup", price = 13500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
	},
	jackal = {
		{
			name = "Skin",	
			outfits = function(entity)
				local faces = {}
				local mdl = entity:GetModel()
				local woo = OUTFIT_DATA[mdl:lower()]
				if (!woo) then return faces end
				local facemaps = woo.skins

				for i = 1, facemaps do
					table.insert(faces, {data = (i - 1), name = "facemap", price = i*10000})
				end

				return faces
			end,
			func = function(entity, outfit, orig)
				if (outfit) then
					local facemap = tonumber(outfit.data)

					if (facemap) then
						entity:SetSkin(facemap)
					end
				end
			end,		
		},
		{
			bodygroup = 1,
			name = "Teeth",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Eyes",		
			bodygroup = 2,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Helmet",		
			bodygroup = 3,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 9000},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
	},
	brute = {
		{
			bodygroup = 1,
			name = "Helmet",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
				{data = 8, name = "bodygroup", price = 4500},
				{data = 9, name = "bodygroup", price = 4500},
				{data = 10, name = "bodygroup", price = 4500},
				{data = 11, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup
				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Shoulders",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
				{data = 8, name = "bodygroup", price = 4500},
				{data = 9, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				if (bodygroup) then
					entity:SetBodygroup(2, bodygroup)
					entity:SetBodygroup(3, bodygroup)
				end
			end,		
		},
		{
			name = "Forearms",	
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				if (bodygroup) then
					entity:SetBodygroup(4, bodygroup)
					entity:SetBodygroup(5, bodygroup)
				end
			end,		
		},
		{
			name = "Torso",		
			bodygroup = 6,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
				{data = 8, name = "bodygroup", price = 4500},
				{data = 9, name = "bodygroup", price = 4500},
				{data = 10, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Thighs",		
			bodygroup = 7,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
				{data = 7, name = "bodygroup", price = 4500},
				{data = 8, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Calves",		
			bodygroup = 8,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 4500},
				{data = 2, name = "bodygroup", price = 4500},
				{data = 3, name = "bodygroup", price = 4500},
				{data = 4, name = "bodygroup", price = 4500},
				{data = 5, name = "bodygroup", price = 4500},
				{data = 6, name = "bodygroup", price = 4500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
		{
			name = "Undersuit",		
			bodygroup = 9,
			outfits = {
				{data = 0, name = "bodygroup", price = 0},
				{data = 1, name = "bodygroup", price = 9000},
				{data = 2, name = "bodygroup", price = 13500},
			},
			func = function(entity, outfit, orig)
				local bodygroup = tonumber(outfit.data)
				local part = orig.bodygroup

				if (bodygroup) then
					if (part) then
						entity:SetBodygroup(part, bodygroup)
					end
				end
			end,		
		},
	},
}