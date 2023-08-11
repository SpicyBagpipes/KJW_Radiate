/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_serverInit

Description:
    Gathers all radiation sources.

Parameters:
    
	
Returns:


Author:
    KJW
---------------------------------------------------------------------------- */

if (!isServer) exitwith{};

KJW_Radiate_SourceObjects = allMissionObjects "" select {_x getVariable ["KJW_Radiate_RadiationSource", false]};
publicVariable "KJW_Radiate_SourceObjects";