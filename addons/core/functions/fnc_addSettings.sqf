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
	["KJW's Medical Expansion", "Radiate"],
	true, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(ppeThreshold),
	"SLIDER",
	["PPE Threshold", "Threshold for PPE blocking all damage"],
	["KJW's Medical Expansion", "Radiate"],
	[0, 15, 2.2, 1], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(EDTACoef),
	"SLIDER",
	["EDTA Coefficient", "Coefficient for how much EDTA should reduce ionisation"],
	["KJW's Medical Expansion", "Radiate"],
	[0, 5, 1, 0], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(EACACoef),
	"SLIDER",
	["EACA Coefficient", "Coefficient for how much EACA should reduce ionisation"],
	["KJW's Medical Expansion", "Radiate"],
	[0, 5, 1, 0], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;