    class OPTRE_Base
    {
        logo = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_mod_ca.paa);
        basepath = QPATHTOFOLDER(Templates\Templates\OPTRE);
        priority = 16;
        climate[] = {"temperate","tropical","arid","arctic"};
    };

    class OPTRE_UNSC : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_UNSC_name;
        file = "OPTRE_AI_UNSC";
        climate[] = {"arid", "temperate"};
        description = $STR_A3AP_setupFactionsTab_OPTRE_UNSC;
    };
    class OPTRE_UNSC_desert : OPTRE_UNSC
    {
        name = $STR_A3AP_setupFactionsTab_OPTRE_UNSC_desert_name;
        file = "OPTRE_AI_UNSC_desert";
        climate[] = {"arid"};
    };
    class OPTRE_UNSC_snow : OPTRE_UNSC
    {
        name = $STR_A3AP_setupFactionsTab_OPTRE_UNSC_snow_name;
        file = "OPTRE_AI_UNSC_snow";
        climate[] = {"arctic"};
    };
    class OPTRE_UNSC_tropical : OPTRE_UNSC
    {
        name = $STR_A3AP_setupFactionsTab_OPTRE_UNSC_tropical_name;
        file = "OPTRE_AI_UNSC_tropical";
        climate[] = {"tropical"};
    };

    class OPTRE_Cov : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_covenant_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_Cov_name;
        file = "OPTRE_AI_Covenant";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Cov;
    };
    class OPTRE_Ins : OPTRE_Cov
    {
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_Ins_name;
        file = "OPTRE_AI_Insurrection";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Ins;
    };

    class OPTRE_Reb : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core"};
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_Reb_name;
        file = "OPTRE_Reb_Ins";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Reb;
    };
    class OPTRE_Reb_ODST : OPTRE_Reb
    {
        priority = 15;
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa);
        name = "ODST"; // STR_A3AP_setupFactionsTab_OPTRE_Reb_ODST_name
        file = "OPTRE_Reb_ODST";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Reb_ODST;
    };
    class OPTRE_Reb_UNSC : OPTRE_Reb_ODST
    {
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_UNSC_name;
        file = "OPTRE_Reb_UNSC";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Reb_UNSC;
    };
    class OPTRE_Reb_DME : OPTRE_Reb_ODST
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_Reb_DME_name;
        file = "OPTRE_Reb_DME";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Reb_DME;
    };

    class OPTRE_Riv : OPTRE_Reb
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_Riv_name;
        file = "OPTRE_Riv_Ins";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Riv;
    };

    class OPTRE_Civ : OPTRE_Reb
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = $STR_A3AP_setupFactionsTab_OPTRE_Civ_name;
        file = "OPTRE_Civ";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Civ;
    };
    class OPTRE_Civ_Flood : OPTRE_Civ
    {
        requiredAddons[] = {"OPTRE_Core", "dev_common"};
        name = $STR_A3AP_setupFactionsTab_OPTRE_Civ_Flood_name;
        file = "OPTRE_Civ_Flood";
        description = $STR_A3AP_setupFactionsTab_OPTRE_Civ_Flood;
    };