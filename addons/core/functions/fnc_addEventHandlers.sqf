#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds event handlers required for the mod to function
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_fnc_addEventHandlers
 * 
 *  Public: No
 */

[
	"ace_medical_handleUnitVitals",
	{
		params ["_unit", "_deltaT"];
		if (_unit != ACE_Player) then {[_unit, _deltaT] call FUNC(unitProcess)};

		private _totalIonisation = _unit getVariable [QGVAR(totalIonisation),0];
		private _countRate = _unit getVariable [QGVAR(countRate),0];
		_unit setVariable [QGVAR(countRate),_countRate,true];
		_unit setVariable [QGVAR(totalIonisation),_totalIonisation,true];
	}
] call CBA_fnc_addEventHandler;

[
	"CAManBase",
	"respawn",
	FUNC(resetVariables),
	true,
	[],
	true
] call CBA_fnc_addClassEventHandler;

[
	{
		[ACE_Player, diag_deltaTime] call FUNC(unitProcess);
		
		if ("KJW_Radiate_GeigerCounter" in assignedItems ACE_Player) then {
			private _currentCounts = ACE_Player getVariable [QGVAR(currentCounts),0];
			
			private _decimal = abs (round _currentCounts - _currentCounts);
			private _roll = random 1;
			if (_roll < _decimal) then {
				_currentCounts = _currentCounts + 1;
			};
			private _displayCounts = round _currentCounts;
			if ((_displayCounts > 0) && (GVAR(focusCheck) && isGameFocused) && !isGamePaused) then {
				playSound "KJW_Geiger_Click";
				private _totalCounts = ACE_Player getVariable [QGVAR(totalCounts),0];
				ACE_Player setVariable [QGVAR(totalCounts), _totalCounts+_displayCounts];
			};
		} else {
			GVAR(counterActive) = false;
		};
	},
	0,
	[]
] call CBA_fnc_addPerFrameHandler;

[
	{
		[
			"DecontaminationSimulated_base_F",
			"init",
			FUNC(initDeconShower),
			true,
			[],
			true
		] call CBA_fnc_addClassEventHandler;
	},
	[],
	1
] call CBA_fnc_waitAndExecute;

[
	"ace_medical_treatment_fullHealLocal",
	FUNC(resetVariables)
] call CBA_fnc_addEventHandler;