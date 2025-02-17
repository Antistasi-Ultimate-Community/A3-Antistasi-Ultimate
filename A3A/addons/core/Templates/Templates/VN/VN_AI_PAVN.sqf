//////////////////////////
//   Side Information   //
//////////////////////////

["name", "PAVN"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "PAVN"]] call _fnc_saveToTemplate;

["flag", "vn_flag_pavn"] call _fnc_saveToTemplate;
["flagTexture", "vn\objects_f_vietnam\flags\vn_flag_01_pavn_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "vn_flag_pavn"] call _fnc_saveToTemplate;

//////////////////////////
//       Attributes     //
//////////////////////////

["noSandbag", true] call _fnc_saveToTemplate;                   // Faction will not use AT sandbags on frontiline roadblocks
["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "vn_o_ammobox_04"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["vn_o_bicycle_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_o_wheeled_btr40_01"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["vn_o_wheeled_btr40_mg_02", "vn_o_wheeled_btr40_mg_01", "vn_o_wheeled_btr40_mg_04_nva65", "vn_o_wheeled_btr40_mg_03", "vn_o_wheeled_z157_mg_02", "vn_o_wheeled_z157_mg_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["vn_o_wheeled_z157_01", "vn_o_wheeled_z157_02"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["vn_o_wheeled_z157_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["vn_o_wheeled_z157_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["vn_o_wheeled_z157_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["vn_o_wheeled_btr40_02", "vn_o_armor_btr50pk_03_nva65"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["vn_o_wheeled_z157_01", "vn_o_wheeled_z157_02", "vn_o_armor_m113_01"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["vn_o_armor_m113_acav_03"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["vn_o_wheeled_z157_01", "vn_o_wheeled_z157_02", "vn_o_armor_m113_acav_01","vn_o_armor_m113_acav_03", "vn_o_armor_btr50pk_01_nva65", "vn_o_armor_btr50pk_02_nva65", "vn_o_armor_btr50pk_01_nva65", "vn_o_armor_btr50pk_02_nva65"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["vn_o_armor_pt76a_01","vn_o_armor_pt76b_01","vn_o_armor_type63_01"]] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["vn_o_armor_pt76a_01", "vn_o_armor_pt76b_01", "vn_o_armor_type63_01"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["vn_o_armor_m41_01", "vn_o_armor_ot54_01", "vn_o_armor_t54b_01"]] call _fnc_saveToTemplate;
["vehiclesAA", ["vn_o_wheeled_btr40_mg_03", "vn_o_wheeled_z157_mg_02"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["vn_o_boat_01_mg_03"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["vn_o_boat_04_02"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["vn_o_air_mig19_at", "vn_o_air_mig21_cas"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["vn_o_air_mig19_cap", "vn_o_air_mig21_cap"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["vn_o_air_mi2_01_03"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["vn_o_air_mi2_01_03"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["vn_o_air_mi2_04_02", "vn_o_air_mi2_04_03", "vn_o_air_mi2_05_04"]] call _fnc_saveToTemplate;      // Don't actually work atm
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["vn_o_nva_static_h12", "vn_o_nva_static_d44_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["vn_o_nva_static_h12", ["vn_h12_v_12_he_mag"]],
["vn_o_nva_static_d44_01", ["vn_cannon_d44_mag_he_x12"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["vn_b_wheeled_m151_mg_02", "vn_b_wheeled_m151_mg_04"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["vn_b_wheeled_m54_01_sog"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["vn_b_wheeled_m151_01", "vn_b_wheeled_m151_02"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["vn_b_armor_m113_01"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["vn_b_wheeled_m151_01_mp", "vn_b_wheeled_m151_02_mp"]] call _fnc_saveToTemplate;

["staticMGs", ["vn_o_nva_static_pk_high", "vn_o_nva_static_rpd_high", "vn_o_nva_static_dshkm_high_01", "vn_o_nva_65_static_m1910_high_01"]] call _fnc_saveToTemplate;
["staticAT", ["vn_o_nva_65_static_type56rr"]] call _fnc_saveToTemplate;
["staticAA", ["vn_o_nva_static_sgm_high_01", "vn_o_nva_static_dshkm_high_02", "vn_o_nva_static_zpu4", "vn_o_nva_65_static_zgu1_01"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_o_vc_static_mortar_type53"]] call _fnc_saveToTemplate;
["staticHowitzers", ["vn_o_nva_static_d44_01"]] call _fnc_saveToTemplate;

["vehicleRadar", "vn_o_static_rsna75"] call _fnc_saveToTemplate;
["vehicleSam", "vn_sa2"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "vn_cannon_d44_mag_he_x12"] call _fnc_saveToTemplate;

["mortarMagazineHE", "vn_mortar_type53_mag_he_x8"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "vn_mortar_type53_mag_wp_x8"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "vn_mortar_type53_mag_lume_x8"] call _fnc_saveToTemplate;


["minefieldAT", ["vn_mine_tripwire_arty"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["vn_mine_punji_02"]] call _fnc_saveToTemplate;

#include "VN_Vehicle_Attributes.sqf"

["flares", ["vn_40mm_m583_flare_w_ammo", "vn_40mm_m661_flare_g_ammo", "vn_40mm_m662_flare_r_ammo", "vn_40mm_m695_flare_y_ammo"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"]] call _fnc_saveToTemplate;
["voices", ["Male01CHI", "Male02CHI", "Male03CHI"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["ATLaunchers", ["vn_rpg2", "vn_rpg7"]];
_loadoutData set ["AALaunchers", ["vn_sa7", "vn_sa7b"]];
_loadoutData set ["sidearms", ["vn_pm", "vn_tt33", "vn_vz61_p", "vn_m10", "vn_m1895", "vn_m712"]];

_loadoutData set ["ATMines", ["vn_mine_tripwire_f1_04_mag"]];
_loadoutData set ["APMines", ["vn_mine_punji_01_mag"]];
_loadoutData set ["lightExplosives", ["vn_mine_m112_remote_mag"]];
_loadoutData set ["heavyExplosives", ["vn_mine_satchel_remote_02_mag"]];

_loadoutData set ["antiTankGrenades", ["vn_rkg3_grenade_mag"]];
_loadoutData set ["antiInfantryGrenades", ["vn_t67_grenade_mag", "vn_rgd33_grenade_mag", "vn_rg42_grenade_mag", "vn_rgd5_grenade_mag"]];
_loadoutData set ["smokeGrenades", ["vn_rdg2_mag"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["vn_o_item_map"]];
_loadoutData set ["watches", ["vn_b_item_watch"]];
_loadoutData set ["compasses", ["vn_b_item_compass"]];
_loadoutData set ["radios", ["vn_o_item_radio_m252"]];
_loadoutData set ["binoculars", ["vn_mk21_binocs"]];

_loadoutData set ["traitorUniforms", ["vn_o_uniform_vc_mf_01_07"]];
_loadoutData set ["traitorVests", ["vn_o_vest_05", "vn_o_vest_04"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["vn_o_uniform_nva_army_01_03"]];
_loadoutData set ["officerVests", ["vn_o_vest_07"]];
_loadoutData set ["officerHats", ["vn_o_cap_01"]];

_loadoutData set ["cloakUniforms", ["vn_o_uniform_nva_dc_13_07", "vn_o_uniform_nva_dc_13_08", "vn_o_uniform_nva_dc_13_04", "vn_o_uniform_nva_dc_13_02", "vn_o_uniform_nva_dc_14_01", "vn_o_uniform_nva_dc_14_04"]];
_loadoutData set ["cloakVests", ["vn_o_vest_02", "vn_o_vest_03"]];
_loadoutData set ["cloakGlasses", ["vn_o_poncho_01_01"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["vn_o_pack_t884_01"]];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["MGbackpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["engBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["GLhelmets", []];
_loadoutData set ["MGhelmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _eeItems = ["vn_b_item_toolkit", "vn_b_item_trapkit"];
private _mmItems = [];

if (A3A_hasACE) then {
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard"];
};

_loadoutData set ["items_squadLeader_extras", []];
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
    "vn_o_scarf_01_04",
    "vn_o_scarf_01_02",
    "vn_o_poncho_01_01",
    "vn_o_bandana_b",
    "vn_o_bandana_g"
]];
_loadoutData set ["goggles", ["vn_o_acc_goggles_01"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_11_03", "vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_04_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_09_04"]];
_sfLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_sfLoadoutData set ["medVests", ["vn_o_vest_06"]];
_sfLoadoutData set ["engVests", ["vn_o_vest_08"]];
_sfLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_sfLoadoutData set ["slVests", ["vn_o_vest_07"]];
_sfLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_sfLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_sfLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_sfLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_sfLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];

_sfLoadoutData set ["rifles", [
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_sfLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""]
]];
_sfLoadoutData set ["SMGs", [
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_pps52", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["vn_rpd", "", "", "", ["vn_rpd_100_mag"], [], ""],
"vn_dp28", "vn_pk"
]];
_sfLoadoutData set ["marksmanRifles", [
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""],
["vn_svd", "", "", "vn_o_4x_svd", ["vn_svd_mag", "vn_svd_mag", "vn_svd_t_mag"], [], "vn_b_camo_svd"]
]];
_sfLoadoutData set ["sidearms", [
"vn_fkb1_pm", "vn_pm", "vn_tt33",
["vn_izh54_p", "", "", "", ["vn_izh54_mag", "vn_izh54_so_mag"], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_11_03", "vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_04_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_09_04"]];
_eliteLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_eliteLoadoutData set ["medVests", ["vn_o_vest_06"]];
_eliteLoadoutData set ["engVests", ["vn_o_vest_08"]];
_eliteLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_eliteLoadoutData set ["slVests", ["vn_o_vest_07"]];
_eliteLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_eliteLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_eliteLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_eliteLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_eliteLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];

_eliteLoadoutData set ["rifles", [
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_eliteLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["vn_pps52", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_eliteLoadoutData set ["machineGuns", ["vn_pk"]];
_eliteLoadoutData set ["marksmanRifles", [
["vn_svd", "", "", "vn_o_4x_svd", ["vn_svd_mag", "vn_svd_mag", "vn_svd_t_mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["vn_vz54", "", "", "vn_o_3x_vz54", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""],
["vn_vz54", "", "", "vn_o_3x_vz54", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_vz54"],
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
"vn_fkb1_pm", "vn_pm", "vn_tt33",
["vn_izh54_p", "", "", "", ["vn_izh54_mag", "vn_izh54_so_mag"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_11_03", "vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_04_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_09_04"]];
_militaryLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_militaryLoadoutData set ["medVests", ["vn_o_vest_06"]];
_militaryLoadoutData set ["engVests", ["vn_o_vest_08"]];
_militaryLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_militaryLoadoutData set ["slVests", ["vn_o_vest_07"]];
_militaryLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_militaryLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_militaryLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_militaryLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_militaryLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];

_militaryLoadoutData set ["rifles", [
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_kbkg", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_militaryLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["vn_kbkg_gl", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], ["vn_20mm_f1n60_frag_mag", "vn_20mm_kgn_frag_mag", "vn_20mm_pgn60_heat_mag"], ""],
["vn_kbkg_gl", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], ["vn_20mm_f1n60_frag_mag", "vn_20mm_dgn_wp_mag", "vn_20mm_pgn60_heat_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["vn_rpd", "", "", "", ["vn_rpd_100_mag"], [], ""],
"vn_dp28", 
"vn_pk"
]];
_militaryLoadoutData set ["marksmanRifles", [
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_svd", "", "", "vn_o_4x_svd", ["vn_svd_mag", "vn_svd_mag", "vn_svd_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["vn_vz54", "", "", "vn_o_3x_vz54", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""],
["vn_vz54", "", "", "vn_o_3x_vz54", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_vz54"],
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
"vn_fkb1_pm", "vn_pm", "vn_tt33",
["vn_izh54_p", "", "", "", ["vn_izh54_mag", "vn_izh54_so_mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_02_01"]];
_policeLoadoutData set ["vests", ["vn_o_vest_07"]];
_policeLoadoutData set ["helmets", []];

_policeLoadoutData set ["rifles", [
["vn_sks", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""]
]];

_policeLoadoutData set ["shotguns", [
["vn_izh54", "", "", "", ["vn_izh54_mag"], [], ""],
["vn_izh54_shorty", "", "", "", ["vn_izh54_so_mag"], [], ""]
]];

_policeLoadoutData set ["sidearms", ["vn_m1895", "vn_m10", "vn_tt33"]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_01_04", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_10_04",
"vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_02_04", "vn_o_uniform_nva_army_03_04", "vn_o_uniform_nva_army_05_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_07_03"]];
_militiaLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_militiaLoadoutData set ["medVests", ["vn_o_vest_06"]];
_militiaLoadoutData set ["engVests", ["vn_o_vest_08"]];
_militiaLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_militiaLoadoutData set ["slVests", ["vn_o_vest_07"]];
_militiaLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_militiaLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_militiaLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_militiaLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_militiaLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];

_militiaLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_m4956_gl", "", "", "", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_m4956_gl", "", "", "", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""]
]];

_militiaLoadoutData set ["rifles", [
["vn_sks", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_m36", "", "", "", ["vn_m36_mag", "vn_m36_mag", "vn_m36_t_mag"], [], ""],
["vn_m36", "", "vn_b_m36", "", ["vn_m36_mag", "vn_m36_mag", "vn_m36_t_mag"], [], ""],
["vn_m4956", "", "", "", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], [], ""],
["vn_m4956", "", "vn_b_m4956", "", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], [], ""],
["vn_k98k", "", "", "", ["vn_k98k_mag", "vn_k98k_t_mag", "vn_k98k_mag"], [], ""],
["vn_k98k", "", "vn_b_k98k", "vn_o_1_5x_k98k", ["vn_k98k_mag", "vn_k98k_t_mag", "vn_k98k_mag"], [], ""]
]];

_militiaLoadoutData set ["SMGs", [
["vn_k50m", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_k50m", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["vn_m4956_gl", "", "", "", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], ["vn_22mm_he_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m4956_gl", "", "", "", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], ["vn_22mm_he_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
"vn_dp28"
]];
_militiaLoadoutData set ["marksmanRifles", [
["vn_m4956", "", "", "vn_o_4x_m4956", ["vn_m4956_10_mag", "vn_m4956_10_mag", "vn_m4956_10_t_mag"], [], ""],
["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["vn_vz54", "", "", "", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""],
["vn_vz54", "", "", "vn_o_3x_vz54", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_vz54"],
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["vn_m1895", "vn_m10", "vn_tt33"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_04_03", "vn_o_uniform_nva_army_05_03", "vn_o_uniform_nva_army_04_01"]];
_crewLoadoutData set ["vests", ["vn_o_vest_06"]];
_crewLoadoutData set ["helmets", ["vn_o_helmet_tsh3_01", "vn_o_helmet_tsh3_02"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03"]];
_pilotLoadoutData set ["vests", ["vn_o_vest_05"]];
_pilotLoadoutData set ["helmets", ["vn_o_helmet_zsh3_02", "vn_o_helmet_zsh3_01"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "slRifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;
    ["handgun", 4] call _fnc_addAdditionalMuzzleMagazines;
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;

    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
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
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	["longRangeRadios"] call _fnc_setBackpack;

    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
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
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
      ["SMGs"] call _fnc_setPrimary;
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
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;
    ["handgun", 2] call _fnc_addAdditionalMuzzleMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
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
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["SMGs"] call _fnc_setPrimary;
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
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

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
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

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
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

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
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
};

private _marksmanTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["binoculars"] call _fnc_addBinoculars;
};

private _sniperTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
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
    ["binoculars"] call _fnc_addBinoculars;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "shotguns"]] call _fnc_setPrimary;
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

    ["SMGs"] call _fnc_setPrimary;
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

    ["SMGs"] call _fnc_setPrimary;
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
    ["cloakGlasses"] call _fnc_setFacewear;
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
    ["cloakGlasses"] call _fnc_setFacewear;
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
