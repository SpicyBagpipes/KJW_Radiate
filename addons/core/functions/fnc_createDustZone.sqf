#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Function description
 * 
 *  Arguments:
 *  0: Position ASL <ARRAY>
 *  1: Radiation Type <STRING>
 *  2: Count Rate <NUMBER>
 *  3: Radius <NUMBER>
 *  4: Height <NUMBER>
 * 
 *  Return Value:
 *  0: Area <OBJECT>
 * 
 *  Example:
 *  [[530,300,50], "alpha", 60, 50] call KJW_Radiate_Core_fnc_createDustZone
 * 
 *  Public: Yes
 */

params ["_pos", "_type", "_countRate", "_radius", "_height"];

private _obj1 = createTrigger ["EmptyDetector", _pos, true];
_obj1 setTriggerArea [_radius, _radius, 0, false, _height];
_obj1 setVariable [QGVAR(radiationType), _type, true];
_obj1 setVariable [QGVAR(countRate), _countRate, true];
GVAR(zones) pushBack _obj1;
publicVariable QGVAR(zones);
_obj1