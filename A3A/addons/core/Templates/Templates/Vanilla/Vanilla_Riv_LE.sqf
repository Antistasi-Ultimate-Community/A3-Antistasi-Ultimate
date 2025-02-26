private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasKart = "kart" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasSOG = "vn" in A3A_enabledDLC;
private _hasSPE = "spe" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "L'Ensemble"] call _fnc_saveToTemplate;
["nameLeader", "Samjo"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////

private _faces = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"];
private _voices = ["Male01ENGFRE","Male02ENGFRE","male01fre","male02fre","male03fre"];
["voices", _voices] call _fnc_saveToTemplate;
["faces", _faces] call _fnc_saveToTemplate;
if (_hasSPE) then {
  _faces append [
    #include "..\DLC_content\faces\SPE\SPE_white.sqf"
  ];
  _voices append [
    #include "..\DLC_content\voices\SPE_french.sqf"
  ];
};
if (_hasSOG) then {
  _faces append [
    #include "..\DLC_content\faces\SOG\SOG_faces_nocamo.sqf"
  ];
};
if (_hasRF) then {
  _faces append [
    #include "..\DLC_content\faces\RF\RF_white.sqf"
  ];
};
if (_hasGM) then {
  _faces append [
    #include "..\DLC_content\faces\GM\GM_white.sqf"
  ];
};
if (_hasWS) then {
  _faces append [
    #include "..\DLC_content\faces\WS\WS_white.sqf",
    #include "..\DLC_content\faces\WS\WS_african.sqf"
  ];
};
//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

private _lightArmedVehicles = ["I_C_Offroad_02_AT_F", "I_C_Offroad_02_LMG_F"];
private _lightUnarmedVehicles = ["I_C_Offroad_02_unarmed_F"];
private _trucks = ["I_C_Van_01_transport_F"];
private _helis = ["I_C_Heli_Light_01_civil_F"];
private _uav = ["O_UAV_01_F"];
private _tanks = [];
private _apc = [];

if (_hasWs) then {
	_lightArmedVehicles append ["O_G_Offroad_01_armor_AT_lxWS", "O_G_Offroad_01_armor_armed_lxWS"];
	_lightUnarmedVehicles pushBack "O_G_Offroad_01_armor_base_lxWS";
	_apc append ["O_SFIA_APC_Wheeled_02_hmg_lxWS","O_SFIA_APC_Wheeled_02_unarmed_lxWS"];
    _uav append ["O_UAV_02_lxWS","O_Tura_UAV_02_IED_lxWS"];
};

if (_hasLawsOfWar) then {
	_trucks append ["O_G_Van_02_transport_F", "O_G_Van_02_vehicle_F"];
    _uav append ["O_UAV_06_F","O_UAV_06_medical_F","C_IDAP_UAV_06_antimine_F"];
};

if (_hasTanks) then {
	_tanks pushBack "I_LT_01_cannon_F";
};

private _staticLowWeapons = ["O_G_HMG_02_F"];
private _staticAT = ["O_static_AT_F"];
private _staticMortars = ["O_Mortar_01_F"];

if (_hasGM) then {
	_staticLowWeapons append ["gm_dk_army_mg3_aatripod", "gm_gc_army_dshkm_aatripod"];
	_staticAT append ["gm_ge_army_milan_launcher_tripod", "gm_gc_army_fagot_launcher_tripod", "gm_gc_army_spg9_tripod"];
	_lightArmedVehicles append ["gm_pl_army_uaz469_dshkm","gm_ge_army_iltis_mg3","gm_gc_army_uaz469_spg9_noinsignia","gm_ge_army_iltis_milan"];
	_lightUnarmedVehicles append  ["gm_gc_army_p601_noinsignia","gm_gc_army_brdm2um_noinsignia","gm_ge_army_iltis_cargo","gm_pl_army_uaz469_cargo","gm_dk_army_u1300l_container","gm_dk_army_typ247_cargo","gm_dk_army_typ253_cargo","gm_pl_army_ural4320_cargo","gm_ge_army_kat1_451_container"];
	_tanks append ["gm_gc_army_bmp1sp2_noinsignia","gm_gc_army_pt76b_noinsignia","gm_gc_army_t55_noinsignia","gm_gc_army_t55a_noinsignia","gm_gc_army_t55ak_noinsignia","gm_gc_army_t55am2_noinsignia","gm_gc_army_t55am2b_noinsignia","gm_ge_army_Leopard1a1_noinsignia","gm_ge_army_Leopard1a1a2_noinsignia","gm_ge_army_Leopard1a3_noinsignia","gm_ge_army_Leopard1a3a1_noinsignia","gm_ge_army_Leopard1a5_noinsignia"];
	_helis append ["gm_ge_army_bo105p_pah1_noinsignia","gm_ge_army_bo105m_vbh_noinsignia","gm_ge_army_bo105p1m_vbh_noinsignia","gm_ge_army_bo105p1m_vbh_swooper_noinsignia",
	"gm_pl_airforce_mi2t","gm_pl_airforce_mi2urn","gm_pl_airforce_mi2us","gm_gc_airforce_mi2p_noinsignia","gm_gc_airforce_mi2t_noinsignia","gm_gc_airforce_mi2urn_noinsignia","gm_gc_airforce_mi2us_noinsignia","gm_pl_airforce_mi2urp_noinsignia","gm_pl_airforce_mi2urs_noinsignia"];
	_apc append ["gm_dk_army_m113a1dk_apc_noinsignia","gm_dk_army_m113a1dk_command_noinsignia","gm_dk_army_m113a1dk_engineer_noinsignia","gm_dk_army_m113a1dk_medic_noinsignia","gm_dk_army_m113a2dk_noinsignia","gm_ge_army_m113a1g_apc_noinsignia","gm_ge_army_m113a1g_apc_milan_noinsignia","gm_ge_army_m113a1g_command_noinsignia",
	"gm_ge_army_m113a1g_medic_noinsignia","gm_ge_army_luchsa1_noinsignia","gm_ge_army_luchsa2_noinsignia","gm_ge_army_marder1a1plus_noinsignia",
	"gm_ge_army_marder1a1a_noinsignia","gm_ge_army_marder1a2_noinsignia","gm_ge_army_fuchsa0_command_noinsignia",
	"gm_ge_army_fuchsa0_engineer_noinsignia","gm_ge_army_fuchsa0_reconnaissance_noinsignia","gm_gc_army_brdm2_noinsignia","gm_gc_army_btr60pa_noinsignia","gm_gc_army_btr60pa_dshkm_noinsignia","gm_gc_army_btr60pb_noinsignia","gm_gc_army_btr60pu12_noinsignia","gm_pl_army_ot64a_noinsignia"];
	_trucks append ["gm_gc_army_ural375d_cargo_noinsignia","gm_gc_army_ural4320_cargo_noinsignia","gm_dk_army_typ247_cargo","gm_dk_army_u1300l_container","gm_ge_army_kat1_454_cargo","gm_ge_army_u1300l_container","gm_ge_army_kat1_451_cargo","gm_ge_army_u1300l_cargo"];
};

if (_hasRF) then {
	_lightArmedVehicles append ["a3a_black_Pickup_mmg_rf", "a3u_black_Pickup_mmg_frame_rf", "a3u_black_Pickup_mmg_alt_rf"];
	_lightUnarmedVehicles pushBack "a3u_black_Pickup_rival_rf";
};

if (_hasCSLA) then {
	_staticLowWeapons append ["AFMC_infFALf", "AFMC_M2l","CSLA_UK59L_Stat","CSLA_UK59T_Stat"];
	_staticAT append ["AFMC_TOW_Stat", "CSLA_rT21","CSLA_9K113_Stat"];
	_staticMortars append ["US85_M252_Stat","CSLA_M52_Stat"];
	_lightArmedVehicles append ["US85_M1025_M2","US85_M1025_M60","US85_M1043_M2","US85_M1043_M60","US85_M998SFGT","FIA_AZU_DSKM_noinsignia","FIA_AZU_T21_noinsignia"];
	_lightUnarmedVehicles append  ["US85_M1008c","US85_M1008","US85_M1025_ua","US85_M1043_ua","FIA_AZU_para_noinsignia","CSLA_AZU_R2_noinsignia","CSLA_AZU_noinsignia"];
	_tanks append ["US85_M1A1","US85_M1IP","CSLA_T72_noinsignia","CSLA_T72M_noinsignia","CSLA_T72M1_noinsignia"];
	_helis append ["US85_MH60M134","US85_UH60M240","CSLA_Mi17_noinsignia","CSLA_Mi17mg_noinsignia"];
	_apc append ["AFMC_LAV25","AFMC_M113A1","AFMC_M113A2ext","CSLA_BVP1_noinsignia","CSLA_MU90_noinsignia","CSLA_OT62_noinsignia","CSLA_OT64C_noinsignia","CSLA_OT65A_noinsignia","FIA_BTR40_noinsignia","FIA_BTR40_DSKM_noinsignia"];
};

if (_hasSOG) then {
	_staticLowWeapons append ["vn_b_army_static_m2_scoped_high","vn_o_pl_static_mg42_high","vn_o_kr_static_sgm_high_01","vn_o_kr_static_m1910_high_01","vn_i_fank_70_static_rpd_high","vn_i_fank_71_static_m60_high","vn_i_fank_71_static_m2_high","vn_i_fank_71_static_m1919a4_high",
    "vn_i_fank_70_static_dshkm_high_01","vn_i_fank_70_static_dp28_high","vn_i_static_m1919a4_high","vn_i_static_m2_high","vn_i_static_m60_high","vn_i_fank_70_static_dshkm_high_02","vn_i_fank_70_static_sgm_high_01"];
	_staticAT append ["vn_o_pl_static_d44","vn_o_pl_static_at3","vn_i_fank_70_static_type56rr","vn_i_fank_71_static_m40a1rr","vn_i_static_tow","vn_i_static_m101_01"];
	_staticMortars append ["vn_b_aus_army_static_mortar_m2","vn_b_aus_army_static_mortar_m29","vn_o_kr_static_mortar_type53","vn_o_kr_static_mortar_type63"];
	_lightArmedVehicles append ["vn_b_wheeled_m151_mg_03_noinsignia","vn_b_wheeled_m151_mg_02_noinsignia","vn_b_wheeled_m151_mg_04_noinsignia","vn_o_wheeled_btr40_mg_02_noinsignia",
	"vn_o_wheeled_btr40_mg_01_noinsignia","vn_o_wheeled_btr40_mg_04_noinsignia","vn_b_wheeled_lr2a_mg_02_aus_army_noinsignia","vn_b_wheeled_lr2a_mg_01_aus_army_noinsignia","vn_o_car_04_mg_01_kr","vn_o_wheeled_z157_mg_01_nvam"];
	_lightUnarmedVehicles append  ["vn_b_wheeled_lr2a_02_aus_army","vn_b_wheeled_lr2a_01_aus_army","vn_b_wheeled_m151_01_aus_army","vn_b_wheeled_m151_02_aus_army","vn_o_wheeled_btr40_01_noinsignia"];
	_tanks append ["vn_o_armor_type63_01_noinsignia","vn_o_armor_t54b_01_nva65_noinsignia","vn_o_armor_pt76b_01_nva65_noinsignia","vn_o_armor_ot54_01_nva65_noinsignia","vn_o_armor_pt76a_01_pl_noinsignia","vn_b_armor_m41_01_01_noinsignia","vn_b_armor_m48_01_01_noinsignia","vn_b_armor_m67_01_01_noinsignia"];
	_helis append ["vn_b_air_uh1b_01_09","vn_b_air_uh1d_04_09","vn_o_air_mi2_02_02_noinsignia","vn_o_air_mi2_03_05_noinsignia","vn_o_air_mi2_01_02_noinsignia","vn_o_air_mi2_01_01_noinsignia","vn_b_air_uh1f_01_03_noinsignia","vn_b_air_oh6a_01_noinsignia","vn_b_air_uh1b_01_02_noinsignia","vn_b_air_uh1c_07_02_noinsignia",
	"vn_b_air_ch34_04_03_noinsignia","vn_b_air_ch34_04_01_noinsignia","vn_b_air_ch34_04_04_noinsignia","vn_b_air_ch34_04_02_noinsignia","vn_o_air_mi2_03_03_noinsignia","vn_o_air_mi2_03_05_noinsignia","vn_o_air_mi2_04_03_noinsignia",
	"vn_o_air_mi2_04_01_noinsignia","vn_o_air_mi2_04_05_noinsignia","vn_b_air_uh1b_02_05_noinsignia","vn_b_air_oh6a_02_noinsignia","vn_b_air_oh6a_03_noinsignia","vn_b_air_oh6a_07_noinsignia","vn_b_air_uh1d_03_01_noinsignia","vn_b_air_oh6a_06_noinsignia","vn_b_air_oh6a_05_noinsignia","vn_b_air_oh6a_04_noinsignia"
    ,"vn_o_air_mi2_05_03_noinsignia","vn_o_air_mi2_05_01_noinsignia","vn_o_air_mi2_05_05_noinsignia","vn_b_air_uh1c_03_01_noinsignia","vn_b_air_uh1c_01_02_noinsignia","vn_b_air_uh1c_05_01_noinsignia","vn_b_air_uh1c_02_02_noinsignia","vn_b_air_uh1c_04_02_noinsignia",
    "vn_b_air_uh1c_06_01_noinsignia","vn_b_air_ah1g_01_noinsignia","vn_b_air_ach47_04_01_noinsignia","vn_b_air_ach47_03_01_noinsignia","vn_b_air_ach47_05_01_noinsignia","vn_b_air_ach47_01_01_noinsignia","vn_b_air_ach47_02_01_noinsignia"
    ,"vn_i_air_ch47_01_01_noinsignia","vn_i_air_ch34_02_02","vn_i_air_ch34_01_02_noinsignia","vn_i_air_ch34_02_01_noinsignia","vn_b_air_ch34_01_01_noinsignia","vn_b_air_ch34_03_01_noinsignia","vn_b_air_ch47_04_01_noinsignia","vn_b_air_uh1d_02_01_noinsignia"
	];
	_apc append ["vn_i_armor_m132_01_noinsignia","vn_o_armor_btr50pk_01_nva65_noinsignia","vn_b_armor_m113_01_aus_army_noinsignia","vn_b_armor_m113_acav_04_noinsignia","vn_b_armor_m113_acav_02_noinsignia","vn_b_armor_m113_acav_01_noinsignia","vn_b_armor_m113_acav_06_noinsignia",
    "vn_b_armor_m113_acav_03_noinsignia","vn_b_armor_m113_acav_05_noinsignia","vn_b_armor_m113_01_noinsignia"];
};

if (_hasSPE) then {
	_staticLowWeapons append ["SPE_ST_MG34_Lafette_Deployed","SPE_ST_MG42_Lafette_Deployed","SPE_GER_SearchLight","SPE_FR_M1919A6_Bipod","SPE_FR_M1919_M2_Trench_Deployed"];
	_staticAT append ["SPE_ST_FlaK_36","SPE_ST_Pak40","SPE_ST_leFH18_AT","SPE_FR_57mm_M1"];
	_staticMortars append ["SPE_M1_81","SPE_GrW278_1"];
	//_lightArmedVehicles append [];
	//_lightUnarmedVehicles append  [];
	_tanks append ["SPE_PzKpfwIII_J_noinsignia","SPE_PzKpfwIII_L_noinsignia","SPE_PzKpfwIII_M_noinsignia","SPE_PzKpfwIII_N_noinsignia","SPE_PzKpfwIV_G_noinsignia","SPE_ST_PzKpfwVI_H1","SPE_FR_M10_noinsignia",
	"SPE_FR_M4A0_75_Early_noinsignia","SPE_FR_M4A0_75_mid_noinsignia","SPE_FR_M4A1_76_noinsignia","SPE_FR_M4A1_75_noinsignia","SPE_M18_Hellcat_noinsignia","SPE_M4A1_T34_Calliope_Direct_noinsignia"];
	_apc append ["SPE_FFI_SdKfz250_1_noinsignia","SPE_FR_M3_Halftrack_noinsignia"];
	_trucks append ["SPE_FR_M3_Halftrack_Unarmed_Open_noinsignia","SPE_FR_M3_Halftrack_Unarmed_noinsignia"];
};

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

["staticLowWeapons", _staticLowWeapons] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["vehiclesRivalsLightArmed", _lightArmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", _trucks] call _fnc_saveToTemplate;
["vehiclesRivalsCars", _lightUnarmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", _apc] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", _helis] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", _uav] call _fnc_saveToTemplate;			

["animations", [
    ["O_SFIA_APC_Wheeled_02_hmg_lxWS", ["mg_hide_armor_front",0.3,"mg_hide_armor_rear",0.3,"mg_Hide_Rail",0.3,"showBags",0.3,"showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_SFIA_APC_Wheeled_02_unarmed_lxWS", ["showBags",0.3,"showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["I_LT_01_cannon_F", ["showTools",0.3,"showCamonetHull",0.3,"showBags",0.3,"showSLATHull",0.3]],
	["gm_dk_army_m113a1dk_command_noinsignia", ["antennaMast_01_unhide",0.3,"antennamast_01_elev_trigger",0.3,"generator_01_unhide",0.3,"storageBox_01_unhide",0.3,"IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_dk_army_m113a2dk_noinsignia", ["camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3]],
    ["gm_dk_army_Leopard1a3_noinsignia", ["CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gm_dk_army_m113a1dk_medic_noinsignia", ["IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_dk_army_m113a1dk_apc_noinsignia",["MachineGunTurret_01_addonarmor_01_unhide",0.3,"MachineGunTurret_01_addonarmor_02_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"ammo_01_unhide",0.3,"ammo_02_unhide",0.3,"ammo_03_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_dk_army_m113a1dk_engineer_noinsignia", ["ladder_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"Tarp_01_unhide",0.3,"ammo_01_unhide",0,"ammo_02_unhide",0.3,"ammo_03_unhide",0.3,"MachineGunTurret_01_addonarmor_01_unhide",0.3,"MachineGunTurret_01_addonarmor_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_dk_army_m109_noinsignia",["CamoNet_01_unhide",0.3,"ammo_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gm_dk_army_bpz2a0_noinsignia", ["beacon_01_org_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_dk_army_bibera0_noinsignia", ["beacon_01_org_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_m113a1g_apc_noinsignia", ["IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"CamoNet_02_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_m113a1g_apc_milan_noinsignia", ["IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"CamoNet_02_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_m113a1g_command_noinsignia",["antennaMast_01_unhide",0.3,"antennamast_01_elev_trigger",0.3,"generator_01_unhide",0.3,"storageBox_01_unhide",0.3,"IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_m113a1g_medic_noinsignia",["IceCleats_01_unhide",0.3,"IceCleats_02_unhide",0.3,"SupportPoles_01_unhide",0.3,"storageBox_01_unhide",0.3,"CamoNet_02_unhide",0.3,"generator_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_03_unhide",0.3,"Tarp_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_luchsa1_noinsignia",["CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"radio_03_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gm_ge_army_luchsa2_noinsignia",["radio_03_unhide",0.3,"SignsExtraWide_unhide",0.3,"TurretBox_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gm_ge_army_marder1a1plus_noinsignia",["beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"CamoNet_01_unhide",0.3,"supply_01_unhide",0.3,"supply_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gm_ge_army_marder1a1a_noinsignia", ["beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"CamoNet_01_unhide",0.3,"supply_01_unhide",0.3,"supply_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gm_ge_army_marder1a2_noinsignia", ["beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"CamoNet_01_unhide",0.3,"supply_01_unhide",0.3,"supply_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3]],
    ["gm_ge_army_fuchsa0_command_noinsignia", ["radio_04_unhide",0.3,"antennamast_01_elev_trigger",0.3,"beacon_01_org_unhide",0.3,"beacon_01_blu_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_rack_unhide",0.3,"StowingBox_01_unhide",0.3,"SignsExtraWide_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_fuchsa0_engineer_noinsignia", ["ringbuoy_01_unhide",0.3,"beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"CamoNet_01_unhide",0.3,"CamoNet_02_rack_unhide",0.3,"SignsExtraWide_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_fuchsa0_reconnaissance_noinsignia", ["beacon_01_org_unhide",0,"beacon_01_blu_unhide",0,"CamoNet_01_unhide",0.3,"CamoNet_02_rack_unhide",0.3,"StowingBox_01_unhide",0.3,"SignsExtraWide_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_ge_army_ch53gs_noinsignia", ["fueltank_1_1_unhide",0.3]],
    ["gm_ge_army_bo105m_vbh_noinsignia", ["door_1_1_unhide",0.3,"door_1_2_unhide",0.3,"door_2_1_unhide",0.3,"door_2_2_unhide",0.3]],
    ["gm_ge_army_bo105p1m_vbh_noinsignia", ["door_1_1_unhide",0.3,"door_1_2_unhide",0.3,"door_2_1_unhide",0.3,"door_2_2_unhide",0.3]],
    ["gm_ge_army_bo105p1m_vbh_swooper_noinsignia", ["swooperRopes_unhide",0.3,"door_2_1_unhide",0.3,"door_2_2_unhide",0.3,"door_1_1_unhide",0.3,"door_1_2_unhide",0.3]],
    ["gm_ge_army_Leopard1a1_noinsignia", ["CamoNet_01_unhide",0.3,"CamoNet_04_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"SpareWheel_01_unhide",0.3,"SpareWheel_02_unhide",0.3,"SpareWheel_03_unhide",0.3,"SpareWheel_04_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gm_ge_army_Leopard1a1a2_noinsignia", ["CamoNet_01_unhide",0.3,"CamoNet_04_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_05_unhide",0.3,"CamoNet_03_unhide",0.3,"SpareWheel_01_unhide",0.3,"SpareWheel_02_unhide",0.3,"SpareWheel_03_unhide",0.3,"SpareWheel_04_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gm_ge_army_Leopard1a3a1_noinsignia",["CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gm_ge_army_Leopard1a5_noinsignia", ["CamoNet_01_unhide",0.3,"CamoNet_04_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_05_unhide",0.3,"CamoNet_03_unhide",0.3,"SpareWheel_01_unhide",0.3,"SpareWheel_02_unhide",0.3,"SpareWheel_03_unhide",0.3,"SpareWheel_04_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"beacon_01_org_unhide",0,"sideskirt_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3]],
    ["gm_gc_army_bmp1sp2_noinsignia", ["spareTracks_1_1_unhide",0.3,"spareTracks_1_2_unhide",0.3,"spareTracks_2_1_unhide",0.3,"wheelChock_1_1_unhide",0.3,"wheelChock_1_2_unhide",0.3,"woodenBeam_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"CamoNet_03_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"AmmoBox_04_unhide",0.3,"AmmoBox_05_unhide",0.3,"AmmoBox_06_unhide",0.3,"AmmoBox_07_unhide",0.3,"AmmoBox_08_unhide",0.3,"AmmoBox_09_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3]],
    ["gm_gc_army_brdm2_noinsignia",["ConvoyLights_01_unhide",0.3,"FrontLight_02_Cover_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"SpareWheel_01_unhide",0.3,"SpareWheel_02_unhide",0.3,"CamoNet_01_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3]],
    ["gm_gc_army_brdm2um_noinsignia",["ConvoyLights_01_unhide",0.3,"FrontLight_02_Cover_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanisterHolder_01_unhide",0.3,"FuelCanisterHolder_02_unhide",0.3,"CamoNet_01_unhide",0.3,"SpareWheel_01_unhide",0.3,"SpareWheel_02_unhide",0.3,"generator_01_unhide",0.3,"AmmoBox_03_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3]],
    ["gm_gc_army_btr60pa_noinsignia",["ConvoyLights_01_unhide",0.3,"FrontLight_02_Cover_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"AmmoBox_04_unhide",0.3,"AmmoBox_05_unhide",0.3,"AmmoBox_06_unhide",0.3,"AmmoBox_07_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"FuelCanister_04_unhide",0.3,"FuelCanister_05_unhide",0.3,"FuelCanister_06_unhide",0.3,"Barrel_01_unhide",0.3,"SpareWheel_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3]],
    ["gm_gc_army_btr60pa_dshkm_noinsignia",["ConvoyLights_01_unhide",0.3,"FrontLight_02_Cover_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"AmmoBox_04_unhide",0.3,"AmmoBox_05_unhide",0.3,"AmmoBox_06_unhide",0.3,"AmmoBox_07_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"FuelCanister_04_unhide",0.3,"FuelCanister_05_unhide",0.3,"FuelCanister_06_unhide",0.3,"Barrel_01_unhide",0.3,"SpareWheel_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3]],
    ["gm_gc_army_btr60pb_noinsignia", ["ConvoyLights_01_unhide",0.3,"FrontLight_01_Cover_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"AmmoBox_04_unhide",0.3,"AmmoBox_05_unhide",0.3,"AmmoBox_06_unhide",0.3,"AmmoBox_07_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"FuelCanister_04_unhide",0.3,"FuelCanister_05_unhide",0.3,"Barrel_01_unhide",0.3,"SpareWheel_01_unhide",0.3,"SpareWheel_02_unhide",0.3,"SpareWheel_03_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"FrontLight_02_Cover_unhide",0.3]],
    ["gm_gc_army_btr60pu12_noinsignia",["ConvoyLights_01_unhide",0.3,"antennamast_01_elev_trigger",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"AmmoBox_04_unhide",0.3,"AmmoBox_05_unhide",0.3,"AmmoBox_06_unhide",0.3,"AmmoBox_07_unhide",0.3,"FuelCanister_01_unhide",0.3,"FuelCanister_02_unhide",0.3,"FuelCanister_03_unhide",0.3,"FuelCanister_04_unhide",0.3,"FuelCanister_05_unhide",0.3,"Barrel_01_unhide",0.3,"SpareWheel_03_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"FrontLight_02_Cover_unhide",0.3]],
    ["gm_pl_army_uaz469_cargo", ["ConvoyLights_01_unhide",0.3,"FrontLight_01_Cover_unhide",0.3,"windshield",0.3,"windows_unhide",0.3,"cover_hoops_unhide",0.3,"spare_wheel_unhide",0.3,"antenna_01_unhide",0.3,"antenna_02_unhide",0.3,"FogLights_01_unhide",0.3,"mirrors_01_unhide",0.3,"doors_unhide",0.3]],
    ["gm_pl_army_uaz469_dshkm", ["ConvoyLights_01_unhide",0.3,"FrontLight_01_Cover_unhide",0.3,"windows_unhide",0.3,"mirrors_01_unhide",0.3,"windshield",0.3,"spare_wheel_unhide",0.3,"antenna_01_unhide",0.3,"antenna_02_unhide",0.3,"FogLights_01_unhide",0.3,"doors_unhide",0.3]],
    ["gm_gc_army_uaz469_spg9_noinsignia", ["ConvoyLights_01_unhide",0.3,"FrontLight_01_Cover_unhide",0.3,"windshield",0.3,"windows_unhide",0.3,"mirrors_01_unhide",0.3,"spare_wheel_unhide",0.3,"antenna_01_unhide",0.3,"antenna_02_unhide",0.3,"FogLights_01_unhide",0.3,"doors_unhide",0.3]],
    ["gm_gc_airforce_mi2p_noinsignia", ["cablecutter_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1,"winch_unhide",0.3,"fueltank_left_unhide",0.3,"fueltank_right_unhide",0.3]],
    ["gm_gc_airforce_mi2t_noinsignia", ["cablecutter_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1,"winch_unhide",0.3,"fueltank_left_unhide",0.3,"fueltank_right_unhide",0.3]],
    ["gm_gc_airforce_mi2urn_noinsignia", ["cablecutter_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1,"winch_unhide",0.3,"fueltank_left_unhide",0.3,"fueltank_right_unhide",0.3]],
    ["gm_gc_airforce_mi2us_noinsignia", ["cablecutter_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1,"winch_unhide",0.3,"fueltank_left_unhide",0.3,"fueltank_right_unhide",0.3]],
    ["gm_gc_army_pt76b_noinsignia", ["ConvoyLights_01_unhide",0.3,"CamoNet_01_unhide",0.3,"CamoNet_02_unhide",0.3,"AmmoBox_01_unhide",0.3,"AmmoBox_02_unhide",0.3,"AmmoBox_03_unhide",0.3,"FuelTank_01_unhide",0.3,"FuelTank_02_unhide",0.3,"FuelTank_03_unhide",0.3,"FuelTank_04_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"FrontLight_02_Cover_unhide",0.3]],
    ["gm_gc_army_t55_noinsignia", ["ConvoyLights_01_unhide",0.3,"MainTurret_SearchLight_cover_unhide",0.3,"MainTurret_Optic_cover_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"buoy_01_unhide",0.3,"camoNet_01_unhide",0.3,"camoNet_02_unhide",0.3,"turretBox_01_unhide",0.3,"turretBox_02_unhide",0.3,"fender_01_unhide",0.3,"fender_02_unhide",0.3,"woodenBeam_01_unhide",0.3,"snorkel_01_unhide",0.3,"snorkel_02_unhide",0.3,"rearbar_01_unhide",0.3,"barrelHolder_01_unhide",0.3,"barrel_01_unhide",0.3,"barrel_02_unhide",0.3,"wheelChock_01_unhide",0.3,"storageBox_01_unhide",0.3,"storageBox_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3,"FormationLight_01_unhide",0.3]],
    ["gm_gc_army_t55a_noinsignia", ["ConvoyLights_01_unhide",0.3,"turretBox_01_unhide",0.3,"turretBox_02_unhide",0.3,"MainTurret_SearchLight_cover_unhide",0.3,"MainTurret_Optic_cover_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"buoy_01_unhide",0.3,"camoNet_01_unhide",0.3,"camoNet_02_unhide",0.3,"fender_01_unhide",0.3,"fender_02_unhide",0.3,"woodenBeam_01_unhide",0.3,"snorkel_01_unhide",0.3,"snorkel_02_unhide",0.3,"rearbar_01_unhide",0.3,"barrelHolder_01_unhide",0.3,"barrel_01_unhide",0.3,"barrel_02_unhide",0.3,"wheelChock_01_unhide",0.3,"storageBox_01_unhide",0.3,"storageBox_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3,"FormationLight_01_unhide",0.3]],
    ["gm_gc_army_t55ak_noinsignia",["ConvoyLights_01_unhide",0.3,"antennamast_01_elev_trigger",0.3,"antennaMast_01_unhide",0.3,"turretBox_01_unhide",0.3,"turretBox_02_unhide",0.3,"MainTurret_SearchLight_cover_unhide",0.3,"MainTurret_Optic_cover_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"buoy_01_unhide",0.3,"camoNet_01_unhide",0.3,"camoNet_02_unhide",0.3,"fender_01_unhide",0.3,"fender_02_unhide",0.3,"woodenBeam_01_unhide",0.3,"snorkel_01_unhide",0.3,"snorkel_02_unhide",0.3,"rearbar_01_unhide",0.3,"barrelHolder_01_unhide",0.3,"barrel_01_unhide",0.3,"barrel_02_unhide",0.3,"wheelChock_01_unhide",0.3,"storageBox_01_unhide",0.3,"storageBox_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3,"FormationLight_01_unhide",0.3]],
    ["gm_gc_army_t55am2_noinsignia",["ConvoyLights_01_unhide",0.3,"turretBox_03_unhide",0.3,"turretBox_01_unhide",0.3,"turretBox_02_unhide",0.3,"MainTurret_SearchLight_cover_unhide",0.3,"MainTurret_Optic_cover_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"buoy_01_unhide",0.3,"camoNet_01_unhide",0.3,"snorkel_02_unhide",0.3,"rearbar_01_unhide",0.3,"barrelHolder_01_unhide",0.3,"barrel_01_unhide",0.3,"barrel_02_unhide",0.3,"wheelChock_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3,"FormationLight_01_unhide",0.3]],
    ["gm_gc_army_t55am2b_noinsignia", ["ConvoyLights_01_unhide",0.3,"turretBox_03_unhide",0.3,"turretBox_01_unhide",0.3,"turretBox_02_unhide",0.3,"MainTurret_SearchLight_cover_unhide",0.3,"MainTurret_Optic_cover_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"buoy_01_unhide",0.3,"camoNet_01_unhide",0.3,"snorkel_02_unhide",0.3,"rearbar_01_unhide",0.3,"barrelHolder_01_unhide",0.3,"barrel_01_unhide",0.3,"barrel_02_unhide",0.3,"wheelChock_01_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3,"FormationLight_01_unhide",0.3]],
    ["gm_gc_bgs_mi2p_noinsignia", ["cablecutter_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1,"winch_unhide",0.3,"fueltank_left_unhide",0.3,"fueltank_right_unhide",0.3]],
    ["gm_gc_bgs_mi2us_noinsignia", ["cablecutter_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1,"winch_unhide",0.3,"fueltank_left_unhide",0.3,"fueltank_right_unhide",0.3]],
    ["gm_pl_army_ot64a_noinsignia", ["RoadPrioritySign_01_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3]],
    ["gm_pl_army_t55ak_noinsignia", ["RoadPrioritySign_01_unhide",0.3,"antennamast_01_elev_trigger",0.3,"antennaMast_01_unhide",0.3,"turretBox_01_unhide",0.3,"turretBox_02_unhide",0.3,"MainTurret_SearchLight_cover_unhide",0.3,"MainTurret_Optic_cover_unhide",0.3,"CommanderTurret_SearchLight_cover_unhide",0.3,"buoy_01_unhide",0.3,"camoNet_01_unhide",0.3,"camoNet_02_unhide",0.3,"fender_01_unhide",0.3,"fender_02_unhide",0.3,"woodenBeam_01_unhide",0.3,"snorkel_01_unhide",0.3,"snorkel_02_unhide",0.3,"rearbar_01_unhide",0.3,"barrelHolder_01_unhide",0.3,"barrel_01_unhide",0.3,"barrel_02_unhide",0.3,"wheelChock_01_unhide",0.3,"storageBox_01_unhide",0.3,"storageBox_02_unhide",0.3,"camonet_hull_unhide",0.3,"camofoilage_hull_unhide",0.3,"camonet_MainTurret_trav_unhide",0.3,"camofoilage_MainTurret_trav_unhide",0.3,"camonet_MainTurret_elev_unhide",0.3,"FormationLight_01_unhide",0.3]],
    ["gm_pl_airforce_mi2urs_noinsignia", ["cablecutter_unhide",0.3,"camera_front_unhide",0.3,"camera_rear_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1]],
    ["gm_pl_airforce_mi2urp_noinsignia", ["cablecutter_unhide",0.3,"camera_front_unhide",0.3,"camera_rear_unhide",0.3,"fan_unhide",0.3,"plugs_unhide",0.1,"skids_unhide",0.1]],
	["CSLA_Mi24V_noinsignia", ["addEVU",0.3,"addASO_Tail",0.3,"addASO_Body",0.3]],
    ["CSLA_PLdvK59V3S_noinsignia",["addTools",0.3,"addFuelKanister",0.3]],
    ["CSLA_BVP1_noinsignia", ["addCoverTurret",0.3,"addTools",0.3,"addRope",0.3,"addBar",0.3,"addMudguards",0.3]],
    ["CSLA_BPzV_noinsignia", ["addCoverTurret",0.3,"addTools",0.3,"addRope",0.3,"addBar",0.3,"addMudguards",0.3]],
    ["CSLA_DTP90_noinsignia", ["addTools",0.3,"addRope",0.3,"addBar",0.3,"addMudguards",0.3]],
    ["CSLA_MU90_noinsignia", ["addTools",0.3,"addRope",0.3,"addBar",0.3,"addMudguards",0.3]],
    ["CSLA_OT62_noinsignia", ["addTools",0.3,"addRope",0.3,"addCover",0.3,"addSpareTracks",0.3]],
    ["CSLA_OT64C_noinsignia", ["addTools",0.3,"addRope",0.3,"addTripod",0.3]],
    ["CSLA_OT65A_noinsignia", ["addTools",0.3,"addRope",0.3,"addFuelKanister",0.3]],
    ["CSLA_OZV90_noinsignia", ["addTools",0.3,"addRope",0.3,"addBar",0.3,"addMudguards",0.3]],
    ["CSLA_AZU_noinsignia", ["ADD_canvas",0.3,"ADD_canvas_frame",0.3,"ADD_antenna",0.3,"ADD_sparewheel",0.3,"ADD_fuelcan",0.3,"ADD_frame",0.3,"ADD_light_covers",0.3,"ADD_searchlight",0.3]],
    ["CSLA_AZU_para_noinsignia", ["ADD_antenna",0.3,"ADD_sparewheel",0.3,"ADD_fuelcan",0.3,"ADD_frame",0.3,"ADD_light_covers",0.3,"ADD_searchlight",0.3]],
    ["CSLA_AZU_R2_noinsignia", ["ADD_canvas",0.3,"ADD_canvas_frame",0.3,"ADD_sparewheel",0.3,"ADD_fuelcan",0.3,"ADD_frame",0.3,"ADD_light_covers",0.3,"ADD_searchlight",0.3]],
    ["CSLA_V3SLizard_noinsignia", ["addTools",0.3,"addFuelKanister",0.3]],
    ["CSLA_V3Sa_noinsignia", ["addCanvas",0.3,"addAmmo",1,"addSpareWheel",0.3,"addFuelKanister",0.3]],
    ["CSLA_V3Sf_noinsignia", ["addSpareWheel",0.3,"addFuelKanister",0.3]],
    ["CSLA_V3So_noinsignia", ["addCanvas",0,"addSpareWheel",0.3,"addFuelKanister",0.3]],
    ["CSLA_V3S_noinsignia", ["addCanvas",1,"addSpareWheel",0.3,"addFuelKanister",0.3]],
    ["CSLA_V3Sr_noinsignia", ["addWindowCovers",0.3,"addStowage",0.3,"addTools",0.3,"addSpareWheel",0.3,"addFuelKanister",0.3]],
    ["CSLA_Mi17_noinsignia", ["ADD_winch",0.5]],
    ["CSLA_Mi17mg_noinsignia", ["ADD_winch",0.5]],
    ["CSLA_Mi17pylons_noinsignia", ["ADD_winch",0.5]],
    ["CSLA_T72_noinsignia", ["ADD_antenna",0.3,"ADD_frontMudGuards",0.3,"ADD_trackLinks",0.3,"ADD_fuelDrums",0.3,"ADD_log",0.3,"ADD_R130",0.3,"ADD_nsvMag1",0.3,"ADD_nsvMag2",0.3,"ADD_camoNet",0.3,"ADD_ropeFront",0.3,"ADD_ropeBack",0.3]],
    ["CSLA_T72M_noinsignia", ["ADD_antenna",0.3,"ADD_frontMudGuards",0.3,"ADD_trackLinks",0.3,"ADD_fuelDrums",0.3,"ADD_log",0.3,"ADD_R130",0.3,"ADD_nsvMag1",0.3,"ADD_nsvMag2",0.3,"ADD_camoNet",0.3,"ADD_ropeFront",0.3,"ADD_ropeBack",0.3]],
    ["CSLA_T72M1_noinsignia", ["ADD_antenna",0.3,"ADD_frontMudGuards",0.3,"ADD_trackLinks",0.3,"ADD_fuelDrums",0.3,"ADD_log",0.3,"ADD_R130",0.3,"ADD_nsvMag1",0.3,"ADD_nsvMag2",0.3,"ADD_camoNet",0.3,"ADD_ropeFront",0.3,"ADD_ropeBack",0.3]],
    ["FIA_BTR40_noinsignia", ["ADD_canvas",0.3,"ADD_sparewheel",0.3]],
    ["FIA_BTR40_DSKM_noinsignia",["ADD_sparewheel",0.5]],
    ["US85_M1A1", ["ADD_smallAmmobox",0.3,"ADD_medAmmoBox",0.3,"ADD_topStuff",0.3,"ADD_cardBoardBox",0.3,"ADD_trackLink",0.3,"ADD_spareWheel",0.3,"ADD_frontTowRings",0.3,"ADD_rearTowRings",0.3,"ADD_frontTowBar",0.3,"ADD_rearTowBar",0.3,"ADD_leftTowCable",0.3,"ADD_rightTowCable",0.3,"ADD_alice",0.3,"ADD_fuelCan",0.3,"ADD_camoNet",0.3]],
    ["US85_M1IP", ["ADD_topStuff",0.3,"ADD_cardBoardBox",0.3,"ADD_trackLink",0.3,"ADD_spareWheel",0.3,"ADD_frontTowRings",0.3,"ADD_rearTowRings",0.3,"ADD_frontTowBar",0.3,"ADD_rearTowBar",0.3,"ADD_leftTowCable",0.3,"ADD_rightTowCable",0.3,"ADD_alice",0.3,"ADD_fuelCan",0.3,"ADD_camoNet",0.3]],
    ["AFMC_M113A2ext",["AddBox",0.3,"AddBagsSide",0.3,"AddInt1",0.3,"AddTools",0.3,"AddSpareWheel",0.3,"AddKanister",0.3,"AddTop1",0.3,"AddTop2",0.3,"AddCamonet",0.3,"AddBarbwire",0.3,"AddMetalRope",0.3]],
    ["US85_M163",["AddKanister",0.3,"AddTop1",0.3,"AddTop2",0.3,"AddCamonet",0.3,"AddMetalRope",0.3,"AddTools",0.3,"AddTurret1",0.3]],
    ["US85_LAV25", ["addKanister_body",0.3,"addKanister_turret",0.3,"addBackpacks_turret",0.3,"addAmmo25mm_turret",0.3,"addTools",0.3,"addCamonet",0.3,"addBarbwire",0.3,"addRope",0.3]],
    ["US85_M113_AMB",["AddBagsSide",0.3,"AddInt1",0.3,"AddTools",0.3,"AddKanister",0.3,"AddTop1",0.3,"AddTop2",0.3,"AddCamonet",0.3,"AddBarbwire",0.3,"AddMetalRope",0.3]],
    ["US85_M113_DTP",["AddBagsSide",0.3,"AddInt1",0.3,"AddInt2",0.3,"AddTop2",0.3,"AddSpareWheel",0.3,"AddKanister",0.3,"AddTop1",0.3,"AddCamonet",0.3,"AddBarbwire",0.3,"AddMetalRope",0.3]],
    ["US85_M113", ["AddBox",0.3,"AddBagsSide",0.3,"AddInt1",0.3,"AddTools",0.3,"AddKanister",0.3,"AddTop1",0.3,"AddTop2",0.3,"AddCamonet",0.3,"AddBarbwire",0.3,"AddMetalRope",0.3]],
    ["US85_M1008c", ["addCanvas",0.3,"addCanvasFrame",0.3,"addBenches",0.3,"addRearFrame",0.3,"addFrontFrame",0.3]],
    ["US85_M1008", ["addCanvas",0.3,"addCanvasFrame",0.3,"addBenches",0.3,"addRearFrame",0.3,"addFrontFrame",0.3]],
    ["US85_M1008_S250", ["addFrontFrame",0.5]],
    ["US85_M1025_ua", ["AddBarbwire",0.3,"AddSparewheel",0.3,"AddCamonet",0.3]],
    ["US85_M1025_M2", ["AddBarbwire",0.3,"AddSparewheel",0.3,"AddCamonet",0.3]],
    ["US85_M1025_M60", ["AddBarbwire",0.3,"AddSparewheel",0.3,"AddCamonet",0.3,"AddSandBags",0.3]],
    ["US85_M1043_ua", ["AddBarbwire",0.3,"AddSparewheel",0.3,"AddCamonet",0.3]],
    ["US85_M1043_M2", ["AddBarbwire",0.3,"AddSparewheel",0.3,"AddCamonet",0.3]],
    ["US85_M1043_M60", ["AddBarbwire",0.3,"AddSparewheel",0.3,"AddCamonet",0.3,"AddSandBags",0.3]],
    ["US85_M923a",["ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_reammo",0.3,"ADD_side_benches",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3,"ADD_roof",0.3]],
    ["US85_M923cargo", ["ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_reammo",0,"ADD_repair",0,"ADD_side_benches",0.3,"ADD_explosive",0.3,"ADD_explosive_tailgate",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3,"ADD_roof",0.3]],
    ["US85_M923f",["ADD_spareWheel",0.3,"ADD_fuelcan",0.3,"ADD_roof",0.3]],
    ["US85_M923a1_r", ["ADD_repair",1,"ADD_tarpRoof",0.3,"ADD_roof",0.3,"ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_side_benches",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3]],
    ["US85_M923a1_s280", ["ADD_tarpRoof",0.3,"ADD_roof",0.3,"ADD_s280",0.3,"ADD_s280_ac",0.3,"ADD_s280_panel",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3]],
    ["US85_M923a1o", ["ADD_tarpRoof",0.3,"ADD_roof",0.3,"ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3]],
    ["US85_M923a1om2", ["ADD_ammoBox",0.3,"ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3]],
    ["US85_M923a1c", ["ADD_tarpRoof",0.3,"ADD_roof",0.3,"ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3]],
    ["US85_M923a1cm2", ["ADD_ammoBox",0.3,"ADD_tailgate",0.3,"ADD_canvas",0.3,"ADD_frame",0.3,"ADD_spareWheel",0.3,"ADD_fuelcan",0.3]],
    ["US85_M998SFGT",["AddBarbwire", 0.3,"AddBumper",0.3,"AddBackpacks",0.3,"AddRoofCover",0.3,"AddRearFrame",0.3]],
    ["US85_AH1F",["addAirIntakeCovers",0.3,"addASO_Tail",0.3]],
    ["US85_MH60M134", ["addWinch",0.5]],
    ["US85_MH60FFAR", ["addWinch",0.5]],
    ["US85_UH60", ["addESSS",0.5,"addWinch",0.5]],
    ["US85_UH60M240", ["addWinch",0.5]],
	#include "..\vehicleAnimations\vehicleAnimations_SOG.sqf",
	#include "..\vehicleAnimations\vehicleAnimations_SPE.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    ["I_LT_01_cannon_F", ["Indep_Olive", 1, "Indep_01", 0]]
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["lightHELaunchers", [
["launch_RPG32_green_F", "", "", "", ["RPG32_HE_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_tna_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

private _rifles = [
	["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F"], [], ""]
];
private _tunedRifles = [
	["arifle_AK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
	["arifle_AK12_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
];
private _enforcerRifles = [
	["SMG_05_F", "", "", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Red"], [], ""],
	["arifle_AKM_F", "", "", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""],
	["arifle_AKM_F", "", "", "", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F"], [], ""]
];
private _carbines = [
	["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Tracer_F"], [], ""]
];
private _gls = [
	["arifle_AK12_GL_F", "", "", "", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""]
];
private _mgs = [
	["LMG_03_F", "", "", "", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
];
private _marksmanRifles = [
	["arifle_AK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
	["arifle_AK12_F", "", "acc_flashlight", "optic_DMS", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
];

private _rpgs = [
	["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
	["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
	["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
	["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
];

private _pistols = ["hgun_Pistol_01_F"];

private _helmets = ["H_Helmet_Skate"];

if (_hasGM) then {
    #include "..\DLC_content\weapons\GM\Vanilla_Rivals.sqf" 
};

if (_hasRF) then {
	#include "..\DLC_content\weapons\RF\Vanilla_Rivals.sqf" 
};

if (_hasContact) then {
	#include "..\DLC_content\weapons\Contact\Vanilla_Rivals.sqf" 
};

if (_hasMarksman) then {
	#include "..\DLC_content\weapons\Marksman\Vanilla_Rivals.sqf" 
};

if (_hasApex) then {
	#include "..\DLC_content\weapons\Apex\Vanilla_Rivals.sqf" 
};

if (_hasWs) then {
	#include "..\DLC_content\weapons\WS\Vanilla_Rivals.sqf" 
};

if (_hasCSLA) then {
    #include "..\DLC_content\weapons\CSLA\Vanilla_Rivals.sqf" 
};

if (_hasSOG) then {
    #include "..\DLC_content\weapons\SOG\Vanilla_Rivals.sqf" 
};

if (_hasSPE) then {
    #include "..\DLC_content\weapons\SPE\Vanilla_Rivals.sqf" 
};

_loadoutData set ["rifles", _rifles];
_loadoutData set ["tunedRifles", _tunedRifles];
_loadoutData set ["enforcerRifles", _enforcerRifles];
_loadoutData set ["carbines", _carbines];
_loadoutData set ["grenadeLaunchers", _gls];
_loadoutData set ["machineGuns", _mgs];
_loadoutData set ["marksmanRifles", _marksmanRifles];
_loadoutData set ["lightATLaunchers", _rpgs];

_loadoutData set ["sidearms", _pistols];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData set ["facewear", [
	"G_Aviator",
	"G_Combat",
	"G_Bandanna_aviator",
	"G_Bandanna_Syndikat2",
	"G_Bandanna_beast",
	"G_Bandanna_sport",
	"G_Bandanna_shades",
	"G_Bandanna_blk"
]];

_loadoutData set ["fullmask", []];

_loadoutData set ["headgear", [
    "H_Booniehat_oli",
    "H_Beret_blk",
    "H_Cap_oli",
    "H_Cap_headphones",
	"H_Watchcap_camo"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

_loadoutData set ["uniforms", [
	"U_I_C_Soldier_Bandit_4_F",
	"U_I_C_Soldier_Bandit_1_F",
	"U_I_C_Soldier_Bandit_2_F",
	"U_I_C_Soldier_Bandit_5_F",
	"U_I_C_Soldier_Bandit_3_F"
]];

private _vests = ["V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F", "V_TacVest_blk"];
_loadoutData set ["offuniforms", ["U_I_C_Soldier_Camo_F"]];
_loadoutData set ["vests", _vests];

private _backpacks = ["B_AssaultPack_rgr","B_AssaultPack_cbr","B_AssaultPack_sgg","B_AssaultPack_khk","B_AssaultPack_blk","B_TacticalPack_oli","B_Carryall_oli","B_Kitbag_sgg","B_FieldPack_oli"];
_loadoutData set ["backpacks", _backpacks];
_loadoutData set ["helmets", _helmets];
private _crewhelmets = ["H_Tank_black_F"];
_loadoutData set ["crewHelmets", _crewhelmets];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F", "V_TacVest_blk"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["V_TacChestrig_cbr_F"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O"]];

if (_hasLawsOfWar) then {
	#include "..\DLC_content\gear\Lawsofwar\Vanilla_Rivals.sqf" 
};

if (_hasArtOfWar) then {
	#include "..\DLC_content\gear\Artofwar\Vanilla_Rivals.sqf" 
};

if (_hasSOG) then {
    #include "..\DLC_content\weapons\SOG\Vanilla_Rivals.sqf" 
};

if (_hasSPE) then {
    #include "..\DLC_content\weapons\SPE\Vanilla_Rivals.sqf" 
};

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_medic"] call _fnc_addItemSet;
	["items_medic_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 2] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_explosivesExpert_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["lightExplosives", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["crewHelmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "fullmask", 1.25, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["carbines"] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_crew_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
