#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Processes passed unit on handleVitals. Should only run locally.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Delta Time <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, 60] call KJW_Radiate_Core_fnc_unitProcess
 * 
 *  Public: No
 */

params ["_unit", "_deltaTime"];

// _deltaTime is usually approximately 1 for handlevitals. Count rate is counts per second.

_deltaTime = _deltaTime*accTime;
private _zones = GVAR(zones) select {systemChat str _x; _unit inArea _x};
private _deconZones = GVAR(deconZones) select {_unit inArea _x && _x getVariable QGVAR(turnedOn)};

private _fnc_objectRelevant = {
	params ["_unit", "_obj1"];

	private _type = _obj1 getVariable [QGVAR(radiationType), "alpha"];

	private _properties = GVAR(radiationProperties) get _type;
	_properties params ["_maxDistance", "_attenuation", "_ionisingPower"];

	if (_obj1 isKindOf "CAManBase") then {_attenuation = _attenuation - 1}; // Has to penetrate out of the unit.

	private _unitDist = _unit distance _obj1;
	if (_unitDist > _maxDistance) then {continueWith false};

	private _intersects = lineIntersectsSurfaces [eyePos _unit, getPosASL _obj1, _unit, _obj1, true, _attenuation];
	private _nIntersects = count _intersects;
	if (_nIntersects == _attenuation) then {continueWith false};

	private _strengthCoef = 1 - _nIntersects/_attenuation; // 2/4 = half power if maximum of 4 intersections.
	private _countRate = _obj1 getVariable [QGVAR(countRate), 1];

	[_obj1, _strengthCoef, _ionisingPower, _countRate, _unitDist]
};

private _relevantSources = GVAR(sources) apply {[_unit, _x] call _fnc_objectRelevant};
_relevantSources = _relevantSources select {_x isNotEqualTo false};

private _currentCounts = 0;
private _currentIonisation = 0;

private _totalIonisation = _unit getVariable [QGVAR(totalIonisation), 0];

{
	_x params ["_obj1", "_strengthCoef", "_ionisingPower", "_countRate", "_unitDist"];
	_countRate = (_countRate*(1/(_unitDist max 1)^2))*_deltaTime; // Will increase exponentially as tends towards 0. Need to handle that.
	_currentCounts = _currentCounts + _countRate;
	_currentIonisation = _currentIonisation + (_ionisingPower*_strengthCoef*_countRate); // deltaT already handled in countRate, no need to repeat it.
} forEach _relevantSources;

private _protection = _unit getVariable ["KJW_MedicalExpansion_PPE_ppe", []];
_protection params ["_headgearProtection", "_facewearProtection", "_backpackProtection", "_uniformProtection"];
_facewearProtection = _facewearProtection + _headgearProtection;

{
	private _countRate = _x getVariable [QGVAR(countRate), 10];
	private _type = _x getVariable [QGVAR(radiationType), 10];
	private _properties = GVAR(radiationProperties) get _type;
	_properties params ["_maxDistance", "_attenuation", "_ionisingPower"];

	_countRate = _countRate*_deltaTime;

	_currentCounts = _currentCounts + _countRate;
	_currentIonisation = _currentIonisation + _ionisingPower*_countRate;

	// Irradiation ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Don't just make the unit a source, check countRate and so on. Unit can only be one radiation type, perhaps have an irradiated type instead?
	private _roll = random 1;

	private _facewearMultiplier = _roll - _facewearProtection;
	private _uniformMultiplier = _roll - _uniformProtection;
	private _facewearBlocked = _facewearMultiplier <= 0;
	private _uniformBlocked = _uniformMultiplier <= 0;

	if (_facewearBlocked && _uniformBlocked) then {
		continue // Early exit of the loop as if uniform and facewear block then nothing happens irradiation wise.
	};
	if (!_uniformBlocked) then {
		// Irradiate -- skin. _uniformMultiplier == how much of the count should be taken.
		private _touchedCounts = _countRate*_uniformMultiplier;
		private _unitIsSource = _unit in GVAR(sources);

		if (!_unitIsSource) then {
			[_unit, "irradiated", _touchedCounts] call KJW_Radiate_Core_fnc_addSource;
			_unit setVariable [QGVAR(irradiationSkin), _touchedCounts];
		} else {
			private _irradiationSkin = _unit getVariable [QGVAR(irradiationSkin), 0];
			private _unitCountRate = _unit getVariable [QGVAR(countRate), 0];

			_unit setVariable [QGVAR(irradiationSkin),_irradiationSkin+_touchedCounts];
			_unit setVariable [QGVAR(countRate),_unitCountRate+_touchedCounts];
		};
	};
	if (!_facewearBlocked) then {
		// Irradiate -- inhaled. _facewearMultiplier == how much of the count should be taken.
		private _inhaledCounts = _countRate*_facewearMultiplier;
		private _unitIsSource = _unit in GVAR(sources);

		if (!_unitIsSource) then {
			[_unit, "irradiated", _inhaledCounts] call KJW_Radiate_Core_fnc_addSource;
		} else {
			private _unitCountRate = _unit getVariable [QGVAR(countRate), 0];

			_unit setVariable [QGVAR(countRate),_unitCountRate+_inhaledCounts];
		};
	};
} forEach _zones;

// Decontamination

{
	private _unitCountRate = _unit getVariable [QGVAR(countRate), 0];
	private _irradiationSkin = _unit getVariable [QGVAR(irradiationSkin), 0];

	if (_irradiationSkin > 0) then {
		_irradiationSkin = (_irradiationSkin-_deltaTime*10) max 0;
		_unitCountRate = (_unitCountRate-_deltaTime*10) max 0;
		_unit setVariable [QGVAR(countRate),_unitCountRate];
		_unit setVariable [QGVAR(irradiationSkin), _irradiationSkin];
		if (_unitCountRate <= 0) then {
			[_unit] call FUNC(deleteSource);
		};
	};
} forEach _deconZones;

// Background radiation
_currentCounts = _currentCounts + CMBRCOUNT*_deltaTime;

// Update unit variables
_unit setVariable [QGVAR(currentCounts), _currentCounts];
if (_uniformProtection + _facewearProtection < GVAR(ppeThreshold)) then {
	_unit setVariable [QGVAR(currentIonisation), _currentIonisation];
	_unit setVariable [QGVAR(totalIonisation), _totalIonisation + _currentIonisation];
};

// Modify blood values accordingly
private _fluidData = _unit getVariable ["KJW_MedicalExpansion_Core_bloodInfo", []];

if (_fluidData isNotEqualTo [] && _uniformProtection + _facewearProtection < GVAR(ppeThreshold)) then {
	private _rbc = _fluidData get "RBC";
	private _wbc = _fluidData get "WBC";
	private _platelet = _fluidData get "Platelet";

	_fluidData set ["RBC", (_rbc-(_currentIonisation*_deltaTime))/1000];
	_fluidData set ["WBC", (_wbc-(_currentIonisation*_deltaTime))/1000];
	_fluidData set ["Platelet", (_platelet-(_currentIonisation*_deltaTime))/1000];
};

// Add radiation poisoning medication
if (_currentIonisation > 10*_deltaTime) then {
	private _roll = random 60000*_deltaTime;
	if (_roll < _currentIonisation*_deltaTime) then {
		[_unit, _deltaTime*2] call ace_medical_fnc_adjustPainLevel;
		["ace_medical_treatment_medicationLocal", [_unit, "Chest", "KJW_RadiationPoisoning"], _patient] call CBA_fnc_localEvent;
	};
};

if (_totalIonisation > 50*_deltaTime) then {
	private _roll = random 600000*_deltaTime;
	if (_roll < _totalIonisation*_deltaTime) then {
		[_unit, _deltaTime*2] call ace_medical_fnc_adjustPainLevel;
		["ace_medical_treatment_medicationLocal", [_unit, "Chest", "KJW_RadiationPoisoning"], _patient] call CBA_fnc_localEvent;
	};
};

private _EDTACount = [_unit, "KJW_Radiate_EDTA"] call ace_medical_status_fnc_getMedicationCount;
if (_EDTACount > 0) then {
	private _unitCounts = _unit getVariable [QGVAR(countRate),0];
	private _newAmount = (_unitCounts-(_EDTACount*GVAR(EDTACoef))*_deltaTime);
	if (_newAmount <= 0) then {
		[_unit] call FUNC(deleteSource);
	};
	_unit setVariable [QGVAR(countRate), _newAmount max 0];
};

private _EACACount = ([_unit, "KJW_Radiate_EACA"] call ace_medical_status_fnc_getMedicationCount) + ([_unit, "EACA"] call ace_medical_status_fnc_getMedicationCount); // KAT compat
if (_EACACount > 0) then {
	private _newAmount = ((_totalIonisation + _currentIonisation)-(_EACACount*GVAR(EACACoef))*_deltaTime);
	_unit setVariable [QGVAR(totalIonisation), _newAmount max 0];
};