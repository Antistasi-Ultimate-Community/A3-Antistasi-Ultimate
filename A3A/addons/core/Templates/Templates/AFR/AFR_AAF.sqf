//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "AAF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AAF"]] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_aaf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_AAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["I_SDV_01_F"]] call _fnc_saveToTemplate;

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["I_Quadbike_01_F"];
private _unarmedVehicles = ["AFR_I_AAF_m1043_AAF_TAN", "AFR_I_AAF_m1043_AAF_MERDC", "AFR_I_AAF_m998_2dr_fulltop_AAF_TAN", "AFR_I_AAF_m998_2dr_fulltop_AAF_MERDC"];
private _armedVehicles = ["AFR_I_AAF_m1025_m2_AAF_TAN", "AFR_I_AAF_m1025_m2_AAF_MERDC", "AFR_I_AAF_m1151_m2_AAF_Tan", "AFR_I_AAF_m1151_m2_AAF_MERDC"];
private _Trucks = ["AFR_I_AAF_Truck_02_transport_F_MERDC", "AFR_I_AAF_Truck_02_covered_F_MERDC"];
private _cargoTrucks = ["AFR_I_AAF_Truck_02_transport_F_MERDC", "AFR_I_AAF_Truck_02_covered_F_MERDC"];
private _ammoTrucks = ["AFR_I_AAF_Truck_02_ammo_F_MERDC"];
private _repairTrucks = ["AFR_I_AAF_Truck_02_box_F_MERDC"];
private _fuelTrucks = ["AFR_I_AAF_Truck_02_fuel_F_MERDC"];
private _medicalTrucks = ["AFR_I_AAF_Truck_02_Medical_F_MERDC"];
private _lightAPCs = ["AFR_I_AAF_btr80_MERDC", "AFR_I_AAF_btr80a_MERDC", "AFR_I_AAF_M113_M240_MERDC"];
private _APCs = ["AFR_I_AAF_bmp3mera_msv_TAN", "AFR_I_AAF_bmp3mera_msv", "AFR_I_AAF_btr80_MERDC", "AFR_I_AAF_btr80a_MERDC"];
private _IFVs = ["AFR_I_AAF_bmp3mera_msv_TAN", "AFR_I_AAF_bmp3mera_msv"];
private _airborneVehicles = ["AFR_I_AAF_bmp3mera_msv_TAN", "AFR_I_AAF_bmp3mera_msv", "AFR_I_AAF_btr80_MERDC", "AFR_I_AAF_btr80a_MERDC"];
private _tanks = ["rhs_t72ba_tv", "rhs_t80", "rhs_t80b"];
private _lightTanks = ["rhs_sprut_vdv"];
private _aa = ["rhs_zsu234_aa", "RHS_M6_wd"];

private _transportBoat = ["I_C_Boat_Transport_02_F"];
private _gunBoat = ["rhsusf_mkvsoc"];

private _planesCAS = ["AFR_I_AAF_RHSGREF_A29B_Grey"];
private _planesAA = ["AFR_I_AAF_Gripen_Fighter_Grey"];

private _planesTransport = ["RHS_C130J"];
private _gunship = [];

private _helisLight = ["AFR_I_AAF_rhs_uh1h_Unarmed_Olive", "AFR_I_AAF_rhs_uh1h_Armed_Olive"];
private _transportHelicopters = ["AFR_I_AAF_Mi8AMT", "RHS_UH60M"];
private _helisLightAttack =  ["AFR_I_AAF_rhs_uh1h_Gunship_Olive"];
private _helisAttack = ["RHS_AH64D_wd"];

private _airPatrol = ["AFR_I_AAF_rhs_uh1h_Armed_Olive", "RHS_AH64D_wd"];

private _artillery = ["AFR_I_AAF_Truck_02_MRL_MERDC_AAF"];
["magazines", createHashMapFromArray [
    ["AFR_I_AAF_Truck_02_MRL_MERDC_AAF", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["B_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:

private _militiaLightArmed = ["rhs_tigr_m_vv"];
private _militiaTrucks = ["AFR_I_ANP_m998_2dr_fulltop1"];
private _militiaCars = ["AFR_I_ANP_m998_4dr_fulltop", "AFR_I_ANP_m1043_A"];
private _militiaAPCs = ["AFR_I_ANP_btr80_POLICE"];

private _policeVehs = ["AFR_I_ANP_m998_4dr_fulltop"];

private _staticMG = ["AFR_I_AAF_M2StaticMG"];
private _staticAT = ["AFR_I_AAF_Kornet_9M133_2", "AFR_I_AAF_RHS_TOW_TriPod_D", "rhsgref_ins_g_d30_at"];
private _staticAA = ["RHS_Stinger_AA_pod_D"];
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;
private _howitzers = ["rhs_D30_msv"];

private _radar = selectRandom ["rhs_p37_turret_vpvo", "rhs_prv13_turret_vpvo"];
private _SAM = "B_SAM_System_03_F";

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "..\RHS\RHS_Vehicle_Attributes.sqf"

["vehiclesAirPatrol", _airPatrol] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["howitzerMagazineHE", "",""] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
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
["staticHowitzers", _howitzers] call _fnc_saveToTemplate;
["vehicleRadar", _radar] call _fnc_saveToTemplate;
["vehicleSam", _SAM] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _planesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _planesAA] call _fnc_saveToTemplate;
["vehiclesArtillery", _artillery] call _fnc_saveToTemplate;
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

private _faces = ["GreekHead_A3_05","GreekHead_A3_07","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"];

["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

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
    ["arifle_Mk20C_plain_F", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_556x45_M193_2MAG_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Pull", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 6
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

_loadoutData set ["traitorUniforms", ["AFR_U_aaf_bdu_m81_low"]];
_loadoutData set ["traitorVests", ["V_Simc_vest_rba_mk1_alice_1", "V_Simc_vest_rba_mk1_alice_2", "V_Simc_vest_RBA_mk1"]];
_loadoutData set ["traitorHats", ["AFR_H_aaf_patrol_hat_liz","AFR_H_aaf_usmc_hat_liz"]];

_loadoutData set ["officerUniforms", ["AFR_U_aaf_bdu_m81_roll"]];
_loadoutData set ["officerVests", ["AFR_H_aaf_pasgt_alice"]];
_loadoutData set ["officerHats", ["H_Beret_blk"]];

_loadoutData set ["cloakUniforms", ["U_Simc_regenkot", "U_Simc_regenkot_og107"]];
_loadoutData set ["cloakVests", ["AFR_V_aaf_belt_alice_light", "AFR_V_aaf_liz_belt_alice_alt"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["AFR_V_aaf_belt_alice_light"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["B_simc_rajio_flak_Frem_Ligt", "B_simc_rajio_flak_M43_1"]];
_loadoutData set ["atBackpacks", ["B_simc_packboard_roket_2"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["AFR_H_aaf_bush_hat_1", "AFR_H_aaf_bush_hat_2"]];
_loadoutData set ["sniHats", ["AFR_H_aaf_bush_hat_6"]];

_loadoutData set ["glasses", [
    "G_Nomex_2_cut",
    "G_comba_2",
    "G_tweed_tacticool_oranje_peltor"
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
_sfLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_liz_des_low", 4, "AFR_U_aaf_bdu_liz_des_knee_nom_low", 0.5, "AFR_U_aaf_bdu_liz_des_tee", 2, "AFR_U_aaf_bdu_liz_jumpr_trop", 3]];
_sfLoadoutData set ["slUniforms", ["AFR_U_aaf_og107_liz_tuck_trop", 10]];
_sfLoadoutData set ["vests", ["V_Simc_vest_rba_mk1_alice_1", 5, "V_Simc_vest_rba_mk1_alice_2", 5, "V_Simc_vest_rba_mk1_alice_45_1", 5]];
_sfLoadoutData set ["Hvests", ["V_tweed_msv_mk2_249", 5, "V_tweed_msv_mk2_240", 1]];
_sfLoadoutData set ["backpacks", ["B_simc_US_Molle_sturm_OCP_thermos_OCP", 6, "B_simc_US_asspack_61_roll", 4, "AFR_aaf_pack_ass", 2]];
_sfLoadoutData set ["helmets", ["H_Simc_Boon_m81_3", 5, "H_Simc_Boon_m81_2", 3, "H_Simc_Boon_m81_1", 3, "H_Simc_Boon_m81_5", 1, "H_Simc_Boon_m81_6", 1]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];
_sfLoadoutData set ["glasses", ["rhssaf_veil_Green"]];

_sfRifleOpticsWest = ["rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4];
_sfSlRifleOpticsWest = ["rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_sfAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_sfRifleOpticsEast = ["rhs_acc_ekp8_02", 4, "rhs_acc_okp7_dovetail", 3, "rhs_acc_pkas", 2];
_sfSlRifleOpticsEast = ["rhs_acc_1p63", 10];
_sfAttachmentsEast = ["rhs_acc_2dpZenit", 2, "", 8];

_sfLoadoutData set ["slRifles", [
    ["arifle_Mk20_plain_F", "rhsusf_acc_nt4_black", _sfAttachmentsWest, _sfSlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger", "rhs_mag_30Rnd_556x45_M855_Stanag_Pull", "rhs_mag_30Rnd_556x45_M855_Stanag_Ranger"], [], ""], 3.5,
    ["rhs_weap_ak74m_gp25", "rhs_acc_tgpa", _sfAttachmentsEast, _sfSlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 3.5,
    ["rhs_weap_ak74m_zenitco01", "rhs_acc_tgpa", _sfAttachmentsEast, _sfSlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 3.5,
    ["rhs_weap_m4_carryhandle", "rhsusf_acc_nt4_black", _sfAttachmentsWest, _sfSlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m16a4_imod", "rhsusf_acc_nt4_black", _sfAttachmentsWest, _sfSlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_sfLoadoutData set ["rifles", [
    ["rhs_weap_ak74m_zenitco01", "rhs_acc_tgpa", _sfAttachmentsEast, _sfRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74mr", "rhs_acc_tgpa", _sfAttachmentsEast, _sfRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_vss", "", _sfAttachmentsEast, _sfRifleOpticsEast, ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""], 2.5,
    ["rhs_weap_m4_carryhandle", "rhsusf_acc_nt4_black", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m4", "rhsusf_acc_nt4_black", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 5.5
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "rhs_acc_tgpa", _sfAttachmentsEast, _sfRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74_gp25", "rhs_acc_tgpa", _sfAttachmentsEast, _sfRifleOpticsEast, [" rhs_30Rnd_545x39_7N6M_AK", " rhs_30Rnd_545x39_7N6_AK"], [" rhs_VOG25", " rhs_VG40OP_green", " rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_nt4_black", _sfAttachmentsWest, _sfRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
]];

_sfMGOptics = ["rhs_acc_pkas", 3.5, "", 8.5];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_rpk74m", "", _sfAttachmentsEast, _sfMGOptics, ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N22_AK"], [], ""], 5,
    ["rhs_weap_pkm", "", _sfAttachmentsEast, _sfMGOptics, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR_7N13"], [], ""], 5,
    ["rhs_weap_m249", "", _sfAttachmentsWest, _sfMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7
]];

_sfMarksmanOptics = ["", 10];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", _sfAttachmentsWest, _sfMarksmanOptics, ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_harris_bipod"], 10,
    ["rhs_weap_svdp", "rhsgref_sdn6_suppressor", "", "", ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
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
_eliteLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_liz_des_low", 4, "AFR_U_aaf_bdu_liz_des_knee_nom_low", 0.5, "AFR_U_aaf_bdu_liz_des_tee", 2, "AFR_U_aaf_bdu_liz_jumpr_trop", 3]];
_eliteLoadoutData set ["slUniforms", ["AFR_U_aaf_og107_liz_tuck_trop", 10]];
_eliteLoadoutData set ["vests", ["V_tweed_msv_mk2_1", 5, "V_tweed_msv_mk2_3", 5, "V_tweed_msv_mk2_cell_2", 5]];
_eliteLoadoutData set ["Hvests", ["V_tweed_msv_mk2_249", 5, "V_tweed_msv_mk2_240", 1]];
_eliteLoadoutData set ["backpacks", ["B_simc_US_Molle_sturm_OCP_thermos_OCP", 6, "B_simc_US_asspack_61_roll", 4, "AFR_aaf_pack_ass", 2]];
_eliteLoadoutData set ["helmets", ["tsp_gear_fast_mt_multicamCover_peltor_tec", 5, "tsp_gear_fast_mt_multicamCover_peltor_fold_tec", 1, "tsp_gear_fast_mt_multicamCover_tec", 3, "tsp_gear_fast_mt_multicamCover_peltor_manta", 3]];
_eliteLoadoutData set ["binoculars", ["Rangefinder"]];

_eliteRifleOpticsWest = ["rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4, "", 8];
_eliteSlRifleOpticsWest = ["rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_eliteAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_eliteRifleOpticsEast = ["rhs_acc_ekp8_02", 4, "rhs_acc_okp7_dovetail", 3, "rhs_acc_pkas", 2, "", 8];
_eliteSlRifleOpticsEast = ["rhs_acc_1p63", 10];
_eliteAttachmentsEast = ["rhs_acc_2dpZenit", 2, "", 8];

_eliteLoadoutData set ["slRifles", [
    ["arifle_Mk20_plain_F", "", _eliteAttachmentsWest, _eliteSlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger", "rhs_mag_30Rnd_556x45_M855_Stanag_Pull", "rhs_mag_30Rnd_556x45_M855_Stanag_Ranger"], [], ""], 3.5,
    ["rhs_weap_ak74m_gp25", "", _eliteAttachmentsEast, _eliteSlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 3.5,
    ["rhs_weap_ak74m_zenitco01", "", _eliteAttachmentsEast, _eliteSlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 3.5,
    ["rhs_weap_m4_carryhandle", "", _eliteAttachmentsWest, _eliteSlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m16a4_imod", "", _eliteAttachmentsWest, _eliteSlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_eliteLoadoutData set ["rifles", [
    ["rhs_weap_ak74m_zenitco01", "", _eliteAttachmentsEast, _eliteRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74mr", "", _eliteAttachmentsEast, _eliteRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_vss", "", _eliteAttachmentsEast, _eliteRifleOpticsEast, ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""], 2.5,
    ["rhs_weap_m4_carryhandle", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m4", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 5.5
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "", _eliteAttachmentsEast, _eliteRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74_gp25", "", _eliteAttachmentsEast, _eliteRifleOpticsEast, [" rhs_30Rnd_545x39_7N6M_AK", " rhs_30Rnd_545x39_7N6_AK"], [" rhs_VOG25", " rhs_VG40OP_green", " rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_m16a4_carryhandle_M203", "", _eliteAttachmentsWest, _eliteRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
]];

_eliteMGOptics = ["rhs_acc_pkas", 3.5, "", 8.5];
_eliteLoadoutData set ["machineGuns", [
    ["rhs_weap_rpk74m", "", _eliteAttachmentsEast, _eliteMGOptics, ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N22_AK"], [], ""], 5,
    ["rhs_weap_pkm", "", _eliteAttachmentsEast, _eliteMGOptics, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR_7N13"], [], ""], 5,
    ["rhs_weap_m249", "", _eliteAttachmentsWest, _eliteMGOptics, ["rhsusf_200rnd_556x45_M855_box", "rhsusf_100Rnd_556x45_M200_soft_pouch_coyote"], [], ""], 7
]];

_eliteMarksmanOptics = ["", 10];
_eliteLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14ebrri", "", _eliteAttachmentsWest, _eliteMarksmanOptics, ["rhsusf_20Rnd_762x51_m80_Mag"], [], "rhsusf_acc_harris_bipod"], 10,
    ["rhs_weap_svdp", "", "", "", ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
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
_militaryLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_liz_des_low", 4, "AFR_U_aaf_bdu_liz_des_knee_nom_low", 0.5, "AFR_U_aaf_bdu_liz_des_tee", 2, "AFR_U_aaf_bdu_liz_jumpr_trop", 3]];
_militaryLoadoutData set ["slUniforms", ["AFR_U_aaf_og107_liz_tuck_trop", 10]];
_militaryLoadoutData set ["vests", ["V_Simc_vest_rba_mk1_alice_1", 5, "V_Simc_vest_rba_mk1_alice_2", 5, "V_Simc_vest_rba_mk1_alice_45_1", 5]];
_militaryLoadoutData set ["Hvests", ["V_Simc_vest_rba_mk1_alice_nade", 5, "V_Simc_flak_55_alice_60", 1]];
_militaryLoadoutData set ["backpacks", ["B_simc_pack_frem_empty", 4, "B_simc_US_asspack_61_roll", 4, "B_simc_US_Molle_sturm_OCP_thermos_OCP", 2]];
_militaryLoadoutData set ["helmets", ["AFR_H_aaf_pasgt_ben", 5, "AFR_H_aaf_pasgt_g_cov_grn", 1, "AFR_H_aaf_pasgt", 3, "AFR_H_aaf_pasgt_uncov_2", 3, "AFR_H_aaf_pasgt_g", 2]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryRifleOpticsWest = ["rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4, "", 8];
_militarySlRifleOpticsWest = ["rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_militaryAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_militaryRifleOpticsEast = ["rhs_acc_ekp8_02", 4, "rhs_acc_okp7_dovetail", 3, "rhs_acc_pkas", 2, "", 8];
_militarySlRifleOpticsEast = ["rhs_acc_1p63", 10];
_militaryAttachmentsEast = ["rhs_acc_2dpZenit", 2, "", 8];

_militaryLoadoutData set ["slRifles", [
    ["arifle_Mk20_plain_F", "", _militaryAttachmentsWest, _militarySlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger", "rhs_mag_30Rnd_556x45_M855_Stanag_Pull", "rhs_mag_30Rnd_556x45_M855_Stanag_Ranger"], [], ""], 3.5,
    ["rhs_weap_ak74m_gp25", "", _militaryAttachmentsEast, _militarySlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 3.5,
    ["rhs_weap_ak74m_zenitco01", "", _militaryAttachmentsEast, _militarySlRifleOpticsEast, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 3.5,
    ["rhs_weap_m4_carryhandle", "", _militaryAttachmentsWest, _militarySlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m16a4_imod", "", _militaryAttachmentsWest, _militarySlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_ak74m", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74m_npz", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""], 3.5,
    ["rhs_weap_m16a4", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m4", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["arifle_Mk20_plain_F", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 6.5
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
_policeLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_blk_trop_pol", 10, "AFR_U_aaf_bdu_blk_roll_pol", 10, "U_simc_civ_jean_blau_dunkel", 10, "U_simc_civ_jean_blau_dunkel_tuck_trop", 10]];
_policeLoadoutData set ["vests", ["V_Simc_vest_fauf_2", 4, "V_Simc_vest_aws_rig_2", 2]];
_policeLoadoutData set ["helmets", ["rhssaf_beret_black", 10, "H_Watchcap_blk", 10, "H_tweed_Hat_fleece", 10]];

_policeLoadoutData set ["SMGs", [ // CBA rewriting the stupid template to remove SMGs
    ["rhs_weap_m14", "", "", "", ["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m118_special_Mag"], [], ""], 6,
    ["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""], 3
]];
_policeLoadoutData set ["sidearms", ["rhsusf_weap_glock17g4", 10]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_liz_pol", 3, "AFR_U_aaf_bdu_liz_roll_pol", 2, "AFR_U_aaf_bdu_liz_trop_pol", 3]];
_militiaLoadoutData set ["vests", ["V_Simc_vest_fauf_rig_4", 1.25, "V_Simc_vest_aws_rig_2", 5, "V_Simc_vest_fauf_2", 3.75]];
_militiaLoadoutData set ["Hvests", ["V_Simc_vest_fauf_alice", 10]];
_militiaLoadoutData set ["backpacks", ["AFR_B_Molle_sturm_Olive", 1, "B_simc_pack_frem_1_alt", 4, "B_simc_pack_frem_8", 4]];
_militiaLoadoutData set ["helmets", ["AFR_H_pol_pasgt_g", 5, "AFR_H_pol_pasgt_g_low", 4, "AFR_H_pol_pasgt", 3]];

_militiaRifleOptics = ["", 8];
_militiaSlRifleOptics = ["", 2];
_militiaAttachments = ["", 6];

_militiaLoadoutData set ["slRifles", [
    ["rhs_weap_ak74m", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 6,
    ["rhs_weap_ak74m_gp25", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 6,
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
_crewLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_m81_des_nom", 10]];
_crewLoadoutData set ["vests", ["V_Simc_vest_RBA_mk1", 10]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I", 10]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["AFR_U_aaf_bdu_m81_nom", 5]];
_pilotLoadoutData set ["vests", ["V_Simc_vest_RBA_mk1", 10]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_white", 5, "rhsusf_hgu56p_visor_white", 5]];

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
