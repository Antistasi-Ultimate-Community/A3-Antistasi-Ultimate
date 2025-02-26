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
        name = "UNSC";
        file = "OPTRE_AI_UNSC";
        climate[] = {"arid", "temperate"};
        description = "The UNSC";
    };
    class OPTRE_UNSC_desert : OPTRE_UNSC
    {
        name = "UNSC Desert";
        file = "OPTRE_AI_UNSC_desert";
        climate[] = {"arid", "temperate"};
    };
    class OPTRE_UNSC_snow : OPTRE_UNSC
    {
        name = "UNSC Snow";
        file = "OPTRE_AI_UNSC_snow";
        climate[] = {"arctic"};
    };
    class OPTRE_UNSC_tropical : OPTRE_UNSC
    {
        name = "UNSC Tropical";
        file = "OPTRE_AI_UNSC_tropical";
        climate[] = {"tropical"};
    };

    class OPTRE_Cov : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_covenant_ca.paa);
        name = "Covenant (Elites)";
        file = "OPTRE_AI_Covenant";
        description = "The Covenant (With OPTRE elites)";
    };
    class OPTRE_Cov_Grunts : OPTRE_Cov
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core", "WBK_Halo_Alients"};
        name = "Covenant (WBK Elites)";
        file = "OPTRE_AI_Covenant_Grunts";
        description = "The Covenant (With Webknights elites and grunts)";
    };
    class OPTRE_Ins : OPTRE_Cov
    {
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "Insurrection";
        file = "OPTRE_AI_Insurrection";
        description = "Generic insurrectionists, as an alternative to Covenant.";
    };

    class OPTRE_Reb : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core"};
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "Insurrectionists";
        file = "OPTRE_Reb_Ins";
        description = "Led by Jerald Mulkey Ander, this faction fights to be free from the reign of the UNSC. They are similar to the United Rebel Front, but have no army to back up their cause. Yet.";
    };
    class OPTRE_Reb_ODST : OPTRE_Reb
    {
        priority = 15;
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa);
        name = "ODST";
        file = "OPTRE_Reb_ODST";
        description = "Dropped feet first into hostile territory, you are tasked with covertly liberating the local population.\n\nThis faction is meant to be used in conjunction with the Covenant. Due to that, this faction may be seen as extremely overpowered.";
    };
    class OPTRE_Reb_UNSC : OPTRE_Reb_ODST
    {
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa);
        name = "UNSC";
        file = "OPTRE_Reb_UNSC";
        description = "Sent behind enemy lines to gather intelligence on the Insurrection, you were shocked when the Covenant invaded. The UNSC (United Nations Space Command) fleet has been decimated, there will be no reinforcements...\n\nThis faction is meant to be used in conjunction with the Covenant. Due to that, this faction may be seen as overpowered.";
    };
    class OPTRE_Reb_DME : OPTRE_Reb_ODST
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "DME";
        file = "OPTRE_Reb_DME";
        description = "The DME (Dark Moon Enterprises) is a private security company. The planet you were providing security for eventually made contact with the Covenant, leading to today. The DME hierarchy has collapsed, and you are now alone.\n\nThis faction is meant to be used in conjunction with the Covenant. Due to that, this faction may be seen as overpowered.";
    };

    class OPTRE_Riv : OPTRE_Reb
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "United Rebel Front";
        file = "OPTRE_Riv_Ins";
        description = "Led by Colonel Watts, this faction originally fought with the insurrectionists. They hate each other due to different ideals, but still use similar equipment.";
    };

    class OPTRE_Civ : OPTRE_Reb
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "OPTRE Civs";
        file = "OPTRE_Civ";
        description = "OPTRE Civilians. Some of them are even forklift certified.";
    };
    class OPTRE_Civ_Flood : OPTRE_Civ
    {
        requiredAddons[] = {"OPTRE_Core", "dev_common"};
        name = "OPTRE Flood";
        file = "OPTRE_Civ_Flood";
        description = "OPTRE Flood Combat Forms.";
    };