/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_createDustArea

Description:
    Used for creating the dust area of triggers synced to a module.

Parameters:
    _radiationType - The type of radiation to be processed.
    _obj1 - The object that has decayed. Used in calculating irradiation chance.

Returns:


Author:
    KJW
---------------------------------------------------------------------------- */
_logic = param [0,objNull,[objNull]];
[
    { (!(isNil "BIS_fnc_init") && { BIS_fnc_init }) },
    {_this params["_logic"];
    _radiationType = _logic getVariable ["KJW_Radiate_Module_AreaRadiationType", "GammaArea"];
    _countRate = _logic getVariable ["KJW_Radiate_Module_CountRate", 1];
    _fadeInDist = _logic getVariable ["KJW_Radiate_Module_FadeInDist", 1];
    {
    [_x, _radiationType, _countRate] call KJW_Radiate_fnc_makeSource;
    _x setVariable ["KJW_Radiate_FadeInDistancePercentage",_fadeInDist, true];
    } forEach synchronizedObjects _logic;
    },
    [_logic]
] call CBA_fnc_waitUntilAndExecute;