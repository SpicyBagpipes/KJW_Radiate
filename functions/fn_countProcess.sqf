/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_countProcess

Description:
    Processes radiation count. Called when there has been a radiation count.
	Adds +1 to player's radiation count.

Parameters:
    _radiationType - The type of radiation to be processed.
    _obj2 - The object that has decayed. Used in calculating irradiation chance.
    _dust - True if count is from dust.

Returns:


Author:
    KJW
---------------------------------------------------------------------------- */
params["_radiationType","_obj2","_dust"];
scopeName "main";

//Variables
private _countRate = ACE_Player getVariable ["KJW_Radiate_Counts",0];
//End variables
//Begin code
if !(isNull objectParent ACE_Player) then {
    _protection = [objectParent ACE_Player] call KJW_Radiate_fnc_protectionProcess;
    _random = random 1;
    if (_random < _protection) exitWith{breakOut "main"}; //Protection value is probability that incoming radiation will be shielded by vehicle. Vehicles can however become irradiated.
};
ACE_Player setVariable ["KJW_Radiate_Counts",_countRate+1];
[_radiationType] call KJW_Radiate_fnc_playerProcess;
if (("KJW_Radiate_GeigerCounter" in assignedItems ACE_Player) && (KJW_Radiate_Setting_FocusCheck && isGameFocused)) then {playSound "KJW_Geiger_Click";};
if (
    (_obj2 == ACE_Player getVariable ["ACE_Dragging_CarriedObject",objNull]) || 
    (_obj2 == ACE_Player getVariable ["ACE_Dragging_DraggedObject",objNull])) 
exitWith {[ACE_Player, _radiationType] call KJW_Radiate_fnc_irradiateProcess};
if (_dust) exitWith {[ACE_Player, _radiationType] call KJW_Radiate_fnc_irradiateProcess};