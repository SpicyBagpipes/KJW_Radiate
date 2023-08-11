class CfgPatches {
    class KJW_Radiate {
        author="KJW";
        requiredAddons[]=
        {
            "A3_Data_F",
            "A3_Weapons_F",
            "A3_Characters_F",
            "A3_Data_F_AoW_Loadorder",
            "ace_medical",
            "ace_interaction",
            "ace_medical_gui"
        };
        requiredVersion=1;
		units[] = {""};
		weapons[] = {"KJW_Radiate_GeigerCounter"};
		vehicles[] = {""};
	};
};

/*
Current changelogs:
    - Fixed helmet protection not working properly.
*/

#include "macro_suit_protection.hpp"
#include "macro_face_protection.hpp"
#include "macro_backpack_protection.hpp"
#include "macro_helmet_protection.hpp"
#include "macro_function.hpp"

#include "RscTitles.hpp"

class Extended_PostInit_EventHandlers {
    class KJW_Radiate_hoseAdder {
        init = "call compileScript ['KJW_Radiate\functions\fn_hoseAdder.sqf']"
    };
    class KJW_Radiate_keybindAdder {
        init = "call compileScript ['KJW_Radiate\functions\fn_addCBAKeybind.sqf']"
    };
    class KJW_Radiate_handleMuscleDamage {
        init = "call compileScript ['KJW_Radiate\functions\fn_handleThirst.sqf']"
    };
    class KJW_Radiate_addCBASettings {
        init = "call compileScript ['KJW_Radiate\functions\fn_addCBASettings.sqf']"
    };
    class KJW_Radiate_playerHandler {
        init = "call compileScript ['KJW_Radiate\functions\fn_playerHandler.sqf']"
    };
    class KJW_Radiate_serverInit {
        init = "call compileScript ['KJW_Radiate\functions\fn_serverInit.sqf']"
    };
    class KJW_Radiate_serverHandler {
        init = "call compileScript ['KJW_Radiate\functions\fn_serverHandler.sqf']"
    };
    class KJW_Radiate_respawnHandler {
        init = "call compileScript ['KJW_Radiate\functions\fn_playerRespawnEH.sqf']"
    };
    class KJW_Radiate_fullHealHandler {
        init = "call compileScript ['KJW_Radiate\functions\fn_fullHealHandler.sqf']"
    };
    class KJW_Radiate_effectsHandler {
        init = "call compileScript ['KJW_Radiate\functions\fn_effectsHandler.sqf']"
    };
};

class CfgFunctions {
    class KJW_Radiate {
        class functions {
            MACRO_FUNCTION(addCBAKeybind);
            MACRO_FUNCTION(addCBASettings);
            MACRO_FUNCTION(addRespirator);
            MACRO_FUNCTION(AIObjectHandler);
            MACRO_FUNCTION(backgroundHandler);
            MACRO_FUNCTION(CBRNHoseInit);
            MACRO_FUNCTION(countProcess);
            MACRO_FUNCTION(deconShowerHandler);
            MACRO_FUNCTION(deleteSource);
            MACRO_FUNCTION(effectsHandler);
            MACRO_FUNCTION(handleThirst);
            MACRO_FUNCTION(hideGeigerCounter);
            MACRO_FUNCTION(hoseAdder);
            MACRO_FUNCTION(irradiateProcess);
            MACRO_FUNCTION(makeSource);
            MACRO_FUNCTION(objectProcess);
            MACRO_FUNCTION(playerHandler);
            MACRO_FUNCTION(playerProcess);
            MACRO_FUNCTION(playerRespawnEH);
            MACRO_FUNCTION(protectionProcess);
            MACRO_FUNCTION(radiationProcess);
            MACRO_FUNCTION(serverHandler);
            MACRO_FUNCTION(serverInit);
            MACRO_FUNCTION(showGeigerCounter);
            MACRO_FUNCTION(generateCompat);
            MACRO_FUNCTION(clearStats);
            MACRO_FUNCTION(fullHealHandler);
            MACRO_FUNCTION(createDustArea);
        };
    };
};

class CfgSounds {
	sounds[]={};
	class KJW_Geiger_Click {
		name = "Geiger Click";
		sound[] = {"KJW_Radiate\audio\geiger_click.wss",1,1};
		titles[] = {0,""};
	};
};

class Cfg3den {
    class Object {
        class AttributeCategories {
            class KJW_Radiate {
                displayName = "KJW's CBRN";
                collapsed = 1;
                class Attributes {
                    class KJW_Radiate_RadiationSource {
                        displayName = "Is Radiation Source";
                        toolTip = "Is the object a source of radiation?";
                        property = "KJW_Radiate_RadiationSource";
                        control = "Checkbox";
                        defaultValue = "false";
                        expression = "_this setVariable ['%s',_value, true];";
                    };
                    class KJW_Radiate_RadiationType {
                        displayName = "Radiation Type";
                        toolTip = "What type of radiation is the object? (Alpha, Beta, Gamma)";
                        property = "KJW_Radiate_RadiationType";
                        control = "Combo";
                        defaultValue = "''";
                        expression = "_this setVariable ['%s',_value, true];";
                        class Values {
                            class Alpha {
                                name = "Alpha";
                                tooltip = "Low penetrating power, but highly ionising and more damaging to biological tissue.";
                                value = "Alpha";
                            };
                            class Beta {
                                name = "Beta";
                                tooltip = "Medium penetrating power with medium ionising power. Can be damaging to biological tissue.";
                                value = "Beta";
                            };
                            class Gamma {
                                name = "Gamma";
                                tooltip = "High penetrating power, not very ionising. Rarely damaging to biological tissue.";
                                value = "Gamma";
                            };
                        };
                    };
                    class KJW_Radiate_Activity {
                        displayName = "Activity of object";
                        toolTip = "Measured in counts per minute. Recommended maximum of 1199.";
                        property = "KJW_Radiate_Activity";
                        control = "EditShort";
                        defaultValue = "'0'";
                        expression = "_this setVariable ['%s',_value, true];";
                        validate = "number";
                    };
                };
            };
        };
    };
};

class CfgVehicles {
    class B_CombinationUnitRespirator_01_Base_F;
    class B_SCBA_01_base_F;
    class DeconShower_02_base_F;
    class DeconShower_01_base_F;
    class Man;
    class B_W_Soldier_F;
    class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};
        class ModuleDescription
		{
			class AnyBrain;
		};
    };
    MACRO_BACKPACK_PROTECTION(B_CombinationUnitRespirator_01_F,B_CombinationUnitRespirator_01_Base_F,0.3,1);
    MACRO_BACKPACK_PROTECTION(B_SCBA_01_F,B_SCBA_01_base_F,0.3,1);

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
                statement = "player playActionNow 'PutDown';[this,5.4,4,2,true] spawn bin_fnc_deconShowerAnimLarge; [this] remoteExecCall ['KJW_Radiate_fnc_deconShowerHandler',0];";
            };
            class Deactivate : Activate {
                condition = "alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' > 0}";
                displayName = "Deactivate shower";
                displayNameDefault = "Deactivate shower";
                statement = "player playActionNow 'PutDown';[this] call bin_fnc_deconShowerAnimStop;this setVariable ['KJW_Radiate_DeconShower_Status', false, true];";
            };
        };
    };
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
                statement = "player playActionNow 'PutDown';[this,1.5,9] spawn bin_fnc_deconShowerAnim; [this] remoteExecCall ['KJW_Radiate_fnc_deconShowerHandler',0];";
            };
            class Deactivate : Activate {
                condition = "alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' > 0}";
                displayName = "Deactivate shower";
                displayNameDefault = "Deactivate shower";
                statement = "player playActionNow 'PutDown';[this] call bin_fnc_deconShowerAnimStop;this setVariable ['KJW_Radiate_DeconShower_Status', false, true];";
            };
        };
    };
    class CAManBase : Man {
        class ACE_Actions {
            class ACE_Head {
                class KJW_Radiate_AddMask {
                    condition = "lifeState _target == 'INCAPACITATED'";
                    displayName = "Put mask on unit";
                    exceptions[] = {"isNotInside","isNotSitting"};
                    statement = "[_player, _target] call KJW_Radiate_fnc_addRespirator";
                };
            };
        };
    };
    class B_W_Soldier_CBRN_F : B_W_Soldier_F {
        linkedItems[] = {"V_PlateCarrier1_wdl","H_HelmetB","G_AirPurifyingRespirator_01_F","ItemMap","ItemCompass","KJW_Radiate_GeigerCounter","ItemRadio","NVGoggles_INDEP"};
    };
    class KJW_Radiate_Module_DustZone: Module_F {
        scope = 2;
        category = "Effects";
        displayName = "Radioactive Dust Zone";
        function = "KJW_Radiate_fnc_createDustArea";
        icon = "KJW_Radiate\data\icon.paa";
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 1;
        class Attributes: AttributesBase {
            class KJW_Radiate_Module_AreaRadiationType: Combo {
                property = "KJW_Radiate_Module_AreaRadiationType";
                displayName = "Radiation Type";
                typeName = "STRING";
                class Values {
                    class AlphaArea {name = "Alpha"; value = "AlphaArea"};
                    class BetaArea {name = "Beta"; value = "BetaArea"};
                    class GammaArea {name = "Gamma"; value = "GammaArea"};
                };
            };
            class KJW_Radiate_Module_CountRate: Edit {
                property = "KJW_Radiate_Module_CountRate";
                displayName = "Count Rate";
                defaultValue = 0;
                typeName = "NUMBER";
            };
            class KJW_Radiate_Module_FadeInDist: Edit {
                property = "KJW_Radiate_Module_FadeInDist";
                displayName = "Fade In Percentage";
                tooltip = "Percentage of distance to trigger center. Can cause issues with irregularly shaped triggers.";
                defaultValue = 10;
                typeName = "Number";
            };
        };
    };
};

class CfgGlasses {
    class G_AirPurifyingRespirator_01_base_F;
    class G_AirPurifyingRespirator_02_base_F;
    class G_Respirator_base_F;
    class G_RegulatorMask_base_F;
    MACRO_FACE_PROTECTION(G_AirPurifyingRespirator_01_F,G_AirPurifyingRespirator_01_base_F,0.3,0);
    MACRO_FACE_PROTECTION(G_AirPurifyingRespirator_02_black_F,G_AirPurifyingRespirator_02_base_F,0.3,0);
    MACRO_FACE_PROTECTION(G_AirPurifyingRespirator_02_olive_F,G_AirPurifyingRespirator_02_base_F,0.3,0);
    MACRO_FACE_PROTECTION(G_AirPurifyingRespirator_02_sand_F,G_AirPurifyingRespirator_02_base_F,0.3,0);
    MACRO_FACE_PROTECTION(G_RegulatorMask_F,G_RegulatorMask_base_F,0.4,1);
    MACRO_FACE_PROTECTION(G_Respirator_blue_F,G_Respirator_base_F,0.05,0);
    MACRO_FACE_PROTECTION(G_Respirator_white_F,G_Respirator_base_F,0.05,0);
    MACRO_FACE_PROTECTION(G_Respirator_yellow_F,G_Respirator_base_F,0.05,0);
};

class CfgWeapons {
    class Uniform_Base;
    class H_HelmetB;
    //CBRN suits below.
    MACRO_SUIT_PROTECTION(U_C_CBRN_Suit_01_Blue_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_B_CBRN_Suit_01_Wdl_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_B_CBRN_Suit_01_MTP_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_B_CBRN_Suit_01_Tropic_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_C_CBRN_Suit_01_White_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_I_CBRN_Suit_01_AAF_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_I_E_CBRN_Suit_01_EAF_F,Uniform_Base,0.3);
    //Special Purpose Suits below.
    MACRO_SUIT_PROTECTION(U_O_V_Soldier_Viper_F,Uniform_Base,0.3);
    MACRO_SUIT_PROTECTION(U_O_V_Soldier_Viper_hex_F,Uniform_Base,0.3);
    //Gorkas below. Only offer some protection.
    MACRO_SUIT_PROTECTION(U_O_R_Gorka_01_F,Uniform_Base,0.1);
    MACRO_SUIT_PROTECTION(U_O_R_Gorka_01_black_F,Uniform_Base,0.1);
    MACRO_SUIT_PROTECTION(U_O_R_Gorka_01_brown_F,Uniform_Base,0.1);
    MACRO_SUIT_PROTECTION(U_O_R_Gorka_01_camo_F,Uniform_Base,0.1);
    //Special Purpose Helmet below. Other one inherits from this so no need to do twice.
    MACRO_HELMET_PROTECTION(H_HelmetO_ViperSP_hex_F,H_HelmetB,0.3);

    class ItemWatch;
    class KJW_Radiate_GeigerCounter : ItemWatch {
        ACE_hideItemType = "Watch";
        author = "KJW";
        descriptionShort = "A Geiger Counter used for displaying radiation counts per second.";
        displayName = "Geiger Counter";
        picture = "\KJW_Radiate\data\counterunlit.paa";
    };
};

class ace_medical_treatment {
    class Medication {
        class Painkillers;
        class KJW_Radiate_RadiationPoisoning : Painkillers {
            maxDose = 100;
            painReduce = 0;
            timeInSystem = 600;
            timeTillMaxEffect = 60;
            viscosityChange = -20;
        };
    };
};