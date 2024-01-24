class CfgVehicles {
	class B_W_Soldier_F;
    class B_W_Soldier_CBRN_F : B_W_Soldier_F {
        linkedItems[] = {"V_PlateCarrier1_wdl","H_HelmetB_plain_wdl","G_AirPurifyingRespirator_01_F","ItemMap","ItemCompass","KJW_Radiate_GeigerCounter","ItemRadio","NVGoggles_INDEP"};
    };

    class DeconShower_02_base_F;
    class DeconShower_02_F : DeconShower_02_base_F {
        class UserActions {
            class Activate {
                actionNamedSel = "ControlBox_Action";
                condition = "alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' isEqualTo 0}";
                displayName = "Activate shower";
                displayNameDefault = "Activate shower";
                onlyForPlayer = 1;
                position = "";
                radius = 1.7;
                statement = "player playActionNow 'PutDown';[this,5.4,4,2,true] spawn bin_fnc_deconShowerAnimLarge; private _zone = this getVariable ['KJW_Radiate_Core_deconZone',objNull]; _zone setVariable ['KJW_Radiate_Core_turnedOn', true];";
            };
            class Deactivate : Activate {
                condition = "alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' > 0}";
                displayName = "Deactivate shower";
                displayNameDefault = "Deactivate shower";
                statement = "player playActionNow 'PutDown';[this] call bin_fnc_deconShowerAnimStop; private _zone = this getVariable ['KJW_Radiate_Core_deconZone',objNull]; _zone setVariable ['KJW_Radiate_Core_turnedOn', false];";
            };
        };
    };
    class DeconShower_01_base_F;
    class DeconShower_01_F : DeconShower_01_base_F {
        class UserActions {
            class Activate {
                actionNamedSel = "ControlBox_Action";
                condition = "alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' isEqualTo 0}";
                displayName = "Activate shower";
                displayNameDefault = "Activate shower";
                onlyForPlayer = 1;
                position = "";
                radius = 1.7;
                statement = "player playActionNow 'PutDown';[this,1.5,9] spawn bin_fnc_deconShowerAnim; private _zone = this getVariable ['KJW_Radiate_Core_deconZone',objNull]; _zone setVariable ['KJW_Radiate_Core_turnedOn', true];";
            };
            class Deactivate : Activate {
                condition = "alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' > 0}";
                displayName = "Deactivate shower";
                displayNameDefault = "Deactivate shower";
                statement = "player playActionNow 'PutDown';[this] call bin_fnc_deconShowerAnimStop; private _zone = this getVariable ['KJW_Radiate_Core_deconZone',objNull]; _zone setVariable ['KJW_Radiate_Core_turnedOn', false];";
            };
        };
    };
};