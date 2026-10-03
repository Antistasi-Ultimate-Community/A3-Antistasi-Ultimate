    class MOD_Base
    {
        requiredAddons[] = {
            "aFunnyCfgPatchesClass", // Name of the mod on steam
        }; 
        logo = QPATHTOFOLDER(Templates\Templates\MOD\images\mod_name_faction_ca.paa);
        basepath = QPATHTOFOLDER(Templates\Templates\MOD);
        priority = 70;
        climate[] = {"temperate","tropical","arid","arctic"};
    };

    // Occ + Inv use the exact same logic; just swap Occ to Inv accordingly
    class MOD_Occ_FACTION : MOD_Base
    {
        side = "Occ";
        name = "FACTION";
        file = "MOD_Occ_FACTION";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\MOD\images\flag_FACTION_co.paa);
    };
    /*
    class MOD_Occ_FACTION_Temperate : MOD_Occ_FACTION
    {
        name = "FACTION (Temperate)";
        file = "MOD_Occ_FACTION_Temperate";
        climate[] = {"temperate"};
    };
    class MOD_Occ_FACTION_Arid : MOD_Occ_FACTION
    {
        name = "FACTION (Arid)";
        file = "MOD_Occ_FACTION_Arid";
        climate[] = {"arid"};
    };
    */

    class MOD_Civ_FACTION : MOD_Base
    {
        side = "Civ";
        name = "FACTION Civilians";
        file = "MOD_Civ_FACTION";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\MOD\images\flag_FACTION_co.paa);
    };

    class MOD_Reb_FACTION : MOD_Base
    {
        side = "Reb";
        name = "FACTION";
        file = "MOD_Reb_FACTION";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\MOD\images\flag_FACTION_co.paa);
    };

    /*
    class MOD_Riv_FACTION : MOD_Base
    {
        side = "Riv";
        name = "FACTION";
        file = "MOD_Riv_FACTION";
        description = "";
        flagTexture = QPATHTOFOLDER(Templates\Templates\MOD\images\flag_FACTION_co.paa);
    };
    */