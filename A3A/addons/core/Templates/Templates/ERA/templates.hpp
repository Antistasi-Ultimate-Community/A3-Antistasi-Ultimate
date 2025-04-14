    class ERA_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\ERA);
        priority = 70;
    };

    class ERA_GER : ERA_Base
    {
		requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","bwa3_common","gm_weapons_items","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        side = "Occ";
        flagTexture = "bwa3_common\data\bwa3_flag_germany_co.paa";
		logo = "bwa3_common\data\bwa3_flag_germany_co.paa";
        name = "ERA Germany";
        file = "ERA_AI_GER";
    };