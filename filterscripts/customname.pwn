/*
			-----------------------------------
			H-Custom NameTags With AFK Status
			-----------------------------------
			Author: HoussemGaming
			-----------------------------------
			Credits:
				- SA-MP - a_samp
				- Emmet_ - Callbacks include
				- HoussemGaming - IDK Why :D
			-----------------------------------
			You can edit it in any way
			-----------------------------------
*/		
//-------------------------------------------------		
#include <a_samp>
#include <callbacks>
//-------------------------------------------------	
new Text3D:text;		
public OnFilterScriptInit()
{
	SetNameTagDrawDistance(0.0);
	ShowNameTags(0);
	print("\nH-Custom Nametags has been loaded successfully\n");
	return 1;
}			
public OnFilterScriptExit()
{
	return 1;
}
public OnPlayerConnect(playerid)
{
	new pName[24],Float:pHealth,Float:pArmour, string[200];
	GetPlayerName(playerid, pName, 24);
	GetPlayerHealth(playerid, pHealth);
	GetPlayerArmour(playerid, pArmour);
	format(string, 200, "{00FF00}%s\n{0000FF}Health: %f\n{FF0000}Armour: %f\n{FF7F2A}Status: Active", pName, pHealth, pArmour);
	text = Create3DTextLabel(string, 0xFFFFFFFF, 0, 0, 0, 15, 0, 1);
	Attach3DTextLabelToPlayer(text, playerid, 0.0, 0.0, 0.2);
	SetTimerEx("UpdateNameTag", 500, 1, "i", playerid);
	return 1;
}
forward UpdateNameTag(playerid);
public UpdateNameTag(playerid)
{
	new pName[24],Float:pHealth,Float:pArmour, string[200];
	GetPlayerName(playerid, pName, 24);
	GetPlayerHealth(playerid, pHealth);
	GetPlayerArmour(playerid, pArmour);
	if(IsPlayerPaused(playerid))
	{
		format(string, 200, "{00FF00}%s\n{0000FF}Health: %f\n{FF0000}Armour: %f\n{FF7F2A}Status: AFK", pName, pHealth, pArmour);
	}	
	else
	{
		format(string, 200, "{00FF00}%s\n{0000FF}Health: %f\n{FF0000}Armour: %f\n{FF7F2A}Status: Active", pName, pHealth, pArmour);
	}
	Update3DTextLabelText(text, -1, string);
	return 1;
}
