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

    class TKE_Occ_KMC : TKE_KMC_Base
    {
        side = "Occ";
        name = "KMC";
        file = "TKE_Occ_KMC";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_kmc_co.paa);
    };

    class TKE_Occ_UCN_Arid : TKE_Base
    {
        side = "Occ";
        name = "UCN (Arid)";
        file = "TKE_Occ_UCN_Arid";
        description = "";
        climate[] = {"arid"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
    };
    class TKE_Occ_UCN_Temperate : TKE_Occ_UCN_Arid
    {
        name = "UCN (Temperate)";
        file = "TKE_Occ_UCN_Temperate";
        climate[] = {"temperate"};
    };
    class TKE_Occ_UCMC : TKE_Occ_UCN_Arid
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
    class TKE_Occ_UCMC_Void : TKE_Occ_UCMC
    {
        name = "UCMC (Voidborne)";
        file = "TKE_Occ_UCMC_Void";
        climate[] = {"temperate", "tropical", "arid", "arctic"};
    };

    class TKE_Inv_MD_Arid : TKE_Base
    {
        side = "Inv";
        name = "MD (Arid)";
        file = "TKE_Inv_MD_Arid";
        description = "";
        climate[] = {"arid"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_md_co.paa);
    };
    class TKE_Inv_MD_Temperate : TKE_Inv_MD_Arid
    {
        name = "MD (Temperate)";
        file = "TKE_Inv_MD_Temperate";
        climate[] = {"temperate"};
    };
    class TKE_Inv_MD_Arctic : TKE_Inv_MD_Arid
    {
        name = "MD (Arctic)";
        file = "TKE_Inv_MD_Arctic";
        climate[] = {"arctic"};
    };
    class TKE_Inv_MD_Void : TKE_Inv_MD_Arid
    {
        name = "MD (Voidborne)";
        file = "TKE_Inv_MD_Void";
        climate[] = {"temperate", "tropical", "arid", "arctic"};
    };

    class TKE_Civ_UCN : TKE_Base
    {
        side = "Civ";
        name = "UCN Civilians";
        file = "TKE_Civ_UCN";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
        climate[] = {"temperate", "tropical"};
    };
    class TKE_Civ_UCN_Arctic : TKE_Civ_UCN
    {
        name = "UCN Civilians (Arctic)";
        file = "TKE_Civ_UCN_Arctic";
        climate[] = {"arctic"};
    };
    class TKE_Civ_UCN_Arid : TKE_Civ_UCN
    {
        name = "UCN Civilians (Arid)";
        file = "TKE_Civ_UCN_Arid";
        climate[] = {"arid"};
    };
    // +Voidborne

    class TKE_Reb_FCF : TKE_Base
    {
        side = "Reb";
        name = "FCF";
        file = "TKE_Reb_FCF";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_fcf_co.paa);
    };