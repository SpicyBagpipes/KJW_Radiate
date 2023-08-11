/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_playerRespawnEH

Description:
    Resets all variables of player to 0 upon respawning.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

ACE_Player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	if (_unit != ACE_Player) exitWith {};
	[_unit] call KJW_Radiate_fnc_clearStats;
}];