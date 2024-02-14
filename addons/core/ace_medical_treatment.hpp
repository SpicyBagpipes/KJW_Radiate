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
        class KJW_Radiate_EDTA : Painkillers {
            maxDose = 5;
            painReduce = 0;
            timeInSystem = 600;
            timeTillMaxEffect = 60;
            viscosityChange = -2;
        };
        class KJW_Radiate_EACA : Painkillers {
            maxDose = 5;
            painReduce = 0;
            timeInSystem = 600;
            timeTillMaxEffect = 60;
            viscosityChange = -4;
        };
		// Need EDTA too.
    };
};