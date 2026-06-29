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

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "CTRG"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F_Exp\Flags\flag_CTRG_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CTRG"] call _fnc_saveToTemplate;

["petrosIdentity", createHashMapFromArray [
  ["face", "Miller"],
  ["speaker", "Male01ENGB"],
  ["pitch", 1.1],
  ["firstName", "Miller"],
  ["lastName", ":)"]
]] call _fnc_saveToTemplate;

["petrosPrimary", ["rhs_weap_mk18_bk", 3]] call _fnc_saveToTemplate;
["petrosHandgun", ["rhsusf_weap_glock17g4", 2]] call _fnc_saveToTemplate;
["petrosHeadgear", "tsp_gear_fast_mt_MulticamDarkCover_Black_peltor"] call _fnc_saveToTemplate;
["petrosGoggles", ""] call _fnc_saveToTemplate;
["petrosUniform", "U_tweed_acu_summer_ocp_blench_trop"] call _fnc_saveToTemplate;

private _vehicleBasic = ["AFR_B_CTRG_rhsusf_mrzr4_d"];
private _vehicleLightUnarmed = ["rhsusf_m1043_d", "rhsusf_m998_d_4dr"]; 
private _vehicleLightArmed = ["rhsusf_m1043_d_m2", "rhsusf_m1151_m240_v1_usarmy_d", "rhsusf_M1117_D"];
private _vehicleTruck = ["rhsusf_M977A4_usarmy_d", "rhsusf_M1078A1P2_B_D_fmtv_usarmy"];
private _vehicleAT = ["rhsusf_m1045_d"];
private _vehicleAA = ["RHS_M6"];

private _vehicleBoat = ["rhsusf_mkvsoc", "I_SDV_01_F", "I_C_Boat_Transport_02_F"];

private _vehiclePlane = ["rhsusf_f22", "RHS_A10"];

private _vehicleMedical = [];

private _vehicleSupply = ["C_Van_01_box_F"];

private _vehicleCivPlane = ["RHS_C130J"];

private _vehicleCivCar = ["C_Offroad_02_unarmed_F", "C_Hatchback_01_F", "C_Van_01_transport_F", "C_SUV_01_F"];
private _vehicleCivTruck = ["C_Truck_02_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"];
private _vehicleCivHelicopter = ["AFR_B_ION_UH1H_Unarmed"];
private _vehicleCivBoat = ["C_Boat_Civil_01_F", "C_Rubberboat"];

if (_hasEF) then {
  _vehicleBoat pushBack "EF_B_CombatBoat_HMG_CTRG";
};

if (_hasRF) then {
  _vehicleLightUnarmed append ["a3a_black_Pickup_mmg_rf", "a3u_black_Pickup_mmg_frame_rf", "a3u_black_Pickup_mmg_alt_rf"];
  _vehicleLightArmed pushBack "a3u_black_Pickup_rival_rf";
  _vehicleCivCar append ["C_Pickup_rf", "C_Pickup_covered_rf"];
  _vehicleCivHelicopter append ["C_Heli_EC_01A_civ_RF", "C_Heli_EC_01_civ_RF"];
};

["staticMGs", ["RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", [
	"ATMine_Range_Mag",
	"rhs_mine_tm62m_mag",
	"rhs_mine_M19_mag",
	"rhs_mag_mine_ptm1",
	"SLAMDirectionalMine_Wire_Mag",
	"rhssaf_mine_tma4_mag",
	"rhs_mine_TM43_mag"
]] call _fnc_saveToTemplate;
["minesAPERS", [
	"rhs_mine_M7A2_mag",
	"APERSMine_Range_Mag",
	"rhs_mine_pmn2_mag",
	"APERSBoundingMine_Range_Mag",
	"rhs_mag_mine_pfm1",
	"rhsusf_mine_m14_mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"APERSTripMine_Wire_Mag",
	"rhssaf_tm100_mag",
	"rhssaf_tm200_mag",
	"rhssaf_tm500_mag",
	"rhssaf_mine_pma3_mag",
	"rhssaf_mine_mrud_a_mag",
	"rhssaf_mine_mrud_b_mag",
	"rhssaf_mine_mrud_c_mag",
	"rhssaf_mine_mrud_d_mag",
	"rhs_mine_smine35_press_mag",
	"rhs_mine_smine44_press_mag",
	"rhs_mine_stockmine43_2m_mag",
	"rhs_mine_stockmine43_4m_mag",
	"rhs_mine_M3_tripwire_mag",
	"rhs_mine_Mk2_tripwire_mag",
	"rhs_mine_mk2_pressure_mag",
	"rhs_mine_m3_pressure_mag",
	"rhs_mine_glasmine43_hz_mag",
	"rhs_mine_glasmine43_bz_mag",
	"rhs_mine_m2a3b_press_mag",
	"rhs_mine_m2a3b_trip_mag",
	"rhs_mine_a200_bz_mag",
	"rhs_mine_a200_dz35_mag",
	"rhs_mine_m2a3b_press_mag",
	"rhs_mine_m2a3b_trip_mag",
	"rhs_mine_smine35_trip_mag",
	"rhs_mine_smine44_trip_mag"
]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

["vehiclesCivPlane", _vehicleCivPlane] call _fnc_saveToTemplate;
["vehiclesCivSupply", _vehicleSupply] call _fnc_saveToTemplate;
["vehiclesMedical", _vehicleMedical] call _fnc_saveToTemplate;
["vehiclesBoat", _vehicleBoat] call _fnc_saveToTemplate;
["vehiclesCivHeli", _vehicleCivHelicopter] call _fnc_saveToTemplate;
["vehiclesBasic", _vehicleBasic] call _fnc_saveToTemplate;
["vehiclesPlane", _vehiclePlane] call _fnc_saveToTemplate;
["vehiclesCivTruck", _vehicleCivTruck] call _fnc_saveToTemplate;
["vehiclesTruck", _vehicleTruck] call _fnc_saveToTemplate;
["vehiclesCivBoat", _vehicleCivBoat] call _fnc_saveToTemplate;
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["vehiclesCivCar", _vehicleCivCar] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehicleLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehicleLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehicleAT] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
  "rhsusf_weap_glock17g4",
  "rhs_weap_mk18_bk","rhs_weap_XM2010",
  "rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_5Rnd_300winmag_xm2010",
  "rhsusf_acc_M8541","rhsusf_acc_eotech_xps3","rhsusf_acc_compm4",
  "rhsusf_mag_17Rnd_9x19_JHP",
  "rhs_weap_m72a7",
  "rhs_mag_m67", "B_IR_Grenade",
  ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
  "B_simc_US_Molle_sturm_OCP", "B_simc_US_Molle_sturm_OCP_thermos_OCP", "B_simc_US_Molle_sturm_OCP_etool", "B_simc_US_Molle_sturm_OCP_RTO", "B_simc_US_Molle_asspack_OCP_thermos_OCP",
  "Binocular",
  "rhssaf_mag_brd_m83_white","rhssaf_mag_brd_m83_green","rhssaf_mag_brd_m83_red",
  "V_tweed_msv_mk2_3","V_tweed_msv_mk2_2","V_tweed_msv_mk2_cell_1","V_tweed_msv_mk2_cell_2","V_tweed_msv_mk2_cell_45_1","V_SmershVest_01_F"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _playerUniforms = [
  "U_tweed_acu_summer_ocp_blench_crye_knee",
  "U_tweed_acu_summer_ocp_blench_crye_knee_jedi",
  "U_tweed_acu_summer_ocp_blench_crye_knee_trop",
  "U_tweed_acu_summer_ocp_blench_trop"
];

private _playerUnlocks = [ // Janky hack
  "tsp_gear_fast_mt_MulticamDarkCover_Black_peltor",
  "tsp_gear_fast_mt_MulticamDarkCover_Black_peltor_manta_tec",
  "psq42_blk",
  "psq42_blk_icup",
  "psq42_od3",
  "psq42_od3_icup"
];

private _rebUniforms = _playerUniforms;

private _dlcUniforms = [];

private _headgear = [
  "tsp_gear_fast_mt_MulticamDarkCover_Black_peltor",
  "tsp_gear_fast_mt_MulticamDarkCover_Black_peltor_manta_tec"
];

private _dlcHeadgear = [];

private _headgearAll = (_headgear + _dlcHeadgear);
private _uniformsAll = _playerUniforms;
["headgear", _headgearAll] call _fnc_saveToTemplate;
["uniforms", _uniformsAll] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;
//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["uniforms", _uniformsAll];
_loadoutData set ["rebUniforms", (_rebUniforms + _dlcUniforms)];

_loadoutData set ["glasses", ["G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["rhs_scarf", "AFR_LDF_Balaclava_Black", "G_oak_2", "G_oak_2_cut"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
  ["rebUniforms"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75]] call _fnc_setFacewear;

  ["items_medical_standard"] call _fnc_addItemSet;
  ["items_miscEssentials"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
  ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
  ["rebUniforms"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.35]] call _fnc_setFacewear;

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

waitUntil {sleep 1; !(isNil "jna_datalist")};

_playerUnlocks apply {[_x, true] call A3A_fnc_unlockEquipment};