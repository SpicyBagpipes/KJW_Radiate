/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_irradiateProcess

Description:
    Processes making object passed irradiated or increasing irradiation variables.

Parameters:
    _obj1 - The object to be processed.
	_radiationType - The type of radiation to irradiate with.

Returns:


Author:
    KJW
---------------------------------------------------------------------------- */
params["_obj1","_radiationType"];

//Variables
_radiationType = switch true do {
	case (_radiationType == "AlphaArea"): {"Alpha"};
	case (_radiationType == "BetaArea"): {"Beta"};
	case (_radiationType == "GammaArea"): {"Gamma"};
	default {_radiationType};
};
_radiationTypeInfo = [_radiationType] call KJW_Radiate_fnc_radiationProcess;
_objProtection = if (_obj1 isKindOf "CAManBase") then {
	[_obj1] call KJW_Radiate_fnc_protectionProcess;
}
else {
	[0,0,0];
};
_uniformProtection = _objProtection#0;
_maskProtection = _objProtection#1;
_backpackProtection = _objProtection#2;
_source = _obj1 getVariable ["KJW_Radiate_RadiationSource", false];
_activity = _obj1 getVariable ["KJW_Radiate_Activity", 1];
_irradiation = _obj1 getVariable ["KJW_Radiate_Irradiated", 1];
_randomUniform = random 0.3;
_randomMask = random 0.4;
//End variables
//Begin code

if (_randomMask > (_maskProtection + _backpackProtection)) then {
	//This segment of code only runs if mask + backpack fails to block inhaled irradiated particles.
	if (!(_radiationTypeInfo#3)) exitWith {};//Radiation type isn't able to breathed in.
	if (_obj1 in KJW_Radiate_SourceObjects) exitWith {
		_obj1 setVariable ["KJW_Radiate_Activity", _activity+1, true];
	};
[_obj1,_radiationType,1] call KJW_Radiate_fnc_makeSource;
};

_activity = _obj1 getVariable ["KJW_Radiate_Activity", 1];
_irradiation = _obj1 getVariable ["KJW_Radiate_Irradiated", 1];

if (_randomUniform < _uniformProtection) exitWith {/*Uniform has blocked incoming irradiated particles from being touched.*/};
if (_obj1 in KJW_Radiate_SourceObjects) exitWith {
	_obj1 setVariable ["KJW_Radiate_Activity", _activity+1, true];
	_obj1 setVariable ["KJW_Radiate_Irradiated", _irradiation+1, true];
};
[_obj1,_radiationType,1] call KJW_Radiate_fnc_makeSource;