#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles postinit for the addon
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_XEH_PostInit
 * 
 *  Public: No
 */

call FUNC(addSettings);
call FUNC(addEventHandlers);

[
	2,
	{
		params ["_unit"];
		private _ionisation = _unit getVariable [QGVAR(totalIonisation), 0];
		_ionisation/5
	}
] call ace_field_rations_fnc_addStatusModifier;

if !(isServer) exitWith {};

private _radiationProperties = [ //["_maxDistance", "_attenuation", "_ionisingPower"]
	[
		"alpha",
		[1, 1, 10]
	],
	[
		"beta",
		[5, 2, 1]
	],
	[
		"gamma",
		[10000, 1000, 0.001]
	],
	[
		"cmbr",
		[-1, -1, 0]
	],
	[
		"irradiated",
		[1000, 1000, 0.01]
	]
];

GVAR(radiationProperties) = createHashmapFromArray _radiationProperties;
GVAR(sources) = allMissionObjects "" select {_x getVariable QGVAR(radiationSource)};
GVAR(zones) = [];
GVAR(deconZones) = [];

publicVariable QGVAR(radiationProperties);
publicVariable QGVAR(sources);
publicVariable QGVAR(zones);
publicVariable QGVAR(deconZones);