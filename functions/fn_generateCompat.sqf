/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_generateCompat

Description:
   Generates a compat entry for the specified piece of equipment with the specified protection value and dependency.

Parameters:
	_type - The type of equipment (Facewear, Uniform, Backpack, Helmet)
	_value - The protection value (0 up to 0.3)
	_dependency - The dependency value (0,1)

Returns:
	

Author:
	KJW
---------------------------------------------------------------------------- */

params["_type","_value","_dependency"];

//Variables
private _possible = ["Facewear","Uniform","Backpack","Helmet"];
private _result = nil;

switch (_type in _possible) do {
	case (_type == "Facewear") : {
		private _class = goggles ACE_Player;
		private _baseClass = ([configFile >> "CfgGlasses" >> _class, true] call BIS_fnc_returnParents)#1;
		_result = format ["MACRO_FACE_PROTECTION(%1,%2,%3,%4);",_class, _baseClass, _value, _dependency];
	};
	case (_type == "Uniform") : {
		private _class = uniform ACE_Player;
		private _baseClass = ([configFile >> "CfgWeapons" >> _class, true] call BIS_fnc_returnParents)#1;
		_result = format ["MACRO_SUIT_PROTECTION(%1,%2,%3);",_class, _baseClass, _value];
	};
	case (_type == "Backpack") : {
		private _class = backpack ACE_Player;
		private _baseClass = ([configFile >> "CfgVehicles" >> _class, true] call BIS_fnc_returnParents)#1;
		_result = format ["MACRO_BACKPACK_PROTECTION(%1,%2,%3,%4);",_class, _baseClass, _value, _dependency];
	};
	case (_type == "Helmet") : {
		private _class = headgear ACE_Player;
		private _baseClass = ([configFile >> "CfgWeapons" >> _class, true] call BIS_fnc_returnParents)#1;
		_result = format ["MACRO_HELMET_PROTECTION(%1,%2,%3);",_class, _baseClass, _value];
	};
};

_result