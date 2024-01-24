#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles Geiger UI status
 * 
 *  Arguments:
 *  0: State <STRING>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  ["show"] call KJW_Radiate_Core_fnc_handleGeigerUI
 * 
 *  Public: No
 */

params ["_status"];

if (_status == "hide") exitWith {	
	// Hide
	"KJW_Radiate_CounterLayer" cutRsc ["Default", "PLAIN"];
	GVAR(counterActive) = false;
};

// Show

"KJW_Radiate_CounterLayer" cutRsc [QGVAR(counter), "PLAIN"];
private _display = uiNamespace getVariable "KJW_Radiate_Counter";
private _counts = _display displayCtrl 1244;

ACE_Player setVariable [QGVAR(totalCounts),0];
ACE_Player setVariable [QGVAR(oldCounts),0];

GVAR(counterActive) = true;

[
	{
		_this params ["_args", "_pfhID"];
		_args params ["_display", "_counts"];

		if !(GVAR(counterActive)) exitWith {
			["hide"] call FUNC(handleGeigerUI);
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
		
		private _oldCounts = ACE_Player getVariable [QGVAR(oldCounts),0];
		private _totalCounts = ACE_Player getVariable [QGVAR(totalCounts),0];
		ACE_Player setVariable [QGVAR(oldCounts),_totalCounts];

		private _displayCounts = abs (_totalCounts - _oldCounts);
		
		_counts ctrlSetText (format ["%1", _displayCounts]);
	},
	0.5,
	[
		_display,
		_counts
	]
] call CBA_fnc_addPerFrameHandler;