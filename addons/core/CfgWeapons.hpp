class CfgWeapons {
    class ItemWatch;
    class KJW_Radiate_GeigerCounter : ItemWatch {
        ACE_hideItemType = "Watch";
        author = "KJW";
        descriptionShort = "A Geiger Counter used for displaying radiation counts per second.";
        displayName = "Geiger Counter";
        picture = QPATHTOF(data\tx\geigercounter_ca.paa);
    };
    class ACE_morphine;
    class KJW_Radiate_EDTA : ACE_morphine {
        displayName = "EDTA";
    };
    class KJW_Radiate_EACA : ACE_morphine {
        displayName = "EACA";
    };
};