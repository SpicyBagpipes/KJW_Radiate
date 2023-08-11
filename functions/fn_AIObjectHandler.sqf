/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_AIObjectHandler

Description:
   Handles radiation on AI units.

Parameters:
    _unit - The unit passed.
	_obj1 - The object influencing the AI.

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */
params["_unit", "_obj1"];

//Variables
private _radiationType = _obj1 getVariable "KJW_Radiate_RadiationType";
private _sourceActivity = _obj1 getVariable "KJW_Radiate_Activity";
private _radiationProperties = [_radiationType] call KJW_Radiate_fnc_radiationProcess;
_radiationProperties params ["_penetratingPower", "_ionisingPower", "_range", "_breathable","_distHalvedThruAir"];
private _unitPosASL = getPosASL _unit;
private _objPosASL = getPosASL _obj1;
private _objUpPosASL = _objPosASL vectorAdd [0,0,0.05];
//End variables
//Begin code

if ((_unit distance _obj1 > _range) || {((count (lineIntersectsSurfaces [_objUpPosASL, _unitPosASL, _unit, _obj1, true, -1, "GEOM", "VIEW", false])*2) > _penetratingPower)}) exitWith{};
if (!(_range < _unit distance _obj1) && {_radiationType in ["Alpha", "Beta", "Gamma"]}) exitWith {
	_unitDmg = damage _unit;
	_unit setDamage _unitDmg + (((_sourceActivity/60)*_ionisingPower)/2)/1000
};