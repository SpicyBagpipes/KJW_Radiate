/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_protectionProcess

Description:
    Processes the protection capabilities of passed object.

Parameters:
    _obj1 - The object to be processed.

Returns:
    _protectionStrength - The strength of the protection against CBRN threats. 0-1 value for vehicles, array of 0-1 values for units.

Author:
    KJW
---------------------------------------------------------------------------- */
params["_obj1"];

_protectionStrength = 0;

if (_obj1 isKindOf "CAManBase") then {
	private _uniform = uniform _obj1;
	private _backpack = backpack _obj1;
	private _mask = goggles _obj1;
	private _helmet = headgear _obj1;
	private _uniformProtection =
	switch (true) do {
		case (isNumber(configFile >> "CfgWeapons" >> _uniform >> "KJW_Radiate_ProtectionValue")) : {getNumber(configFile >> "CfgWeapons" >> _uniform >> "KJW_Radiate_ProtectionValue")};
		case ({(_uniform in _x)} forEach parseSimpleArray KJW_Radiate_Setting_UniformProtection) : {{if (_uniform in _x) then {(parseSimpleArray KJW_Radiate_Setting_UniformProtection#_forEachIndex)#1}} forEach parseSimpleArray KJW_Radiate_Setting_UniformProtection};
		default {0};
	};
	private _backpackProtection = 
	switch (true) do {
		case (isNumber(configFile >> "CfgVehicles" >> _backpack >> "KJW_Radiate_ProtectionValue")) : {getNumber(configFile >> "CfgVehicles" >> _backpack >> "KJW_Radiate_ProtectionValue")};
		case ({(_backpack in _x)} forEach parseSimpleArray KJW_Radiate_Setting_BackpackProtection) : {{if (_backpack in _x) then {(parseSimpleArray KJW_Radiate_Setting_BackpackProtection#_forEachIndex)#1}} forEach parseSimpleArray KJW_Radiate_Setting_BackpackProtection};
		default {0};
	};
	private _backpackDependent =
	switch (true) do {
		case (isNumber(configFile >> "CfgVehicles" >> _backpack >> "KJW_Radiate_MaskDependent")) : {getNumber(configFile >> "CfgVehicles" >> _backpack >> "KJW_Radiate_MaskDependent")};
		case ({(_backpack in _x)} forEach parseSimpleArray KJW_Radiate_Setting_BackpackProtection) : {{if (_backpack in _x) then {(parseSimpleArray KJW_Radiate_Setting_BackpackProtection#_forEachIndex)#2}} forEach parseSimpleArray KJW_Radiate_Setting_BackpackProtection};
		default {0};
	};
	private _maskProtection =
	switch (true) do {
		case (isNumber(configFile >> "CfgGlasses" >> _mask >> "KJW_Radiate_ProtectionValue")) : {getNumber(configFile >> "CfgGlasses" >> _mask >> "KJW_Radiate_ProtectionValue")};
		case ({(_mask in _x)} forEach parseSimpleArray KJW_Radiate_Setting_MaskProtection) : {{if (_mask in _x) then {(parseSimpleArray KJW_Radiate_Setting_MaskProtection#_forEachIndex)#1}} forEach parseSimpleArray KJW_Radiate_Setting_MaskProtection};
		default {0};
	};
	private _maskDependent =
	switch (true) do {
		case (isNumber(configFile >> "CfgGlasses" >> _mask >> "KJW_Radiate_BackpackDependent")) : {getNumber(configFile >> "CfgGlasses" >> _mask >> "KJW_Radiate_BackpackDependent")};
		case ({(_mask in _x)} forEach parseSimpleArray KJW_Radiate_Setting_MaskProtection) : {{if (_mask in _x) then {(parseSimpleArray KJW_Radiate_Setting_MaskProtection#_forEachIndex)#2}} forEach parseSimpleArray KJW_Radiate_Setting_MaskProtection};
		default {0};
	};
	private _helmetProtection =
	switch (true) do {
		case (isNumber(configFile >> "CfgWeapons" >> _helmet >> "KJW_Radiate_ProtectionValue")) : {getNumber(configFile >> "CfgWeapons" >> _helmet >> "KJW_Radiate_ProtectionValue")};
		case ({(_helmet in _x)} forEach parseSimpleArray KJW_Radiate_Setting_HelmetProtection) : {{if (_helmet in _x) then {(parseSimpleArray KJW_Radiate_Setting_HelmetProtection#_forEachIndex)#1}} forEach parseSimpleArray KJW_Radiate_Setting_HelmetProtection};
		default {0};
	};

	_protectionStrength = switch (true) do {
		case (_maskDependent == _backpackDependent) : {[_uniformProtection, _maskProtection, _backpackProtection];};
		//If maskDependent == backpackDependent (1 == 1 or 0 == 0) then don't need to touch values. AA & aa.
		case ((_backpackProtection > 0) && (_maskDependent == 1) && (_maskProtection > 0)) : {[_uniformProtection, _maskProtection, _backpackProtection];};
		//If backpack has protection and is dependent on mask, doesn't touch values if mask has protection. Aa.
		case ((_maskProtection > 0) && (_backpackDependent == 1) && (_backpackProtection > 0)) : {[_uniformProtection, _maskProtection, _backpackProtection];};
		//If mask has protection and is dependent on backpack, doesn't touch values if backpack has protection. aA.
		default {[_uniformProtection, 0, 0]};
		//Not AA, aa, Aa or aA. Should never happen.
	};
	_protectionStrength = [_protectionStrength#0, _protectionStrength#1 + (_helmetProtection), _protectionStrength#2];
};

if (_obj1 isKindOf "LandVehicle") then {
	_protectionStrength = getNumber(configFile >> "CfgVehicles" >> typeOf _obj1 >> "KJW_Radiate_ProtectionValue");
};

_protectionStrength