/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_effectsHandler

Description:
   Handles effects of radiation.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */
KJW_Radiate_Counter = 0;
[{
//Variables
private _playerDose = ACE_Player getVariable ["KJW_Radiate_Dose",0];
if (_playerDose < 100) then {continue}; //No effects start below 100, exit ASAP.

KJW_Radiate_Counter = KJW_Radiate_Counter+1;

private _random = random _playerDose; //Anywhere between 0 and 801 from start of this running.

private _alphaFactor = ACE_Player getVariable ["KAT_Pharma_alphaAction",1];
private _oldDose = ACE_Player getVariable ["KJW_Radiate_OldDose",0];
//End variables
//Begin code

if ((_playerDose > 100) && (KJW_Radiate_Counter%10 == 0)) then {[ACE_Player, _playerDose/1000] call ace_medical_fnc_adjustPainLevel;}; //Should only happen once every 10 seconds.

if (_random > 200) then { //50/50 chance of radiation poisoning at 400 dose every second.
    [ACE_Player, "body", "KJW_Radiate_RadiationPoisoning"] call ace_medical_treatment_fnc_medicationLocal;
};

if ((_random > 300) && (KJW_Radiate_Counter%10 == 0)) then { //50/50 chance if dose of 600 to go unconscious every 20 seconds.
	[ACE_Player, true, 5, true] call ace_medical_fnc_setUnconscious;
};

if !((isNil "KAT_Airway_probability_occluded" && lifeState player == "INCAPACITATED") && _random > 300) then { //Increases probability of airway becoming occluded by 1% every second whilst unconscious.
    KAT_Airway_probability_occluded = KAT_Airway_probability_occluded*1.01
};

private _addition = linearConversion [0, 5000, _playerDose, 0, 1, true];
private _oldAddition = linearConversion [0, 5000, _oldDose, 0, 1, true];
_alphaFactor = (_alphaFactor - _oldAddition) + _addition;
ACE_Player setVariable ["KAT_Pharma_alphaAction", _alphaFactor, true];
ACE_Player setVariable ["KJW_Radiate_OldDose",  _playerDose];

}, 1, []] call CBA_fnc_addPerFrameHandler;