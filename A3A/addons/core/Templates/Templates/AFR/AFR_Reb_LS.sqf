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

["name", "LS"] call _fnc_saveToTemplate;

["flag", "Flag_Green_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\Flag_green_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_EnochLooters"] call _fnc_saveToTemplate;

private _vehiclesBasic = ["rhsgref_nat_uaz_open"];
private _vehiclesLightUnarmed = ["rhsgref_nat_uaz_open", "rhsgref_nat_uaz", "rhssaf_army_o_m1025_olive", "rhssaf_army_o_m998_olive_2dr_fulltop", "rhssaf_army_o_m998_olive_2dr_halftop"]; 
private _vehiclesLightArmed = ["rhsgref_nat_uaz_dshkm", "rhssaf_army_o_m1025_olive_m2", "rhssaf_army_o_m1151_olive_pkm"];
private _VehTruck = ["rhssaf_army_o_ural", "rhssaf_army_o_ural_open"];
private _vehiclesAt = ["rhsgref_nat_uaz_spg9"];
private _vehicleAA = ["rhs_gaz66_zu23_msv"];

private _vehiclesBoat = ["AFR_I_Syndi_canoe", "I_SDV_01_F", "AFR_I_Syndi_RHIB"];

private _vehiclePlane = ["AFR_I_AAF_RHSGREF_A29B_Grey"];

private _vehiclesMedical = [];

private _vehiclesSupply = ["C_Van_01_box_F"];

private _vehicleCivPlane = ["AFR_B_HIDF_o3a","C_Plane_Civil_01_racing_F"];

private _vehiclesCivCar = ["C_Offroad_02_unarmed_F", "C_Hatchback_01_F", "C_Van_01_transport_F", "C_SUV_01_F"];
private _CivTruck = ["C_Truck_02_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"];
private _civHelicopters = ["RHS_Mi8t_civilian", "AFR_B_ION_UH1H_Unarmed"];
private _CivBoat = ["C_Boat_Civil_01_F", "C_Rubberboat"];

if (_hasEF) then {
  _vehiclesBoat pushBack "EF_B_CombatBoat_HMG_CTRG";
};

if (_hasRF) then {
  _vehiclesLightUnarmed append ["a3a_black_Pickup_mmg_rf", "a3u_black_Pickup_mmg_frame_rf", "a3u_black_Pickup_mmg_alt_rf"];
  _vehiclesLightArmed pushBack "a3u_black_Pickup_rival_rf";
  _vehiclesCivCar append ["C_Pickup_rf", "C_Pickup_covered_rf"];
  _civHelicopters append ["C_Heli_EC_01A_civ_RF", "C_Heli_EC_01_civ_RF"]
};

["staticMGs", ["rhsgref_nat_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_nat_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_nat_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_nat_2b14"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

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
["vehiclesCivSupply", _vehiclesSupply] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;
["vehiclesCivHeli", _civHelicopters] call _fnc_saveToTemplate;
["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesPlane", _vehiclePlane] call _fnc_saveToTemplate;
["vehiclesCivTruck", _CivTruck] call _fnc_saveToTemplate;
["vehiclesTruck", _VehTruck] call _fnc_saveToTemplate;
["vehiclesCivBoat", _CivBoat] call _fnc_saveToTemplate;
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAt] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
  "rhs_weap_tt33",
  "rhs_weap_m1garand_sa43","rhs_weap_m70ab2",
  "rhsgref_8Rnd_762x63_M2B_M1rifle","rhs_10Rnd_762x39mm",
  "rhs_mag_762x25_8",
  "rhs_weap_rpg26",
  "rhs_grenade_nbhgr39B_mag", "rhs_grenade_sthgr24_mag",
  ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
  "B_AssaultPack_wdl_F", "B_CivilianBackpack_01_Everyday_Black_F", "B_simc_US_Bandoleer_556_doppel_2", "B_simc_US_Bandoleer_556_3", "B_tweed_pack_wasser_molle_od7_alt", "B_tweed_pack_camel_thermos_od7",
  "Binocular",
  "rhs_weap_rsp30_white","rhs_mag_rsp30_white",
  "rhs_weap_rsp30_green","rhs_mag_rsp30_green",
  "rhs_weap_rsp30_red", "rhs_mag_rsp30_red",
  "rhs_mag_nspd", "rhs_mag_nspn_yellow", "rhs_mag_nspn_green", "rhs_mag_nspn_red",
  "rhssaf_vest_md99_woodland_rifleman","rhs_chicom_khk","rhs_lifchik_light","AFR_V_aaf_belt_alice_etool","AFR_V_aaf_belt_alice_alt"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
  "U_simc_tcu_erdl_high_veldjas",
  "U_simc_tcu_erdl_high_veldjas_trop",
  "U_simc_tcu_erdl_high_veldjas_gas",
  "U_simc_tcu_erdl_high_veldjas_gas_trop",
  "U_simc_tcu_veldjas_gas",
  "U_simc_tcu_veldjas_gas_trop",
  "U_AFR_RUS_Gorka_Partizan",
  "U_Simc_bdu_veldjas_trop",
  "U_Simc_bdu_veldjas_gas",
  "U_Simc_CDO_bdu",
  "U_Simc_CDO_bdu_trop",
  "U_Simc_CDO_bdu_trop_alt"
];

private _dlcUniforms = [];

private _headgear = [
  "rhs_ssh68_2",
  "rhs_ssh60",
  "rhsgref_bcap_specter",
  "rhsgref_fieldcap_ttsko_digi",
  "rhssaf_beret_green",
  "H_Bandanna_camo"
];

private _dlcHeadgear = [];

if (_hasRF) then {
  _dlcUniforms append [
    "U_C_PilotJacket_black_RF", 
    "U_C_PilotJacket_open_black_RF", 
    "U_C_PilotJacket_brown_RF", 
    "U_C_PilotJacket_open_brown_RF", 
    "U_C_PilotJacket_lbrown_RF", 
    "U_C_PilotJacket_open_lbrown_RF"
  ];
};

private _headgearAll = (_headgear + _dlcHeadgear);
private _uniformsAll = (_rebUniforms + _dlcUniforms);
["headgear", _headgearAll] call _fnc_saveToTemplate;
["uniforms", _uniformsAll] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01POL", "Male02POL", "Male03POL"]] call _fnc_saveToTemplate;
private _faces = [
  "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
  "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
  "LivonianHead_9", "LivonianHead_10",
  "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
  "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11",
  "WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
  "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"
];
["faces", _faces] call _fnc_saveToTemplate;
//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["uniforms", _uniformsAll];

_loadoutData set ["glasses", ["G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["rhs_scarf", "rhs_balaclava", "rhs_balaclava1_olive", "rhs_facewear_6m2"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
  ["uniforms"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75]] call _fnc_setFacewear;

  ["items_medical_standard"] call _fnc_addItemSet;
  ["items_miscEssentials"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
  ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
  ["uniforms"] call _fnc_setUniform;
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
