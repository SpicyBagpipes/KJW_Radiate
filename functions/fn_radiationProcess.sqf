/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_radiationProcess

Description:
    Processes type of radiation passed, returns properties for it.

Parameters:
    _radiationType - The type of radiation the object has.

Returns:
    _penetratingPower - Number of surfaces the radiation can penetrate. Not needed for background.
	_ionisingPower - Number of microSieverts each count gives.
	_countRate - Average counts per minute of the object. Only for background.
	_range - How many meters of air the particle can penetrate quite well.
	_dropOff - How many meters of air the particle can penetrate before coming to 0.
	_breathable - Can be breathed in? Stops player being able to escape radiation. Intended for Alpha.

Author:
    KJW
---------------------------------------------------------------------------- */
params["_radiationType"];

private _radiationProperties = switch true do {
case (_radiationType == "Alpha"): {parseSimpleArray KJW_Radiate_Setting_Alpha};
case (_radiationType == "Beta"): {parseSimpleArray KJW_Radiate_Setting_Beta};
case (_radiationType == "Gamma"): {parseSimpleArray KJW_Radiate_Setting_Gamma};
case (_radiationType == "AlphaArea"): {parseSimpleArray KJW_Radiate_Setting_AlphaArea};
case (_radiationType == "BetaArea"): {parseSimpleArray KJW_Radiate_Setting_BetaArea};
case (_radiationType == "GammaArea"): {parseSimpleArray KJW_Radiate_Setting_GammaArea};
case (_radiationType == "Background"): {[0,0.0002536783333,18,0,0,false]};
};

_radiationProperties