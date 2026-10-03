    class TKE_Base
    {
        requiredAddons[] = {
            "TKE_Mod_LoadOrder", // The Kuiper Engagements
            "WBK_SciFiWeaponary", // Weapon Research and Security: Firearms 
            "TKE_Ext_Heli", // Scifi Vehicles Pack
            "TKE_Ext_Ships", // Scifi Spaceship Pack
            "WBK_WRS_Mechs", // Weapon Research and Security: Autonomous systems 
            "QAV_MV35", // QAV - Vanilla Vehicle Expansion
            "PHEN_TurretPack" // Sci-fi Turret Pack
        }; 
        logo = QPATHTOFOLDER(Templates\Templates\TKE\images\mod_tke_ucn_ca.paa);
        basepath = QPATHTOFOLDER(Templates\Templates\TKE);
        priority = 61;
        climate[] = {"temperate","tropical","arid","arctic"};
    };
    class TKE_RD_Base : TKE_Base
    {
        requiredAddons[] += {"TKE_Red_Dwarf_HC"}; // TKE - Red Dwarf
    };
    class TKE_KMC_Base : TKE_Base
    {
        requiredAddons[] += {"KMC_mod"}; // TKE - Kuiper Mining Corporation
    };

    class TKE_Occ_UCN_Temperate : TKE_Base
    {
        side = "Occ";
        name = "UCN (Temperate)";
        file = "TKE_Occ_UCN_Temperate";
        description = "";
        climate[] = {"temperate", "tropical", "arctic"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
    };
    class TKE_Occ_UCN_Arid : TKE_Occ_UCN_Temperate
    {
        name = "UCN (Arid)";
        file = "TKE_Occ_UCN_Arid";
        climate[] = {"arid"};
    };
    class TKE_Occ_UCMC : TKE_Occ_UCN_Temperate
    {
        name = "UCMC";
        file = "TKE_Occ_UCMC";
        climate[] = {"temperate", "tropical", "arid"};
    };
    class TKE_Occ_UCMC_Arctic : TKE_Occ_UCMC
    {
        name = "UCMC (Arctic)";
        file = "TKE_Occ_UCMC_Arctic";
        climate[] = {"arctic"};
    };

    class TKE_Civ_UCN : TKE_Base
    {
        side = "Civ";
        name = "UCN Civilians";
        file = "TKE_Civ_UCN";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
    };

    class TKE_Reb_FCF : TKE_Base
    {
        side = "Reb";
        name = "FCF";
        file = "TKE_Reb_FCF";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_fcf_co.paa);
    };

    // class E22_RAF_Arid : E22_RAF_Base
    // {
    //     side = "Inv";
    //     name = "RAF (Arid)";
    //     file = "E22_RAF_Arid";
    //     description = "";
    //     climate[] = {"arid"};
    // };