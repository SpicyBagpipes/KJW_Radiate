/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_addCBAKeybind

Description:
    Adds Geiger Counter CBA Keybind.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

#include "\a3\ui_f\hpp\definedikcodes.inc"

["KJW's Radiate", "KJW_Radiate_ToggleGeiger", ["Toggle Geiger Counter", ""], {
	if (KJW_Radiate_CounterActive) exitWith {
		call KJW_Radiate_fnc_hideGeigerCounter;
	};
	if !("KJW_Radiate_GeigerCounter" in assignedItems ACE_Player) exitWith {};
	call KJW_Radiate_fnc_showGeigerCounter;
}, {}, [DIK_O, [false, false, false]]] call CBA_fnc_addKeybind;