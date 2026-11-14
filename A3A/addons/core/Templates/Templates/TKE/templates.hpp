    class TKE_Base
    {
        requiredAddons[] = {
            "TKE_Mod_LoadOrder", // The Kuiper Engagements
            "WBK_SciFiWeaponary", // Weapon Research and Security: Firearms 
            "TKE_Ext_Heli", // Scifi Vehicles Pack
            "TKE_Ext_Ships", // Scifi Spaceship Pack
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

    // Red Dwarf (RD) Related
    #include "templates_rd.hpp"

    // KMC Related
    #include "templates_kmc.hpp"

    // Base TKE
    class TKE_Occ_UCN_Arid : TKE_Base
    {
        side = "Occ";
        name = "UCN (Arid)";
        file = "TKE_Occ_UCN_Arid";
        description = "The United Coalition of Nations is the largest and most populated human government.\n\nThough a democracy which in theory rules by the consent of those it governs, the UCN possesses a large and capable military by which it maintains cohesion by force.\n\nThrough 2026-2060, the UCN consolidated Earth.";
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
        description = "The Mars Dominion is the second largest state in human space.\n\nIn the late 22nd century, separatists on Mars conspired to break free of UCN control by secretly expanding asteroid mining efforts, building Mars' own military, and developing new technology to rival the UCN.\n\nIn 2213, the first UCN-Martian War broke out.";
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
        description = "The UCN economy is markedly more free-market and deregulated compared to the Mars Dominion's economic system, with private enterprise flourishing on Earth and in the frontier colonies.\n\nMega-corporations dominate industries like technology, finance, manufacturing, and resource extraction.";
        priority = 120;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa);
        climate[] = {"temperate", "tropical"};
    };
    class TKE_Civ_UCN_Arctic : TKE_Civ_UCN
    {
        name = "UCN (Arctic)";
        file = "TKE_Civ_UCN_Arctic";
        priority = 119;
        climate[] = {"arctic"};
    };
    class TKE_Civ_UCN_Arid : TKE_Civ_UCN
    {
        name = "UCN (Arid)";
        file = "TKE_Civ_UCN_Arid";
        priority = 118;
        climate[] = {"arid"};
    };
    class TKE_Civ_UCN_Void : TKE_Civ_UCN
    {
        name = "UCN (Voidborne)";
        file = "TKE_Civ_UCN_Void";
        priority = 117;
        climate[] = {"temperate", "tropical", "arid", "arctic"};
    };

    class TKE_Reb_FCF : TKE_Base
    {
        side = "Reb";
        name = "FCF";
        file = "TKE_Reb_FCF";
        description = "Over the past decade, the FCF has conducted several high-profile and organized attacks against UCN security vessels and personnel.\n\nThe FCF has particularly targeted various habitats on or near planetary bodies under UCN control.\n\nIntelligence services of the UCN have harbored long-standing suspicions that the FCF may be receiving covert support from the Mars Dominion.";
        priority = 120;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_fcf_co.paa);
    };
    class TKE_Reb_PMC : TKE_Reb_FCF
    {
        name = "Meridian Frontier";
        file = "TKE_Reb_PMC";
        description = "The Ceres based Meridian Frontier Group specialises in clandestine operations, even having been contracted to train both the UCN CSTR and MD OMOR.\n\nBy 2234, they had become the go-to mercenary for anything that required discretion and plausible deniability.";
        priority = 119;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_mf_co.paa);
    };

    class TKE_Riv_FCF : TKE_Base
    {
        side = "Riv";
        name = "FCF";
        file = "TKE_Riv_FCF";
        description = "Over the past decade, the FCF has conducted several high-profile and organized attacks against UCN security vessels and personnel.\n\nThe FCF has particularly targeted various habitats on or near planetary bodies under UCN control.\n\nIntelligence services of the UCN have harbored long-standing suspicions that the FCF may be receiving covert support from the Mars Dominion.";
        priority = 120;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_fcf_co.paa);
    };
    class TKE_Riv_PMC : TKE_Riv_FCF
    {
        name = "Meridian Frontier";
        file = "TKE_Riv_PMC";
        description = "The Ceres based Meridian Frontier Group specialises in clandestine operations, even having been contracted to train both the UCN CSTR and MD OMOR.\n\nBy 2234, they had become the go-to mercenary for anything that required discretion and plausible deniability.";
        priority = 119;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_mf_co.paa);
    };
