    class ERA_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\ERA);
        priority = 5;
    };

    class ERA_GER_DLC : ERA_Base
    {
		requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","bwa3_common","gm_weapons_items","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Inv";
        flagTexture = "bwa3_common\data\bwa3_flag_germany_co.paa";
		logo = "bwa3_common\data\bwa3_flag_germany_co.paa";
        name = "MultiEra Germany (CDLC)";
        file = "ERA_AI_GER_DLC";
    };
	
	class ERA_USA_DLC : ERA_Base
    {
		requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","vn_weapons","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
		logo = "a3\data_f\flags\flag_us_co.paa";
        name = "MultiEra USA (CDLC)";
        file = "ERA_AI_USA_DLC";
    };
	
	class ERA_USA : ERA_Base
    {
		requiredAddons[] = {"IFA3_Core","uns_weap_w","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
		logo = "a3\data_f\flags\flag_us_co.paa";
        name = "MultiEra USA";
        file = "ERA_AI_USA";
    };
	
	class ERA_RUS : ERA_Base
    {
		requiredAddons[] = {"cwr3_weapons", "NORTH_Main", "CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Inv";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_rus_co.paa";
		logo = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_rus_co.paa";
        name = "MultiEra Russia";
        file = "ERA_AI_RUS";
    };
	
	class ERA_UK : ERA_Base
    {
		requiredAddons[] = {"cwr3_weapons", "cwr3_expansion_uk", "IFA3_Core", "CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
		logo = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "MultiEra UK";
        file = "ERA_AI_UK";
    };