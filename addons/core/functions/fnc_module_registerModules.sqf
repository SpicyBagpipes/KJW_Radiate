#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds zeus modules for ZEN
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_fnc_module_registerModules
 * 
 *  Public: No
 */

// This does throw script errors on ZEN's side. I'm not quite sure why.


[
    "KJW's Radiate",
    "Add Source",
    {
        [
            "Add Source",
            [
                ["COMBO","Radiation Type",[["alpha","beta","gamma"],["Alpha","Beta","Gamma"],[0]]],
                ["SLIDER",["Count Rate","Counts per second"],[1,2000,10,0]]
            ],
            {
                _this#0 params ["_type","_countRate"];
                _this#1#0 params ["_pos","_obj"];
                [_obj, _type, _countRate] call FUNC(addSource);
            },
            {},
            [_this]
        ] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;

[
    "KJW's Radiate",
    "Remove Source",
    {
        [_this#1] call FUNC(deleteSource);
    }
] call zen_custom_modules_fnc_register;

[
    "KJW's Radiate",
    "Create Dust Zone",
    {
        [
            "Create Dust Zone",
            [
                ["COMBO","Radiation Type",[["alpha","beta","gamma"],["Alpha","Beta","Gamma"],[0]]],
                ["SLIDER",["Count Rate","Counts per minute"],[1,2000,10,0]],
                ["SLIDER:RADIUS",["Radius","Meters from origin"],[1,2000,10,0,_this#0#1]]
            ],
            {
                _this#0 params ["_type","_countRate","_radius"];
                _this#1#0 params ["_pos"];
                [_pos, _type, _countRate, _radius, _radius] call FUNC(createDustZone);
            },
            {},
            [_this]
        ] call zen_dialog_fnc_create;
    }
] call zen_custom_modules_fnc_register;