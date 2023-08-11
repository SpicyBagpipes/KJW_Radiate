/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_addRespirator

Description:
    Adds target respirator to target unit.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

params ["_player", "_target"];

_respiratorsTarget = parseSimpleArray KJW_Radiate_Setting_CompatibleMasks arrayIntersect items _target;

if (count _respiratorsTarget != 0) exitWith {
    _player removeItem _respirators#0;
    _target addGoggles _respirators#0;
};

_respirators = parseSimpleArray KJW_Radiate_Setting_CompatibleMasks arrayIntersect items ACE_player;

if (count _respirators != 0) exitWith {
    _player removeItem _respirators#0;
    _target addGoggles _respirators#0;
};