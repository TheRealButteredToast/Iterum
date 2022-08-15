if (CLIENT) then
	local HELP_DEFAULT

	hook.Add("CreateMenuButtons", "nutHelpMenu", function(tabs)		
		HELP_DEFAULT = [[
			<div id="parent"><div id="child">
				<center>
				    <img src="http://img2.wikia.nocookie.net/__cb20140827051941/nutscript/images/c/c9/Logo.png"></img>
					<br><font size=15>]] .. L"helpDefault" .. [[</font>
				</center>
			</div></div>
		]]

		tabs["help"] = function(panel)
			local html
			local header = [[<html>
			<head>
				<style>
					@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

					#parent {
					    padding: 5% 0;
					}

					#child {
					    padding: 10% 0;
					}

					body {
						color: #FAFAFA;
						font-family: 'Jeju Gothic', serif;
						-webkit-font-smoothing: antialiased;
					}

					h2 {
						margin: 0;
					}
				</style>
			</head>
			<body>
			]]

			local tree = panel:Add("DTree")
			tree:SetPadding(5)
			tree:Dock(LEFT)
			tree:SetWide(180)
			tree:DockMargin(0, 0, 15, 0)
			tree.OnNodeSelected = function(this, node)
				if (node.onGetHTML) then
					local source = node:onGetHTML()

					if (source:sub(1, 4) == "http") then
						html:OpenURL(source)
					else
						html:SetHTML(header..node:onGetHTML().."</body></html>")
					end
				end
			end

			html = panel:Add("DHTML")
			html:Dock(FILL)
			html:SetHTML(header..HELP_DEFAULT)

			local tabs = {}
			hook.Run("BuildHelpMenu", tabs)

			for k, v in SortedPairs(tabs) do
				if (type(v) != "function") then
					local source = v

					v = function() return tostring(source) end
				end

				tree:AddNode(L(k)).onGetHTML = v or function() return "" end
			end
		end
	end)
end

hook.Add("BuildHelpMenu", "nutBasicHelp", function(tabs)
	tabs["commands"] = function(node)
		local body = ""

		for k, v in SortedPairs(nut.command.list) do
			local allowed = false

			if (v.adminOnly and !LocalPlayer():IsAdmin()or v.superAdminOnly and !LocalPlayer():IsSuperAdmin()) then
				continue
			end

			if (v.group) then
				if (type(v.group) == "table") then
					for k, v in pairs(v.group) do
						if (LocalPlayer():IsUserGroup(v)) then
							allowed = true

							break
						end
					end
				elseif (LocalPlayer():IsUserGroup(v.group)) then
					return true
				end
			else
				allowed = true
			end

			if (allowed) then
				body = body.."<h2>/"..k.."</h2><strong>Syntax:</strong> <em>"..v.syntax.."</em><br /><br />"
			end
		end

		return body
	end

	tabs["plugins"] = function(node)
		local body = ""

		for k, v in SortedPairsByMemberValue(nut.plugin.list, "name") do
			body = (body..[[
				<p>
					<span style="font-size: 22;"><b>%s</b><br /></span>
					<span style="font-size: smaller;">
					<b>%s</b>: %s<br />
					<b>%s</b>: %s
			]]):format(v.name or "Unknown", L"desc", v.desc or L"noDesc", L"author", v.author)

			if (v.version) then
				body = body.."<br /><b>"..L"version".."</b>: "..v.version
			end

			body = body.."</span></p>"
		end

		return body
	end

	tabs["flags"] = function(node)
		local body = [[<table border="0" cellspacing="8px">]]

		for k, v in SortedPairs(nut.flag.list) do
			local icon

			if (LocalPlayer():getChar():hasFlags(k)) then
				icon = [[<img src="asset://garrysmod/materials/icon16/tick.png" />]]
			else
				icon = [[<img src="asset://garrysmod/materials/icon16/cross.png" />]]
			end

			body = body..Format([[
				<tr>
					<td>%s</td>
					<td><b>%s</b></td>
					<td>%s</td>
				</tr>
			]], icon, k, v.desc)
		end

		return body.."</table>"
	end

	tabs["Items"] = function(node)
		local body = [[<table border="0" cellspacing="8px">]]
		for k, v in SortedPairs(nut.item.list) do
			local x
			if(v.desc == "noDesc") then 
				x="No Description; Probably a blueprint or default item." 
			else
				x = v.desc
			end
			
			body = body..Format([[
				<tr>
					<td>%s</td>
					<td><b>%s</b></td>
					<td>%s</td>
				</tr>
			]],v.name, x,k)
		end
		
		return body
	end

	tabs["Rules"] = function(node)
		local body = ""
		
		--<h1>
		--<h2>
		--<h3>
		--<h4>
		--<p>
		--<h5>
		--<br> - Break line
		--<b> - Bold text
		--<strong> - Important text
		--<i> - Italic text
		--<em> - Emphasized text
		--<mark> - Marked text
		--<small> - Small text
		--<del> - Deleted text
		--<ins> - Inserted text
		--<sub> - Subscript text
		--<sup> - Superscript text
		--style="text-align:center;"
		--<ul>
			--<li>
		--<ol>
		--<ol type="1">
		-- Below is a "Nested" List
		--[[
		<ul>
			<li>Coffee</li>
			<li>Tea
				<ul>
					<li>Black tea</li>
					<li>Green tea</li>
				</ul>
			</li>
			<li>Milk</li>
		</ul>
		--]]
		
		body = (body..[[
			</p>
<h1>Rules of Iterum</h1>


<p>
This document contains all the rules for Iterum. By joining the server, you agree that you have not only looked over this list of rules, but also agree to uphold and enforce said rules. Failure to do so will result in punishments upwards of total removal from the server.
</p>
<h3>General Rules</h3>


<ol>

<li>RDM is not allowed. 
<ul>
 
<li>Killing another player without or with poor roleplay reason (death match) is prohibited. Unnecessary provoking is included in this rule.
<p>

        Examples:
</p>  
<ol>
<li>Shooting a player because you do not like their armor.
  
<li>Gunning down your own Teammate because they “looked at you funny.”
</li>  
</ol>
 
<li>There are instances where RDM is allowed. These include:  
<ol>
  
<li>If a faction(s) is currently at war with an opposing faction, members of said faction(s) may engage in combat with one another.
</li>  
</ol>
 
<li>Excessive RDM may be stopped by the staff team. If you are asked to stop but still continue, you risk receiving administrative punishment.
</li> 
</ul>

<li>Do not spam, whether it be IC or OOC chat.

<li>Do not harass or disrespect others.

<li>Do not advertise or leech.

<li>Do not exploit. Report any glitches / bugs / exploits to a staff member as soon as it’s found.

<li>Do not engage in Metagaming. 
<ul>
 
<li>This includes using 3rd Party Software (Such as Discord, Skype, etc.) to convey IC information OOCly.
 
<li>This not only ruins the gamemode, but also imposes unfair advantages in various scenarios.
</li> 
</ul>

<li>Do not break the New Life Rule. (NLR) 
<ul>
 
<li>You must wait 3 minutes before returning to whatever situation you were previously involved with.
</li> 
</ul>

<li>Do not post or engage in inappropriate content.

<li>Do not minge or Fail Roleplay.

<li>Prop Killing / Spamming is not allowed. This includes circumventing the Prop Protection System.

<li>In-game currency may not be sold or traded for real life items, currency or credits

<li>Do not ask for staff in the OOC chat. Please use the staff chat, which is accessed by typing @ before your message. (Ex. @Admin to me I need my car repacked.)

<li>If a staff member finds what you're doing unreasonable, you must stop, whether it is explicitly stated on the rules or not.

<li>Do not complain about decisions made by staff in-game or in Global Chat. Instead, make a report / appeal in the Discord server, or to the owner @Toast#5373 on Discord.

<li>Do not avoid any punishment given by staff by any means.

<li>Lying to staff will result in punishment.

<li>Powergaming is not allowed. 
<ul>
 
<li>FearRP falls under this rule, as it does not exist within Iterum.
</li> 
</ul>

<li>Try to stay in-character as much as possible in roleplay oriented areas of the server.

<li>Names must be player appropriate and must not be lore character names from the Halo series. Staff have discretion on what is and is not appropriate.

<li>Player descriptions must be made serious. These are meant to be used as a representation of what your character looks like, and nothing more. It is recommended that you be as descriptive as possible, however the minimum limit is 16 characters. 
<ul>
 
<li>Valid examples:  
<ol>
  
<li>“6’1” | Caucasian | Standard Build”
  
<li>“6'1”. The man before you can be seen in a modified variant of the UNSC Marine armor, bearing different helmet and color variants than most. The helmet has a label reading "Rookie" on the back of it, with a black coloring to it. The armor shares the same coloring.”
  
<li>“6'1". (Civi) The man before you has a scruffy blonde beard, with an undercut tucked underneath his hood. He can be seen wearing a dark grey hoodie with a dull, brown jacket over it, with a SRS-99C slung upon his shoulder, resting against an orange backpack. Below his waist, a pair of jeans, and tan work boots can be seen. (Innie) The man before you can be seen in rundown UNSC armor that has been repainted to represent the URF, with a cloth poncho wrapped around his upper body. His face cannot be seen through the ODST variant helmet he wears. A SRS-99C is slung upon his shoulder.”
</li>  
</ol>
 
<li>Invalid examples:  
<ol>
  
<li>“A normal broski”
  
<li>“U like wat u see????”
  
<li>“Giant boobie”
  
<li>“The person in front of you is a person”
</li>  
</ol>
</li>  
</ul>

<li>No porn / NSFW content, illegal garbage, ear rape garbage, racist garbage, or erotic garbage. 
<ul>
 
<li>This includes any form of erotic roleplay.
</li> 
</ul>

<li>Keep OOC matters OOC, and vice versa.

<li>Do not use /me for anything that is not serious. 
<ul>
 
<li>Valid examples:  
<ol>
  
<li>"Opens tech-panel."
  
<li>"Sifts through wires."
  
<li>"Bandages wound."
  
<li>"Cleans armor."
</li>  
</ol>
 
<li>Invalid Examples:  
<ol>
  
<li>"Looks up skirt."
  
<li>"Vibe checks."
  
<li>"Wipes ass."
  
<li>"Farts."
</li>  
</ol>
</li>  
</ul>

<li>Mic Spamming is not allowed. This includes using soundboards to play music / video clips.

<li>Using a voice changer / soundboard is considered FailRP unless it fits the character. 
<ul>
 
<li>Using a voice changer or soundboard to sound like you are speaking through a helmet is allowed.
 
<li>Using a voice changer or soundboard as an Elite to sound like an Elite is allowed.
 
<li>Any high pitched or voice changer / soundboard seen as minging will not be tolerated.
 
<li>Excessive use of soundboards will not be tolerated.
</li> 
</ul>

<li>Talking in voice chat is firstly for In Character purposes, however you may specify that the voice chat is being used for Out of Character reasoning. 
<ul>
 
<li>Saying "I am taking this OOC!" or "This conversation is now OOC!" is allowed within reason. This must not take whatever situation is currently happening off track.
</li> 
</ul>

<li>Iterum allows for players to create multiple characters to choose between. These characters may not be related in any form.

<li>Using certain items in your inventory to do damage to players will not be tolerated at all. 
<ul>
 
<li>Deploying vehicles / entities from your inventory to crush someone.
</li> 
</ul>

<li>Using items out of your inventory to allow players to sit on it and move them around will not be tolerated.

<li>VDM is allowed, however not excessively. 
<ul>
 
<li>Players may use their vehicles as a weapon in self defense. If someone is shooting at you, you have every right to run them over.
 
<li>Using a vehicle as a means to RDM is not allowed.
</li> 
</ul>

<li>/advert is always in-character.

<li>AFKing for more than 5 minutes is not allowed. You risk being kicked off your character if you do so.

<li>AFKing overnight to farm money is not allowed.

<li>Most staff situations will involve a staff sit. (Being teleported to an area where both parties can plead their cases) However, you are not entitled to a sit. If a staff member believes that your actions are blatantly against the rules, they may take whatever action is necessary.
</li>
</ol>
<h3>Faction Rules</h3>


<h4>General:</h4>


<ol>

<li>All Factions operate under a “Chain of Command” system, with 5 ranks within them. As a military would work, the highest rank has control over the faction, and final say on anything that happens within it. Through helping a faction, and catering to its needs, players may find themselves advancing through said ranks. However, if a player is seen as an issue to their own faction, they may see themselves falling lower and lower within the faction, eventually earning themselves the boot. (Removal) 
<ul>
 
<li>Players may not be “boosted” through the ranks without Manager approval. Someone who joined the server a day ago may not be boosted to the rank of Lieutenant without proper reasoning. (Ex. Known good leader, and lack of current officers)
 
<li>In terms of PKs: Rank is NOT lost on a normal PK. However, if a player earns themselves a Hard PK, their rank is stripped, and handed off to the next in line.
 
<li>If a player is removed from a faction, all faction-specific items are to be removed from their inventory. (Uniforms, IDs, etc.)
</li> 
</ul>

<li>All factions start at the bare minimum, with no special qualities to them. However, each faction is given the option to conduct research on new technologies to potentially each new items, weapons, vehicles, and the like for their faction to utilize in the ever changing climate of Iterum. 
<ul>
 
<li>Factions may only research one tech at a time. Each tech has a variable amount of phases to it which are all required to be completed before a new tech begins research.
 
<li>Sharing resources between your own characters is not allowed. Doing so will result in a research project’s progress being set back, or reset altogether.
</li> 
</ul>

<li>Factions are allowed to create ceasefires / truces between one another within reason. A faction may only be truced / under a ceasefire with one faction at a time. 
<ul>
 
<li>Factions may work together to raid a faction. The number of participants must still match the Raiding Rules. (Listed below)
</li> 
</ul>

<li>Faction Research Items are not allowed to be stored in personal and temporary storages. These items must always stay in Faction Storages.
</li>
</ol>
<h4>Faction Specific:</h4>


<h5>
    United Nations Space Command (UNSC):</h5>


<ol>

<li>Respect the people of rank above you within the UNSC. They have their ranks for a reason.

<li>If no COs are online, (Lieutenant and Captain) Sergeants and above are allowed to take charge. Priority goes to the higher ranking member.

<li>Only those of the rank CPL+ may access the Faction Storage unless permission is given by an NCO+.

<li>Never go on patrols alone. Always have a battle buddy if you’re not assigned to a squad.

<li>Only wear your rank uniform. If you are caught wearing anything else you will be at risk of being arrested.

<li>When going out on non-official business, try to wear civilian clothing to avoid getting captured. 

<li>Do not clutter the faction storages with useless items, as well as not storing uniforms or other wearable items inside of the storages as other factions can, and will steal them.
<h5>
    Covenant:</h5>


</li>
</ol>
<ol>

<li>Always use honorifics when speaking to your comrades:<br>“Your excellency” for normal superiors. <br>“Noble one/High one” for upper command. <br>“Brother” for lower/equal.

<li>Only Officers are allowed to escort relics. You may escort relics if no officers are online. (Officer ranks are: Commander, Zealot, Ultra, and Field Major.)

<li>Only those of the rank Field Major+ may access the Faction Storage unless permission is given by an NCO+.

<li>You may retreat with relics in case of imminent defeat with impossible odds. Tampering with relics is otherwise heretical. 

<li>Possession of an energy sword without the proper rank or permission is deemed heretical. 

<li>Entry to the bridge is forbidden without permission. (Ultra+ are allowed)

<li>Fraternizing with the enemy will not be tolerated. 

<li>When no superiors are present you can/may: <br>Patrol/Recon.<br>Engage in Skirmishes.<br>Gather resources to bolster yourself and the faction.
<h6>
    Heresy Rules:</h6>


<p>

    Heresy is the act of going against the Covenant, and its ideals. The Covenant follow a strict Code of Honor, in which all members are expected to follow to a tee. Failure to do so may result in In-Character punishments.
</p>
<p>

    <strong>Minor Infractions</strong>: <br>Disrespect<br>Lying to NCOs/COs<br>Entering areas where you are not permitted<br><br>Punishments for Minor Infractions can range from public humiliation to jail time / physical labor.<br><br><strong>Major Infractions</strong>:<br>Stealing<br>Striking down another member of the Covenant without valid reasoning<br>Escorting Relics without proper permission<br>Possession of an Energy Sword without proper rank/permission<br>Fraternizing with enemy factions<br><br>Punishment for Major Infractions can range from the stripping of rank upwards to Public Execution.
</p>
<h5>
    The Insurrection (Insurgents):</h5>


<ol>

<li>No one below Lieutenant is allowed to access faction storage unless told otherwise.

<li>Uniforms MUST be worn on base. Failure to do so will result in a demotion.

<li>The word of your superiors is law. Expulsion from the faction is punishment for falling out of line.

<li>Creating items outside of your specialization or using faction resources for personal gain is forbidden.

<li>Divulging any information to the enemy will result in death.

<li>Ranks below Squad Deputy must ask for permission to leave base. 

<li>Civilian attire must be worn in the city to prevent capture or kidnapping of URF officials.

<li>Faction related matters must go through the Major or highest ranking officer before approval.
</li>
</ol>
</li>
</ol>
<h5>The Police:</h5>


<ol>

<li>Arrest Batons may only be used if the person has surrendered, you witnessed the crime and the perpetrator refuses to comply, or if they are in active combat with the Police.

<li>Don't fire upon targets unless they are actively engaged in combat in the city and pose a direct threat to Civilians or Police.

<li>Travel in pairs whenever possible.
</li>
</ol>
<h3>PvP Rules:</h3>


<p>
PvP is a vital part of Iterum’s gameplay, offering players the chance to face off against each other in combat. Like the rest of the gamemode, some rules have been put in place to make sure everyone involved has a good time.
</p>
<ol>

<li>Fading Doors may NOT be used to trap players. (Falls under Prop Abuse)

<li>Using props within a base to prevent bullet penetration is allowed, and encouraged.

<li>Unequipping and reequipping your armor is NOT allowed, and is considered an exploit. (This rule will be removed once the bug is patched out.)

<li>Use of 3rd party software (aimbot, wallhacks, etc.) to gain an advantage on other players is forbidden.
</li>
</ol>
<h3>Raid Rules:</h3>


<p>
A Raid is any action undertaken by a faction in which one faction enters a hostile faction’s main base. There are 3 different forms of raids that may be conducted in Iterum:
</p>
<p>
Scouting
</p>
<p>
Infiltration
</p>
<p>
Raid
</p> 
<ul>
 
<li>Scouting:  
<ol>
  
<li>Scouting is the act of entering another faction’s base, and looking around covertly. You attempt to be as quiet as possible.
  
<li>This can be done with 1 or more members, and does not require staff oversight.
  
<li>You may NOT kill anyone while scouting unless you yourself are fired upon. If combat does initiate, you must attempt to flee.
  
<li>You may NOT look inside another faction’s ARC, Refineries, FARC or Faction Storage, nor steal anything from said entities.
</li>  
</ol>
 
<li>Infiltration:  
<ol>
  
<li>Infiltration is the act of entering another faction’s base, and attempting to steal valuable information / assets. You attempt to be as quiet as possible, however going loud is an option.
  
<li>This can be done with 3 or more members, and requires both a reason, and staff oversight.   
<ul>
   
<li>Example reasons are:    
<ol>
    
<li>Spying on Research Progress
    
<li>Research Task
    
<li>Counter Infiltration
    
<li>Any Staff Accepted Reason
</li>    
</ol>
</li>    
</ul>
  
<li>Infiltration missions must be announced once they begin in staff chat.
  
<li>There must be at least 3 members of a faction online to conduct an infiltration on them.
  
<li>You may engage hostile forces freely during an infiltration.
  
<li>You may look inside another faction’s ARC, Refineries, FARC, and Faction Storage, however you may NOT steal anything inside them.
</li>  
</ol>
 
<li>Raid:  
<ol>
  
<li>Raiding is the act of launching a full-force attack on another faction’s base, and attempting to steal valuable information/assets. Combat is initiated the moment you step on the opposing faction’s door.
  
<li>This requires both a valid reason, relative faction balance, and staff oversight.   
<ul>
   
<li>Example reasons are:    
<ol>
    
<li>Counter Raid
    
<li>Attempting to stunt research
    
<li>Research Task
    
<li>Act of War
    
<li>Attempting to Steal Research Material (I.E Event Rewards, etc.)
    
<li>Any Staff Accepted Reason
</li>    
</ol>
</li>    
</ul>
  
<li>When a raid is conducted, an Advert must be sent out indicating that the raid has begun, as well as sending a 3 minute warning in the staff chat.
  
<li>When a member of a side is killed, they cannot return to the fight. All spawns are blocked off by the staff team during a raid to prevent the defending side from returning.
  
<li>The raid ends when either side is wiped out, or the attacking faction flees. If the attackers win, they are allowed to take whatever they please from the Faction Storage and FARC.
  
<li>After 10 minutes, the raid will be automatically ended by the raid system.
</li>  
</ol>
</li>  
</ul>

<li>To perform any of these types of actions, a faction’s total members online must either be equal to one another, or within 2 of each other. If the members exceed this, members of the attacking faction must sit out. A faction may attempt to perform these actions if they have less members than the opposing faction. 
<ul>
 
<li>If the UNSC has 10 members online, but the Covenant only has 8, both sides may conduct a raid on one another.
 
<li>If the UNSC has 5 members online, but the Insurgents have 10, the Insurgents may raid the UNSC, however they must have 3 people sit out. The UNSC may raid as well, however no Insurgent members will be forced to sit out.
</li> 
</ul>
<h3>Perma Killing Rules (PKs):</h3>


<p>
Perma Killing is a feature within Iterum that allows players to punish those who are not the best of people through their character’s RP. This feature is broken down into two forms, Soft PKs, and Hard PKs, each having different effects and requirements to be performed. Both require staff oversight when taking place, as well as approval from either the staff team, or Management. More will be explained down below.
</p>
<ul>

<li>You cannot PK based on insults towards your character.

<li>You cannot PK based on some faction-related reasons. (Leader of a faction, member of an opposing faction, etc.)  
<ul>
 
<li>An exception to this is if a person has done clear, evident harm to the victim faction, such as sabotaging it, or running it into the ground.
</li> 
</ul>

<li>You cannot PK solely based on how you perceive someone. Just because you don’t like a person in RP, or OOCly, doesn’t mean you have the right to kill them.

<li>You cannot PK based on PvP situations. (Raids, being shot at, etc.)

<li>You cannot PK someone to cover your tracks.  
<ul>
 
<li>You can however, kill someone through PvP means to inflict NLR on them.
</li> 
</ul>

<li>PKs may only occur within faction-owned bases. Civilians may use general housing as a base.
</li>
</ul>
<h4>Soft PK:</h4>


<p>
Soft PKs are staff-approved Perma Kills with less negative consequences on the affected player than those of a Hard PK. These PKs end in a name change, loss of character’s history, as well as loss of the affected player’s items. The affected player keeps their faction rank, and will receive either starting money if they were a civilian, or the basic starting equipment of whichever faction they were a part of. These types of PKs can only happen if one or more PK reasons are met. The below will contain a list of example PK reasons, however if a reason can be justified, staff may approve it within reason. (Usually contacting Management for approval)
</p>
<p>
The following are examples of valid PK reasons, and must be brought into consideration before attempting to use a reason not listed below:
</p>
<ul>

<li>You can PK someone who is specifically hunting you. (Someone who is attempting to PK you)

<li>You can PK someone who has broken a contract with you.

<li>Killing a member of your own faction is considered a valid PK reason.

<li>Defecting from a faction is a valid PK reason.

<li>Being caught in the act of spying is a valid PK reason.

<li>Being outed for/caught kidnapping a highly ranked official of a faction (NCO+) is a valid PK reason.

<li>Being seen PKing another player by someone who has a personal relationship with the affected player is a valid PK reason. (This must have sufficient proof behind it to prevent rapid revenge killing.)
<p>

    Any non-listed reasons must receive approval from Management before being submitted to the staff team for approval.
</p>
</li>
</ul>
<h4>Hard PK:</h4>


<p>

    Hard PKs are Manager-approved Perma Kills that end in the affected player losing their entire character through an in-game deletion, with no chance at any loot that the affected player was holding. These types of PKs should rarely happen, having a list of requirements to be filled before said action can be taken. Hard PKs can change the tide of both a faction, and the server as a whole.
</p>
<p>

    	
</p>
<p>

    The following requirements must be met before attempting a Hard PK:
</p>
<ol>

<li>The player must have an unusually high amount of viable PK reasons on their character. (Upwards of 5 or more.)

<li>The player must be seen as an issue for either a faction itself, or the server as a whole. This can be something such as a faction leader who is pushing their faction much further ahead than the other two, becoming a warmonger in the process, or someone creating a new group that is causing mass chaos across the board. 

<li>A Manager must be presented with valid evidence of the above requirements, and must give approval for said action to take place. The staff team, as well as yourself, will be notified that the PK is approved.
</li>
</ol>
<p>

        Any other reasons are up to the Manager's discretion, such as an OOC reason with an in-game punishment, or special occurrences.
</p>
<h3>Basing/Prop Rules:</h3>


<p>
Iterum features the aspect of building bases similar to those seen in DarkRP servers. However, we’ve taken the time to place some rules around them to ensure things don’t get out of hand.
</p>
<ol>

<li>Bases must be reasonably enterable within a 10 second timeframe. 
<ul>
 
<li>Cannot have extensive crawl mazes, more than 2 fading doors per entrypoint, etc.
 
<li>Fading Doors must have keypads/buttons to enter and exit all doors to ensure no trapping occurs. This means that if you make 2 fading doors with a gap in the middle, there must be a keypad/button within said gap.
</li> 
</ul>

<li>AoS/KoS lines must be clearly visible to enact said action.

<li>The following are unreasonable prop useage: 
<ul>
 
<li>Bullet shields in combat
 
<li>Stairs to space / rooftops
 
<li>Creating excessively large structures
 
<li>Blocking spawns
 
<li>Prop Ships
 
<li>Dropping down cliffs / grav lift
 
<li>Prop Killing
 
<li>Prop Spamming
</li> 
</ul>

<li>Headglitching is not allowed. 
<ul>
 
<li>This includes instances where props are not being used. (Ex. Using a wall to headglitch.)
</li> 
</ul>

<li>Blocking off areas entirely is not allowed, and if you claim a territory (i.e. Forerunner cave) all natural entrances must be enterable.

<li>You are allowed to create prop space stations, but they require a public landing pad.

<li>Laggy structures will be deleted without warning.

<li>Prop blockades which restrict area of movement in a public space must be manned. (Ex. Creating a Toll)

<li>Lamps and Lights cannot be used to prevent vision of defensive emplacements or people.
</li>
</ol>
<h3>General Staff Rules:</h3>


<ol>

<li>Only use your Staff powers while on your admin character UNLESS you are preventing imminent rule breaking, time sensitive situations, or something inconsequential. (I.E Packing a vehicle quickly, or refunding someone’s refinery.)

<li>Don’t abuse. (A rule of thumb - if it's not needed, excessive, or looked down upon, don't do it)

<li>Listen to your superiors. They’re your superior for a reason.

<li>Enforce and follow ALL rules at ALL TIMES.

<li>Always act serious. Your reputation affects the server and team as a whole. Try to make everyone look as good as possible.

<li>Never participate in Passive-RP situations as your staff character UNLESS you are partaking in an event for a Gamemaster. 
<ul>
 
<li>Only do IC actions as your staff character when permitted (Events, Sims, training, etc.)
</li> 
</ul>

<li>Don’t do what you want during events. If a GM says to do something, do it. (Assuming it doesn't violate any of the aforementioned rules) The host of an event should be declared before it starts.

<li>Players are not entitled to a sit. If deemed necessary, the player may be kicked with a reason listed within.

<li>Keep sits to the admin rooms.
</li>
</ol>
<h4>Punishments:</h4>


<p>
For Punishments, use common sense. Someone exploiting a bug to have infinite health shouldn’t be a kick. A rule of thumb; If it’s something that’s severe, go high. If it’s small, go low.
</p>
<p>
Be sure to use these formats below to make everyone’s life easier:
</p>
<p>
<strong>When kicking someone</strong>: Reason for Kick | Staff Member’s Name | Appeal by messaging @Toast5373 on Discord
</p>
<p>
<strong>When banning someone</strong>: Reason for Ban | Ban Length | Staff Member’s Name | Appeal by messaging @Toast5373 on Discord
</p>
<p>
Warn / Kick - Minor Infraction
</p>
<p>
1-3 Day Ban - Intermediate Infraction
</p>
<p>
1 Week+ Ban - Major Infraction
</p>
<p>
Perm Ban - Seveve Infraction
</p>
<p>
(Cheating / Exploiting / Hacking / DDoSing, Mass RDM as a new player, Death Threats, etc are Severe Offenses)
</p>
		]])
		body = body
		
		return body
	end
	
	tabs["Server Information"] = function(node)
		local body = ""
		
		--<h1>
		--<h2>
		--<h3>
		--<h4>
		--<p>
		--<h5>
		--<br> - Break line
		--<b> - Bold text
		--<strong> - Important text
		--<i> - Italic text
		--<em> - Emphasized text
		--<mark> - Marked text
		--<small> - Small text
		--<del> - Deleted text
		--<ins> - Inserted text
		--<sub> - Subscript text
		--<sup> - Superscript text
		--style="text-align:center;"
		--<ul>
			--<li>
		--<ol>
		--<ol type="1">
		-- Below is a "Nested" List
		--[[
		<ul>
			<li>Coffee</li>
			<li>Tea
				<ul>
					<li>Black tea</li>
					<li>Green tea</li>
				</ul>
			</li>
			<li>Milk</li>
		</ul>
		--]]
		
		body = (body..[[
				<h1 style="text-align:center;">Information</h1>
				<h2>A quick Rundown of the Gamemode Creators</h2>
				<p>Iterum was primarily developed by Buttered Toast. I've spent around two to (around) three years pouring countless  hours into the map, materials, models, and code to give you a maximally refined, enjoyable, and enduring experience.</p>
				<br></br>
				<h2>Information Pertaining to the Gamemode itself</h2>
				<p>Iterum was born out of the understanding that most HaloRP servers are centered around staff entertaining the players. Be it through events, sims, patrols, and other, oft repetitive, tools. In light of this, I decided to make a gamemode centered around player and faction interaction. Iterum is entirely player driven, and players can spend hours without once requiring an admin.
				Iterum did not come from nothing. Rather, it rose from ash. Many past servers have popped up under various aliases. Tableflip Gamers, Wipeout Networks, and who knows how many in between. All these iterations were paced between 6 to 12 months of downtime. Each iteration brought new assets, ideas, and faces to the table. As such we have built up a vast and substanial quantity of custom and quality content not found anywhere else in Garry's Mod:</p>
				<br></br>
				<ul>
					<li>Custom Weapons
						<ul>
							<li>All weapons in Iterum have been particularly tuned and balanced to provide an enjoyable, realistic feel to them.</li>
							<li>Each weapon is unique, and the weapon's design allows players to creatively utilize them to their desires.</li>
						</ul>
					</li>
					
					<li>Countless Custom Plugins
						<ul>
							<li>Individual Cosmetics</li>
							<li>Crafting, Refining, Mining</li>
							<li>Farming</li>
							<li>Faction Research & Crafting</li>
							<li>Dialogue NPCs</li>
							<li>Automatic Faction NPCs</li>
							<li>Prison, Bank Robbing, and Detective System</li>
							<li>And much more to be discovered as you play</li>
						</ul>
					</li>
					<li>Custom Map
						<ul>
							<li>Iterum's map is entirely unique, there are none like it.</li>
								<ul>
									<li>Three primary 'layers': City, Badlands, Space</li>
									<li>The City layer boasts stunning heights and idyllic views of the tropical surroundings</li>
									<li>The Badlands layer boasts constant conflict; but with this risk comes much reward</li>
									<li>The Space layer offers unique resources and opportunities for, mostly, safe, serene bases</li>
								</ul>
						</ul>
					</li>
					<li>But most importantly, an unbreakable chain of shared memories
						<ul>
							<li>Any Veteran member can share countless past experiences they will always enjoy</li>
							<li>Stick around, and you'll develope a few of your own</li>
						</ul>
					</li>
				</ul>
				<br></br>
				<h2>Helpful Information</h2>
				<ul>
					<li>Using @ before a message in chat will send that message to any and all staff members on the server</li>
					<li>Hitting F1>Characters allows you to create a new character or load another one</li>
					<li>Store your money in the Bank, accessible by ATMs, as you lose a percent of your on-hand cash each time you die</li>
					<li>Factions have Asymmetric Strengths</li>
						<ul>
							<li>Police 		- Operate within the city limits, and enforce the mayor's laws</li>
							<li>Covenant 	- Powerful, and Driven. But equipment is expensive</li>
							<li>UNSC		- Dangerous and Well Established, but much to contend with</li>
							<li>Insurgent	- Fast and Covert, but direct conflict is not their strength</li>
							<li>Civilian	- Unorganized, Undisciplined, but you can be very, very rich if you play your cards right</li>
						</ul>
					<li>Vanguard Discord - "https://discord.gg/DVxSBUUMr3"</li>
					<li>Iterum Doc A - "https://docs.google.com/document/d/1pUELgbaCxefs78n7vnCkBxt89_CZjwNS7bIAsAgVcTE/edit?usp=sharing"</li>
					<li>Iterum Doc B - "https://docs.google.com/document/d/1qZl1xMJ2uPHRdGtVYRWlRv-9gDuck9RpdKCeFvnxrEE/edit?usp=sharing"</li>
					<li>Iterum Content - "https://steamcommunity.com/sharedfiles/filedetails/?id=1496635500"</li>
					<li>Dieing is usually bad for your health</li>
				</ul>
				<br></br>
				<h2>Staff Information</h2>
				<p>To become a Moderator, you must first meet the following requirements:</p>
				<ul>
					<li>15+ Hours of gameplay</li>
					<li>3 Reccomendations from other players, each must have 5+ hours of gameplay</li>
					<li>15+ Years of Age</li>
					<li>Mic</li>
					<li>Confidently Gurantee several hours of active gameplay a week</li>
					<li>Minimal Negative Administrative History</li>
					<li>Actively Participate in the VN Discord</li>
				</ul>
				<p>If these are met, you may complete the application in the discord.</p>
				<br></br>
				<p>To become a Game Master, you must first meet the following requirements:</p<
				<ul>
					<li>20+ Hours of gameplay</li>
					<li>16+ Years of Age</li>
					<li>Mic</li>
					<li>Confidently Gurantee several hours of active gameplay a week</li>
					<li>Excel at Creating Scenarios</li>
					<li>Actively Participate in the VN Discord</li>
				</ul>
				<p>Iterum has few game masters, and they are often hand picked by Upper Administration. These are just the basic requirements.</p>
		]])
		body = body
		
		return body
	end
	
	tabs["Introduction Videos"] = function(node)
		local body = ""
		
		--<h1>
		--<h2>
		--<h3>
		--<h4>
		--<p>
		--<h5>
		--<br> - Break line
		--<b> - Bold text
		--<strong> - Important text
		--<i> - Italic text
		--<em> - Emphasized text
		--<mark> - Marked text
		--<small> - Small text
		--<del> - Deleted text
		--<ins> - Inserted text
		--<sub> - Subscript text
		--<sup> - Superscript text
		--style="text-align:center;"
		--<ul>
			--<li>
		--<ol>
		--<ol type="1">
		-- Below is a "Nested" List
		--[[
		<ul>
			<li>Coffee</li>
			<li>Tea
				<ul>
					<li>Black tea</li>
					<li>Green tea</li>
				</ul>
			</li>
			<li>Milk</li>
		</ul>
		--]]
		
		gui.OpenURL("https://youtube.com/playlist?list=PLFbWvuU8gYCzIZ7xTiXrQUL9PZTCWFVkR")
		
		body = (body..[[
			<h1>Opened in Steam Overlay...</h1>
			<p>Overlay doesn't work? Here's the link: 'https://youtube.com/playlist?list=PLFbWvuU8gYCzIZ7xTiXrQUL9PZTCWFVkR'</p>
		]])
		body = body
		
		return body
	end
end)