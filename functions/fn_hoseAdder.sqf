/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_hoseAdder

Description:
    Handles adding hoses to backpack/respirator combos.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

_id = ["loadout", {if (!isNull (findDisplay 1127001))exitWith{}; ACE_Player call KJW_Radiate_fnc_CBRNHoseInit}] call CBA_fnc_addPlayerEventHandler;

_id2 = ["ace_arsenal_displayClosed", {ACE_Player call KJW_Radiate_fnc_CBRNHoseInit}] call CBA_fnc_addEventHandler;