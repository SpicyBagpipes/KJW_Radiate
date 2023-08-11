/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_makeSource

Description:
	Makes specified object a radioactive source with given parameters.

Parameters:
   _obj1 - The source object.

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */
params["_obj1"];

_obj1 setVariable ["KJW_Radiate_RadiationSource", false, true];
_obj1 setVariable ["KJW_Radiate_RadiationType", "", true];
_obj1 setVariable ["KJW_Radiate_Activity", 0, true];

if !(_obj1 in KJW_Radiate_SourceObjects) exitWith{}; //Object is not already in the SourceObjects array, no need to remove it.
_obj1ArrPos = KJW_Radiate_SourceObjects find _obj1;
KJW_Radiate_SourceObjects deleteAt _obj1ArrPos;
publicVariable "KJW_Radiate_SourceObjects";