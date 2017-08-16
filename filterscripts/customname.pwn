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
new PlayerText3D:text;		
public OnFilterScriptInit()
{
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
	new pName[24],Float:pHealth,Float:pArmour, string[60];
	GetPlayerName(playerid, pName, 24);
	GetPlayerHealth(playerid, pHealth);
	GetPlayerArmour(playerid, pArmour);
	format(string, 60, "{00FF00}%s\n{0000FF}Health: %f\n{FF0000}Armour: %f\n{FF7F2A}Status: Active", pName, pHealth, pArmour);
	text = CreatePlayer3DTextLabel(playerid, string, -1, 0.0, 0.0, 0.0, 15, playerid);
	SetTimerEx("UpdateNameTag", 500, 1, "i", playerid);
	return 1;
}
forward UpdateNameTag(playerid);
public UpdateNameTag(playerid)
{
	new pName[24],Float:pHealth,Float:pArmour, string[60];
	GetPlayerName(playerid, pName, 24);
	GetPlayerHealth(playerid, pHealth);
	GetPlayerArmour(playerid, pArmour);
	if(IsPlayerPaused(playerid))
	{
		format(string, 60, "{00FF00}%s\n{0000FF}Health: %f\n{FF0000}Armour: %f\n{FF7F2A}Status: AFK", pName, pHealth, pArmour);
	}	
	else
	{
		format(string, 60, "{00FF00}%s\n{0000FF}Health: %f\n{FF0000}Armour: %f\n{FF7F2A}Status: Active", pName, pHealth, pArmour);
	}
	UpdatePlayer3DTextLabelText(playerid, text, -1, string);
	return 1;
}
