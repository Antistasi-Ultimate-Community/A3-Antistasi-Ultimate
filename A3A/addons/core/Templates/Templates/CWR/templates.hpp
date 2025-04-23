    // ***************************** CUP *****************************

    class CWR_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        basepath = QPATHTOFOLDER(Templates\Templates\CWR);
        logo = QPATHTOFOLDER(Templates\Templates\CWR\CWR_logo.paa);
        priority = 65;
    };

    class CWR_USArmy_Temperate : CWR_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CWR US Army Temperate";
        file = "CWR_AI_US_Army_Temperate";
		climate[] = {"temperate","tropical","arctic"};
    };
	
    class CWR_USArmy_Arid : CWR_USArmy_Temperate
    {
        name = "CWR US Army Arid";
        file = "CWR_AI_US_Army_Arid";
		climate[] = {"arid"};
    };

    class CWR_USMC_Temperate : CWR_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons", "cwr3_expansion_usmc"};
		side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CWR USMC Temperate";
        file = "CWR_AI_USMC_Temperate";
    };

    class CWR_BAF_Temperate : CWR_Base
    {
		requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons", "cwr3_expansion_uk"};
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CWR BAF Temperate";
        file = "CWR_AI_BAF_Temperate";
    };

    class CWR_USSR_Temperate : CWR_Base
    {
        side = "Occ";
        flagTexture = "cwr3\general\cwr3_flags\data\ussr.paa";
        name = "CWR USSR Temperate";
        file = "CWR_AI_USSR_Temperate";
    };
	
    class CWR_TDF_Arid : CWR_Base
    {
		requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons", "cwr3_expansion_tdf"};
        side = "Occ";
        flagTexture = "cwr3\expansions\cwr3_expansion_tdf\data\flag_tdf_co.paa";
        name = "CWR TDF Arid";
        file = "CWR_AI_TDF_Arid";
    };
	
    class CWR_Reb : CWR_Base
    {
        side = "Reb";
        flagTexture = "cwr3\general\cwr3_flags\data\fia.paa";
        name = "CWR FIA";
        file = "CWR_Reb_FIA";
    };

    class CWR_ComMil : CWR_Base
    {
        side = "Riv";
        flagTexture = "cwr3\general\cwr3_flags\data\belarus_old.paa";
        name = "CWR Militia";
        file = "CWR_Riv_ComMilitia";
    };

    class CWR_TRF : CWR_Base
    {
		requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons", "cwr3_expansion_tdf"};
        side = "Riv";
        flagTexture = "cwr3\expansions\cwr3_expansion_tdf\data\flag_rebels_co.paa";
        name = "CWR Tonali Rebels";
        file = "CWR_Riv_TReb";
    };