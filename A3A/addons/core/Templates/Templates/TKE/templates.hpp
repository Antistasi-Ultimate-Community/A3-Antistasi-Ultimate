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
        priority = 115;
        climate[] = {"temperate","tropical","arid","arctic"};
    };
    class TKE_RD_Base : TKE_Base
    {
        requiredAddons[] += {"TKE_Red_Dwarf_HC"}; // TKE - Red Dwarf
        priority = 110;
    };
    class TKE_KMC_Base : TKE_Base
    {
        requiredAddons[] += {"KMC_mod"}; // TKE - Kuiper Mining Corporation
        priority = 100;
    };

    // KMC Related
    class TKE_Occ_KMC : TKE_KMC_Base
    {
        side = "Occ";
        name = "KMC";
        file = "TKE_Occ_KMC";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_kmc_co.paa);
    };

    class TKE_Civ_KMC : TKE_KMC_Base
    {
        side = "Civ";
        name = "KMC Civilians";
        file = "TKE_Civ_KMC";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_kmc_co.paa);
    };
    class TKE_Civ_KMC_Void : TKE_Civ_KMC
    {
        name = "KMC Civilians (Voidborne)";
        file = "TKE_Civ_KMC_Void";
    };

    class TKE_Reb_WU : TKE_KMC_Base
    {
        side = "Reb";
        name = "KMC Workers Union";
        file = "TKE_Reb_WU";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_wu_co.paa);
    };

    class TKE_Riv_WU : TKE_KMC_Base
    {
        side = "Riv";
        name = "KMC Workers Union";
        file = "TKE_Riv_WU";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_wu_co.paa);
    };

    // Base TKE
    class TKE_Occ_UCN_Arid : TKE_Base
    {
        side = "Occ";
        name = "UCN (Arid)";
        file = "TKE_Occ_UCN_Arid";
        description = "";
        priority = 120;
        climate[] = {"arid"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
    };
    class TKE_Occ_UCN_Temperate : TKE_Occ_UCN_Arid
    {
        name = "UCN (Temperate)";
        file = "TKE_Occ_UCN_Temperate";
        priority = 119;
        climate[] = {"temperate"};
    };
    class TKE_Occ_UCMC : TKE_Occ_UCN_Arid
    {
        name = "UCMC";
        file = "TKE_Occ_UCMC";
        priority = 118;
        climate[] = {"temperate", "tropical", "arid"};
    };
    class TKE_Occ_UCMC_Arctic : TKE_Occ_UCMC
    {
        name = "UCMC (Arctic)";
        file = "TKE_Occ_UCMC_Arctic";
        priority = 117;
        climate[] = {"arctic"};
    };
    class TKE_Occ_UCMC_Void : TKE_Occ_UCMC
    {
        name = "UCMC (Voidborne)";
        file = "TKE_Occ_UCMC_Void";
        priority = 116;
        climate[] = {"temperate", "tropical", "arid", "arctic"};
    };

    class TKE_Inv_MD_Arid : TKE_Base
    {
        side = "Inv";
        name = "MD (Arid)";
        file = "TKE_Inv_MD_Arid";
        description = "";
        priority = 120;
        climate[] = {"arid"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_md_co.paa);
    };
    class TKE_Inv_MD_Temperate : TKE_Inv_MD_Arid
    {
        name = "MD (Temperate)";
        file = "TKE_Inv_MD_Temperate";
        priority = 119;
        climate[] = {"temperate"};
    };
    class TKE_Inv_MD_Arctic : TKE_Inv_MD_Arid
    {
        name = "MD (Arctic)";
        file = "TKE_Inv_MD_Arctic";
        priority = 118;
        climate[] = {"arctic"};
    };
    class TKE_Inv_MD_Void : TKE_Inv_MD_Arid
    {
        name = "MD (Voidborne)";
        file = "TKE_Inv_MD_Void";
        priority = 117;
        climate[] = {"temperate", "tropical", "arid", "arctic"};
    };

    class TKE_Civ_UCN : TKE_Base
    {
        side = "Civ";
        name = "UCN Civilians";
        file = "TKE_Civ_UCN";
        description = "";
        priority = 120;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
        climate[] = {"temperate", "tropical"};
    };
    class TKE_Civ_UCN_Arctic : TKE_Civ_UCN
    {
        name = "UCN Civilians (Arctic)";
        file = "TKE_Civ_UCN_Arctic";
        priority = 119;
        climate[] = {"arctic"};
    };
    class TKE_Civ_UCN_Arid : TKE_Civ_UCN
    {
        name = "UCN Civilians (Arid)";
        file = "TKE_Civ_UCN_Arid";
        priority = 118;
        climate[] = {"arid"};
    };
    class TKE_Civ_UCN_Void : TKE_Civ_UCN
    {
        name = "UCN Civilians (Voidborne)";
        file = "TKE_Civ_UCN_Void";
        priority = 117;
        climate[] = {"temperate", "tropical", "arid", "arctic"};
    };

    class TKE_Reb_FCF : TKE_Base
    {
        side = "Reb";
        name = "FCF";
        file = "TKE_Reb_FCF";
        description = "";
        priority = 120;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_fcf_co.paa);
    };
    class TKE_Reb_PMC : TKE_Reb_FCF
    {
        name = "ION PMC";
        file = "TKE_Reb_PMC";
        priority = 119;
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
    };

    class TKE_Riv_FCF : TKE_Base
    {
        side = "Riv";
        name = "FCF";
        file = "TKE_Riv_FCF";
        description = "";
        priority = 120;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_fcf_co.paa);
    };
    class TKE_Riv_PMC : TKE_Riv_FCF
    {
        name = "ION PMC";
        file = "TKE_Riv_PMC";
        priority = 119;
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
    };