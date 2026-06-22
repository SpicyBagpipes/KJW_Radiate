class CfgWeapons {
    class ItemWatch;
    class KJW_Radiate_GeigerCounter : ItemWatch {
        ACE_hideItemType = "Watch";
        author = "KJW";
        descriptionShort = "A Geiger Counter used for displaying radiation counts per second.";
        displayName = "Geiger Counter";
        picture = QPATHTOF(data\tx\geigercounter_icon_ca.paa);
    };
    class ACE_morphine;
    class KJW_Radiate_EDTA : ACE_morphine {
        displayName = "EDTA";
        picture = QPATHTOF(data\tx\edta_icon_ca.paa);
    };
    class KJW_Radiate_EACA : ACE_morphine {
        displayName = "EACA";
        picture = QPATHTOF(data\tx\eaca_icon_ca.paa);
    };
};