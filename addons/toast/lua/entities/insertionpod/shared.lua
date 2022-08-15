ENT.Type = "anim"
ENT.PrintName = "ODST drop pod"
ENT.Nicknames = {"ODST drop pod"}
ENT.Author = "thelaughingcheese"
ENT.Category = "Halo ODST"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.Information = "its a pod"
ENT.Modela = "models/odst/pod/drop_pod_body2.mdl"
ENT.Model = "models/toast/ports/cov_insertion_pod.mdl"
ENT.canlaunch = true
ENT.Door = nil
ENT.Chute = nil
ENT.Override = false
ENT.Stage = 0
ENT.RemoveTime = CurTime()
ENT.NextExit = CurTime()
ENT.NextSkip = CurTime()
ENT.StopPush = CurTime()
ENT.NextOverride = CurTime()
ENT.CRemoveTime = CurTime()
ENT.CoverGone = false
ENT.ParentEnt = nil
ENT.modelclone = nil
ENT.PodHealth = 1000
ENT.PodFuel1 = 100
ENT.PodFuel2 = 100
ENT.FuelUse1 = 0.2
ENT.FuelUse2 = 0.25
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.ChuteSnds = "entities/odst_drop_pod/chutedeploy.wav"
ENT.ThrusSnds = "entities/odst_drop_pod/thrusters.wav"
ENT.LaunchSnds = {
	"entities/odst_drop_pod/launch1.wav",
	"entities/odst_drop_pod/launch2.wav",
	"entities/odst_drop_pod/launch1.wav"
}
ENT.LandSnds = {
	"npc/env_headcrabcanister/explosion.wav",
	"npc/env_headcrabcanister/launch.wav",
	"entities/odst_drop_pod/land1.wav"
}
ENT.HatchSnds = {
	"entities/odst_drop_pod/hatch1.wav",
	"entities/odst_drop_pod/hatch2.wav",
	"entities/odst_drop_pod/hatch3.wav"
}

--0 in dock
--1 in free fall, disable exiting
--2 chute need deploy
--3 chute is deployed
--4 chute seperate
--5 thrusters slow decent
--6 thrusters off, landed, enable opening of hatch
--7 player is out or dead, remove pod and parts in 30 sec
--fuel 1 is for landing
--fuel 2 is for moving