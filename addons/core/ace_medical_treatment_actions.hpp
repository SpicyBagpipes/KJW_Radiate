class ace_medical_treatment_actions {
    class Morphine;
    class KJW_Radiate_EACA : Morphine {
        displayName = "Push EACA";
        condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) isEqualTo 1) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
        items[] = {"KJW_Radiate_EACA"};
    };
    class KJW_Radiate_EDTA : Morphine {
        displayName = "Push EDTA";
        condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) isEqualTo 1) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
        items[] = {"KJW_Radiate_EDTA"};
    };
};