/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_clearStats

Description:
    Resets all variables of unit to 0.

Parameters:
    _unit - The unit to reset all variables of

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

params["_unit"];

[_unit] call KJW_Radiate_fnc_deleteSource;
_unit setVariable ["KJW_Radiate_Counts", 0];
_unit setVariable ["KJW_Radiate_Irradiated", 0];
_unit setVariable ["KJW_Radiate_Dose", 0];