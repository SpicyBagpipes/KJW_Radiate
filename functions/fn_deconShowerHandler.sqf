/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_deconShowerHandler

Description:
    Handles reduction of object's irradiation by a set amount every tick whilst in a decon shower.

Parameters:
    _obj1 - The decon shower.

Returns:


Author:
    KJW
---------------------------------------------------------------------------- */
params["_obj1"];

//Variables
_objPos = getPosASL _obj1;
_dimensions = switch (true) do {
	case (typeOf _obj1 == "DeconShower_01_F") : {[1,1,2]};
	case (typeOf _obj1 == "DeconShower_02_F") : {[2,2,4]};
};
_dimensions params ["_posX", "_posY", "_posZ"];
//End variables
//Begin code

_obj1 setVariable ["KJW_Radiate_DeconShower_Status", true, true];
[{
	params["_args","_pfhId"];
	_args params ["_objPos", "_posX", "_posY","_posZ", "_obj1"];
	if !(_obj1 getVariable ["KJW_Radiate_DeconShower_Status", false]) then {[_pfhID] call CBA_fnc_removePerFrameHandler};
	_objPos = ASLToAGL _objPos;
	_arr = KJW_Radiate_SourceObjects inAreaArray [_objPos, _posX, _posY, (getDir _obj1), true, _posZ];
	{
		_irradiation = _x getVariable ["KJW_Radiate_Irradiated",0];
		_activity = _x getVariable ["KJW_Radiate_Activity",0];
		if (_irradiation > 1) then {
			if (_activity > 1) then {
				_x setVariable ["KJW_Radiate_Activity", _activity-1];
			};
			_x setVariable ["KJW_Radiate_Irradiated", _irradiation-1];
		}
		else {
			_x setVariable ["KJW_Radiate_Irradiated", 0];
			if (_x getVariable ["KJW_Radiate_Activity", 0] <= 1) then {
				[_x] call KJW_Radiate_fnc_deleteSource;
			}};
	} forEach _arr;
}, 0.25, [_objPos, _posX, _posY, _posZ, _obj1]] call CBA_fnc_addPerFrameHandler;