/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_showGeigerCounter

Description:
    Shows Geiger counter on screen.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

"KJW_Radiate_CounterLayer" cutRsc ["KJW_Radiate_Counter", "PLAIN"];
private _display = uiNamespace getVariable "KJW_Radiate_Counter";
private _counts = _display displayCtrl 1244;
KJW_Radiate_CounterActive = true;

ACE_Player setVariable ["KJW_Radiate_CounterCountsOld", ACE_Player getVariable ["KJW_Radiate_Counts",0]];

[{
	_this params ["_args", "_pfhID"];
	_args params ["_display", "_counts"];

	if !(KJW_Radiate_CounterActive) exitWith {
		call KJW_Radiate_fnc_hideGeigerCounter;
		[_pfhID] call CBA_fnc_removePerFrameHandler;
	};

	if !("KJW_Radiate_GeigerCounter" in assignedItems ACE_Player) exitWith {
        call KJW_Radiate_fnc_hideGeigerCounter;
		[_pfhID] call CBA_fnc_removePerFrameHandler;
    };

	_currentCounts = ACE_Player getVariable ["KJW_Radiate_Counts",0];
	_oldCounts = ACE_Player getVariable ["KJW_Radiate_CounterCountsOld",0];
	_counts ctrlSetText (format ["%1", (_currentCounts - _oldCounts)]);
	ACE_Player setVariable ["KJW_Radiate_CounterCountsOld", _currentCounts];

},1, [_display,_counts]] call CBA_fnc_addPerFrameHandler