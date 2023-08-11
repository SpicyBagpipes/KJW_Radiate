/* ----------------------------------------------------------------------------
Function: KJW_Radiate_fnc_addCBASettings

Description:
    Adds CBA Settings.

Parameters:
    

Returns:
    

Author:
    KJW
---------------------------------------------------------------------------- */

_allowedClasses = [];
_uniformProtections = [];
_maskProtections = [];
_backpackProtections = [];
_helmetProtections = [];

_alpha = [0,1,5,false,1];
_beta = [1,0.075,25,false,5];
_gamma = [25,0.005,2000,false,20];

_alphaArea = [0,1,0,true,0];
_betaArea = [0,0.075,0,true,0];
_gammaArea = [0,0.005,0,true,0];


["KJW_Radiate_Setting_CompatibleMasks", "EDITBOX",  ["Compatible Masks", "An array of classnames of masks that are able to be put onto other units' face."], "KJW's Radiate", str _allowedClasses] call CBA_fnc_addSetting;

["KJW_Radiate_AIEnabled", "CHECKBOX", ["Enabled on AI", "If disabled, will stop the server running on AI."], "KJW's Radiate", true, 2, {}, true] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_FocusCheck", "CHECKBOX",  ["Background Sound", "Enables focus check for Geiger Counter click."], "KJW's Radiate", true] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_UniformProtection", "EDITBOX",  ["Uniform Values", "[[classname,0-0.3 value],[classname,0-0.3 value]]"], ["KJW's Radiate","PPE Values"], str _uniformProtections] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_MaskProtection", "EDITBOX",  ["Mask Values", "[['classname',protection value,backpack dependent (1 true, 0 false)],[]]"], ["KJW's Radiate","PPE Values"], str _maskProtections] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_BackpackProtection", "EDITBOX",  ["Backpack Values", "[['classname',protection value,mask dependent (1 true, 0 false)],[]]"], ["KJW's Radiate","PPE Values"], str _backpackProtections] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_HelmetProtection", "EDITBOX",  ["Helmet Values", "[['classname',protection value],[]]"], ["KJW's Radiate","PPE Values"], str _helmetProtections] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_Alpha", "EDITBOX",  ["Alpha Radiation", "_penetratingPower - Number of surfaces the radiation can penetrate.
	_ionisingPower - Number of microSieverts each count gives.
	_range - The maximum range the radiation type can travel in air.
	_breathable - Can be breathed in? Stops player being able to escape radiation.
	_distHalvedThruAir - How far can the radiation travel through air before its intensity halves?"], ["KJW's Radiate","Radiation Types"], str _alpha] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_Beta", "EDITBOX",  ["Beta Radiation", "_penetratingPower - Number of surfaces the radiation can penetrate.
	_ionisingPower - Number of microSieverts each count gives.
	_range - The maximum range the radiation type can travel in air.
	_breathable - Can be breathed in? Stops player being able to escape radiation.
	_distHalvedThruAir - How far can the radiation travel through air before its intensity halves?"], ["KJW's Radiate","Radiation Types"], str _beta] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_Gamma", "EDITBOX",  ["Gamma Radiation", "_penetratingPower - Number of surfaces the radiation can penetrate.
	_ionisingPower - Number of microSieverts each count gives.
	_range - The maximum range the radiation type can travel in air.
	_breathable - Can be breathed in? Stops player being able to escape radiation.
	_distHalvedThruAir - How far can the radiation travel through air before its intensity halves?"], ["KJW's Radiate","Radiation Types"], str _gamma] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_AlphaArea", "EDITBOX",  ["Alpha Dust Area Radiation", "_penetratingPower - Number of surfaces the radiation can penetrate. Ignored for area.
	_ionisingPower - Number of microSieverts each count gives.
	_range - The maximum range the radiation type can travel in air. Ignored for area.
	_breathable - Can be breathed in? Stops player being able to escape radiation.
	_distHalvedThruAir - How far can the radiation travel through air before its intensity halves? Ignored for area."], ["KJW's Radiate","Radiation Types"], str _alphaArea] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_BetaArea", "EDITBOX",  ["Beta Dust Area Radiation", "_penetratingPower - Number of surfaces the radiation can penetrate. Ignored for area.
	_ionisingPower - Number of microSieverts each count gives.
	_range - The maximum range the radiation type can travel in air. Ignored for area.
	_breathable - Can be breathed in? Stops player being able to escape radiation.
	_distHalvedThruAir - How far can the radiation travel through air before its intensity halves? Ignored for area."], ["KJW's Radiate","Radiation Types"], str _betaArea] call CBA_fnc_addSetting;

["KJW_Radiate_Setting_GammaArea", "EDITBOX",  ["Gamma Dust Area Radiation", "_penetratingPower - Number of surfaces the radiation can penetrate. Ignored for area.
	_ionisingPower - Number of microSieverts each count gives.
	_range - The maximum range the radiation type can travel in air. Ignored for area.
	_breathable - Can be breathed in? Stops player being able to escape radiation.
	_distHalvedThruAir - How far can the radiation travel through air before its intensity halves? Ignored for area."], ["KJW's Radiate","Radiation Types"], str _gammaArea] call CBA_fnc_addSetting;    