//3CBF - CfgVehicles.hpp

class CfgVehicles 
{
    class UK3CB_AAF_B_FV4201;
    class UK3CB_GAF_B_T80UK;
    class UK3CB_B_M270_MLRS_HE_WDL;

    class UK3CB_CW_US_B_EARLY_M60a1;
    class UK3CB_CW_US_B_EARLY_M60a3;
    
    class UK3CB_CHD_B_T34;

    class a3u_olive_t34 : UK3CB_CHD_B_T34
    {
        hiddenSelectionsTextures[] = {"\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_T-series\t34\data\t34_body01_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_T-series\t34\data\t34_body02_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_T-series\t34\data\t34_turret_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_T-series\t34\data\t34_wheels_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_T-series\t34\data\t34_body03_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\UK3CB_Factions_Vehicles_common\data\flag_co.paa"};
    };

    class a3u_olive_fv4201_chieftain : UK3CB_AAF_B_FV4201
    {
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_hull_baf_olive_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_turret_baf_olive_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_sideskirt_baf_olive_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_cannon_baf_olive_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_wheel_baf_olive_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\universal_props_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\flags_baf_ca.paa"};
    };
    class a3u_tan_fv4201_chieftain : a3u_olive_fv4201_chieftain
    {
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_hull_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_turret_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_sideskirt_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_cannon_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_wheel_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\universal_props_co.paa",""};
    };
    class a3u_winter_fv4201_chieftain : a3u_olive_fv4201_chieftain
    {
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_hull_berlin_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_turret_berlin_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_sideskirt_berlin_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_cannon_berlin_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\chieftain_wheel_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\universal_props_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_FV4201\data\flags_baf_ca.paa"};
    };

    class a3u_tan_m60a1 : UK3CB_CW_US_B_EARLY_M60a1
    {
        hiddenSelectionsMaterials[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp.rvmat"};
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp_des_ca.paa"};
    };
    class a3u_winter_m60a1 : a3u_tan_m60a1
    {
        hiddenSelectionsMaterials[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp.rvmat"};
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret_snowt_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull_snowt_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail_snowt_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp_snowt_ca.paa"};
    };

    class a3u_tan_m60a3 : UK3CB_CW_US_B_EARLY_M60a3
    {
        hiddenSelectionsMaterials[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp.rvmat"};
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels_des_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp_des_ca.paa"};
    };
    class a3u_winter_m60a3 : a3u_tan_m60a3
    {
        hiddenSelectionsMaterials[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels.rvmat","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp.rvmat"};
        hiddenSelectionsTextures[] = {"UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_turret_snowt_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_hull_snowt_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_detail_snowt_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_wheels_co.paa","UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M60\data\M60_transp_snowt_ca.paa"};
    };

    class a3u_olive_t80uk : UK3CB_GAF_B_T80UK
    {
        textureList[] = {"SOV",1};
        animationList[] = {"nsvtHide", 1};
        hiddenSelectionsTextures[] = {"rhsafrf\addons\rhs_t80u\data\rhs_t80u_01_co.paa","rhsafrf\addons\rhs_t80u\data\rhs_t80u_02a_co.paa","rhsafrf\addons\rhs_t80u\data\rhs_t80u_03_co.paa","rhsafrf\addons\rhs_t80u\data\shotram_co.paa"};
    };

    class a3u_olive_mlrs : UK3CB_B_M270_MLRS_HE_WDL
    {
        hiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_himars\data\m142_rear_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M270\data\mlrs_hull_olive_co.paa"};
    };
    class a3u_tan_mlrs : a3u_olive_mlrs
    {
        hiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_himars\data\m142_rear_d_co.paa","\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\armour\UK3CB_Factions_Vehicles_M270\data\mlrs_hull_desert_co.paa"};
    };
};
