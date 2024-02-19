class Cfg3den {
    class Object {
        class AttributeCategories {
            class KJW_Radiate {
                displayName = "KJW's Radiate";
                collapsed = 1;
                class Attributes {
                    class KJW_Radiate_Core_radiationSource {
                        displayName = "Is Radiation Source";
                        toolTip = "Is the object a source of radiation?";
                        property = "KJW_Radiate_Core_radiationSource";
                        control = "Checkbox";
                        defaultValue = "false";
                        expression = "_this setVariable ['%s',_value, true];";
                    };
                    class KJW_Radiate_Core_RadiationType {
                        displayName = "Radiation Type";
                        toolTip = "What type of radiation is the object? (Alpha, Beta, Gamma)";
                        property = "KJW_Radiate_Core_RadiationType";
                        control = "Combo";
                        defaultValue = "''";
                        expression = "_this setVariable ['%s',_value, true];";
                        class Values {
                            class Alpha {
                                name = "Alpha";
                                tooltip = "Low penetrating power, but highly ionising and more damaging to biological tissue.";
                                value = "alpha";
                            };
                            class Beta {
                                name = "Beta";
                                tooltip = "Medium penetrating power with medium ionising power. Can be damaging to biological tissue.";
                                value = "beta";
                            };
                            class Gamma {
                                name = "Gamma";
                                tooltip = "High penetrating power, not very ionising. Rarely damaging to biological tissue.";
                                value = "gamma";
                            };
                        };
                    };
                    class KJW_Radiate_Core_countRate {
                        displayName = "Activity of object";
                        toolTip = "Measured in counts per minute.";
                        property = "KJW_Radiate_Core_countRate";
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