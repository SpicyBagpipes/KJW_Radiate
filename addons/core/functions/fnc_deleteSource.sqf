#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Stops an object being a radioactive source or dust zone
 * 
 *  Arguments:
 *  0: Source <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_Radiate_Core_fnc_deleteSource
 * 
 *  Public: No
 */

params ["_obj1"];

_obj1 setVariable [QGVAR(radiationType), nil, true];
_obj1 setVariable [QGVAR(countRate), nil, true];
GVAR(sources) deleteAt (GVAR(sources) find _obj1);
publicVariable QGVAR(sources);