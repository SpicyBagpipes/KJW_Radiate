/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_playerProcess

Description:
    Handles player effects of radiation. Called once every count.

Parameters:
    _radiationType - Type of radiation that ran script.

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */
params["_radiationType"];

//Variables
private _radiationProperties = [_radiationType] call KJW_Radiate_fnc_radiationProcess;
_radiationProperties params ["_penetratingPower", "_ionisingPower", "_range", "_breathable","_distHalvedThruAir"];
private _counts = ACE_Player getVariable ["KJW_Radiate_Counts",0];
private _playerDose = ACE_Player getVariable ["KJW_Radiate_Dose",0];
//End variables
//Begin code
private _dose = _ionisingPower;
ACE_Player setVariable ["KJW_Radiate_Dose",_playerDose+_dose];
private _playerDose = ACE_Player getVariable ["KJW_Radiate_Dose",0];