//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "CSAT"]] call _fnc_saveToTemplate;

["flag", "Flag_CSAT_F"] call _fnc_saveToTemplate;
["flagTexture", "A3\Data_F\Flags\Flag_CSAT_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CSAT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "rhs_7ya37_1_single"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["O_T_Quadbike_01_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["O_T_MRAP_02_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["O_T_MRAP_02_gmg_ghex_F", "O_T_MRAP_02_hmg_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["O_T_Truck_03_covered_ghex_F", "O_T_Truck_03_transport_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["O_T_Truck_02_F", "O_T_Truck_02_transport_F", "O_T_Truck_03_covered_ghex_F", "O_T_Truck_03_transport_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["O_T_Truck_03_ammo_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_T_Truck_03_repair_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_T_Truck_03_fuel_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_T_Truck_03_medical_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", "rhs_btr80_vdv"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", "O_T_APC_Tracked_02_cannon_ghex_F", "rhs_bmd4_vdv", "rhs_bmd4m_vdv"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", "rhs_btr80a_vdv"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["O_T_APC_Tracked_02_cannon_ghex_F"]] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["O_T_MBT_04_cannon_F", "O_T_MBT_04_command_F", "rhs_sprut_vdv"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["O_T_MBT_04_cannon_F", "O_T_MBT_04_command_F", "O_T_MBT_02_railgun_ghex_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["O_T_APC_Tracked_02_AA_ghex_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_T_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F", "O_T_VTOL_02_infantry_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_Plane_CAS_02_dynamicLoadout_F", "O_T_VTOL_02_infantry_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_T_VTOL_02_infantry_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", ["O_Plane_Gunship_02_F"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["AFR_O_PLA_O_Heli_Transport_04_covered_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["AFR_O_PLA_O_Heli_Transport_04_bench_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["a3a_Heli_Light_02_black_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_Ka52_vvs"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", ["RHS_Ka52_vvs"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_T_MBT_02_arty_ghex_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["O_T_MBT_02_arty_ghex_F",["32Rnd_155mm_Mo_shells_O", "2Rnd_155mm_Mo_Cluster_O"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_T_UAV_04_CAS_F", "O_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["I_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["O_T_LSV_02_armed_F", "O_T_LSV_02_AT_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_T_Truck_02_transport_F", "O_T_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["O_T_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["O_T_MRAP_02_hmg_ghex_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["rhs_KORD_high_MSV"]] call _fnc_saveToTemplate;
["staticAT", ["rhs_Kornet_9M133_2_msv"]] call _fnc_saveToTemplate;
["staticAA", ["rhs_Igla_AA_pod_msv"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhs_D30_msv"]] call _fnc_saveToTemplate;

["vehicleRadar", "O_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", "O_SAM_System_04_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "..\RHS\RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;

private _faces = ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"];
private _sfFaces = ["RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5"];

["faces", _faces] call _fnc_saveToTemplate;
["sfFaces", _sfFaces] call _fnc_saveToTemplate;
["insignia", ["simc_9id", "", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["Spetsnaz223rdDetachment", "", ""]] call _fnc_saveToTemplate;
["milInsignia", ["tweed_7id", "", ""]] call _fnc_saveToTemplate;

"ChineseMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mag_mine_ptm1", "rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_ozm72_a_mag", "rhs_mine_ozm72_b_mag", "rhs_mine_ozm72_c_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_rgo", "rhs_mag_rgn"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["psq42_blk_icup", "psq42_blk_lenscap", "psq42_blk"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["traitorUniforms", ["U_AFR_PLA_BDU_Blench", "U_AFR_PLA_BDU_Blench_trop", "U_AFR_PLA_BDU_Blench_knee_trop"]];
_loadoutData set ["traitorVests", ["AFR_V_tweed_iotv_mk4_cell_1_PLA"]];
_loadoutData set ["traitorHats", ["H_Beret_blk"]];

_loadoutData set ["officerUniforms", ["U_AFR_PLA_BDU_Blench", "U_AFR_PLA_BDU_Blench_trop", "U_AFR_PLA_BDU_Blench_knee_trop"]];
_loadoutData set ["officerVests", ["AFR_V_tweed_iotv_mk4_e_2_PLA"]];
_loadoutData set ["officerHats", ["H_Beret_CSAT_01_F"]];

_loadoutData set ["cloakUniforms", ["U_AFR_PLA_BDU_Blench_knee", "U_AFR_PLA_BDU_Blench_knee_trop"]];
_loadoutData set ["cloakVests", ["AFR_V_tweed_iotv_mk4_1_PLA", "AFR_V_tweed_iotv_mk4_cell_1_PLA"]];
_loadoutData set ["cloakCarbines", [
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "muzzle_snds_58_blk_F", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_ARX_blk_F", "muzzle_snds_65_TI_blk_F", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "muzzle_snds_65_TI_blk_F", "", "optic_ERCO_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "muzzle_snds_65_TI_blk_F", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""]
]];
_loadoutData set ["cloakRifles", [
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"],
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"],
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_loadoutData set ["cloakSidearms", [
    ["rhs_weap_pya", "", "", "", ["rhs_mag_9x19_17"], [], ""]
]];

_loadoutData set ["uniforms", []];
_loadoutData set ["ATvests", ["AFR_V_tweed_iotv_mk4_4cm_2_PLA"]];
_loadoutData set ["MGvests", ["AFR_V_tweed_iotv_mk4_249_PLA"]];
_loadoutData set ["MEDvests", ["AFR_V_tweed_iotv_mk4_45_1_PLA"]];
_loadoutData set ["SLvests", ["AFR_V_tweed_iotv_mk4_cell_45_2_PLA"]];
_loadoutData set ["SNIvests", ["AFR_V_tweed_iotv_mk4_cell_1_PLA"]];
_loadoutData set ["GLvests", ["AFR_V_tweed_iotv_mk4_cell_4cm_1_PLA"]];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["expBackpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["aaBackpacks", ["AFR_ViperHarness_PLA"]];
_loadoutData set ["longRangeRadios", ["AFR_RadioBag_PLA"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_CSAT_01_F", "AFR_H_HelmetSpecB_PLA_FLAG", "tsp_gear_fast_sf_PLA_amp_pvs"]];
_loadoutData set ["sniHats", ["H_Simc_Boon_zwart_2", "H_Simc_Boon_zwart_6", "AFR_H_HelmetSpecB_PLA"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
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

_loadoutData set ["glasses", [
    "G_tweed_tacticool_oranje_comba",
    "G_tweed_tacticool_oranje_peltor",
    "G_tweed_tacticool_oranje_peltor_comba",
    "G_tweed_tacticool_weiss_comba",
    "G_tweed_tacticool_weiss_peltor_oak",
    "G_tweed_tacticool_comba",
    "G_oak_2"
]];
_loadoutData set ["goggles", ["G_Balaclava_TI_blk_F", "tsp_gear_amp_black_g"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _glAmmo = ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"];

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["U_AFR_RUS_Gorka_ATACS_Full", "U_AFR_RUS_Gorka_ATACS"]];
_sfLoadoutData set ["vests", ["AFR_ION_V_tweed_msv_mk2_cell_45_1_OLIVE", "AFR_ION_V_tweed_msv_mk2_45_1_OLIVE_RUSFLAG", "AFR_ION_V_tweed_msv_mk2_2_OLIVE", "AFR_ION_V_tweed_msv_mk2_cell_2_OLIVE"]];
_sfLoadoutData set ["ATvests", ["AFR_ION_V_tweed_msv_mk2_4cm_1_OLIVE"]];
_sfLoadoutData set ["MGvests", ["AFR_ION_V_tweed_msv_mk2_249_OLIVE"]];
_sfLoadoutData set ["MEDvests", ["AFR_ION_V_tweed_msv_mk2_2_OLIVE"]];
_sfLoadoutData set ["SLvests", ["AFR_ION_V_tweed_msv_mk2_cell_45_1_OLIVE"]];
_sfLoadoutData set ["SNIvests", ["AFR_ION_V_tweed_msv_mk2_cell_1_OLIVE"]];
_sfLoadoutData set ["GLvests", ["AFR_ION_V_tweed_msv_mk2_cell_4cm_1_OLIVE"]];
_sfLoadoutData set ["backpacks", ["B_ViperLightHarness_blk_F"]];
_sfLoadoutData set ["medBackpacks", ["B_ViperLightHarness_blk_F"]];
_sfLoadoutData set ["atBackpacks", ["B_ViperHarness_blk_F"]];
_sfLoadoutData set ["helmets", ["AFR_RUS_6b47_ATACS_emr", "AFR_RUS_6b47_ATACS_emr_1", "AFR_RUS_6b47_ATACS_emr_2"]];

_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_sfLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
    ["arifle_ARX_blk_F", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_ERCO_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["rhs_weap_vhsd2", "", "", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2", "", "", "optic_Holosight_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2", "", "", "optic_ERCO_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2_ct15x", "", "", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "optic_Holosight_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "optic_ERCO_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
    ["rhs_weap_ak74mr", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_vhsd2_bg", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["U_AFR_PLA_BDU_Blench", "U_AFR_PLA_BDU_Blench_trop", "U_AFR_PLA_BDU_Blench_knee"]];
_eliteLoadoutData set ["vests", ["AFR_V_tweed_iotv_mk4_1_PLA", "AFR_V_tweed_iotv_mk4_2_PLA", "AFR_V_tweed_iotv_mk4_cell_1_PLA", "AFR_V_tweed_iotv_mk4_cell_2_PLA"]];
_eliteLoadoutData set ["backpacks", ["AFR_PLA_assault_Molle_asspack_OCP_thermos_PLA", "AFR_PLA_assault_Molle_asspack_Low_OCP_thermos_PLA", "AFR_ViperLightHarness_PLA", "AFR_ViperHarness_PLA"]];
_eliteLoadoutData set ["medBackpacks", ["AFR_ViperHarness_PLA"]];
_eliteLoadoutData set ["atBackpacks", ["B_ViperHarness_blk_F"]];
_eliteLoadoutData set ["helmets", ["tsp_gear_fast_sf_PLA_amp_helstar_pvs_tec", "tsp_gear_fast_sf_PLA_amp_pvs", "tsp_gear_fast_sf_PLA_amp_fold_helstar_pvs_tec", "tsp_gear_fast_sf_PLA"]];

_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_eliteLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_ARX_blk_F", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_ERCO_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["rhs_weap_vhsd2", "", "", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2", "", "", "optic_Holosight_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2", "", "", "optic_ERCO_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2_ct15x", "", "", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "optic_Holosight_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "optic_ERCO_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_eliteLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_AFR_PLA_BDU_Blench", "U_AFR_PLA_BDU_Blench_trop", "U_AFR_PLA_BDU_Blench_knee"]];
_militaryLoadoutData set ["vests", ["AFR_V_tweed_iotv_mk4_1_PLA", "AFR_V_tweed_iotv_mk4_2_PLA", "AFR_V_tweed_iotv_mk4_cell_1_PLA", "AFR_V_tweed_iotv_mk4_cell_2_PLA"]];
_militaryLoadoutData set ["backpacks", ["AFR_PLA_assault_Molle_asspack_OCP_thermos_PLA", "AFR_PLA_assault_Molle_asspack_Low_OCP_thermos_PLA", "AFR_ViperLightHarness_PLA", "AFR_ViperHarness_PLA"]];
_militaryLoadoutData set ["medBackpacks", ["AFR_ViperHarness_PLA"]];
_militaryLoadoutData set ["atBackpacks", ["B_ViperHarness_blk_F"]];
_militaryLoadoutData set ["helmets", ["AFR_H_HelmetSpecB_PLA", "AFR_H_HelmetB_PLA", "AFR_H_HelmetB_light_PLA"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militaryLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_ARX_blk_F", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_ERCO_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["rhs_weap_vhsd2", "", "", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2", "", "", "optic_Holosight_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2", "", "", "optic_ERCO_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsd2_ct15x", "", "", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_Holosight_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""],
    ["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk1", "", "optic_ERCO_blk_F", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_U"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "rhs_acc_1p87", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "optic_Holosight_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
    ["rhs_weap_vhsk2", "", "rhs_acc_perst3", "optic_ERCO_blk_F", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["rhs_weap_vhsd2_bg_ct15x", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];
_militaryLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_AFR_PLA_BDU_Blench", "U_AFR_PLA_BDU_Blench_trop"]];
_policeLoadoutData set ["vests", ["AFR_V_tweed_iotv_mk4_e_2_PLA", "AFR_V_tweed_iotv_mk4_cell_1_PLA", "AFR_V_tweed_iotv_mk4_1_PLA"]];
_policeLoadoutData set ["helmets", ["H_tweed_Hat_fleece", "H_Beret_blk"]];
_policeLoadoutData set ["SMGs", [
    ["arifle_CTAR_blk_F", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n21_20", "rhs_mag_9x19mm_7n31_20"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_pya"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_AFR_PLA_BDU_Blench", "U_AFR_PLA_BDU_Blench_trop", "U_AFR_PLA_BDU_Blench_knee"]];
_militiaLoadoutData set ["vests", ["AFR_V_tweed_iotv_mk4_1_PLA", "AFR_V_tweed_iotv_mk4_2_PLA", "AFR_V_tweed_iotv_mk4_cell_1_PLA", "AFR_V_tweed_iotv_mk4_cell_2_PLA"]];
_militiaLoadoutData set ["backpacks", ["AFR_PLA_assault_Molle_asspack_OCP_thermos_PLA", "AFR_PLA_assault_Molle_asspack_Low_OCP_thermos_PLA", "AFR_ViperLightHarness_PLA", "AFR_ViperHarness_PLA"]];
_militiaLoadoutData set ["medBackpacks", ["AFR_ViperHarness_PLA"]];
_militiaLoadoutData set ["atBackpacks", ["B_ViperHarness_blk_F"]];
_militiaLoadoutData set ["helmets", ["AFR_H_HelmetSpecB_PLA", "AFR_H_HelmetB_PLA", "AFR_H_HelmetB_light_PLA", "H_Watchcap_blk", "H_Beret_blk", "H_tweed_Hat_fleece"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militiaLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_ARX_blk_F", "", "", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_ERCO_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""],
    ["arifle_ARX_blk_F", "", "", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["10Rnd_50BW_Mag_F"], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""],
    ["arifle_CTAR_GL_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], _glAmmo, ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_MRCO", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTARS_blk_F", "", "rhs_acc_perst3", "optic_Arco_blk_F", ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", ["rhs_weap_t5000"]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_AFR_PLA_BDU_Blench_nomex", "U_AFR_PLA_BDU_Blench_knee_nomex_trop"]];
_crewLoadoutData set ["vests", ["AFR_V_tweed_iotv_mk4_e_2_PLA", "AFR_V_tweed_iotv_mk4_e_1_PLA"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_ess"]];
_crewLoadoutData set ["carbines", [
    ["arifle_CTAR_blk_F", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_AFR_PLA_BDU_Blench_nomex", "U_AFR_PLA_BDU_Blench_knee_nomex_trop"]];			
_pilotLoadoutData set ["vests", ["AFR_V_tweed_iotv_mk4_e_2_PLA"]];			
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike", "rhs_zsh7a_mike_alt"]];
_pilotLoadoutData set ["carbines", [
    ["arifle_CTAR_blk_F", "", "", "", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    if (random 1 < 0.15) then {
		[["lightHELaunchers", "lightATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["MEDvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["grenadeLaunchers"] call _fnc_setPrimary;

    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["GLVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["expBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["MGvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SNIvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _patrolSniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["cloakRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["cloakSidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["cloakCarbines"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["cloakSidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};


////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];


[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
