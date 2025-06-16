    class KOR_Base
    {
        requiredAddons[] = {"vtf_kf_main"};
        basepath = QPATHTOFOLDER(Templates\Templates\KOR);
        logo = "\vtf_korsac_factions_main\data\vtf_korsac_flag_co.paa";
        priority = 13;
    };

    class KOR_KDF : KOR_Base
    {
        side = "Occ";
        flagTexture = "\vtf_korsac_factions_main\data\vtf_korsac_flag_co.paa";
        name = "Korsac Defence Force";
        file = "KOR_AI_KDF";
    };
