/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_makeSource

Description:
	Makes specified object a radioactive source with given parameters.

Parameters:
   _obj1 - The source object.
   _radiationType - The type of radiation it will emit.
   _countRate - The count rate it will emit.

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */
params["_obj1","_radiationType","_countRate"];

_obj1 setVariable ["KJW_Radiate_RadiationSource", true, true];
_obj1 setVariable ["KJW_Radiate_RadiationType", _radiationType, true];
_obj1 setVariable ["KJW_Radiate_Activity", _countRate, true];

if (_obj1 in KJW_Radiate_SourceObjects) exitWith{}; //Object is already in the SourceObjects array, no need to add it.
KJW_Radiate_SourceObjects pushBack _obj1;
publicVariable "KJW_Radiate_SourceObjects";