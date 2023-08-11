/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_handleThirst

Description:
    Handles adding segment to check dose for hunger and thirst modifier. Also adds duty factors.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

_code = {
	(_this getVariable ["KJW_Radiate_Dose",0])/50;
};

[2, _code] call ace_field_rations_fnc_addStatusModifier;

["KJW_Radiate_StaminaID", {((_this getVariable ["KJW_Radiate_Dose",0])/250) max 1}] call ace_advanced_fatigue_fnc_addDutyFactor;