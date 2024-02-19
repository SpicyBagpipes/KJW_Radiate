#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds keybinds required for the mod to function
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_fnc_addKeybinds
 * 
 *  Public: No
 */

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[
	QUOTE(COMPONENT_BEAUTIFIED),
	QGVAR(toggleGeiger),
	[
		"Toggle Geiger Counter",
		"Toggles Geiger Counter displaying or not."
	],
	{
		if (GVAR(counterActive)) exitWith {
			["hide"] call FUNC(handleGeigerUI);
		};
		if !("KJW_Radiate_GeigerCounter" in assignedItems ACE_Player) exitWith {};
		["show"] call FUNC(handleGeigerUI);
	},
	{
    	//Keyup
	},
	[
		DIK_O,
		[
			false,
			false,
			false
		]
	]
] call CBA_fnc_addKeybind;