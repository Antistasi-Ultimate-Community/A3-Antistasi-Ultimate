["attributesVehicles", [
    ["I_SDV_01_F", ["rebCost", 3000]],
    ["I_Boat_Armed_01_minigun_F", ["rebCost", 5000]],
    ["O_Boat_Armed_01_hmg_F", ["rebCost", 4000]],
    ["a3a_C_Heli_Transport_02_F", ["rebCost", 8000]],
    ["a3a_C_Heli_Light_02_blue_F", ["rebCost", 6500]],
    //WS
    ["I_C_Offroad_02_LMG_F", ["rebCost", 500]],
    ["I_G_Offroad_01_armor_base_lxWS", ["rebCost", 500]],
    ["I_G_Offroad_01_armor_armed_lxWS", ["rebCost", 1100]],
    ["I_G_Offroad_01_armor_AT_lxWS", ["rebCost", 1500]],

    ///apex
    ["I_C_Offroad_02_unarmed_F", ["rebCost", 150]],
    ["I_C_Offroad_02_AT_F", ["rebCost", 1200]],
    //RF
    ["I_G_Pickup_rf", ["rebCost", 400]],
    ["a3u_black_Pickup_mmg_alt_rf", ["rebCost", 700]],
    ["a3u_black_Pickup_mmg_frame_rf", ["rebCost", 700]],
    ["I_G_Pickup_hmg_rf", ["rebCost", 600]],
    ///gm
    ["gm_pl_army_ural4320_cargo", ["rebCost", 350]],
    ["gm_dk_army_u1300l_container", ["rebCost", 400]],
    ["gm_ge_army_kat1_451_cargo", ["rebCost", 500]],
    ["gm_ge_army_k125", ["rebCost", 100]],
    ["gm_xx_civ_bicycle_01", ["rebCost", 50]],
    ["gm_ge_dbp_bicycle_01_ylw", ["rebCost", 50]],
    //csla
    ["CSLA_F813", ["rebCost", 600]],
    ["CSLA_F813o", ["rebCost", 600]],
    ["CSLA_CIV_JARA250", ["rebCost", 100]],
    ["US85_TT650", ["rebCost", 100]],

    //vn
    ["vn_o_air_mig19_gun", ["rebCost", 999999]],
	
    ["vn_i_static_m60_high", ["rebCost", 300]],//7.62 static
	//Civ Cars
    ["vn_c_car_01_01", ["rebCost", 150]], //No Cargo, 4 Seats, 121 speed
    ["vn_c_car_03_01", ["rebCost", 150]], //No Cargo 4 Seats 130 speed
    ["vn_c_car_04_01", ["rebCost", 250]], //no Cargo, 6 Seats 101 speed
    ["vn_c_wheeled_m151_01", ["rebCost", 100]], //no Cargo, 3 Seats 105 speed
	["vn_c_wheeled_m151_02", ["rebCost", 100]],

    //statics
    ["vn_b_army_static_m2_scoped_high", ["rebCost", 600]], //scoped hmg, 8x scope
    ["vn_i_static_m101_01", ["rebCost", 1500]], //105mm Anti-tank gun, big
    ["vn_i_static_mortar_m29", ["rebCost", 1000]], //81mm mortar


    //
    ["vn_o_wheeled_btr40_01_vcmf", ["rebCost", 800]],
    ["vn_o_wheeled_btr40_mg_01_vcmf", ["rebCost", 1200]],
    ["vn_o_wheeled_btr40_mg_02_vcmf", ["rebCost", 1400]],
    ["vn_o_wheeled_btr40_mg_04_vcmf", ["rebCost", 1300]],
    ["vn_o_wheeled_z157_mg_01_vcmf", ["rebCost", 600]],

    ["vn_o_wheeled_btr40_mg_03_vcmf", ["rebCost", 1750]],
    ["vn_o_wheeled_z157_mg_02_vcmf", ["rebCost", 1500]],

    ["vn_o_wheeled_btr40_mg_05_vcmf", ["rebCost", 1400]],

    ["vn_o_vc_static_d44", ["rebCost", 1500]],
    ["vn_i_static_m101_01", ["rebCost", 1500]],

    ["vn_o_vc_static_zgu1_01", ["rebCost", 1200]],
    ["vn_i_fank_70_static_zgu1_01", ["rebCost", 1200]],
    ["vn_o_vc_static_dshkm_high_02", ["rebCost", 100]],
    ["vn_o_vc_static_m1910_high_01", ["rebCost", 800]],
    ["vn_o_vc_static_sgm_high_01", ["rebCost", 800]],

    ["vn_b_wheeled_lr2a_mg_02_aus_army", ["rebCost", 1000]]
]] call _fnc_saveToTemplate;

////PLEASE SOMEONE HELP ME ADD PROPER PRICES TO DLC VEHICLES

if (isClass (configFile >> "CfgPatches" >> "RF_Vehicles")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append [
        ["C_Heli_EC_01A_civ_RF", ["rebCost", 8000]],
        ["C_Heli_EC_01_civ_RF", ["rebCost", 8000]],
        ["C_Heli_EC_04_rescue_RF", ["rebCost", 8000]],
        ["C_Pickup_rf", ["rebCost", 250]],
        ["C_Pickup_covered_rf", ["rebCost", 250]]
    ];
};