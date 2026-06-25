    class AFR_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\AFR);
        logo = QPATHTOFOLDER(Templates\Templates\AFR\images\flag_afr_ca.paa);
        priority = 60;
        climate[] = {"temperate","tropical","arid","arctic"};
        requiredAddons[] = {"RHS_US_A2Port_Armor", "rhs_c_tanks", "rhsgref_main", "rhssaf_c_vehicles", "simc_hillbilly_core", "simc_uaf_88_core", "tweed_augen"}; // RHSUSAF, AFRF, GREF, SAF, S&S, S&S New Wave, W28
    };

    // The idea here is to have factions that belong to specific countries (e.g AAF, HIDF) as Occupants. Because we don't have a US map...
    class AFR_AAF : AFR_Base
    {
        side = "Occ";
        name = "AAF (AFR)";
        file = "AFR_AAF";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        description = "";
        climate[] = {"arid", "temperate"};
        maps[] = {"altis", "malden"};
    };
    /*
    class AFR_HIDF : AFR_Base
    {
        side = "Occ";
        name = "HIDF (AFR)";
        file = "AFR_HIDF";
        flagTexture = "";
        description = "";
        climate[] = {"tropical"};
        maps[] = {"tanoa"};
    };
    class AFR_NTA : AFR_Base
    {
        side = "Occ";
        name = "NTA (AFR)";
        file = "AFR_NTA";
        flagTexture = "";
        description = "";
        climate[] = {"arid"};
    };
    class AFR_LDF : AFR_Base
    {
        side = "Occ";
        name = "Livonian Defense Forces (AFR)";
        file = "AFR_LDF";
        flagTexture = "";
        description = "";
        climate[] = {"temperate", "arctic"};
    };
    */

    class AFR_US_Army_Arid : AFR_Base
    {
        side = "Inv";
        name = "US Army, Arid (AFR)";
        file = "AFR_US_Army_Arid";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        description = "";
        climate[] = {"arid"};
    };
    class AFR_US_Army_Temperate : AFR_Base
    {
        side = "Inv";
        name = "US Army, Temperate (AFR)";
        file = "AFR_US_Army_Temperate";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        description = "";
        climate[] = {"arid"};
    };
    /*
    class AFR_CSAT_Arid : AFR_Base
    {
        side = "Inv";
        name = "CSAT, Iran (AFR)";
        file = "AFR_IAF";
        flagTexture = "";
        description = "";
        climate[] = {"arid"};
    };
    class AFR_CSAT_Tropical : AFR_Base
    {
        side = "Inv";
        name = "CSAT, China (AFR)";
        file = "AFR_PLA";
        flagTexture = "";
        description = "";
    };
    */

    class AFR_Riv_ION : AFR_Base
    {
        side = "Riv";
        flagTexture = "";
        logo = "";
        name = "ION (AFR)";
        file = "AFR_Riv_ION";
        description = "";
    };
    /*
    class AFR_Riv_SDK : AFR_Base
    {
        side = "Riv";
        flagTexture = "";
        logo = "";
        name = "SDK (AFR)";
        file = "AFR_Riv_SDK";
        description = "";
    };
    class AFR_Riv_LS : AFR_Base
    {
        side = "Riv";
        flagTexture = "";
        logo = "";
        name = "Livonian Separatists (AFR)";
        file = "AFR_Riv_LS";
        description = "";
    };
    */

    class AFR_Reb_FIA : AFR_Base
    {
        side = "Reb";
        name = "FIA (AFR)";
        file = "AFR_Reb_FIA";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        description = $STR_A3AP_setupFactionsTab_fia;
        climate[] = {"arid", "temperate"};
    };
    class AFR_Reb_SDK : AFR_Base
    {
        side = "Reb";
        name = "Syndikat (AFR)";
        file = "AFR_Reb_SDK";
        flagTexture = "\A3\Data_F_Exp\Flags\flag_SYND_CO.paa";
        description = $STR_A3AP_setupFactionsTab_sdk;
        climate[] = {"tropical"};
    };
    /*
    class AFR_Reb_LS : AFR_Base
    {
        side = "Reb";
        name = "Livonian Seperatists (AFR)";
        file = "AFR_Reb_LS";
        flagTexture = "";
        description = "";
        climate[] = {"temperate", "arctic"};
    };
    class AFR_Reb_CTRG : AFR_Base
    {
        side = "Reb";
        name = "CTRG (AFR)";
        file = "AFR_Reb_CTRG";
        flagTexture = "";
        description = "A CTRG detachment in enemy territory.\nThis faction is mostly for fun, wildly overpowered.";
    };
    */
    class AFR_Reb_CTRGxFIA : AFR_Reb_FIA
    {
        name = "CTRG x FIA (AFR)";
        file = "AFR_Reb_CTRGxFIA";
        description = "A CTRG detachment that is advising the FIA.\nThis faction is mostly for fun; the idea is to control your AI loadouts to have the FIA gear and use the CTRG gear yourself.";
    };
    class AFR_Reb_CTRGxSDK : AFR_Reb_SDK
    {
        name = "CTRG x SDK (AFR)";
        file = "AFR_Reb_CTRGxSDK";
        description = "A CTRG detachment that is advising Syndikat.\nThis faction is mostly for fun; the idea is to control your AI loadouts to have the Syndikat gear and use the CTRG gear yourself.";
    };
    /*
    class AFR_Reb_CTRGxLS : AFR_Reb_LS
    {
        name = "CTRG x LS (AFR)";
        file = "AFR_Reb_CTRGxLS";
        description = "A CTRG detachment that is advising the Livonian Separatists.\nThis faction is mostly for fun; the idea is to control your AI loadouts to have the Livonian Separatists gear and use the CTRG gear yourself.";
    };
    */