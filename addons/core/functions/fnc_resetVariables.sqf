#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Resets all mod variables the unit uses.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_Radiate_Core_fnc_resetVariables
 * 
 *  Public: No
 */

params ["_unit"];

if (!local _unit) exitWith {};
_unit setVariable [QGVAR(currentCounts), 0];
_unit setVariable [QGVAR(currentIonisation), 0];
_unit setVariable [QGVAR(totalIonisation), 0, true];
_unit setVariable [QGVAR(totalCounts), 0];
[_unit] call FUNC(deleteSource);