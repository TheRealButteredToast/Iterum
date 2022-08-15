local V = {
	Name = "Elephant",
	Model = "models/valk/hw/elephant.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Iterum Vehicles",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 5,
		Inertia = Vector(14017.5,46543,47984.5),
		
		MaxHealth = 75000,
		
		IsArmored = true,
		
		FirstPersonViewPos = Vector(0,-30,0),
		
		FrontWheelRadius = 45,
		RearWheelRadius = 45,
		
		EnginePos = Vector(-79.66,0,72.21),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/valk/spv3/warthog/monster_wheel.mdl",
		
		CustomWheelPosFL = Vector(110,130,53),
		CustomWheelPosFR = Vector(110,-130,53),
		CustomWheelPosML = Vector(-150,130,57),
		CustomWheelPosMR = Vector(-150,-130,57),
		CustomWheelPosRL = Vector(-240,130,57),
		CustomWheelPosRR = Vector(-240,-130,57),
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,5),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(160,-40,150),
		SeatPitch = 0,
		SeatYaw = 90,
	
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
		
			

		
		PassengerSeats = {
		--The Hotbox Room
			{
				pos = Vector(-100,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-125,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-150,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-175,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-200,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-225,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-250,-90,145),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-100,90,145),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-125,90,145),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-150,90,145),
				ang = Angle(0,180,0)
			},
						{
				pos = Vector(-175,90,145),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-200,90,145),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-225,90,145),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-250,90,145),
				ang = Angle(0,180,0)
			},
		},
		
		FrontHeight = 3,
		FrontConstant = 50000,
		FrontDamping = 6000,
		FrontRelativeDamping = 6000,
		
		RearHeight = 3,
		RearConstant = 50000,
		RearDamping = 6000,
		RearRelativeDamping = 6000,
		
		FastSteeringAngle = 14,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 6,
		
		MaxGrip = 800,
		Efficiency = 0.42,
		GripOffset = -300,
		BrakePower = 850,
		BulletProofTires = true,
		
		IdleRPM = 800,
		LimitRPM = 4500,
		PeakTorque = 320,
		PowerbandStart = 600,
		PowerbandEnd = 3500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-111.88,-0.14,59.15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 160,
		
		PowerBias = -0.5,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/tiger/tiger_high.wav",
		Sound_HighPitch = 0.75,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 40,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		
		ForceTransmission = 1,
		
		DifferentialGear = 0.2,
		Gears = {-0.1,0,0.05,0.07,0.09,0.11,0.13,0.16}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_halo_elephant", V )


