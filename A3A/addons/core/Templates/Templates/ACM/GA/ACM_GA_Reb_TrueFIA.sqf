private _hasSOG = "vn" in A3A_enabledDLC;
private _hasRHS = count (["@RHSAFRF", "@RHSUSAF", "@RHSGREF"] arrayIntersect (getLoadedModsInfo apply {_x select 1})) == 3;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "True FIA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "x\A3A\addons\core\Templates\Templates\ACM\flags\flag_true_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["gm_ge_firstaidkit_vehicle","gm_gc_firstaidkit_vehicle","gm_ge_army_firstaidkit_vehicle","gm_gc_army_medkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["gm_gc_army_medbox","gm_ge_army_medkit_80"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["toolKits", ["gm_repairkit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection.

["flyGear", ["gm_ge_uniform_pilot_commando_blk", "gm_ge_uniform_pilot_commando_gry", "gm_ge_uniform_pilot_commando_oli", "gm_ge_uniform_pilot_commando_rolled_blk", "gm_ge_uniform_pilot_commando_rolled_gry", "gm_ge_uniform_pilot_commando_rolled_oli"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

private _vehiclesBasic = ["acm_gm_aaf2015_fiaIns_blu_v_k125_car"];
private _vehiclesLightUnarmed = ["acm_gm_aaf2028_tfia_wheeled_offroad_01", "acm_gm_aaf2028_tfia_wheeled_uaz469_car_cargo_01"];
private _vehiclesLightArmed = ["acm_gm_aaf2028_tfia_wheeled_offroad_armed_01", "acm_gm_aaf2028_tfia_wheeled_u1300l_container_01", "acm_gm_aaf2028_tfia_wheeled_uaz469_car_dshkm_01"];
private _vehiclesTruck = ["acm_gm_aaf2028_tfia_wheeled_van_transport_01", "acm_gm_aaf2028_tfia_wheeled_ural375d_cargo_01"];
private _vehiclesAT = ["acm_gm_aaf2028_tfia_wheeled_offroad_AT_01", "acm_gm_aaf2028_tfia_wheeled_uaz469_car_spg9_01"];
private _vehiclesAA = [];
private _vehiclesBoat = ["I_C_Boat_Transport_02_F"];
private _vehiclesPlane = ["gm_gc_civ_l410s_passenger"];
private _vehiclesCivCar = ["acm_gm_aaf2028_tfia_wheeled_type47_car_01", "acm_gm_aaf2028_tfia_wheeled_type253_car_01"];
private _vehiclesCivTruck = ["acm_gm_aaf2028_tfia_wheeled_u1300l_car_01"];
private _vehiclesCivSupply = ["acm_gm_aaf2028_tfia_wheeled_u1300l_car_01"]; 
private _vehiclesCivHeli = ["gm_ge_adak_bo105m_vbh_noinsignia", "a3a_C_Heli_Light_02_blue_F"];
private _vehiclesCivBoat = ["C_Rubberboat"];
private _staticMGs = ["acm_gm_aaf2028_tfia_turret_dshkm", "acm_gm_aaf2028_tfia_turret_HMG_02", "acm_gm_aaf2028_tfia_turret_HMG_02_High"];
private _staticAT = ["acm_gm_aaf2028_tfia_turret_spg9_01"];
private _staticAA = [];
private _staticMortars = ["acm_gm_aaf2015_fiaIns_blu_v_mortar_turret"];

if (_hasSOG) then {
    _vehiclesBasic append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_bike_mule"];
    _vehiclesLightUnarmed append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_m274_transport_car"];
    _vehiclesLightArmed append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_Boheme_DP27_car", "acm_gm_aaf2015_SOG_fiaIns_blu_v_Z157_MG_01_Car"];
    _vehiclesTruck append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_Z157_Transport_Car"];
    _vehiclesAT append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_m274_M40_car"];
    _staticMGs append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_dshkm_low_turret", "acm_gm_aaf2015_SOG_fiaIns_blu_v_m1910_turret", "acm_gm_aaf2015_SOG_fiaIns_blu_v_sgm_low_turret"];
    _staticAA append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_zgu1_turret"];
    _staticMortars append ["acm_gm_aaf2015_SOG_fiaIns_blu_v_m2_mortar_turret"];
};

if (_hasRHS) then {
    _vehiclesAA append ["acm_gm_aaf2015_fiaIns_rhsafrf_blu_v_Ural_zu23_car"];
    _staticAA append ["acm_gm_aaf2015_fiaIns_rhsafrf_blu_v_zu23_turret"];
    _vehiclesCivHeli append ["RHS_Mi8amt_civilian", "RHS_Mi8t_civilian", "rhs_uh1h_idap"];
};

["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesTruck", _vehiclesTruck] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAT] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;

["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;

["vehiclesPlane", _vehiclesPlane] call _fnc_saveToTemplate;

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesCivTruck", _vehiclesCivTruck] call _fnc_saveToTemplate;
["vehiclesCivHeli", _vehiclesCivHeli] call _fnc_saveToTemplate;
["vehiclesCivBoat", _vehiclesCivBoat] call _fnc_saveToTemplate;
["vehiclesCivSupply", _vehiclesCivSupply] call _fnc_saveToTemplate;
["vehiclesCivPlane", []] call _fnc_saveToTemplate;

["staticMGs", _staticMGs] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "gm_mine_at_dm21"] call _fnc_saveToTemplate;         // , "gm_mine_at_dm1233"]]
["mineAPERS", "gm_mine_ap_dm31"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["gm_explosive_petn_charge", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

#include "..\ACM_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "hgun_ACPC2_F", "9Rnd_45ACP_Mag",
    "sgun_HunterShotgun_01_F", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug",
    "gm_g3a3_oli", "gm_5Rnd_762x51mm_B_DM41_g3_blk",
    ["gm_m72a3_oli", 10], ["gm_1Rnd_66mm_heat_m72a3", 10],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],    
    "gm_1Rnd_265mm_flare_single_red_gc", "gm_1Rnd_265mm_flare_single_wht_gc", "gm_1Rnd_265mm_flare_single_grn_DM11", 
    "gm_1Rnd_265mm_flare_single_wht_DM15", "gm_1Rnd_265mm_flare_multi_wht_DM25",
    "gm_handgrenade_frag_dm51","gm_smokeshell_wht_dm25", "gm_handgrenade_frag_rgd5",
    "gm_pl_army_backpack_at_80_gry", "gm_ge_backpack_satchel_80_blk",
    "gm_ge_vest_sov_80_blk","V_Chestrig_oli",
    "gm_df7x40_blk"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

_rebUniforms = [
    "gm_xx_army_uniform_fighter_02_wdl",
    "gm_xx_army_uniform_fighter_04_wdl",
    "gm_xx_army_uniform_fighter_01_alp",
    "U_Simc_bdu_raid_blench_knee_trop",
    "U_Simc_CDO_bdu",
    "U_Simc_bdu_civ_desu_trop",
    "U_simc_bdu_veldjas_blench_gas_trop",
    //"U_IG_Guerilla_6_1",
    "U_Simc_DCU_civ",
    "U_Simc_DCU_civ_trop",
    "U_Simc_bdu_civ_desu",
    "U_Simc_bdu_civ_DT",
    "U_Simc_bdu_civ_DT_trop",
    "acm_gm_aaf2028_tweed_acu_summer_ocp_blench_trop_ind",
    "U_Simc_bdu_civ"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", ["H_ShemagOpen_khk", "H_Shemag_olive", "H_Simc_Boon_m81_1", "H_Cap_headphones", "gm_ge_headgear_hat_boonie_flk", "H_Simc_Boon_m81_2", "gm_ge_headgear_hat_90_flk",
    "H_Simc_Boon_green_3", "H_ShemagOpen_tan", "H_Simc_Boon_m81_1", "gm_xx_headgear_headwrap_crew_01_flk", "H_Booniehat_mcamo", "H_Booniehat_mgrn"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _faces = ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","GreekHead_A3_10","GreekHead_A3_11","GreekHead_A3_12","GreekHead_A3_13",
"GreekHead_A3_14","Ioannou","Mavros","Sturrock"];
["voices", ["Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE"]] call _fnc_saveToTemplate;
["faces", _faces] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////



private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["gm_watch_kosei_80", "ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["gm_df7x40_blk"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Squares", "G_Squares_Tinted", "gm_ge_facewear_glacierglasses"]];
_loadoutData set ["goggles", ["gm_gc_army_facewear_dustglasses"]];
_loadoutData set ["facemask", ["G_Bandanna_aviator", "G_Bandanna_CandySkull", "gm_ge_facewear_stormhood_blk", "gm_xx_facewear_scarf_01_blk", "gm_xx_facewear_scarf_01_grn", "gm_xx_facewear_scarf_01_gry", "gm_xx_facewear_scarf_01_oli", "gm_xx_facewear_scarf_01_str", "G_Balaclava_blk"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
