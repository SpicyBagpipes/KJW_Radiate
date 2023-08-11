/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_serverHandler

Description:
   Script for server handling radiation on AI units.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

if !(isServer) exitWith{};
[{
	if (!KJW_Radiate_AIEnabled) then {
		[_this#1] call CBA_fnc_removePerFrameHandler;
	};
	{
		if (isPlayer _x) then {continue};
		_arr = [];
		_iteratedUnit = _x;
		{
			if (_iteratedUnit distance _x < 80) then {_arr pushBack _x};
			[_iteratedUnit, _x] call KJW_Radiate_fnc_AIObjectHandler;
		} forEach KJW_Radiate_SourceObjects;
	} forEach allUnits;
}, 1, []] call CBA_fnc_addPerFrameHandler;