#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds settings required for the mod to function
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_fnc_addSettings
 * 
 *  Public: No
 */

 [
	QGVAR(focusCheck),
	"CHECKBOX",
	["Geiger Counter Focus Check", "Check for window focus if Geiger Counter in inventory"],
	["KJW's Medical Expansion - Radiate", "Miscellaneous"],
	true, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;