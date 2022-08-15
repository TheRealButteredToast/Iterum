TOOL.Category = "Headcrab-Plus"
TOOL.Name = "Zombie Creator"

TOOL.ClientConVar['model'] = ''
TOOL.ClientConVar['health'] = '100'
TOOL.ClientConVar['removeheadcrab'] = '0'
TOOL.ClientConVar['zombietype'] = '0'
TOOL.ClientConVar['bzero'] = '0'
TOOL.ClientConVar['override'] = '0'

if CLIENT then
	language.Add("tool.headcrabplus_zombiecreator.name", "Zombie Creator")
	language.Add("tool.headcrabplus_zombiecreator.0", "Left Click: Create a Zombie Right Click: Copy Model")
	language.Add("tool.headcrabplus_zombiecreator.desc", "Creates Custom Zombies")

	language.Add("Undone_Zombie", "Undone Custom-Zombie")
	
	CreateClientConVar("headcrabplus_zombiecreator_model", "models/player/zombie_classic.mdl", false, true)
	CreateClientConVar("headcrabplus_zombiecreator_removeheadcrab", 0, false, true)
	CreateClientConVar("headcrabplus_zombiecreator_health", 100, false, true)
	CreateClientConVar("headcrabplus_zombiecreator_zombietype", 0, false, true)
	CreateClientConVar("headcrabplus_zombiecreator_bzero", 0, false, true)
	CreateClientConVar("headcrabplus_zombiecreator_override", 0, false, true)
end

local ConVarsDefault = TOOL:BuildConVarList()

function TOOL:LeftClick(tr)
	if CLIENT then return true end

	local ply = self:GetOwner()

	local spawn_pos = tr.HitPos + tr.HitNormal*4.4
	local trace_ent = tr.Entity

	if not self:GetWeapon():CheckLimit("npcs") then return false end
	
	local removeheadcrab = util.tobool(self:GetClientNumber("removeheadcrab"))
	local bzero = util.tobool(self:GetClientNumber("bzero"))
	local override = util.tobool(self:GetClientNumber("override"))
	local health = self:GetClientNumber("health")
	local zombietype = self:GetClientNumber("zombietype")
	
	if zombietype == 0 then zombie = "npc_zombie"
	elseif zombietype == 1 then zombie = "npc_fastzombie"
	elseif zombietype == 2 then zombie = "npc_poisonzombie"
	else zombie = "npc_zombine" end
	
	local zombieEnt=ents.Create(zombie)
	zombieEnt:SetPos(spawn_pos)
	zombieEnt:Spawn()
	zombieEnt:Activate()
	zombieEnt:SetSkin(100)
	zombieEnt.IsHeadcrabPlus = true
	if health then zombieEnt:SetHealth(health) end
	if removeheadcrab and zombie != "npc_poisonzombie" then zombieEnt:SetBodygroup(1, 0) end
	
	undo.Create("Zombie")
		undo.AddEntity(zombieEnt)
		undo.SetPlayer(ply)
	undo.Finish()

	ply:AddCount("npcs", zombieEnt)
	ply:AddCleanup("npcs", zombieEnt)
	
	local model = self:GetClientInfo("model")
	if !model or IsUselessModel(model) then return end
	
	local boneMerge
	if removeheadcrab == false then boneMerge=ents.Create("headcrabplus_bonemerge") else boneMerge=ents.Create("headcrabplus_bonemerge_nores") end
	if !boneMerge or boneMerge == nil then return end
	boneMerge:SetModel(model)
	boneMerge:SetParent(zombieEnt)
	boneMerge:Spawn()
	if bzero then boneMerge:SetBodygroup(1, 1) end
	if not boneMerge:LookupBone("ValveBiped.Bip01_Head1") and not override == true then boneMerge:Remove() timer.Simple(0.01, function() zombieEnt:SetSubMaterial(0, "") end) return false end
	zombieEnt.boneMerge = boneMerge

	return true
end
	
function TOOL:RightClick(tr)
	local trace_ent = tr.Entity
	if not IsValid(trace_ent) then return false end
	
	self:GetOwner():ConCommand("headcrabplus_zombiecreator_model " .. trace_ent:GetModel())
	return true
end

if CLIENT then
	function TOOL.BuildCPanel(CPanel)
		CPanel:Help("Creates custom zombies with any valid ValveBiped model")
		CPanel:Help("All Playermodels and most NPC models will work.")
		CPanel:Help("If your zombie is the default model and you didn't intend for it to be, the model you set is either invalid or not ValveBiped")
		
		CPanel:AddControl("ComboBox", {MenuButton = 1, Folder = "zombiecreator", Options = {[ "#preset.default" ] = ConVarsDefault}, CVars = table.GetKeys(ConVarsDefault)})
		local output_mode_combobox = vgui.Create("DComboBox", CPanel)
			output_mode_combobox:AddChoice("Normal Zombie", 0, true)
			output_mode_combobox:AddChoice("Fast Zombie", 1 , false)
			output_mode_combobox:AddChoice("Posion Zombie", 2 , false)
			output_mode_combobox:AddChoice("Zombine", 3 , false)
			output_mode_combobox.OnSelect = function(panel, index, value, data)
				LocalPlayer():ConCommand("headcrabplus_zombiecreator_zombietype " .. data)
			end
		CPanel:AddPanel(output_mode_combobox)
		CPanel:AddControl("TextBox", {Label = "Model", Command = "headcrabplus_zombiecreator_model"})
		
		CPanel:NumSlider("Health", "headcrabplus_zombiecreator_health", 1, 300, 0)
		
		CPanel:Help("Removes the default headcrab and restores the models head. Good for models that already have headcrabs on them. Does not work for posion zombies.")
		CPanel:CheckBox("Remove deafult headcrab", "headcrabplus_zombiecreator_removeheadcrab")
		CPanel:Help("Advanced Options")
		CPanel:CheckBox("Set first body group one", "headcrabplus_zombiecreator_bzero")
		CPanel:CheckBox("Override ValveBiped check", "headcrabplus_zombiecreator_override")
	end
end