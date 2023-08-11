/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_playerHandler

Description:
    Handles all player script stuff.

Parameters:
    

Returns:


Author:
    KJW
---------------------------------------------------------------------------- */
if (!hasInterface) exitWith{};
[{
	params ["_args", "_pfID"];
	_args params ["_time"];
	private _deltaT = CBA_missionTime - _time;
	_args set[0, CBA_missionTime];
	//Above handles fps scaling calculations.
	private _arr = [];
	{if (ACE_Player distance _x < 5000) then {_arr pushBack _x}} forEach KJW_Radiate_SourceObjects;
	{[_x, _deltaT] call KJW_Radiate_fnc_objectProcess} forEach _arr;
	//Above handles running objectProcess on every object.
	_randomThingy = 3 * _deltaT;
	_probThingy = 10;
	_random = random _probThingy;
	if (_random < _randomThingy) exitWith {call KJW_Radiate_fnc_backgroundHandler};
}, 0.01, [CBA_missionTime]] call CBA_fnc_addPerFrameHandler;