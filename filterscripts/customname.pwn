#include <a_samp>
#include <callbacks>

new Text3D:text[MAX_PLAYERS];
public OnFilterScriptInit()
{
    SetNameTagDrawDistance(0.0);
    ShowNameTags(0);
    print("H-Custom Nametags has been loaded successfully\n");
    return 1;
}
public OnPlayerDisconnect(playerid,reason)
{
    Delete3DTextLabel(text[playerid]);
    return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    Delete3DTextLabel(text[playerid]);
    return 1;
}
public OnPlayerSpawn(playerid)
{
    new Float:health, Float:armour, name[24], string[125];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
    format(string, sizeof(string), "{00FF00}%s\n{0000FF}Health: %0.2f\n{FF0000}Armour: %0.2f\n{FF7F2A}Status: Active", name, health, armour);
    text[playerid] = Create3DTextLabel(string, 0xFFFFFFFF, 0, 0, 0, 15, 0, 1);
    Attach3DTextLabelToPlayer(text[playerid], playerid, 0.0, 0.0, 0.2);
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    new Float:health, Float:armour, name[24], string[125];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
    format(string, sizeof(string), "{00FF00}%s\n{0000FF}Health: %0.2f\n{FF0000}Armour: %0.2f\n{FF7F2A}Status: Active", name, health, armour);
    Update3DTextLabelText(text[playerid], -1, string);
    return 1;
}
public OnPlayerPause(playerid)
{
    new Float:health, Float:armour, name[24], string[125];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
    format(string, sizeof(string), "{00FF00}%s\n{0000FF}Health: %0.2f\n{FF0000}Armour: %0.2f\n{FF7F2A}Status: AFK", name, health, armour);
    Update3DTextLabelText(text[playerid], -1, string);
    return 1;
}
public OnPlayerResume(playerid)
{
    new Float:health, Float:armour, name[24], string[125];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
    format(string, sizeof(string), "{00FF00}%s\n{0000FF}Health: %0.2f\n{FF0000}Armour: %0.2f\n{FF7F2A}Status: Active", name, health, armour);
    Update3DTextLabelText(text[playerid], -1, string);
    return 1;
}
