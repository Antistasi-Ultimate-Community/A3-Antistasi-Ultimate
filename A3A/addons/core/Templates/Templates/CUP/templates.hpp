    // ***************************** CUP *****************************

    class CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        basepath = QPATHTOFOLDER(Templates\Templates\CUP);
        logo = "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa";
        priority = 60;
    };

    class CUP_ACR_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa";
        name = "CUP ACR Arid";
        file = "CUP_AI_ACR_Arid";
        climate[] = {"arid"};
    };
    class CUP_ACR_Temperate : CUP_ACR_Arid
    {
        name = "CUP ACR Temperate";
        file = "CUP_AI_ACR_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_AFRF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa";
        name = "CUP AFRF Arid";
        file = "CUP_AI_AFRF_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aegis_afrf;
    };
    class CUP_AFRF_Temperate : CUP_AFRF_Arid
    {
        name = "CUP AFRF Temperate";
        file = "CUP_AI_AFRF_Temperate";
        climate[] = {"temperate","tropical"};
    };
    class CUP_AFRF_Arctic : CUP_AFRF_Arid
    {
        name = "CUP AFRF Arctic";
        file = "CUP_AI_AFRF_Arctic";
        climate[] = {"arctic"};
    };

    class CUP_NATO_Temperate : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "CUP NATO Temperate";
        file = "CUP_AI_NATO_Temperate";
    };

    class CUP_BAF_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CUP BAF Arid";
        file = "CUP_AI_BAF_Arid";
        climate[] = {"arid"};
    };
    class CUP_BAF_Temperate : CUP_BAF_Arid
    {
        name = "CUP BAF Temperate";
        file = "CUP_AI_BAF_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_CDF_Arctic : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa";
        name = "CUP CDF Arctic";
        file = "CUP_AI_CDF_Arctic";
        climate[] = {"arctic"};
        maps[] = {"chernarus_winter"};
        description = $STR_A3AP_setupFactionsTab_cdf;
    };
    class CUP_CDF_Temperate : CUP_CDF_Arctic
    {
        name = "CUP CDF Temperate";
        file = "CUP_AI_CDF_Temperate";
        climate[] = {"temperate"};
        maps[] = {"chernarus_summer","chernarus"};
    };

    class CUP_RACS_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa";
        name = "CUP RACS Arid";
        file = "CUP_AI_RACS_Arid";
        climate[] = {"arid"};
        maps[] = {"sara"};
    };
    class CUP_RACS_Tropical : CUP_RACS_Arid
    {
        name = "CUP RACS Tropical";
        file = "CUP_AI_RACS_Tropical";
        climate[] = {"tropical"};
        maps[] = {"tanoa"};
    };

    class CUP_SLA : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_sla_co.paa";
        name = "CUP SLA";
        file = "CUP_AI_SLA_Temperate";          // Sahrani is a bit weird
        climate[] = {"arid","temperate"};
        maps[] = {"sara"};
    };

    class CUP_TKA : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKA";
        file = "CUP_AI_TKA_Arid";
        climate[] = {"arid"};
        maps[] = {"takistan","kunduz"};
    };

    class CUP_USAF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP US Army Arid";
        file = "CUP_AI_US_Army_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_usaf;
    };
    class CUP_USAF_Temperate : CUP_USAF_Arid
    {
        name = "CUP US Army Temperate";
        file = "CUP_AI_US_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_USMC_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP USMC Arid";
        file = "CUP_AI_US_Marine_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_usmc;
    };
    class CUP_USMC_Temperate : CUP_USMC_Arid
    {
        name = "CUP USMC Temperate";
        file = "CUP_AI_US_Marine_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_ION_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "CUP ION Arid";
        file = "CUP_AI_ION_Arid";
        climate[] = {"arid","temperate","tropical"};
    };
    class CUP_ION_Temperate : CUP_ION_Arid
    {
        name = "CUP ION Arctic";
        file = "CUP_AI_ION_Arctic";
        climate[] = {"arctic"};
    };

    class CUP_BW_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_ger_co.paa";
        name = "CUP BW Arid";
        file = "CUP_AI_BW_Arid";
        climate[] = {"arid"};
    };
        class CUP_BW_Temperate : CUP_BW_Arid
    {
        name = "CUP BW Temperate";
        file = "CUP_AI_BW_Temperate";
        climate[] = {"arctic","temperate","tropical"};
    };
        class CUP_HIL : CUP_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "CUP HIL";
        file = "CUP_AI_HIL";
        climate[] = {"temperate","tropical"};
    };
    class CUP_TKM : CUP_Base
    {
        side = "Reb";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKM";
        file = "CUP_Reb_TKM";
    };
    class CUP_Reb : CUP_Base
    {
        side = "Reb";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa";
        name = "CUP NAPA";
        file = "CUP_Reb_NAPA";
        description = $STR_A3AP_setupFactionsTab_napa_3cbf;
    };
    class CUP_Reb_EM : CUP_Reb
    {
        name = "Eastern Loyalists";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CUP\images\flag_old_soviet_co.paa);
        file = "CUP_Reb_EM";
        description = "A generic militarized militia using surplus or outdated Soviet technology. Loyal to the East. Consider this a more forgiving start than most.";
    };
    class CUP_Reb_WM : CUP_Reb
    {
        name = "Western Loyalists";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CUP\images\flag_old_nato_co.paa);
        file = "CUP_Reb_WM";
        description = "A generic militarized militia using surplus or outdated NATO technology. Loyal to the West. Consider this a more forgiving start than most.";
    };
    class CUP_TKC : CUP_Base
    {
        side = "Civ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKC";
        file = "CUP_Civ_TKC";
    };
    class CUP_Civ : CUP_Base
    {
        side = "Civ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_chernarus_co.paa";
        name = "CUP CHC";
        file = "CUP_Civ_CHC";
    };
    class CUP_CHDKZ : CUP_Base
    {
        side = "Riv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_chdkz_co.paa";
        name = "CUP CHDKZ";
        file = "CUP_Riv_CHDKZ";
        description = $STR_A3AP_setupFactionsTab_chdkz;
    };
    class CUP_LRI : CUP_Base
    {
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CUP\flag_LRI_co.paa);
        name = "CUP LRI";
        file = "CUP_Reb_LRI";
        description = $STR_A3AP_setupFactionsTab_CUP_LRI;
    };
	
    class LDF_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_LDF_Faction"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        priority = 61;
    };
	
    class CUP_LDF : LDF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "CUP LDF";
        file = "CUP_AI_LDF";
    };
    class HAFM_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "HAFM_Acc"};
        priority = 61;
	};
    //CUP NorAF
    class NorAF_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_NOR_Faction"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        priority = 61;
    };

    class CUP_HAFM : HAFM_Base
    {
        side = "Occ";
        flagTexture = "\A3\ui_f\data\map\markers\flags\Greece_ca.paa";
        name = "CUP HAFM";
        file = "CUP_AI_HAFM";
	};
    class CUP_NorAF_Temperate : NorAF_Base
    {
        side = "Occ";
        flagTexture = "\A3\ui_f\data\map\markers\flags\Norway_ca.paa";
        name = "CUP NorAF Temperate";
        file = "CUP_AI_NorAF_Temperate";
        climate[] = {"temperate","tropical"};
    };

    class CUP_NorAF_Arctic : CUP_NorAF_Temperate
    {
        name = "CUP NorAF Arctic";
        file = "CUP_AI_NorAF_Arctic";
        climate[] = {"arctic"};
    };

    class EST_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Estraria_Army", "DEGA_Vehicles_V22", "BVC_Facewear"};
        priority = 61;
    };
	
    class CUP_EST : EST_Base
    {
        side = "Occ";
        flagTexture = "\EST_Markers\Data\Marker_EST.paa";
        name = "CUP Estraria";
        file = "CUP_AI_EST";
    };

    class CAF2035_Base : CUP_Base
    { 
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "PUP_CAF", "Weapons_F_JCA_AWM", "vests_f_JCA_MCRP", "A3_Aegis_Air_F_Aegis", "Weapons_1_F_lxWS"};//Unfortunately it requires a bit of random single mods from just the base CAF 2035
        priority = 61;
    };
    class CAF2035 : CAF2035_Base
    {
        side = "Occ";
        flagTexture = "\A3\ui_f\data\map\markers\flags\Canada_ca.paa";
        name = "CUP CAF";
        file = "CUP_AI_CAF2035";
        description = "CUP/Aegis Mixed Canadian Armed Forces 2035";
    };

    // ***************************** The Lombakkan Crisis *****************************
    
    class CUP_LC_Base: CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_LOM_Equipment"};
        basepath = QPATHTOFOLDER(Templates\Templates\CUP);
        logo = QPATHTOFOLDER(Templates\Templates\CUP\images\CUP_LC_logo_mod.paa);
    };

    class CUP_LC_SLDF : CUP_LC_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_LOM_Equipment", "Flex_CUP_SLDF_Faction"};
        side = "Inv";
        flagTexture = "Flex_CUP_SLDF_Faction\Data\Flag\SLOM_Flag_co.paa";
        name = "CUP LC SLDF";
        description = "Having emerged defeated from the civil war, the south continues to have good relations with former colonies and beyond. After the civil war, the army underwent various reforms for modernization, also favoring better organization. The army is composed mainly of motorized and mechanized units with good air support.";
        file = "CUP_AI_LC_SLDF";
    };

    class CUP_LC_NLAF : CUP_LC_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_LOM_Equipment", "Flex_CUP_NLAF_Faction"};
        side = "Occ";
        flagTexture = "Flex_CUP_NLAF_Faction\Data\Flag\NLOM_Flag_co.paa";
        name = "CUP LC NLAF & UN Peacekeepers";
        description = "After the successful independence from the south and the colonies, the north can count on neighboring allies and UN Peacekeepers. After the civil war, a mainly conscript but well-trained army was formed, even if the government's economic resources are not the best, the army can count on a good choice of vehicles and equipment. The army is composed mainly of motorized and mechanized units with good air support accompanied by a small support militia.";
        file = "CUP_AI_LC_NLAF";
    };

    class CUP_LC_LUF : CUP_LC_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_LOM_Equipment", "Flex_CUP_LUF_Faction"};
        side = "Reb";
        flagTexture = "Flex_CUP_LUF_Faction\Data\Flag\LUF_Flag_co.paa";
        name = "CUP LC LUF";
        description = "One of the many armed groups in the region that thanks to the latest messes is finding consensus among the population. The goal of the LUF is to unite the entire region of Lombakka into one nation, the way is to eliminate the two governments. This paramilitary group composed of deserters and mercenaries has at its disposal vehicles and equipment dating back to the civil war, although not well organized they give hard time to both armies.";
        file = "CUP_Reb_LC_LUF";
    };

    class CUP_LC_BOC : CUP_LC_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_LOM_Equipment", "Flex_CUP_BOC_Faction"};
        side = "Riv";
        flagTexture = "Flex_CUP_BOC_Faction\Data\Flag\BOC_Flag_co.paa";
        name = "CUP LC BOC";
        description = "After the tensions on the border, the armed forces of Bocano are on high alert for possible incursions of the LUF rebels into the national territory. Although it has declared itself neutral, Bocano has good relations with North Lombakka. The army is composed mainly of conscripts and is characterized by equipment and vehicles that come from the Cold War.";
        file = "CUP_Riv_LC_BOC";
    };

    class CUP_AFR_CIV : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs"};
        basepath = QPATHTOFOLDER(Templates\Templates\CUP);
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CUP\images\flag_CUP_Civ_AFR.paa);
        name = "CUP AFR CIV";
        file = "CUP_Civ_AFR";
        
    class FlexPOL_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_POL_Faction"};
        priority = 61;
    };

    class Flex_POL : FlexPOL_Base
    {
        side = "Occ";
        flagTexture = "\A3\ui_f\data\map\markers\flags\Poland_ca.paa";
        name = "CUP Polish Armed Forces";
        file = "CUP_AI_POL";
    };

    class FlexPLA_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_PLA_Faction"};
        priority = 61;
    };

    class Flex_PLA : FlexPLA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\PLA_Flag.paa);
        name = "CUP PLA";
        file = "CUP_AI_PLA";
    };

    class FlexFDF_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_FIN_Faction", "KAR_RK62"};
        priority = 61;
    };

    class Flex_FDF : FlexFDF_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_fin_co.paa);
        name = "CUP Finnish Defense Force";
        file = "CUP_AI_FDF";
    };

    class FlexSPA_Base : CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Flex_CUP_SPA_Faction"};
        priority = 61;
    };

    class Flex_SPA : FlexSPA_Base
    {
        side = "Occ";
        flagTexture = "\A3\ui_f\data\map\markers\flags\Spain_ca.paa";
        name = "CUP Spain";
        file = "CUP_AI_SPA";
    };
