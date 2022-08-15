/*--------------------------------------------------
	=============== VJ Base Plugins ===============
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

if VJBASE_PLUGINS != nil then VJBASE_TOTALPLUGINS = table.Count(VJBASE_PLUGINS) else VJBASE_TOTALPLUGINS = 0 end
//PrintTable(VJBASE_PLUGINS)
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_PLUGINS(Panel)
	Panel:AddControl("Label", {Text = "#vjbase.menu.plugins.label"})
	Panel:ControlHelp(language.GetPhrase("#vjbase.menu.plugins.version").." "..VJBASE_VERSION) -- Main Number / Version / Patches
	Panel:ControlHelp(language.GetPhrase("#vjbase.menu.plugins.totalplugins").." "..VJBASE_TOTALPLUGINS)
	
	local CheckList = vgui.Create("DListView")
	CheckList:SetTooltip(false)
	//CheckList:Center() -- No need since Size does it already
	CheckList:SetSize(100, 300) -- Size
	CheckList:SetMultiSelect(false)
	CheckList:AddColumn("#vjbase.menu.plugins.header1") -- Add column
	CheckList:AddColumn("#vjbase.menu.plugins.header2") -- Add column
	//Panel:SetName("Test") -- Renames the blue label
	if VJBASE_PLUGINS != nil then
		for _,v in SortedPairsByMemberValue(VJBASE_PLUGINS,"Name") do
			CheckList:AddLine(v.Name,v.Type)
		end
	else
		CheckList:AddLine("#vjbase.menu.plugins.notfound","")
	end
	CheckList.OnRowSelected = function()
		surface.PlaySound(Sound("vj_illuminati/Illuminati Confirmed.mp3"))
		chat.AddText(Color(255,255,0),"-=-=-=-=-=-=-=-=- ", Color(255,100,0),VJBASE_GETNAME, Color(255,255,0)," -=-=-=-=-=-=-=-=-")
		chat.AddText(Color(0,255,0), language.GetPhrase("#vjbase.menu.plugins.version").." "..VJBASE_VERSION)
		chat.AddText(Color(0,255,0), language.GetPhrase("#vjbase.menu.plugins.totalplugins").." "..VJBASE_TOTALPLUGINS)
	end
	Panel:AddItem(CheckList)

end
---------------------------------------------------------------------------------------------------------------------------------------------
hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_INSTALLATIONS", function()
	spawnmenu.AddToolMenuOption("DrVrej", "Main Menu", "Installed Plugins", "#vjbase.menu.plugins", "", "", VJ_PLUGINS)
end)
---------------------------------------------------------------------------------------------------------------------------------------------