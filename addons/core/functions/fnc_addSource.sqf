#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Processes an object as being a radiation source
 * 
 *  Arguments:
 *  0: Object <OBJECT>
 *  1: Radiation Type <STRING>
 *  2: Count Rate <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, "alpha", 60] call KJW_Radiate_Core_fnc_addSource
 * 
 *  Public: Yes
 */

params ["_obj1", "_type", "_countRate"];

_obj1 setVariable [QGVAR(radiationType), _type, true];
_obj1 setVariable [QGVAR(countRate), _countRate, true];
GVAR(sources) pushBack _obj1;
publicVariable QGVAR(sources);