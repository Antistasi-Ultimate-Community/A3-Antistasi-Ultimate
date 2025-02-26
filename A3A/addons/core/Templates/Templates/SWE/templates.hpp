    class SFP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "sfp_soldiers"};        // units, weapons, vehicles
        basepath = QPATHTOFOLDER(Templates\Templates\SWE);
        logo = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        priority = 90;
    };

    class SFP_SWE_Temperate : SFP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        name = "SFP Sweden Temperate";
        file = "SFP_AI_SWE_Temperate";
        climate[] = {"temperate","tropical"};
    };

    class SFP_SWE_Arid : SFP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        name = "SFP Sweden Arid";
        file = "SFP_AI_SWE_Arid";
        climate[] = {"arid"};
    };
	
    class SFP_SWE_Arctic : SFP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        name = "SFP Sweden Winter";
        file = "SFP_AI_SWE_Arctic";
        climate[] = {"arctic"};
    };

    class FFP_Base : SFP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "sfp_soldiers", "Finnish_Forces_Pack"};        // units, weapons, vehicles
        basepath = QPATHTOFOLDER(Templates\Templates\SWE);
        logo = "\ffp_config\data\flag\fin_flag_map_ca.paa";
        priority = 90;
    };

    class FFP_Fin_Temperate : FFP_Base
    {
        side = "Occ";
        flagTexture = "\ffp_config\data\flag\fin_flag_ca.paa";
        name = "FFP Finland Temperate";
        file = "FFP_AI_FIN_Temperate";
        climate[] = {"temperate","tropical"};
    };

    class FFP_Fin_Arctic : FFP_Fin_Temperate
    {
        name = "FFP Finland Winter";
        file = "FFP_AI_FIN_Arctic";
        climate[] = {"arctic"};
    };