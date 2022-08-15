-- The MISC(s)
local light_table = {
	L_HeadLampPos = Vector(73,18.5,-2.5),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(73,-24,-2.5),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-91.5,40,-12),
	L_RearLampAng = Angle(0, 180, 10),

	R_RearLampPos = Vector(-91.5,-46,-12),
	R_RearLampAng = Angle(0,180,10),
	
	Headlight_sprites = { 
		Vector(73,18.5,-2.5),
		Vector(73,-24,-2.5),
		Vector(73,12.5,-2.5),
		Vector(73,-17,-2.5),
	},
	Headlamp_sprites = { 
		Vector(71,18.5,-2.5),
		Vector(71,-24,-2.5),
		Vector(73,12.5,-2.5),
		Vector(73,-17,-2.5),
	},
	Rearlight_sprites = {
		Vector(-91.5,40,-12),
		Vector(-91.5,-46,-12),
	},
	Brakelight_sprites = {
		Vector(-91.5,40,-12),
		Vector(-91.5,-46,-12),
	},
	Reverselight_sprites = {
		Vector(-91.5,40,-12),
		Vector(-91.5,-46,-12),
	},
	FogLight_sprites = {
		{pos = Vector(73,12.5,-2.5),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(73,-17,-2.5),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "cart", light_table)

local V = {
	Name = "HC100 LT",
	Model = "models/halocivilianvehicles/cart/cart.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,
	SpawnOffset = Vector(0,0,20),

	Members = { 
		Mass = 1500,
		
		LightsTable = "cart",
	
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 14,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 14,
		
		CustomWheelModel = "models/halocivilianvehicles/cart/wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(24,36,-18),		
		CustomWheelPosFR = Vector(24,-42,-18),
		CustomWheelPosML = Vector(-21,36,-18),		
		CustomWheelPosMR = Vector(-21,-42,-18),	
		CustomWheelPosRL = Vector(-70,36,-18),
		CustomWheelPosRR = Vector(-70,-42,-18),	
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(12,-15,30),
		SeatPitch = 5,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-78,-16,-20),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-78,14,-20),
				ang = Angle(0,90,0)
			},
		},

		FrontHeight = 0,		--positive numbers only
		FrontConstant = 50000,		--max 50000 if StrengthenSuspension set to false     constant can be imagined as spring strength
		FrontDamping = 3000,		-- dont set damping/relative damping too high or it will spazz     damping is basically the shock absorbers
		FrontRelativeDamping = 2800,
		
		RearHeight = 0,
		RearConstant = 40000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 100,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_4.wav",
		
		DifferentialGear = 0.35,
		Gears = {-0.09,0,0.08}
	}
}
list.Set( "simfphys_vehicles", "caart", V )

local light_table = {
	L_HeadLampPos = Vector(74,14.5,43),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(74,-13.5,43),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(72,16,30),
		Vector(72,-15.5,30),
		Vector(66,26,28.5),
		Vector(66,-25.5,28.5),
		Vector(74,14.5,43),
		Vector(74,-13.5,43),
	},
	Headlamp_sprites = { 
		Vector(66,26,28.5),
		Vector(66,-25.5,28.5),
		Vector(74,14.5,43),
		Vector(74,-13.5,43),
	},
}
list.Set( "simfphys_lights", "h5fork", light_table)

local V = {
	Name = "HC 150 Forklift",
	Model = "models/tfg/forkliftv2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",

	Members = { 
		Mass = 1500,
		
		LightsTable = "h5fork",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 14,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 14,
		
		CustomWheelModel = "models/tfg/forkliftv2wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		CustomWheelModel_R = "models/props_junk/PopCan01a.mdl",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(45,26,8),		
		CustomWheelPosFR = Vector(45,-26,8),
		CustomWheelPosRL = Vector(-21,0,6),		
		CustomWheelPosRR = Vector(-21,0,6),	
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-8,0,70),
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-90,-16,-6),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-90,14,-6),
				ang = Angle(0,90,0)
			},
		},

		FrontHeight = 0,		--positive numbers only
		FrontConstant = 50000,		--max 50000 if StrengthenSuspension set to false     constant can be imagined as spring strength
		FrontDamping = 3000,		-- dont set damping/relative damping too high or it will spazz     damping is basically the shock absorbers
		FrontRelativeDamping = 2800,
		
		RearHeight = 0,
		RearConstant = 40000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 800,
		LimitRPM = 6000,
		PeakTorque = 100,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_4.wav",
		
		DifferentialGear = 0.35,
		Gears = {-0.09,0,0.08}
	}
}
list.Set( "simfphys_vehicles", "forklift", V )

local light_table = {
	L_HeadLampPos = Vector(41,9,53),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(41,-9,53),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-70,24,56),
	L_RearLampAng = Angle(0, 180, 10),

	R_RearLampPos = Vector(-70,-24,56),
	R_RearLampAng = Angle(0,180,10),
	
	Headlight_sprites = { 
		Vector(41,9,53),
		Vector(41,-9,53),
	},
	Headlamp_sprites = { 
		Vector(41,9,53),
		Vector(41,-9,53),
	},
	Rearlight_sprites = {
		Vector(-70,24,56),
		Vector(-70,-24,56),
	},
	Brakelight_sprites = {
		Vector(-70,24,56),
		Vector(-70,-24,56),
	},
	Reverselight_sprites = {
		Vector(-70,24,56),
		Vector(-70,-24,56),
	},
}
list.Set( "simfphys_lights", "reachfork", light_table)

local V = {
	Name = "HC 147 Forklift",
	Model = "models/tfg/reachfork.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",

	Members = { 
		Mass = 1500,
		
		LightsTable = "reachfork",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 14,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 10,
		
		CustomWheelModel = "models/tfg/reachfwheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		CustomWheelModel_R = "models/tfg/reachrwheel.mdl",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(30,26,8),		
		CustomWheelPosFR = Vector(30,-26,8),
		CustomWheelPosRL = Vector(-48,34,6),		
		CustomWheelPosRR = Vector(-48,-34,6),	
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-8,0,80),
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(110,-24,-4),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(110,23,-4),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 0,		--positive numbers only
		FrontConstant = 50000,		--max 50000 if StrengthenSuspension set to false     constant can be imagined as spring strength
		FrontDamping = 3000,		-- dont set damping/relative damping too high or it will spazz     damping is basically the shock absorbers
		FrontRelativeDamping = 2800,
		
		RearHeight = 0,
		RearConstant = 40000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.8,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 2000,
		LimitRPM = 8000,
		PeakTorque = 100,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_4.wav",
		
		DifferentialGear = 0.4,
		Gears = {-0.09,0,0.08,0.12}
	}
}
list.Set( "simfphys_vehicles", "reachforklift", V )

-- The Genet
local light_table = {
	L_HeadLampPos = Vector(70,18,28),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(70,-18,28),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-82,26,32),
	L_RearLampAng = Angle(0, 180, 10),

	R_RearLampPos = Vector(-82,-26,32),
	R_RearLampAng = Angle(0,180,10),
	
	Headlight_sprites = { 
		Vector(70,18,28),
		Vector(70,-18,28)
	},
	Headlamp_sprites = { 
		Vector(70,18,28),
		Vector(70,-18,28)
	},
	Rearlight_sprites = {
		Vector(-71,16,49),
		Vector(-71,-19,49),
		Vector(-82,23,32),
		Vector(-82,-26,32),
	},
	Brakelight_sprites = {
		Vector(-71,16,49),
		Vector(-71,-19,49),
		Vector(-82,23,32),
		Vector(-82,-26,32),
	},
	Reverselight_sprites = {
		Vector(-71,16,49),
		Vector(-71,-19,49),
		Vector(-82,23,32),
		Vector(-82,-26,32),
	},
	FogLight_sprites = {
		{pos = Vector(70,18,28),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(70,-18,28),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "civcar", light_table)

local V = {
	Name = "The Genet",
	Model = "models/halocivilianvehicles/hu/civcar.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = { 
		Mass = 1500,
		
		EnginePos = Vector(70,0,28),
		
		LightsTable = "civcar",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 13,
		RearWheelRadius = 13,
		
		CustomWheelModel = "models/xeon133/racewheel/race-wheel-30.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(47,28,10),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(47,-30,10),	-- position front right wheel
		CustomWheelPosRL = Vector(-53,34,10),	-- rear left
		CustomWheelPosRR = Vector(-53,-36,10),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-14,-16,43),
		SeatPitch = 0,
		SeatYaw = 80,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-14,-16,10),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 0,		--positive numbers only
		FrontConstant = 40000,		--max 50000 if StrengthenSuspension set to false     constant can be imagined as spring strength
		FrontDamping = 2800,		-- dont set damping/relative damping too high or it will spazz     damping is basically the shock absorbers
		FrontRelativeDamping = 2800,
		
		RearHeight = 0,
		RearConstant = 40000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 5000,
		LimitRPM = 12000,
		PeakTorque = 150,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/generic3/generic3_idle.wav",
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_1.wav",
		
		DifferentialGear = 0.35,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.46}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_civcar", V )
-- Patrol Car
local light_table = {
	L_HeadLampPos = Vector(70,6,25),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(70,-6,25),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-99,22,51),
	L_RearLampAng = Angle(0, 0, 0),

	R_RearLampPos = Vector(-99,-22,51),
	R_RearLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(70,20,25),
		Vector(70,-20,25)
	},
	Headlamp_sprites = { 
		Vector(70,20,25),
		Vector(70,-20,25)
	},
	Rearlight_sprites = {
		Vector(-71,18,46),
		Vector(-71,-18,46),
		Vector(-80,26,28),
		Vector(-80,-26,28),
	},
	Brakelight_sprites = {
		Vector(-71,18,46),
		Vector(-71,-18,46),
		Vector(-80,26,28),
		Vector(-80,-26,28),
	},
	Reverselight_sprites = {
		Vector(-71,14,46),
		Vector(-71,-14,46),
	},
	FogLight_sprites = {
		{pos = Vector(25,14,73.5),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(25,-14,73.5),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "nmpdcar", light_table)

local V = {
	Name = "Patrol Car",
	
	Model = "models/halo/nmpd_car_chassis.mdl",
	--Model = "models/jessev92/halo/vehicles/mongoose_chassis.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1200,
		
		EnginePos = Vector(70,0,28),
		
		LightsTable = "nmpdcar",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 14,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 14,
		
		CustomWheelModel = "models/xeon133/racewheel/race-wheel-30.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(49,30,6),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(49,-30,6),	-- position front right wheel
		CustomWheelPosRL = Vector(-51,36,8),	-- rear left
		CustomWheelPosRR = Vector(-51,-36,8),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-14,-18,40),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua

		PassengerSeats = {
			{
				pos = Vector(-14,-18,10),
				ang = Angle(0,-90,0)
			},
		},
		
		
		StrengthenSuspension = false, -- if set to true it will increase the constant limit to 10 0000 but double the amount of constraints used. Also the limiters of the physical wheel will be set tighter. You can make the physical wheelpos visible by typing cl_simfphys_debugwheels = 1 into the console
							  --If you are using vehicle models with bones/poseparameters and experience floating wheels or wheels clipping into the ground then this will probably fix it. 
							  --Keep in mind that this will make the suspension alot more responsive to bumps and stiffer. If your wheels are still leaving the ground in corners you will have to decrease the constant or lower the masscenter
		
		FrontHeight = 0,		--positive numbers only
		FrontConstant = 27000,		--max 50000 if StrengthenSuspension set to false     constant can be imagined as spring strength
		FrontDamping = 2800,		-- dont set damping/relative damping too high or it will spazz     damping is basically the shock absorbers
		FrontRelativeDamping = 2800,
		
		RearHeight = 0,
		RearConstant = 32000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 44,
		Efficiency = 1.337,
		GripOffset = 0,
		BrakePower = 40,
		
		IdleRPM = 750,
		LimitRPM = 6500,

		PeakTorque = 100,
		PowerbandStart = 2200,
		PowerbandEnd = 6300,
		
		PowerBias = 0.5,
		
		EngineSoundPreset = -1,
		
		Sound_Idle = "simulated_vehicles/generic3/generic3_idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/generic3/generic3_low.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/generic3/generic3_mid.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/police/siren_1.wav",
		
		DifferentialGear = 0.3,
		Gears = {-0.15,0,0.15,0.25,0.35,0.45}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_nmpdcar", V )


-- Mongooses
local light_table = {
	L_HeadLampPos = Vector(38,12,36),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(38,-12,36),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-43,14,31.5),
	L_RearLampAng = Angle(0, 180, 0),

	R_RearLampPos = Vector(-43,-14,31.5),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(38,12,36),
		Vector(38,-12,36)
	},
	Headlamp_sprites = { 
		Vector(38,12,36),
		Vector(38,-12,36)
	},
	Rearlight_sprites = {
		Vector(-43,14,31.5),
		Vector(-43,-14,31.5),
	},
	Brakelight_sprites = {
		Vector(-43,14,31.5),
		Vector(-43,-14,31.5),
	},
	Reverselight_sprites = {
		Vector(-43,14,31.5),
		Vector(-43,-14,31.5),
	},
}
list.Set( "simfphys_lights", "mongoose", light_table)

local V = {
	Name = "Mongoose",
	Model = "models/jessev92/halo/vehicles/mongoose_chassis.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1500,
		BulletProofTires = true,
		
		LightsTable = "mongoose",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 14,
		RearWheelRadius = 14,
	
		
		CustomWheelModel = "models/jessev92/halo/vehicles/mongoose_tyre_f.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		CustomWheelModel_R = "models/jessev92/halo/vehicles/mongoose_tyre_r.mdl",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(28,20,12),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(28,-20,12),	-- position front right wheel
		CustomWheelPosRL = Vector(-38,18,12),	-- rear left
		CustomWheelPosRR = Vector(-38,-18,12),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-20,0,50),
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-40,0,30),
				ang = Angle(0,90,0)
			},
		},

		FrontHeight = 0,
		FrontConstant = 75000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 0,
		RearConstant = 75000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 5000,
		LimitRPM = 12000,
		PeakTorque = 150,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.46}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_mongoose", V )

local V = { 
	Name = "Urban Mongoose",
	Model = "models/jessev92/halo/vehicles/mongoose_chassis.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1500,
		BulletProofTires = true,
		
		LightsTable = "mongoose",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 14,
		RearWheelRadius = 14,
		
		ModelInfo = {
			Skin = 1,
		},		
		
		CustomWheelModel = "models/jessev92/halo/vehicles/mongoose_tyre_f.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		CustomWheelModel_R = "models/jessev92/halo/vehicles/mongoose_tyre_r.mdl",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(28,20,12),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(28,-20,12),	-- position front right wheel
		CustomWheelPosRL = Vector(-38,18,12),	-- rear left
		CustomWheelPosRR = Vector(-38,-18,12),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-20,0,50),
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-40,0,30),
				ang = Angle(0,90,0)
			},
		},

		FrontHeight = 0,
		FrontConstant = 75000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 0,
		RearConstant = 75000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 5000,
		LimitRPM = 12000,
		PeakTorque = 150,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.46}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_mongoosesnow", V )

-- Warthogs
local light_table = {
	L_HeadLampPos = Vector(93,6,45),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(93,-6,45),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-90,29,51),
	L_RearLampAng = Angle(0, 180, 0),

	R_RearLampPos = Vector(-90,-29,51),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(90,6,45),
		Vector(90,-6,45)
	},
	Headlamp_sprites = { 
		Vector(90,6,45),
		Vector(90,-6,45)
	},
	Rearlight_sprites = {
		Vector(-90,29,51),
		Vector(-90,-29,51),
	},
	Brakelight_sprites = {
		Vector(-90,29,51),
		Vector(-90,-29,51),
	},
	Reverselight_sprites = {
		Vector(-90,29,51),
		Vector(-90,-29,51),
	},
	FogLight_sprites = {
		{pos = Vector(90,6,45),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(90,-6,45),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "vh4warthog", light_table)

local light_table = {
	L_HeadLampPos = Vector(93,6,45),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(93,-6,45),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-90,29,51),
	L_RearLampAng = Angle(0, 180, 0),

	R_RearLampPos = Vector(-90,-29,51),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(100,6,47),
		Vector(100,-6,47)
	},
	Headlamp_sprites = { 
		Vector(100,6,47),
		Vector(100,-6,47)
	},
	Rearlight_sprites = {
		Vector(-100,32,58),
		Vector(-100,-32,58),
	},
	Brakelight_sprites = {
		Vector(-100,32,58),
		Vector(-100,-32,58),
	},
	Reverselight_sprites = {
		Vector(-100,32,58),
		Vector(-100,-32,58),
	},
	FogLight_sprites = {
		{pos = Vector(-8,16,96),material = "sprites/light_ignorez",size = 70},
	},
}
list.Set( "simfphys_lights", "vh4warthogtroop", light_table)

local light_table = {
	L_HeadLampPos = Vector(102,5,45),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(102,-5,45),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-102,28,52),
	L_RearLampAng = Angle(0, 180, 0),

	R_RearLampPos = Vector(-102,-28,52),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(102,5,45),
		Vector(102,-5,45),
	},
	Headlamp_sprites = { 
		Vector(102,8,45),
		Vector(102,-8,45),
	},
	Rearlight_sprites = {
		Vector(-102,29,52),
		Vector(-102,-29,52),
	},
	Brakelight_sprites = {
		Vector(-102,27,52),
		Vector(-102,-27,52),
	},
	Reverselight_sprites = {
		Vector(-102,28,52),
		Vector(-102,-28,52),
	},
	FogLight_sprites = {
		{pos = Vector(102,0,45),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "civwarthog", light_table)

local V = {
	Name = "M12 Civilian Hog",
	Model = "models/jessev92/halo/vehicles/warthog_civ_chassis.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1500,
		BulletProofTires = true,
		
		LightsTable = "civwarthog",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 22,
		RearWheelRadius = 22,
		
		CustomWheelModel = "models/jessev92/halo/vehicles/warthog_civ_tyre_sliding.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(64,20,11),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(64,-20,11),	-- position front right wheel
		CustomWheelPosRL = Vector(-64,20,11),	-- rear left
		CustomWheelPosRR = Vector(-64,-20,11),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-8,-18,60),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-4,-18,26),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-86,0,45),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-60,36,45),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-60,-36,45),
				ang = Angle(0,180,0)
			},
		},

		FrontHeight = 0,
		FrontConstant = 75000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 0,
		RearConstant = 75000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 5000,
		LimitRPM = 12000,
		PeakTorque = 150,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.46}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_civhog", V )

local V = {
	Name = "M12 LRV",
	Model = "models/h4vehicles/warthog.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1500,
		BulletProofTires = true,
		
		LightsTable = "vh4warthog",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 17,
		RearWheelRadius = 17,
		
		CustomWheelModel = "models/h4vehicles/wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(64,43,15),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(64,-43,15),	-- position front right wheel
		CustomWheelPosRL = Vector(-64,43,15),	-- rear left
		CustomWheelPosRR = Vector(-64,-43,15),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-6,-18,60),
		SeatPitch = 0,
		SeatYaw = 80,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-10,-18,26),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 0,
		FrontConstant = 75000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 0,
		RearConstant = 75000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 5000,
		LimitRPM = 12000,
		PeakTorque = 150,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.46}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_4hog", V )

local V = {
	Name = "M12 LRV Troop Hog",
	Model = "models/tfg/warthogtroop.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1500,
		BulletProofTires = true,
		
		LightsTable = "vh4warthogtroop",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 19,
		RearWheelRadius = 19,
		
		CustomWheelModel = "models/tfg/warthogtroopwheels.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(64,43,15),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(64,-43,15),	-- position front right wheel
		CustomWheelPosRL = Vector(-64,43,15),	-- rear left
		CustomWheelPosRR = Vector(-64,-43,15),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(-6,-20,70),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(-10,-20,36),
				ang = Angle(0,-90,0),
			},
			{
				pos = Vector(-50,10,50),
				ang = Angle(0,0,0),
			},
			{
				pos = Vector(-70,10,50),
				ang = Angle(0,0,0),
			},
			{
				pos = Vector(-50,-10,50),
				ang = Angle(0,180,0),
			},
			{
				pos = Vector(-70,-10,50),
				ang = Angle(0,180,0),
			},
			{
				pos = Vector(-80,0,50),
				ang = Angle(0,90,0),
			},
			{
				pos = Vector(-10,-20,36),
				ang = Angle(0,0,0),
			},
		},

		FrontHeight = 0,
		FrontConstant = 75000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 0,
		RearConstant = 75000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 75,
		Efficiency = 0.75,
		GripOffset = -0,
		BrakePower = 50,
		
		IdleRPM = 5000,
		LimitRPM = 12000,
		PeakTorque = 150,
		PowerbandStart = 4500,
		PowerbandEnd = 7500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.46}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_4hogtroop", V )

-- Pickup / Spade
local light_table = {
	L_HeadLampPos = Vector(73,26,50),
	L_HeadLampAng = Angle(0,0,0),
	
	R_HeadLampPos = Vector(73,-26,50),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-160,29,39.5),
	L_RearLampAng = Angle(0, 0, 0),

	R_RearLampPos = Vector(-160,-29,39.5),
	R_RearLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(73,23,57),
		Vector(73,-23,57)
	},
	Headlamp_sprites = { 
		Vector(73,26,57),
		Vector(73,-26,57)
	},
	Rearlight_sprites = {
		Vector(-130,26,39.5),
		Vector(-130,-26,39.5),
		Vector(-36,8,90.5),
		Vector(-36,-8,90.5),
		Vector(-36,3,90.5),
		Vector(-36,-3,90.5),
	},
	Brakelight_sprites = {
		Vector(-130,26,39.5),
		Vector(-130,-26,39.5),
		Vector(-36,8,90.5),
		Vector(-36,-8,90.5),
		Vector(-36,3,90.5),
		Vector(-36,-3,90.5),
	},
	Reverselight_sprites = {
		Vector(-130,29,39.5),
		Vector(-130,-29,39.5),
		Vector(-130,23,39.5),
		Vector(-130,-23,39.5),
	},
	FogLight_sprites = {
		{pos = Vector(25,14,73.5),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(25,-14,73.5),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "halopickup", light_table)

local V = {
	Name = "The Spade",
	
	Model = "models/halo/pickup.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 180,

	Members = {
		Mass = 1200,
		
		EnginePos = Vector(73,0,57),
		
		LightsTable = "halopickup",
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 23,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 23,
		
		CustomWheelModel = "models/halo/halo_pickup_tire.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(75,48,18),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(75,-48,18),	-- position front right wheel
		CustomWheelPosRL = Vector(-80,48,18),	-- rear left
		CustomWheelPosRR = Vector(-80,-48,18),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(0,-19,72),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua

		PassengerSeats = {
			{
				pos = Vector(0,-20,42),
				ang = Angle(0,-90,0)
			},
		},
		
		
		StrengthenSuspension = false, -- if set to true it will increase the constant limit to 10 0000 but double the amount of constraints used. Also the limiters of the physical wheel will be set tighter. You can make the physical wheelpos visible by typing cl_simfphys_debugwheels = 1 into the console
							  --If you are using vehicle models with bones/poseparameters and experience floating wheels or wheels clipping into the ground then this will probably fix it. 
							  --Keep in mind that this will make the suspension alot more responsive to bumps and stiffer. If your wheels are still leaving the ground in corners you will have to decrease the constant or lower the masscenter
		
		FrontHeight = 0,		--positive numbers only
		FrontConstant = 27000,		--max 50000 if StrengthenSuspension set to false     constant can be imagined as spring strength
		FrontDamping = 2800,		-- dont set damping/relative damping too high or it will spazz     damping is basically the shock absorbers
		FrontRelativeDamping = 2800,
		
		RearHeight = 0,
		RearConstant = 32000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 54,
		Efficiency = 1.337,
		GripOffset = 0,
		BrakePower = 40,
		
		IdleRPM = 2225,
		LimitRPM = 6500,

		PeakTorque = 100,
		PowerbandStart = 2200,
		PowerbandEnd = 6300,
		
		PowerBias = 0.5,
		
		EngineSoundPreset = -1,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.3,
		Gears = {-0.15,0,0.15,0.25,0.35,0.45}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_halopickup", V )

-- HC1500s
local light_table = {
	L_HeadLampPos = Vector(-25,78,5),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(26,78,5),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-41,-130,4),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(43,-130,4),
	R_RearLampAng = Angle(0,-90,0), 
	
	Headlight_sprites = {  
		Vector(23,78,5),
		Vector(-22,78,5),
		Vector(25,77,-16),
		Vector(-24,77,-16)
	},
	Headlamp_sprites = { 
		Vector(29,78,5),
		Vector(-28,78,5),
		Vector(25,77,-16), 	
		Vector(-24,77,-16)
	},
	Rearlight_sprites = {
		Vector(43,-130,7),
		Vector(43,-130,2),	
		
		Vector(-41,-130,7),
		Vector(-41,-130,2),
	},
	Brakelight_sprites = {
		Vector(43,-130,7),
		Vector(43,-130,2),
		
		Vector(-41,-130,7),
		Vector(-41,-130,2),
	},
	FogLight_sprites = {
		{pos = Vector(-24,77,-16),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(25,77,-16),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "halocargotruck", light_table)

local V = {
	Name = "HC1500 Truck Model Y",
	Model = "models/halocivilianvehicles/odstcargotruck/cargo_truck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 2000,

		
		
		EnginePos = Vector(0,87,8),
		
		LightsTable = "halocargotruck",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halocivilianvehicles/reachcargo/wheel.mdl",
		
		FrontWheelRadius = 17,
		RearWheelRadius = 17,
		
		CustomWheelPosFL = Vector(-30,30,-23),	-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(30,30,-23),	-- position front right wheel
		CustomWheelPosRL = Vector(-30,-98,-23),	-- rear left
		CustomWheelPosRR = Vector(30,-98,-23),	-- rear right
		CustomWheelAngleOffset = Angle(0,180,0),
		
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(20,-16,35),
		SeatPitch = 10,
		
		PassengerSeats = {
			{
				pos = Vector(25,26,0),
				ang = Angle(0,0,10)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 5500,
		PeakTorque = 55,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "vehicles/crane/crane_startengine1.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		Sound_Throttle = "",
		
		DifferentialGear = 0.13,
		Gears = {-0.1,0,0.6,0.8,1,1.4,1.8}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halocargomy", V )

local light_table = {
	L_HeadLampPos = Vector(-24,78,4),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(25.5,78,4),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(43,-129,8),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(-41,-129,8),
	R_RearLampAng = Angle(0,-90,0), 
	
	Headlight_sprites = {  
		Vector(25.5,78,4),
		Vector(-24,78,4),
		Vector(36,74,-8),
		Vector(-35,74,-8)
	},
	Headlamp_sprites = { 
		Vector(25.5,78,4),
		Vector(-24,78,4),
		Vector(36,74,-8), 	
		Vector(-35,74,-8)
	},
	Rearlight_sprites = {
		Vector(43,-129,10.5),
		Vector(43,-129,6.5),
		
		Vector(-41,-129,10.5),
		Vector(-41,-129,6.5),
	},
	Brakelight_sprites = {
		Vector(43,-129,10.5),
		Vector(43,-129,6.5),
		
		Vector(-41,-129,10.5),
		Vector(-41,-129,6.5),
	},
	FogLight_sprites = {
		{pos = Vector(36,77,-8),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(-35,77,-8),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "halocargotruckw", light_table)

local V = {
	Name = "HC1500 Truck Model W",
	Model = "models/halocivilianvehicles/reachcargo/truck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 2000,

		
		
		EnginePos = Vector(0,78,0),
		
		LightsTable = "halocargotruckw",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halocivilianvehicles/reachcargo/wheel.mdl",
		
		FrontWheelRadius = 17,
		RearWheelRadius = 17,
		
		CustomWheelPosFL = Vector(-31,30.5,-19),	-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(33,30.5,-19),	-- position front right wheel
		CustomWheelPosRL = Vector(-31,-77,-19),	-- rear left
		CustomWheelPosRR = Vector(33,-77,-19),	-- rear right
		CustomWheelAngleOffset = Angle(0,180,0),
		
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(37,-19.5,32),
		SeatPitch = 10,
		
		PassengerSeats = {
			{
				pos = Vector(20,45,-5),
				ang = Angle(0,0,10),
			},
			{
				pos = Vector(0,45,-5),
				ang = Angle(0,0,10)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 17,
		FrontConstant = 70000,
		FrontDamping = 3000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 17,
		RearConstant = 70000,
		RearDamping = 4000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 2500,
		LimitRPM = 9500,
		PeakTorque = 55,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "vehicles/crane/crane_startengine1.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		Sound_Throttle = "",
		
		DifferentialGear = 0.11,
		Gears = {-0.1,0,0.6,0.8,1,1.4,1.8}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halocargomw", V )

-- HC1200s
local light_table = {
	L_HeadLampPos = Vector(0,120,100),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(0,120,100),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-42.25,-123,45),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(36.25,-123,45),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(33,123,83),
		Vector(-33,123,83),
		Vector(35,96,145),
		Vector(-35,96,145)
		
	},
	Headlamp_sprites = { 
		Vector(33,123,83),
		Vector(-33,123,83),
		Vector(35,96,145),
		Vector(-35,96,145)
	},
	Rearlight_sprites = {
		Vector(-42.25,-123,45),
		Vector(43,-123,45),
		
		Vector(-42.25,-123,49),
		Vector(43,-123,49),
		
		Vector(-36.25,-123,45),
		Vector(37,-123,45),
		
		Vector(-36.25,-123,49),
		Vector(37,-123,49),
	},
	Brakelight_sprites = {
		Vector(-42.25,-123,45),
		Vector(43,-123,45),
		
		Vector(-42.25,-123,49),
		Vector(43,-123,49),
		
		Vector(-36.25,-123,45),
		Vector(37,-123,45),
		
		Vector(-36.25,-123,49),
		Vector(37,-123,49),
	},
	Reverselight_sprites = {
		Vector(-42.25,-123,45),
		Vector(43,-123,45),
		
		Vector(-42.25,-123,49),
		Vector(43,-123,49),
		
		Vector(-36.25,-123,45),
		Vector(37,-123,45),
		
		Vector(-36.25,-123,49),
		Vector(37,-123,49),
	},
	FogLight_sprites = {
		{pos = Vector(35,96,145),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(-35,96,145),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "halotruckcablarge", light_table)

local V = {
	Name = "HC1200 Model O",
	Model = "models/halo/halo_truck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,
		
		EnginePos = Vector(0,123,83),
		
		LightsTable = "halotruckcablarge",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		FirstPersonViewPos =  Vector(0,-10,12),
		
		CustomWheelModel = "models/halo/truck_front_tire.mdl",
		CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-50,76,25),
		CustomWheelPosFR = Vector(50,76,25),
		CustomWheelPosML = Vector(-37,-43,25),
		CustomWheelPosMR = Vector(37,-43,25),
		CustomWheelPosRL = Vector(-37,-94,25),
		CustomWheelPosRR = Vector(37,-94,25),	
		CustomWheelAngleOffset = Angle(0,270,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(41,-28,133),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(0,65,90),
				ang = Angle(0,0,0)
			},
			
			{
				pos = Vector(28,65,90),
				ang = Angle(0,0,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 32000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 20000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 500,
		LimitRPM = 5500,
		PeakTorque = 55,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halotruck", V )

local light_table = {
	//CustomWheelPosFL = Vector(-3,-33, 0),
	L_HeadLampPos = Vector(35,87,8),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(-33,87,8),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-41.5,-154,-25),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(44,-154,-25),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = {  
		Vector(35,87,8),
		Vector(-33,87,8),
		Vector(37,63,70),
		Vector(-35,64,70)
	},
	Headlamp_sprites = { 
		Vector(35,87,8),
		Vector(-33,87,8),
		Vector(37,63,70),
		Vector(-35,64,70)
	},
	Rearlight_sprites = {
		Vector(-41.5,-154,-25),
		Vector(-41.5,-154,-30),
		
		Vector(-35,-155,-25),
		Vector(-35,-155,-30),
		
		Vector(44,-154,-25),
		Vector(44,-154,-30),
		
		Vector(38,-155,-25),
		Vector(38,-155,-30),
	},
	Brakelight_sprites = {
		Vector(-41.5,-154,-25),
		Vector(-41.5,-154,-30),
		
		Vector(-35,-155,-25),
		Vector(-35,-155,-30),
		
		Vector(44,-154,-25),
		Vector(44,-154,-30),
		
		Vector(38,-155,-25),
		Vector(38,-155,-30),
	},
	FogLight_sprites = {
		{pos = Vector(37,63,70),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(-35,64,70),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "halomiltrucklarge", light_table)

local V = {
	Name = "M900 LV",
	Model = "models/halocivilianvehicles/miltruck/militarytruck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,

		EnginePos = Vector(0,87,8),
		
		LightsTable = "halomiltrucklarge",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halo/truck_front_tire.mdl",
		CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-47,43,-43),
		CustomWheelPosFR = Vector(47,43,-43),
		CustomWheelPosML = Vector(-34,-74,-43),
		CustomWheelPosMR = Vector(34,-74,-43),
		CustomWheelPosRL = Vector(-34,-127,-43),
		CustomWheelPosRR = Vector(34,-127,-43),	
		CustomWheelAngleOffset = Angle(0,270,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(23,-28,55),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(0,28,15),
				ang = Angle(0,0,0)
			},
			
			{
				pos = Vector(23,28,15),
				ang = Angle(0,0,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 8500,
		PeakTorque = 60,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halomiltruck", V )

local light_table = {
	L_HeadLampPos = Vector(34,96,6),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(-32.5,96,6),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-44,-152,-35),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(46,-152,-35),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = {  
		Vector(34,96,6),
		Vector(-32.5,96,6),
		Vector(36,68.5,71.5),
		Vector(-34.5,68.5,71.5)
	},
	Headlamp_sprites = { 
		Vector(34,96,6),
		Vector(-32.5,96,6),
		Vector(36,68.5,71.5),
		Vector(-34.5,68.5,71.5)
	},
	Rearlight_sprites = {
		Vector(-44,-152,-35),
		Vector(46,-152,-35),
	},
	Brakelight_sprites = {
		Vector(-45,-152,-34),
		Vector(47,-152,-34),
	},
	FogLight_sprites = {
		{pos = Vector(36,68.5,71.5),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(-34.5,68.5,71.5),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "halomiltrucklarger", light_table)

local V = {
	Name = "HC1200 Model R",
	Model = "models/halocivilianvehicles/reachtruckcab/truck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,

		EnginePos = Vector(0,87,8),
		
		LightsTable = "halomiltrucklarger",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halo/truck_front_tire.mdl",
		CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-47,51,-43),
		CustomWheelPosFR = Vector(47,51,-43),
		
		CustomWheelPosML = Vector(-40,-60,-43),
		CustomWheelPosMR = Vector(40,-60,-43),
		
		CustomWheelPosRL = Vector(-40,-113,-43),
		CustomWheelPosRR = Vector(40,-113,-43),	
		CustomWheelAngleOffset = Angle(0,270,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(44,-27.5,44),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(0,50,2),
				ang = Angle(0,0,0)
			},
			
			{
				pos = Vector(23,50,2),
				ang = Angle(0,0,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 8500,
		PeakTorque = 60,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_haloreatruck", V )

-- Military Trucks / M850s
local light_table = {
	L_HeadLampPos = Vector(41.6,121,42),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(-41.6,121,42),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-44,-152,-35),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(46,-152,-35),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = {  
		Vector(-35,104,128.6),
		Vector(0,104,128.6),
		Vector(35,104,128.6),
		
		Vector(47.5,118.5,52.5),
		Vector(-47.5,118.5,52.5),
		
		Vector(41.6,121,42),
		Vector(-41.6,121,42),
	},
	Headlamp_sprites = { 
		Vector(-35,104,128.6),
		Vector(0,104,128.6),
		Vector(35,104,128.6),
		
		Vector(47.5,118.5,52.5),
		Vector(-47.5,118.5,52.5),
		
		Vector(41.6,121,42),
		Vector(-41.6,121,42),
	},
	Rearlight_sprites = {
		Vector(-49,-128,47),
		Vector(49,-128,47),
	},
	Brakelight_sprites = {
		Vector(51,-127,52.5),
		Vector(-51,-127,52.5),
	},
	FogLight_sprites = {
		{pos = Vector(-42.5,118.5,52),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(42.5,118.5,52),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "m850lights", light_table)

local light_table = {
	L_HeadLampPos = Vector(41.6,121,42),
	L_HeadLampAng = Angle(0,90,0),
	
	R_HeadLampPos = Vector(-41.6,121,42),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-44,-152,-35),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(46,-152,-35),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = {  
		Vector(-35,189,122),
		Vector(0,189,122),
		Vector(35,189,122),
		
		Vector(46,204,49),
		Vector(-46,204,49),
		
		Vector(40.5,206,39),
		Vector(-40.5,206,39),
	},
	Headlamp_sprites = { 
		Vector(-35,189,122),
		Vector(0,189,122),
		Vector(35,189,122),
		
		Vector(46,204,49),
		Vector(-46,204,49),
		
		Vector(40.5,206,39),
		Vector(-40.5,206,39),
	},
	FogLight_sprites = {
		{pos = Vector(-41,204,49),material = "sprites/light_ignorez",size = 50},
		{pos = Vector(41,204,49),material = "sprites/light_ignorez",size = 50},
	},
}
list.Set( "simfphys_lights", "m850lightsd", light_table)

local V = {
	Name = "M850 Model D",
	Model = "models/tfg/trooptruck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,-10),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,

		EnginePos = Vector(0,118.5,52.5),
		
		LightsTable = "m850lightsd",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halocivilianvehicles/reachmiltruck/wheel.mdl",
		//CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-45,130,34),
		CustomWheelPosFR = Vector(45,130,34),
		
		CustomWheelPosML = Vector(-45,-9,34),
		CustomWheelPosMR = Vector(45,-9,34),
		
		CustomWheelPosRL = Vector(-45,-62,34),
		CustomWheelPosRR = Vector(45,-62,34),	
		CustomWheelAngleOffset = Angle(0,0,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(130,-30,125),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(40,50,60),
				ang = Angle(0,90,0)
			},
			
			{
				pos = Vector(-40,50,60),
				ang = Angle(0,-90,0)
			},
			
			{
				pos = Vector(40,20,60),
				ang = Angle(0,90,0)
			},
			
			{
				pos = Vector(-40,20,60),
				ang = Angle(0,-90,0)
			},
			
			{
				pos = Vector(40,-10,60),
				ang = Angle(0,90,0)
			},
			
			{
				pos = Vector(-40,-10,60),
				ang = Angle(0,-90,0)
			},
			
			{
				pos = Vector(40,-40,60),
				ang = Angle(0,90,0)
			},
			
			{
				pos = Vector(-40,-40,60),
				ang = Angle(0,-90,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 8500,
		PeakTorque = 60,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_m850md", V )

local V = {
	Name = "M850 Model C",
	Model = "models/halocivilianvehicles/reachmiltruck/truck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,0),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,

		EnginePos = Vector(0,118.5,52.5),
		
		LightsTable = "m850lights",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halocivilianvehicles/reachmiltruck/wheel.mdl",
		//CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-45,58,34),
		CustomWheelPosFR = Vector(45,58,34),
		
		CustomWheelPosML = Vector(-45,-40,34),
		CustomWheelPosMR = Vector(45,-40,34),
		
		CustomWheelPosRL = Vector(-45,-95,34),
		CustomWheelPosRR = Vector(45,-95,34),	
		CustomWheelAngleOffset = Angle(0,0,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(55,-34.5,115),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(0,80,70),
				ang = Angle(0,0,0)
			},
			
			{
				pos = Vector(26,80,70),
				ang = Angle(0,0,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 8500,
		PeakTorque = 60,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_m850mc", V )

local V = {
	Name = "M850 Model B",
	Model = "models/halocivilianvehicles/reachmiltruck/equipmenttruck.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,0),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,

		EnginePos = Vector(0,118.5,52.5),
		
		LightsTable = "m850lights",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halocivilianvehicles/reachmiltruck/wheel.mdl",
		//CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-45,58,34),
		CustomWheelPosFR = Vector(45,58,34),
		
		CustomWheelPosML = Vector(-45,-40,34),
		CustomWheelPosMR = Vector(45,-40,34),
		
		CustomWheelPosRL = Vector(-45,-95,34),
		CustomWheelPosRR = Vector(45,-95,34),	
		CustomWheelAngleOffset = Angle(0,0,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(55,-34.5,115),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(0,80,70),
				ang = Angle(0,0,0)
			},
			
			{
				pos = Vector(26,80,70),
				ang = Angle(0,0,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 8500,
		PeakTorque = 60,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_m850mb", V )

local V = {
	Name = "M850 Model A",
	Model = "models/halocivilianvehicles/reachmiltruck/flatbed.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "TFG Custom Halo",
	SpawnOffset = Vector(0,0,0),
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 3000,

		EnginePos = Vector(0,118.5,52.5),
		
		LightsTable = "m850lights",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/halocivilianvehicles/reachmiltruck/wheel.mdl",
		//CustomWheelModel_R = "models/halo/truck_back_tire.mdl",
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelPosFL = Vector(-45,58,34),
		CustomWheelPosFR = Vector(45,58,34),
		
		CustomWheelPosML = Vector(-45,-40,34),
		CustomWheelPosMR = Vector(45,-40,34),
		
		CustomWheelPosRL = Vector(-45,-95,34),
		CustomWheelPosRR = Vector(45,-95,34),	
		CustomWheelAngleOffset = Angle(0,0,0),
		
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(55,-34.5,115),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(0,80,70),
				ang = Angle(0,0,0)
			},
			
			{
				pos = Vector(26,80,70),
				ang = Angle(0,0,0)
			},
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 1500,
		LimitRPM = 8500,
		PeakTorque = 60,
		PowerbandStart = 650,
		PowerbandEnd = 5300,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4bangeridle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_m850ma", V )