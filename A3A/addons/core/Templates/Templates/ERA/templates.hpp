    class ERA_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\ERA);
        priority = 5;
    };

    class ERA_GER : ERA_Base
    {
		requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","bwa3_common","gm_weapons_items","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Inv";
        flagTexture = "bwa3_common\data\bwa3_flag_germany_co.paa";
		logo = "bwa3_common\data\bwa3_flag_germany_co.paa";
        name = "ERA Germany";
        file = "ERA_AI_GER";
    };
	
	class ERA_USA : ERA_Base
    {
		requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","vn_weapons","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
		logo = "a3\data_f\flags\flag_us_co.paa";
        name = "ERA USA";
        file = "ERA_AI_USA";
    };