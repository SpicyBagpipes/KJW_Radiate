/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_objectProcess

Description:
	Processes radioactive properties of object.

Parameters:
	_obj1 - The object to be processed.
	_deltaT - The time since last execution of the script. Used for scaling.

Returns:


Author:
	KJW
---------------------------------------------------------------------------- */
params["_obj1", "_deltaT"];

//Variables
private _radiationType = _obj1 getVariable "KJW_Radiate_RadiationType";
private _sourceActivity = _obj1 getVariable "KJW_Radiate_Activity";
_sourceActivity = _sourceActivity * (_deltaT*100);
private _radiationProperties = [_radiationType] call KJW_Radiate_fnc_radiationProcess;
_radiationProperties params ["_penetratingPower", "_ionisingPower", "_range", "_breathable","_distHalvedThruAir"];
private _random = random 6000;
private _playerPosASL = getPosASL ACE_Player;
private _objPosASL = getPosASL _obj1;
private _objUpPosASL = _objPosASL vectorAdd [0,0,0.05];
private _dustRange = _obj1 getVariable ["KJW_Radiate_DustRange",0.001];
//End variables
//Begin code

switch true do {
	case (_radiationType == "Alpha" || _radiationType == "Beta" || _radiationType == "Gamma"): {
		if ((_random > _sourceActivity) ||
			((count (lineIntersectsSurfaces [_objUpPosASL, _playerPosASL, ACE_Player, _obj1, true, -1, "GEOM", "VIEW", false])*2) > _penetratingPower)) exitWith{};
		private _range = if (_range isEqualTo 0) then {0.05} else {_range};
		private _dist = if (_obj1 isEqualTo ACE_Player) then {0.05} else {ACE_player distance _obj1};
		if ( random 1 < (((_range/_dist^2)/(2^((ACE_player distance _obj1)/_distHalvedThruAir)))) ) exitWith {
			if (_breathable) exitWith {[_radiationType,_obj1,true] call KJW_Radiate_fnc_countProcess;};
			[_radiationType,_obj1] call KJW_Radiate_fnc_countProcess;
		};
	};
	case (_radiationType == "AlphaArea" || _radiationType == "BetaArea" || _radiationType == "GammaArea"): {
		if (_random > _sourceActivity) exitWith {};
		if (ACE_player inArea _obj1) then {
			_triggerDimensions = triggerArea _obj1;
			_percentageIntoTrigger = (_triggerDimensions#0 - (ACE_Player distance _obj1))/(_triggerDimensions#0)*100; //Percentage of how far the player is inside of the trigger area.
			_percentageFadeInDist = _obj1 getVariable ["KJW_Radiate_FadeInDistancePercentage",0.01];
			_percentageFadeInDist = if (_percentageFadeInDist isEqualTo 0) then {0.01} else {_percentageFadeInDist};
			if (random _percentageFadeInDist > _percentageIntoTrigger) exitWith{};
			if (_breathable) exitWith {[_radiationType,_obj1,true] call KJW_Radiate_fnc_countProcess;};
			[_radiationType,_obj1] call KJW_Radiate_fnc_countProcess;
		};
	};
	default {};
};