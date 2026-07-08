//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Takistan Army"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "Takistan"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\rhsafrf\addons\rhs_main\data\Flag_trn_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "rhs_flag_trn"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["AFR_B_NTA_m1151_Tan"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["AFR_B_NTA_m1151_Tan", "rhsgref_BRDM2UM_msv"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["AFR_B_NTA_m1151_m2_Tan", "rhsgref_BRDM2_msv", "rhsgref_BRDM2_HQ_msv"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["rhsusf_M1078A1P2_D_fmtv_usarmy", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["rhs_kraz255b1_flatbed_msv", "RHS_Ural_Open_Flat_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["RHS_Ural_Ammo_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["RHS_Ural_Repair_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["RHS_Ural_Fuel_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhs_gaz66_ap2_msv", "AFR_B_NTA_M113A3_Medical_Tan"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["AFR_B_NTA_M113A3_M2_Tan", "rhs_btr80_vv"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["AFR_B_NTA_M113A3_M2_Tan", "rhs_btr80_vv", "rhs_bmp1d_tv", "rhs_btr80a_vdv", "rhs_bmp2d_vv"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["rhs_btr80a_vdv", "rhs_bmp1d_tv"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["rhs_bmp2d_vv", "rhs_btr80a_vdv"]] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["rhs_bmp3_msv", "rhs_bmp2d_msv", "rhs_sprut_vdv"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhs_t72ba_tv", "rhs_t80", "rhs_t90_tv", "rhsusf_m1a1aimd_usarmy"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhs_zsu234_aa"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhs_bmk_t"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["AFR_B_NTA_su25_Tan"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_mig29s_vvs"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["RHS_UH60M"]] call _fnc_saveToTemplate;

["vehiclesPlanesGunship", []] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["RHS_CH_47F_light", "RHS_Mi8mt_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["RHS_UH60M"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_Mi24V_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_AH64D_d", "RHS_Mi24V_vdv"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsusf_m109d_usarmy", "RHS_BM21_MSV_01"]] call _fnc_saveToTemplate;

["magazines", createHashMapFromArray [
    ["rhsusf_m109d_usarmy",["rhs_mag_155mm_m795_28"]],
    ["RHS_BM21_MSV_01",["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;
["uavsPortable", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["AFR_B_NTA_m1151_m2_Tan", "rhsusf_m1240a1_m240_usarmy_d", "rhsusf_M1220_M2_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["RHS_Ural_Open_MSV_01", "rhs_kraz255b1_cargo_open_msv"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["AFR_B_NTA_m1151_Tan", "rhsusf_m1240a1_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["rhsusf_M1117_D", "rhsusf_M1220_MK19_usarmy_d"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["AFR_B_NTA_m1151_Tan", "AFR_B_NTA_m1151_m2_Tan"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_nat_DSHKM", "RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_nat_SPG9", "RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_nat_ZU23", "RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_nat_2b14"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhs_D30_msv"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "..\RHS\RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","PersianHead_A3_04_a","PersianHead_A3_04_l","PersianHead_A3_04_sa"]] call _fnc_saveToTemplate;
["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
"TakistaniMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", [
    ["rhs_weap_akms", "", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_89"], [], ""], 6
]];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", [
    ["rhs_weap_akms", "", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_89"], [], ""], 6
]];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VS_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92", "rhs_weap_igla"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["GLsidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["traitorUniforms", ["U_AFR_Taki6Color_BDU_Blench", "U_AFR_Taki6Color_BDU_Blench_trop"]];
_loadoutData set ["traitorVests", ["AFR_Taki_vest_rba", "AFR_Taki_vest_rba_alice_2"]];
_loadoutData set ["traitorHats", ["rhssaf_beret_green"]];

_loadoutData set ["officerUniforms", ["U_AFR_Taki6Color_BDU_Blench", "U_AFR_Taki6Color_BDU_Blench_trop"]];
_loadoutData set ["officerVests", ["AFR_Taki_vest_rba", "AFR_Taki_vest_rba_alice_2"]];
_loadoutData set ["officerHats", ["rhssaf_beret_red"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_loadoutData set ["longRangeRadios", ["B_simc_rajio_3_alt"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["rhssaf_beret_black"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk"]];

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

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench_knee", 5, "U_AFR_Taki6Color_BDU_Blench_knee_trop", 5]];
_sfLoadoutData set ["slUniforms", ["U_AFR_Taki6Color_BDU_Blench_knee_trop", 10]];
_sfLoadoutData set ["vests", ["AFR_ION_V_tweed_msv_mk2_1_TAN", 1.25, "AFR_ION_V_tweed_msv_mk2_cell_2_TAN", 5, "AFR_ION_V_tweed_msv_mk2_2_TAN", 3.75, "AFR_Taki_vest_rba_alice_2", 4.25, "AFR_Taki_vest_rba", 6, "AFR_Taki_vest_rba_alice_1", 7]];
_sfLoadoutData set ["Hvests", ["AFR_ION_V_tweed_msv_mk2_1_TAN", 5, "AFR_ION_V_tweed_msv_mk2_cell_2_TAN", 5, "AFR_ION_V_tweed_msv_mk2_2_TAN", 3.75]];
_sfLoadoutData set ["backpacks", ["B_tweed_pack_wasser_molle_od3", 5, "B_tweed_pack_camel_thermos_od3", 4, "B_simc_US_Molle_asspack_OCP_thermos_od3", 4, "B_simc_US_Molle_sturm_OCP", 3, "B_simc_US_Molle_sturm_OCP_thermos_od3", 2]];
_sfLoadoutData set ["helmets", ["rhsusf_mich_bare_norotos_arc_alt", 5, "rhsusf_mich_bare_norotos_arc", 4, "rhsusf_mich_bare_norotos_arc_alt_headset", 3, "rhsusf_mich_bare_norotos_arc_headset", 2]];

_sfLoadoutData set ["glasses", ["G_tweed_tacticool_oranje_oak", "G_tweed_tacticool_weiss_peltor_comba", "G_tweed_tacticool_weiss_peltor_oak", "G_tweed_tacticool_weiss_oak"]];

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
_eliteLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench", 3, "U_AFR_Taki6Color_BDU_Blench_trop", 2, "U_AFR_Taki6Color_BDU_Blench_knee", 3, "U_AFR_Taki6Color_BDU_Blench_knee_nomex_trop", 2]];
_eliteLoadoutData set ["slUniforms", ["U_AFR_Taki6Color_BDU_Blench", 10]];
_eliteLoadoutData set ["vests", ["AFR_Taki_vest_rba_alice_2", 4.25, "AFR_Taki_vest_rba", 6, "AFR_Taki_vest_rba_alice_1", 7]];
_eliteLoadoutData set ["Hvests", ["AFR_Taki_vest_rba_alice_nade", 10, "rhsgref_6b23_khaki_rifleman", 10]];
_eliteLoadoutData set ["backpacks", ["B_tweed_pack_wasser_molle_od3", 1, "B_tweed_pack_camel_thermos_od3", 4, "B_simc_US_Molle_asspack_OCP_thermos_od3", 4]];
_eliteLoadoutData set ["helmets", ["AFR_Taki_pasgt_m81_scrim", 5, "AFR_Taki_pasgt_m81_scrim_alt", 4, "AFR_Taki_pasgt_m81_scrim_alt_nvo", 3, "AFR_Taki_pasgt_m81_scrim_nvo", 2]];
_eliteLoadoutData set ["binoculars", ["Rangefinder"]];

_eliteRifleOpticsWest = ["rhsusf_acc_ACOG", 2, "rhsusf_acc_eotech_xps3", 3, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 4, "", 8];
_eliteSlRifleOpticsWest = ["rhsusf_acc_ACOG", 4, "rhsusf_acc_eotech_xps3", 2, "rhsusf_acc_eotech_552", 4, "rhsusf_acc_compm4", 2];
_eliteAttachmentsWest = ["rhsusf_acc_wmx_bk", 2, "rhsusf_acc_anpeq15_bk_top", 2, "", 4];

_eliteRifleOpticsEast = ["rhs_acc_ekp8_02", 4, "rhs_acc_okp7_dovetail", 3, "rhs_acc_pkas", 2, "", 8];
_eliteSlRifleOpticsEast = ["rhs_acc_1p63", 10];
_eliteAttachmentsEast = ["rhs_acc_2dpZenit", 2, "", 8];

_eliteLoadoutData set ["slRifles", [
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
_militaryLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench", 3, "U_AFR_Taki6Color_BDU_Blench_trop", 2, "U_AFR_Taki6Color_BDU_Blench_knee", 3, "U_AFR_Taki6Color_BDU_Blench_knee_nomex_trop", 2]];
_militaryLoadoutData set ["slUniforms", ["U_AFR_Taki6Color_BDU_Blench", 10]];
_militaryLoadoutData set ["vests", ["rhsgref_6b23_khaki", 3, "rhsgref_6b23_khaki_sniper", 3, "rhsgref_6b23_khaki_rifleman", 3, "AFR_Taki_vest_rba_alice_2", 1.25, "AFR_Taki_vest_rba", 5, "AFR_Taki_vest_rba_alice_1", 3.75]];
_militaryLoadoutData set ["Hvests", ["AFR_Taki_vest_rba_alice_nade", 10, "rhsgref_6b23_khaki_rifleman", 10]];
_militaryLoadoutData set ["backpacks", ["B_tweed_pack_wasser_molle_od3", 1, "B_tweed_pack_camel_thermos_od3", 4, "B_simc_US_Molle_asspack_OCP_thermos_od3", 4]];
_militaryLoadoutData set ["helmets", ["AFR_Taki_pasgt_m81_nvo_strap_swdg", 5, "AFR_Taki_pasgt_m81_nvo", 4, "AFR_Taki_pasgt_m81_SWDG_low_b", 3]];
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
    ["rhs_weap_m16a4_carryhandle", "", _militaryAttachmentsWest, _militarySlRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_ak74m", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74m_npz", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""], 5.5,
    ["rhs_weap_ak74", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""], 3.5,
    ["rhs_weap_m16a2", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5,
    ["rhs_weap_m4", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["carbines", [
    ["rhs_weap_m4a1_carryhandle", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""], 3.5
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74_gp25", "", _militaryAttachmentsEast, _militaryRifleOpticsEast, [" rhs_30Rnd_545x39_7N6M_AK", " rhs_30Rnd_545x39_7N6_AK"], [" rhs_VOG25", " rhs_VG40OP_green", " rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_m16a2_m203", "", _militaryAttachmentsWest, _militaryRifleOpticsWest, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""], 3
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
_policeLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench", 10, "U_AFR_Taki6Color_BDU_Blench_trop", 10]];
_policeLoadoutData set ["vests", ["V_Simc_mk56_alt", 6, "AFR_Taki_vest_rba", 3]];
_policeLoadoutData set ["helmets", ["rhssaf_beret_black", 10]];

_policeLoadoutData set ["SMGs", [ // CBA rewriting the stupid template to remove SMGs
    ["rhs_weap_akms", "", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_89"], [], ""], 6,
    ["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""], 3
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_pya", 10]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench", 3, "U_AFR_Taki6Color_BDU_Blench_trop", 2, "U_AFR_Taki6Color_BDU_Blench_knee", 3, "U_AFR_Taki6Color_BDU_Blench_knee_nomex_trop", 2]];
_militiaLoadoutData set ["vests", ["rhs_chicom_khk", 7, "rhs_suspender_AK8_chestrig", 5, "AFR_Taki_vest_rba_alice_2", 1.25, "AFR_Taki_vest_rba", 5, "AFR_Taki_vest_rba_alice_1", 3.75]];
_militiaLoadoutData set ["Hvests", ["AFR_Taki_vest_rba_alice_nade", 10, "rhsgref_6b23_khaki_rifleman", 5, "rhsgref_6b23_khaki", 5]];
_militiaLoadoutData set ["backpacks", ["rhsusf_falconii", 1, "rhs_rd54", 4, "rhs_sidor", 4]];
_militiaLoadoutData set ["helmets", ["AFR_Taki_pasgt_m81_nvo_strap_swdg", 5, "AFR_Taki_pasgt_m81_nvo", 4, "AFR_Taki_pasgt_m81_SWDG_low_b", 3]];

_militiaRifleOptics = ["rhs_acc_ekp8_02", 2, "", 8];
_militiaSlRifleOptics = ["rhs_acc_1p63", 4, "", 2];
_militiaAttachments = ["", 6];

_militiaLoadoutData set ["slRifles", [
    ["rhs_weap_ak74m", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 6,
    ["rhs_weap_ak74m_gp25", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_ak74", "", _militiaAttachments, _militiaSlRifleOptics, ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N6M_AK"], [], ""], 6
]];
_militiaLoadoutData set ["rifles", [
    ["rhs_weap_akm", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_polymer"], [], ""], 5.5,
    ["rhs_weap_akmn", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_polymer"], [], ""], 5.5,
    ["rhs_weap_aks74", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""], 3.5,
    ["rhs_weap_aks74n", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK"], [], ""], 3.5
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_akms", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_89", "rhs_30Rnd_762x39mm_U"], [], ""], 5.5
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akm_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 8,
    ["rhs_weap_akmn_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 8,
    ["rhs_weap_aks74_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4,
    ["rhs_weap_aks74n_gp25", "", _militiaAttachments, _militiaRifleOptics, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6_AK"], ["rhs_VOG25", "rhs_VG40OP_green", "rhs_GRD40_Green"], ""], 4
]];

_militiaMGOptics = ["rhs_acc_pkas", 3.5, "", 8.5];
_militiaLoadoutData set ["machineGuns", [
    ["rhs_weap_rpk74m", "", _militiaAttachments, _militiaMGOptics, ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N22_AK"], [], ""], 10,
    ["rhs_weap_pkm", "", _militiaAttachments, _militiaMGOptics, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7BZ3", "rhs_100Rnd_762x54mmR_7N13"], [], ""], 3
]];

_militiaMarksmanOptics = ["", 10];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "", ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
]];

_militiaLoadoutData set ["sniperRifles", [
    ["rhs_weap_svdp_wd", "", "", ["rhs_acc_pso1m2", 10], ["rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14"], [], ""], 5
]];

_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", 10]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench_nomex", 10]];
_crewLoadoutData set ["vests", ["AFR_Taki_vest_rba", 10]];
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess", 10]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_AFR_Taki6Color_BDU_Blench_nomex", 5]];
_pilotLoadoutData set ["vests", ["AFR_Taki_vest_rba", 10]];
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
