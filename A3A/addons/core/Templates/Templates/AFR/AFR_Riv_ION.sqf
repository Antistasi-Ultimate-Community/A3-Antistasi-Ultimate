////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "ION"] call _fnc_saveToTemplate;
["nameLeader", "Reed Thompson"] call _fnc_saveToTemplate; // That pesky CIA guy went freelance

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32",
"RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5",
"LivonianHead_1","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8", "LivonianHead_9", "LivonianHead_10",
"GreekHead_A3_02", "GreekHead_A3_06", "GreekHead_A3_03", "GreekHead_A3_04", "AsianHead_A3_03", "AsianHead_A3_06"
]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG",
"Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG",
"Male12ENG", "Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB",
"Male05ENGB", "Male01ENGFRE", "Male02ENGFRE"
]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "rhs_7ya37_1_single"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["AFR_B_ION_m1151_PKM", "AFR_B_ION_m1151_m2", "AFR_B_ION_M1117"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["AFR_B_ION_M1078A1P2_Flatbed_BLK", "AFR_B_ION_M1078A1P2_Transport_BLK", "AFR_B_ION_M1078A1P2_Flatbed_M2_BLK"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["AFR_B_ION_m1151", "AFR_B_ION_m1151_RSV_D", "AFR_B_ION_Van_Black"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["AFR_B_ION_M113_M240_BLK", "AFR_B_ION_M113A3_M2_BLK", "rhs_btr80a_msv", "rhs_bmd4_vdv", "rhs_bmd1k"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["rhs_sprut_vdv", "rhs_t80u", "rhs_t90_tv", "RHS_M6_wd", "RHS_M2A3_BUSKIII_wd"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["AFR_B_ION_Mi8AMT", "AFR_B_ION_UH1H_m240", "AFR_B_ION_MELB_MH6M"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["staticLowWeapons", [
	"rhsgref_ins_DSHKM_Mini_TriPod", 
	"rhsgref_ins_NSV_TriPod", 
	"rhsgref_ins_DSHKM_Mini_TriPod", 
	"rhsgref_ins_NSV_TriPod", 
	"rhsgref_ins_AGS30_TriPod", 
	"rhsgref_ins_SPG9M", 
	"rhsgref_ins_SPG9"
]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_ins_2b14"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["rhs_ammo_rgd5", "rhs_ammo_f1"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_rgo", "rhs_mag_rgn"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];

_loadoutData set ["facewear", [
	"G_tweed_tacticool_oak",
	"G_tweed_tacticool_nomex",
	"G_tweed_tacticool_weiss_oak",
	"G_tweed_tacticool_weiss",
	"G_tweed_tacticool_oranje",
	"G_tweed_ESS_Green",
	"G_comba_1",
	"G_comba_1_cut",
	"G_comba_2",
	"G_comba_2_cut"
]];
_loadoutData set ["fullmask", ["AFR_LDF_Balaclava_Black", "rhsusf_shemagh2_od", "rhsusf_shemagh_od", "rhsusf_shemagh2_tan", "rhsusf_shemagh_tan"]];

_loadoutData set ["headgear", [
    "H_Beret_blk",
    "H_Cap_blk",
    "H_Cap_usblack",
    "H_Simc_Boon_zwart_2",
    "H_Simc_Boon_zwart_5",
	"H_tweed_Hat_fleece"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["rhssaf_zrak_rd7j"]];
_loadoutData set ["Rangefinder", ["rhs_pdu4"]];

_loadoutData set ["uniforms", [
	"U_Simc_DCU_blench_tee",
	"U_simc_civ_jean_rot_ligt",
	"U_simc_civ_jean_grun_tuck_trop",
	"U_simc_civ_jean_blau",
	"U_simc_civ_jean_weiss_dunkel",
	"U_simc_civ_jean_weiss_trop",
	"U_simc_bdu_civ_trop",
	"U_Simc_bdu_civ"
]];

_loadoutData set ["offuniforms", ["U_Simc_TCU_mk1_zwart_roll", "U_Simc_TCU_mk2_zwart", "U_Simc_TCU_mk1_leg_zwart_roll", "U_Simc_TCU_mk3_zwart_nomex"]];
_loadoutData set ["vests", ["V_tweed_iotv_mk4_3", "V_tweed_iotv_mk4_2", "V_tweed_iotv_mk4_1", "V_tweed_iotv_mk4_e_2"]];
_loadoutData set ["heavyVests", ["V_tweed_iotv_mk4_240", "V_tweed_iotv_mk4_249", "V_tweed_iotv_mk4_4cm_1"]];
_loadoutData set ["atBackpacks", ["rhsusf_assault_eagleaiii_coy", "B_simc_US_Molle_sturm_OCP_thermos_OCP"]];
_loadoutData set ["backpacks", ["B_simc_US_Molle_sturm_OCP", "B_simc_US_Molle_sturm_OCP_thermos_OCP", "B_simc_US_Molle_asspack_OCP_thermos_OCP", "B_tweed_pack_camel_thermos_od3", "B_tweed_pack_wasser_molle_od3_alt"]];
_loadoutData set ["helmets", [
	"tsp_gear_fast_mt_Black_Dark_ION",
	"tsp_gear_fast_mt_Black_Dark",
	"tsp_gear_fast_mt_black_dark_manta",
	"tsp_gear_fast_mt_black_dark_peltor",
	"tsp_gear_fast_pj_black",
	"tsp_gear_fast_pj_black_peltor",
	"rhssaf_helmet_m97_black_nocamo",
	"rhssaf_helmet_m97_black_nocamo_black_ess",
	"rhssaf_helmet_m97_black_nocamo_black_ess_bare",
	"AFR_RUS_6b47_ATACS_emr",
	"AFR_RUS_6b47_ATACS_emr_1",
	"AFR_RUS_6b47_ATACS_emr_2"
]];
_loadoutData set ["heavyHelmets", [
	"tsp_gear_fast_sf_black_amp_tec",
	"tsp_gear_fast_sf_black_amp_fold_manta_tec",
	"tsp_gear_fast_sf_black_amp_manta_pvs",
	"rhsusf_ach_helmet_camo_ocp",
	"AFR_RUS_6b47_ATACS_emr",
	"AFR_RUS_6b47_ATACS_emr_1",
	"AFR_RUS_6b47_ATACS_emr_2"
]];

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

_loadoutData set ["rifles", [
	["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk", "rhs_acc_perst3_top", "rhsusf_acc_eotech_552",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
	["rhs_weap_ak105_zenitco01", "rhs_acc_dtk", "rhs_acc_perst3", "rhs_acc_pkas",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
	["rhs_weap_ak105_zenitco01", "rhs_acc_dtk", "", "",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], "rhs_acc_grip_rk6"],
	["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk", "rhs_acc_perst3_top", "rhsusf_acc_eotech_552",  ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
	["rhs_weap_ak104_zenitco01", "rhs_acc_dtk", "rhs_acc_perst3", "rhs_acc_pkas",  ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
	["rhs_weap_ak104_zenitco01", "rhs_acc_dtk", "", "",  ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_polymer_tracer"], [], "rhs_acc_grip_rk6"],
	["rhs_weap_vhsd2", "rhsusf_acc_SF3P556", "", "rhsusf_acc_eotech_xps3",  ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
	["rhs_weap_g36c", "rhsusf_acc_SFMB556", "", "rhsusf_acc_eotech_552",  ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
	["rhs_weap_m4_carryhandle", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_carryhandle", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_carryhandle", "", "", "rhs_acc_ekp8_18",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_carryhandle", "", "", "rhsusf_acc_compm4",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_carryhandle", "", "", "rhsusf_acc_eotech_xps3",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_carryhandle", "", "", "rhsusf_acc_su230",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""]
]];
_loadoutData set ["tunedRifles", [
	["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk", "rhs_acc_perst3_top", "rhsusf_acc_eotech_552",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
	["rhs_weap_ak105_zenitco01", "rhs_acc_dtk", "rhs_acc_perst3", "rhs_acc_pkas",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
	["rhs_weap_ak105_zenitco01", "rhs_acc_dtk", "", "",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], "rhs_acc_grip_rk6"],
	["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk", "rhs_acc_perst3_top", "rhsusf_acc_eotech_552",  ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
	["rhs_weap_ak104_zenitco01", "rhs_acc_dtk", "rhs_acc_perst3", "rhs_acc_pkas",  ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
	["rhs_weap_ak104_zenitco01", "rhs_acc_dtk", "", "",  ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_89", "rhs_30Rnd_762x39mm_polymer_tracer"], [], "rhs_acc_grip_rk6"],
	["rhs_weap_vhsd2", "rhsusf_acc_SF3P556", "", "rhsusf_acc_eotech_xps3",  ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
	["rhs_weap_g36c", "rhsusf_acc_SFMB556", "", "rhsusf_acc_eotech_552",  ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
	["rhs_weap_mk18_bk", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_KAC_bk", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_bk", "", "", "rhs_acc_ekp8_18",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_KAC_bk", "", "", "rhsusf_acc_compm4",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_bk", "", "", "rhsusf_acc_eotech_xps3",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_KAC_bk", "", "", "rhsusf_acc_su230",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_hk416d10", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_hk416d10_LMT", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_hk416d145", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
	["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk", "", "rhsusf_acc_eotech_552",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
	["rhs_weap_ak105_zenitco01", "rhs_acc_dtk", "", "rhs_acc_pkas",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], ""],
	["rhs_weap_ak105_zenitco01", "rhs_acc_dtk", "", "",  ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7U1_AK"], [], "rhs_acc_grip_rk6"],
	["rhs_weap_vhsd2", "rhsusf_acc_SF3P556", "", "rhsusf_acc_eotech_xps3",  ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
	["rhs_weap_g36c", "rhsusf_acc_SFMB556", "", "rhsusf_acc_eotech_552",  ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
	["rhs_weap_mk18_bk", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_KAC_bk", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""]
]];
_loadoutData set ["carbines", [
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_mk18_m320", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_mk18_m320", "", "", "rhsusf_acc_ACOG",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_m203", "", "", "rhs_acc_ekp8_18",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
	["rhs_weap_m4_m203", "", "", "rhsusf_acc_compm4",  ["rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""]
]];
_loadoutData set ["machineGuns", [
    ["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"]
]];
_loadoutData set ["marksmanRifles", [
	["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
	["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
	["rhs_weap_svdp", "", "", "rhs_acc_1pn93_1", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
	["rhs_weap_svdp", "", "", "rhs_acc_1pn93_1", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
    ["rhs_weap_m14ebrri", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_m14ebrri", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_m14ebrri", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_loadoutData set ["lightATLaunchers", [
    "rhs_weap_M136",
    "rhs_weap_M136_hedp",
    "rhs_weap_M136_hp"
]];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""]
]];
_loadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", ["rhs_weap_pya", "rhs_weap_pp2000_folded", "rhs_weap_cz99", "rhsusf_weap_glock17g4", "rhsusf_weap_m9"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["V_Simc_vest_fauf_2", "V_Simc_vest_fauf_rig_4"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_alt_helmet", "rhsusf_cvc_green_ess"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["V_Simc_vest_fauf_2", "V_Simc_vest_fauf_rig_4"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_visor_black", "rhsusf_hgu56p_black"]];

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

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
	if (random 100 > 60) then {
		["heavyHelmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
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

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
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

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
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
		["launcher", 1] call _fnc_addMagazines;
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

	["ATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 4] call _fnc_addMagazines;

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
	["helmets"] call _fnc_setHelmet;
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