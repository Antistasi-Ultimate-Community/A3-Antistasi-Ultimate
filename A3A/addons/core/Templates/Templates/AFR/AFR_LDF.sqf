//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "LDF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "LDF"]] call _fnc_saveToTemplate;

["flag", "Flag_Enoch_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f_enoch\flags\flag_enoch_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Enoch"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["I_SDV_01_F"]] call _fnc_saveToTemplate;

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["B_SDV_01_F"];
private _unarmedVehicles = ["AFR_I_LDF_m1151_olive", "AFR_I_LDF_m1152_olive", "AFR_I_LDF_m1152_TCV_olivee", "AFR_I_LDF_m1152_rsv_olive"];
private _armedVehicles = ["AFR_I_LDF_m1151_m2_v1", "AFR_I_LDF_m1151_olive_pkm"];
private _Trucks = ["rhsgref_nat_ural", "rhsgref_nat_ural_open"];
private _cargoTrucks = ["rhsgref_nat_ural", "rhsgref_nat_ural_open"];
private _ammoTrucks = ["RHS_Ural_Ammo_MSV_01"];
private _repairTrucks = ["RHS_Ural_Repair_MSV_01"];
private _fuelTrucks = ["RHS_Ural_Fuel_MSV_01"];
private _medicalTrucks = ["rhs_gaz66_ap2_msv"];
private _lightAPCs = ["AFR_I_LDF_btr80_msv", "AFR_I_LDF_btr80a_msv", "rhs_bmp1d_msv"];
private _APCs = ["rhs_bmp2d_msv", "rhs_bmp2k_msv", "rhs_bmp3_msv"];
private _IFVs = ["rhs_bmp2d_msv", "rhs_bmp2k_msv"];
private _airborneVehicles = ["rhs_bmd4_vdv", "rhs_bmd4m_vdv", "rhs_bmd4ma_vdv", "rhs_bmp2d_msv", "rhs_bmp2k_msv", "rhs_bmp3_msv"];
private _tanks = ["rhs_t72ba_tv", "rhs_t80", "rhs_t80b"];
private _lightTanks = ["rhs_sprut_vdv"];
private _aa = ["rhs_zsu234_aa", "rhsgref_nat_ural_Zu23"];

private _transportBoat = ["I_C_Boat_Transport_02_F"];
private _gunBoat = ["rhsusf_mkvsoc"];

private _planesCAS = ["AFR_I_LDF_su25_Splinter"];
private _planesAA = ["AFR_I_AAF_Gripen_Fighter_Grey"];

private _planesTransport = ["RHS_C130J"];
private _gunship = ["B_T_VTOL_01_armed_F"];

private _helisLight = ["AFR_I_LDF_Heli_Light_3_Unarmed"];
private _transportHelicopters = ["AFR_I_LDF_RHS_UH60M"];
private _helisLightAttack =  ["AFR_I_LDF_Heli_Light_3"];
private _helisAttack = ["RHS_AH64D_wd"];

private _airPatrol = ["AFR_I_LDF_Heli_Light_3", "RHS_AH64D_wd"];

["vehiclesArtillery", ["rhsusf_m109_usarmy", "RHS_BM21_MSV_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["rhsusf_m109_usarmy",["rhs_mag_155mm_m795_28"]],
    ["RHS_BM21_MSV_01",["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["B_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:

private _militiaLightArmed = ["AFR_I_LDF_m1151_olive_pkm"];
private _militiaTrucks = ["AFR_I_LDF_m1152_olive"];
private _militiaCars = ["AFR_I_LDF_m1151_olive", "AFR_I_LDF_m1152_rsv_olive"];
private _militiaAPCs = ["AFR_I_LDF_btr80_msv"];

private _policeVehs = ["AFR_I_LDF_m1152_olive"];

["staticMGs", ["rhsgref_nat_DSHKM", "RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_nat_SPG9", "RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_nat_ZU23", "RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_nat_2b14"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhs_D30_msv"]] call _fnc_saveToTemplate;

private _radar = selectRandom ["rhs_p37_turret_vpvo", "rhs_prv13_turret_vpvo"];
private _SAM = "B_SAM_System_03_F";

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "..\RHS\RHS_Vehicle_Attributes.sqf"

["vehiclesAirPatrol", _airPatrol] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["howitzerMagazineHE", "",""] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _militiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _militiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _militiaCars] call _fnc_saveToTemplate;
["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;
["vehiclesBasic", _basic] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _planesTransport] call _fnc_saveToTemplate;
["vehiclesHelisLight", _helisLight] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _helisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _helisAttack] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
["vehicleRadar", _radar] call _fnc_saveToTemplate;
["vehicleSam", _SAM] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _planesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _planesAA] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _lightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _IFVs] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _militiaAPCs] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _unarmedVehicles] call _fnc_saveToTemplate;
["vehiclesLightArmed", _armedVehicles] call _fnc_saveToTemplate;
["vehiclesLightTanks",  _lightTanks] call _fnc_saveToTemplate;
["vehiclesAirborne", _airborneVehicles] call _fnc_saveToTemplate;
["vehiclesAA", _aa] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesTrucks", _Trucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _ammoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _repairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _fuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _medicalTrucks] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _faces = ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_6","LivonianHead_9","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"];
["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01pol","Male02pol","Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

["insignia", ["", "", ""]] call _fnc_saveToTemplate;
["milInsignia", ["", "", ""]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

// Note on loadout array weighting:
// If a given loadoutData variable has a weighted array, make sure all mod/DLC compats also have a weighted array for the same.
// To simplify work on mod/DLC compats, the weighted arrays here are made to sum up to 10. This is so that compats have a consistent base to work off but is not strictly necessary.

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", [
    ["rhs_weap_ak74n_2", "", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N22_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK"], [], ""], 6
]];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", [
    ["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n21_20", "rhs_mag_9x19mm_7n21_20"], [], ""], 6,
    ["rhs_weap_aks74u", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""], 3
]];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", ["rhs_weap_igla", "rhs_weap_fim92"]];
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
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_flag", "U_AFR_LDFSplinter_bdu_raid_blench_knee"]];
_loadoutData set ["traitorVests", ["rhssaf_vest_md99_md2camo_rifleman", "rhssaf_vest_md99_md2camo_rifleman_radio"]];
_loadoutData set ["traitorHats", ["rhs_6b7_1m_olive","rhs_beanie_green"]];

_loadoutData set ["officerUniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_trop", "U_AFR_LDFSplinter_bdu_raid_blench_flag"]];
_loadoutData set ["officerVests", ["rhssaf_vest_md99_md2camo_radio"]];
_loadoutData set ["officerHats", ["H_Beret_EAF_01_F"]];

_loadoutData set ["cloakUniforms", ["U_Simc_regenkot", "U_Simc_regenkot_og107"]];
_loadoutData set ["cloakVests", ["V_Simc_vest_aws_rig_1", "V_Simc_vest_aws_rig_3"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["V_Simc_vest_aws_rig_3"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_eaf_F", "B_RadioBag_01_wdl_F"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_EAF_01_F"]];
_loadoutData set ["sniHats", ["H_Booniehat_eaf"]];

_loadoutData set ["glasses", [
    "G_Nomex_2_cut",
    "G_comba_2",
    "G_tweed_tacticool_oranje_peltor",
    "G_tweed_tacticool_comba",
    "G_tweed_tacticool_peltor_oak",
    "G_oak_2",
    "G_oak_2_cut"
]];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries", "I_IR_Grenade"];
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["U_AFR_LDF_ACU_Knee_Jedi_SPLINTER", 4, "U_AFR_LDF_ACU_Knee_SPLINTER", 4, "U_AFR_LDF_ACU_Knee_Trop_SPLINTER", 2]];
_sfLoadoutData set ["slUniforms", ["U_AFR_LDF_ACU_Knee_Trop_SPLINTER", 10]];
_sfLoadoutData set ["vests", ["AFR_ION_V_tweed_msv_mk2_1_OLIVE", 3, "AFR_ION_V_tweed_msv_mk2_2_OLIVE", 5, "AFR_ION_V_tweed_msv_mk2_cell_1_OLIVE", 5]];
_sfLoadoutData set ["Hvests", ["AFR_ION_V_tweed_msv_mk2_249_OLIVE", 5, "AFR_ION_V_tweed_msv_mk2_4cm_2_OLIVE", 3]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_wdl_F", 6, "AFR_B_Molle_sturm_Olive", 4, "AFR_LDF_Splinter_assault_umbts", 2]];
_sfLoadoutData set ["helmets", ["rhsusf_mich_bare_norotos_arc", 5, "rhsusf_mich_bare_norotos_arc_alt", 1, "rhsusf_mich_bare_norotos_arc_alt_headset", 3, "rhsusf_mich_bare_norotos_arc_headset", 3]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];

_sfRifleOpticsWest = ["rhsusf_acc_su230_c", 6, "rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4, "", 8];
_sfSlRifleOpticsWest = ["rhsusf_acc_su230_c", 8, "rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_sfAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_sfLoadoutData set ["slRifles", [
    ["rhs_weap_g36kv", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfSlRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_g36c", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfSlRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsd2", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5,
    ["rhs_weap_vhsd2_ct15x", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_sfLoadoutData set ["rifles", [
    ["rhs_weap_g36kv", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_g36c", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsd2", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5,
    ["rhs_weap_vhsd2_ct15x", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5,
    ["rhs_weap_vhsk2", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_sfLoadoutData set ["carbines", [
    ["rhs_weap_g36c", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsk2", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_sfLoadoutData set ["SMGs", [
    ["rhs_weap_g36c", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsk2", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_g36kv_ag36", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3,
    ["rhs_weap_vhsd2_bg", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3,
    ["rhs_weap_vhsd2_bg_ct15x", "rhsgref_sdn6_suppressor", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
]];

_sfMGOptics = ["rhsusf_acc_ELCAN", 7.5, "", 2.5];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_m249", "", _sfAttachmentsWest, _sfMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7,
    ["rhs_weap_m249_pip", "", _sfAttachmentsWest, _sfMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7,
    ["rhs_weap_m249_pip_L_para", "", _sfAttachmentsWest, _sfMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7
]];

_sfMarksmanOptics = ["rhsusf_acc_nxs_3515x50_md", 10, "rhsusf_acc_su230a", 5];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", _sfAttachmentsWest, _sfMarksmanOptics, ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_harris_bipod"], 10
]];

_sfLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", ["rhsusf_acc_M8541_low", 10], ["rhsusf_5Rnd_762x51_m118_special_Mag","rhsusf_5Rnd_762x51_m62_Mag","rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"], 10,
    ["rhs_weap_XM2010", "rhsusf_acc_M2010S_wd", "", ["rhsusf_acc_M8541", 10], ["rhsusf_5Rnd_300winmag_xm2010"], [], ""], 5
]];

_sfLoadoutData set ["sidearms", ["rhsusf_weap_glock17g4", 10, "rhsusf_weap_m1911a1", 10]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["U_AFR_LDF_ACU_Knee_Jedi_SPLINTER", 4, "U_AFR_LDF_ACU_Knee_SPLINTER", 4, "U_AFR_LDF_ACU_Knee_Trop_SPLINTER", 2]];
_eliteLoadoutData set ["slUniforms", ["U_AFR_LDF_ACU_Knee_Trop_SPLINTER", 10]];
_eliteLoadoutData set ["vests", ["AFR_ION_V_tweed_msv_mk2_1_OLIVE", 3, "AFR_ION_V_tweed_msv_mk2_2_OLIVE", 5, "AFR_ION_V_tweed_msv_mk2_cell_1_OLIVE", 5]];
_eliteLoadoutData set ["Hvests", ["AFR_ION_V_tweed_msv_mk2_249_OLIVE", 5, "AFR_ION_V_tweed_msv_mk2_4cm_2_OLIVE", 3]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_wdl_F", 6, "AFR_B_Molle_sturm_Olive", 4, "AFR_LDF_Splinter_assault_umbts", 2]];
_eliteLoadoutData set ["helmets", ["rhsusf_mich_bare_norotos_arc", 5, "rhsusf_mich_bare_norotos_arc_alt", 1, "rhsusf_mich_bare_norotos_arc_alt_headset", 3, "rhsusf_mich_bare_norotos_arc_headset", 3]];
_eliteLoadoutData set ["binoculars", ["Rangefinder"]];

_eliteRifleOpticsWest = ["rhsusf_acc_su230_c", 6, "rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4, "", 8];
_eliteSlRifleOpticsWest = ["rhsusf_acc_su230_c", 8, "rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_eliteAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_eliteLoadoutData set ["slRifles", [
    ["rhs_weap_g36kv", "", _eliteAttachmentsWest, _eliteSlRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_g36c", "", _eliteAttachmentsWest, _eliteSlRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsd2", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5,
    ["rhs_weap_vhsd2_ct15x", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_eliteLoadoutData set ["rifles", [
    ["rhs_weap_g36kv", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_g36c", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsd2", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5,
    ["rhs_weap_vhsd2_ct15x", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5,
    ["rhs_weap_vhsk2", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_eliteLoadoutData set ["carbines", [
    ["rhs_weap_g36c", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsk2", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_eliteLoadoutData set ["SMGs", [
    ["rhs_weap_g36c", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""], 3.5,
    ["rhs_weap_vhsk2", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""], 3.5
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_g36kv_ag36", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3,
    ["rhs_weap_vhsd2_bg", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3,
    ["rhs_weap_vhsd2_bg_ct15x", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
]];

_eliteMGOptics = ["rhsusf_acc_ELCAN", 7.5, "", 2.5];
_eliteLoadoutData set ["machineGuns", [
    ["rhs_weap_m249", "", _eliteAttachmentsWest, _eliteMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7,
    ["rhs_weap_m249_pip", "", _eliteAttachmentsWest, _eliteMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7,
    ["rhs_weap_m249_pip_L_para", "", _eliteAttachmentsWest, _eliteMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7
]];

_eliteMarksmanOptics = ["rhsusf_acc_nxs_3515x50_md", 10, "rhsusf_acc_su230a", 5];
_eliteLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14ebrri", "", _eliteAttachmentsWest, _eliteMarksmanOptics, ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_harris_bipod"], 10
]];

_eliteLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "", "", ["rhsusf_acc_M8541_low", 10], ["rhsusf_5Rnd_762x51_m118_special_Mag","rhsusf_5Rnd_762x51_m62_Mag","rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"], 10,
    ["rhs_weap_XM2010", "", "", ["rhsusf_acc_M8541", 10], ["rhsusf_5Rnd_300winmag_xm2010"], [], ""], 5
]];

_eliteLoadoutData set ["sidearms", ["rhsusf_weap_glock17g4", 10, "rhsusf_weap_m1911a1", 10]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_flag", 4, "U_AFR_LDFSplinter_bdu_raid_blench_knee", 0.5, "U_AFR_LDFSplinter_bdu_raid_blench_trop", 2, "U_AFR_LDFSplinter_bdu_raid_blench_knee_trop", 3]];
_militaryLoadoutData set ["slUniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_knee_nomex_trop", 10]];
_militaryLoadoutData set ["vests", ["V_CarrierRigKBT_01_light_EAF_F", 3, "V_CarrierRigKBT_01_light_Olive_F", 3, "rhssaf_vest_md99_md2camo_rifleman", 5, "rhssaf_vest_md99_md2camo_rifleman_radio", 5, "rhssaf_vest_md99_woodland_rifleman", 5, "rhssaf_vest_md99_woodland_rifleman_radio"]];
_militaryLoadoutData set ["Hvests", ["V_CarrierRigKBT_01_light_Olive_F", 5, "V_CarrierRigKBT_01_heavy_EAF_F", 3]];
_militaryLoadoutData set ["backpacks", ["AFR_aaf_pack_ass", 4, "AFR_B_Molle_sturm_Olive", 2, "AFR_LDF_Splinter_assault_umbts_Flag", 3, "AFR_LDF_Splinter_assault_umbts", 2]];
_militaryLoadoutData set ["helmets", ["rhs_6b7_1m", 5, "rhs_6b7_1m_ess", 5, "rhs_6b7_1m_olive", 3, "rhs_6b47", 3, "rhs_6b47_bare", 3]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryRifleOpticsWest = ["rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4, "", 8];
_militarySlRifleOpticsWest = ["rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_militaryAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_militaryRifleOpticsEast = ["rhs_acc_ekp8_02", 4, "rhs_acc_okp7_dovetail", 3, "rhs_acc_pkas", 2, "", 8];
_militarySlRifleOpticsEast = ["rhs_acc_1p63", 10];
_militaryAttachmentsEast = ["rhs_acc_2dpZenit", 2, "", 8];

_militaryLoadoutData set ["slRifles", [
    ["rhs_weap_ak74m_gp25", "", _militaryAttachmentsEast, _militarySlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 3.5,
    ["rhs_weap_ak74m_zenitco01", "", _militaryAttachmentsEast, _militarySlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 3.5,
    ["rhs_weap_m4_carryhandle", "", _militaryAttachmentsWest, _militarySlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m16a4_imod", "", _militaryAttachmentsWest, _militarySlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_ak74m", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74m_npz", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74n_2", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""], 3.5,
    ["rhs_weap_m16a4", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m4", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["carbines", [
    ["rhs_weap_m4a1_carryhandle", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74_gp25", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, [" rhs_30Rnd_545x39_7N6M_AK", " rhs_30Rnd_545x39_7N6_AK"], [" rhs_VOG25", " rhs_VG40OP_green", " rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_m16a4_carryhandle_M203", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
]];

_militaryMGOptics = ["rhs_acc_pkas", 3.5, "", 8.5];
_militaryLoadoutData set ["machineGuns", [
    ["rhs_weap_rpk74m", "", _militaryAttachmentsEast, _militaryMGOptics, ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N22_AK"], [], ""], 5,
    ["rhs_weap_pkm", "", _militaryAttachmentsEast, _militaryMGOptics, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR_7N13"], [], ""], 5,
    ["rhs_weap_m249", "", _militaryAttachmentsWest, _militaryMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7
]];

_militaryMarksmanOptics = ["", 10];
_militaryLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14ebrri", "", _militaryAttachmentsWest, _militaryMarksmanOptics, ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_harris_bipod"], 10,
    ["rhs_weap_svdp", "", "", "", ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
]];

_militaryLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "", "", ["rhsusf_acc_M8541_low", 10], ["rhsusf_5Rnd_762x51_m118_special_Mag","rhsusf_5Rnd_762x51_m62_Mag","rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"], 10,
    ["rhs_weap_XM2010", "", "", ["rhsusf_acc_M8541", 10], ["rhsusf_5Rnd_300winmag_xm2010"], [], ""], 5
]];

_militaryLoadoutData set ["sidearms", ["rhsusf_weap_glock17g4", 10, "rhsusf_weap_m1911a1", 10]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_flag", 10, "U_AFR_LDFSplinter_bdu_raid_blench_trop", 10]];
_policeLoadoutData set ["vests", ["AFR_LDF_M99RiflemanRadio_Splinter", 4, "AFR_LDF_M99Rifleman_Splinter", 2]];
_policeLoadoutData set ["helmets", ["rhssaf_beret_black", 10, "H_Watchcap_blk", 10, "H_Booniehat_eaf", 10]];

_policeLoadoutData set ["SMGs", [ // CBA rewriting the stupid template to remove SMGs
    ["rhs_weap_m14", "", "", "", ["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m118_special_Mag"], [], ""], 6,
    ["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""], 3,
    ["rhs_weap_ak74n_2", "", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N22_plum_AK"], [], ""], 3
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_pya", 10]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_flag", 3, "U_AFR_LDFSplinter_bdu_raid_blench_knee", 2, "U_AFR_LDFSplinter_bdu_raid_blench_trop", 3]];
_militiaLoadoutData set ["vests", ["V_SmershVest_01_F", 5, "V_SmershVest_01_radio_F", 5, "AFR_LDF_Vest_MD12_Splinter", 1.25, "AFR_LDF_M99Rifleman_Splinter", 3.5, "AFR_LDF_M99RiflemanRadio_Splinter", 3.75]];
_militiaLoadoutData set ["Hvests", ["V_CarrierRigKBT_01_light_EAF_F", 10]];
_militiaLoadoutData set ["backpacks", ["AFR_aaf_pack_ass", 4, "AFR_B_Molle_sturm_Olive", 2, "AFR_LDF_Splinter_assault_umbts_Flag", 3, "AFR_LDF_Splinter_assault_umbts", 2]];
_militiaLoadoutData set ["helmets", ["H_Booniehat_eaf", 5, "H_Simc_Boon_green_5", 4, "H_Simc_Boon_green_6", 3, "rhs_6b7_1m", 2, "rhs_6b7_1m_olive", 2]];

_militiaRifleOptics = ["", 8];
_militiaSlRifleOptics = ["", 2];
_militiaAttachments = ["", 6];

_militiaLoadoutData set ["slRifles", [
    ["rhs_weap_ak74m", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 6,
    ["rhs_weap_ak74m_gp25", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74n_2", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 6,
    ["rhs_weap_m16a4_carryhandle", "", _militiaAttachments, _militiaRifleOptics, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militiaLoadoutData set ["rifles", [
    ["rhs_weap_akm", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_polymer"], [], ""], 5.5,
    ["rhs_weap_akmn", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_polymer"], [], ""], 5.5,
    ["rhs_weap_aks74", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""], 3.5,
    ["rhs_weap_aks74n", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK"], [], ""], 3.5,
    ["rhs_weap_m16a4_carryhandle", "", _militiaAttachments, _militiaRifleOptics, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m4_carryhandle_mstock", "", _militiaAttachments, _militiaRifleOptics, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_l1a1_wood", "", _militiaAttachments, _militiaRifleOptics, ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80a1_fnfal"], [], ""], 3.5
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_akms", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_89", "rhs_30Rnd_762x39mm_U"], [], ""], 5.5,
    ["rhs_weap_m4a1_carryhandle", "", _militiaAttachments, _militiaRifleOptics, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akm_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 8,
    ["rhs_weap_akmn_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 8,
    ["rhs_weap_aks74_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_aks74n_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_m16a4_carryhandle_M203", "", _militiaAttachments, _militiaRifleOptics, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
]];

_militiaMGOptics = ["rhs_acc_pkas", 3.5, "", 8.5];
_militiaLoadoutData set ["machineGuns", [
    ["rhs_weap_rpk74m", "", _militiaAttachments, _militiaMGOptics, ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N22_AK"], [], ""], 10,
    ["rhs_weap_pkm", "", _militiaAttachments, _militiaMGOptics, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR_7N13"], [], ""], 3,
    ["rhs_weap_fnmag", "", _militiaAttachments, _militiaMGOptics, ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m80a1epr"], [], ""], 7
]];

_militiaMarksmanOptics = ["", 10];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14", "", _militiaAttachments, _militiaMarksmanOptics, ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_harris_swivel"], 10,
    ["rhs_weap_svdp", "", "", "", ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
]];

_militiaLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "", "", ["rhsusf_acc_M8541_low", 10], ["rhsusf_5Rnd_762x51_m118_special_Mag","rhsusf_5Rnd_762x51_m62_Mag","rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"], 10,
    ["rhs_weap_svdp_wd", "", "", ["rhs_acc_pso1m2", 10], ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
]];

_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", 10, "rhsusf_weap_m1911a1", 10]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_AFR_LDFPantera_bdu_raid_blench", 10]];
_crewLoadoutData set ["vests", ["rhssaf_vest_md99_md2camo", 10]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", 10]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_AFR_LDFSplinter_bdu_raid_blench_flag", 5]];
_pilotLoadoutData set ["vests", ["rhssaf_vest_md99_md2camo_radio", 10]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_alt", 5, "rhs_zsh7a", 5]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
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

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
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
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines", "marksmanRifles"]] call _fnc_setPrimary;
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
