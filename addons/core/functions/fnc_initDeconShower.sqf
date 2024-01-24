#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Initiates a decontamination shower's zone(s)
 * 
 *  Arguments:
 *  0: Shower <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [_obj1] call KJW_Radiate_Core_fnc_initDeconShower
 * 
 *  Public: No
 */

params ["_obj1"];

private _zone = _obj1 getVariable [QGVAR(deconZone), objNull];

if (!local _obj1 || !isNull _zone) exitWith {};
private _type = typeOf _obj1;
private _zoneParams = switch (_type) do {
	case "DeconShower_02_F": {[2,5, 0.5, 0, true, 2.5]};
	case "DeconShower_01_F": {[0.71, 0.71, 0, true, 1.2]};
	default {[]};
};

if (_zoneParams isEqualTo []) exitWith {};

if (isNull _zone) then {
	_zone = createTrigger ["EmptyDetector", [0,0,0], true];
};
_zone setTriggerArea _zoneParams;
_zone setPosASL (getPosASL _obj1 vectorAdd [0, 0, _zoneParams#-1]);
_zone attachTo [_obj1];

_obj1 setVariable [QGVAR(deconZone), _zone, true];

_obj1 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _zone = _unit getVariable [QGVAR(deconZone), objNull];
	deleteVehicle _zone;
}];

_obj1 addEventHandler ["Deleted", {
	params ["_unit"];
	private _zone = _unit getVariable [QGVAR(deconZone), objNull];
	deleteVehicle _zone;
}];

GVAR(deconZones) pushBack _zone;
publicVariable QGVAR(deconZones);