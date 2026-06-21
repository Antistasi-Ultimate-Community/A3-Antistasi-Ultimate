private _hasSOG = "vn" in A3A_enabledDLC;
private _hasRHS = count (["@RHSAFRF", "@RHSUSAF", "@RHSGREF"] arrayIntersect (getLoadedModsInfo apply {_x select 1})) == 3;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "FIA Insurgents"] call _fnc_saveToTemplate;
["nameLeader", "Petros's long-lost half brother"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
private _faces = [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros",
    "GreekHead_A3_10_l",
    "GreekHead_A3_10_sa",
    "GreekHead_A3_10_a"
];
if (_hasSOG) then {
    _faces append [
        #include "..\..\DLC_content\faces\SOG\SOG_faces_greek.sqf"
    ];
};
["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

_vehiclesRivalsLightArmed = ["acm_gm_aaf2015_fiaIns_opf_v_uaz469_dshkm_car", "acm_gm_aaf2015_fiaIns_opf_v_uaz469_spg9_car"];
_vehiclesRivalsTrucks = ["acm_gm_aaf2015_fiaIns_opf_v_u1300l_car", "acm_gm_aaf2015_fiaIns_opf_v_ural375d_cargo_car"];
_vehiclesRivalsCars = ["acm_gm_aaf2015_fiaIns_opf_v_typ247_car", "acm_gm_aaf2015_fiaIns_opf_v_typ253_car", "acm_gm_aaf2015_fiaIns_opf_v_uaz469_cargo_car", "acm_gm_aaf2015_fiaIns_opf_v_w123_car"];
_vehiclesRivalsAPCs = [];
_vehiclesRivalsTanks = [];
_vehiclesRivalsHelis = [];
_vehiclesRivalsUavs = [];
_staticLowWeapons = ["acm_gm_aaf2015_fiaIns_opf_v_dshkm_turret", "acm_gm_aaf2015_fiaIns_opf_v_spg9_turret"];
_staticMortars = ["acm_gm_aaf2015_fiaIns_opf_v_mortar_turret"];

if (_hasSOG) then {
    _vehiclesRivalsLightArmed append ["acm_gm_aaf2015_SOG_fiaIns_opf_v_m274_M40_car", "acm_gm_aaf2015_SOG_fiaIns_opf_v_Boheme_DP27_car", "acm_gm_aaf2015_SOG_fiaIns_opf_v_Z157_MG_01_Car"];
	_vehiclesRivalsTrucks append ["acm_gm_aaf2015_SOG_fiaIns_opf_v_Z157_MG_01_Car", "acm_gm_aaf2015_SOG_fiaIns_opf_v_Z157_transport_Car"];
	_vehiclesRivalsCars append ["acm_gm_aaf2015_fiaIns_opf_v_m274_transport_car"];
	_staticLowWeapons append ["acm_gm_aaf2015_SOG_fiaIns_opf_v_dshkm_low_turret", "acm_gm_aaf2015_SOG_fiaIns_opf_v_m1910_turret", "acm_gm_aaf2015_SOG_fiaIns_opf_v_m1910_armour_turret", "acm_gm_aaf2015_SOG_fiaIns_opf_v_sgm_low_turret", "acm_gm_aaf2015_SOG_fiaIns_opf_v_zgu1_turret"];
	_staticMortars append ["acm_gm_aaf2015_SOG_fiaIns_opf_v_m2_mortar_turret"];
};

if (_hasRHS) then {
    _vehiclesRivalsTrucks append ["acm_gm_aaf2015_fiaIns_rhsafrf_opf_v_Ural_zu23_car"];
	_staticLowWeapons append ["acm_gm_aaf2015_fiaIns_rhsafrf_opf_v_zu23_turret"];
};

["vehiclesRivalsLightArmed", _vehiclesRivalsLightArmed] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", _vehiclesRivalsTrucks] call _fnc_saveToTemplate;
["vehiclesRivalsCars", _vehiclesRivalsCars] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", _vehiclesRivalsAPCs] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", _vehiclesRivalsTanks] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", _vehiclesRivalsHelis] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", _vehiclesRivalsUavs] call _fnc_saveToTemplate;			

["staticLowWeapons", _staticLowWeapons] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["gm_minestatic_at_tm46"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["gm_minestatic_ap_pfm1"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["gm_mine_at_tm46"]];
_loadoutData set ["APMines", ["gm_mine_ap_pfm1"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["gm_explosive_plnp_charge"]];

_loadoutData set ["antiInfantryGrenades", ["gm_handgrenade_frag_rgd5"]];
_loadoutData set ["smokeGrenades", ["gm_smokeshell_wht_gc"]];
_loadoutData set ["signalsmokeGrenades", ["gm_smokeshell_yel_gc", "gm_smokeshell_red_gc", "gm_smokeshell_org_gc", "gm_smokeshell_grn_gc", "gm_smokeshell_blu_gc", "gm_smokeshell_blk_gc"]];

_loadoutData set ["facewear", ["G_simc_US_Bandoleer_60", "gm_ge_facewear_stormhood_blk", "G_simc_US_Bandoleer_556_fore"]];
_loadoutData set ["fullmask", ["G_Bandanna_beast", "G_Bandanna_khk"]];

_loadoutData set ["headgear", ["H_ShemagOpen_khk", "H_Shemag_olive", "H_Simc_Boon_m81_1", "H_Cap_headphones", "gm_ge_headgear_hat_boonie_flk", "H_Simc_Boon_m81_2", "gm_ge_headgear_hat_90_flk", "H_Simc_Boon_green_3", "H_ShemagOpen_tan", "H_Simc_Boon_m81_1"]];
_loadoutData set ["offheadgear", ["H_Cap_headphones", "gm_ge_headgear_beret_blk"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["gm_df7x40_blk"]];
_loadoutData set ["Rangefinder", ["gm_df7x40_blk"]];

_loadoutData set ["uniforms", ["U_simc_swetr1_leven_trop", "U_Simc_bdu_civ_desu_trop", "U_simc_civ_jean_rot_ligt", "U_simc_bdu_civ_surf", "U_simc_bdu_erla_gas_blench_trop", "U_Simc_bdu_eto_tee", "U_simc_swetr1_amogus", "U_Simc_bdu_civ", "U_simc_civ_jean_blau_tuck_trop", "U_simc_civ_jean_khk_tuck_trop"]];

_loadoutData set ["offuniforms", ["U_Simc_CDO_BDU", "U_Simc_CDO_DCU"]];
_loadoutData set ["vests", ["V_Simc_mk56_sks", "V_Simc_mk56_alt", "gm_ge_vest_90_machinegunner_flk", "V_TacChestrig_grn_F", "V_Simc_61_56_morser", "V_Simc_Barbelt_M56_zusp", "V_Simc_56_med_side_ass", "V_Simc_mk56", "V_Simc_SF_mk56_4", "V_Simc_61_56_bandoleer", "V_Chestrig_rgr"]];
if (_hasSOG) then {
    (_loadoutData get "vests") append ["vn_o_vest_02"]
};
_loadoutData set ["heavyVests", ["gm_ge_vest_sov_80_wdl", "V_TacVest_oli", "V_Simc_nadevest_alice_mc", "V_Simc_flak_55_M61_open_morser"]];
_loadoutData set ["atBackpacks", ["gm_pl_army_backpack_at_80_gry"]];
if (_hasSOG) then {
    (_loadoutData get "atBackpacks") append ["vn_o_pack_03"]
};
_loadoutData set ["backpacks", ["B_simc_pack_frem_7", "B_Carryall_oli", "B_simc_pack_56", "B_Simc_US_Bandoleer_556_doppel_1"]];
_loadoutData set ["helmets", []];
_loadoutData set ["heavyHelmets", []];

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
    ["gm_ak74n_wud", "", "", "", ["gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_ak74n_wud", "", "", "", ["gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_ak74n_wud", "", "", "", ["gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_mpiak74n_blk", "", "", "", ["gm_30Rnd_545x39mm_B_7N6_ak74_blk"], [], ""],
	["gm_akmsn_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_m16a1_blk", "", "", "", ["gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
	["gm_m16a1_blk", "", "", "", ["gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""]
]];
_loadoutData set ["tunedRifles", [
    ["gm_m16a1_blk", "", "gm_colt4x20_ar15_blk", "", ["gm_30Rnd_556x45mm_B_M855_stanag_gry"], [], ""],
	["gm_m16a1_blk", "", "gm_colt4x20_ar15_blk", "", ["gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
	["gm_ak74n_wud", "", "", "", ["gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_mpiak74n_blk", "", "", "gm_pka_dovetail_gry", ["gm_30Rnd_545x39mm_B_7N6_ak74_blk"], [], ""]
]];
_loadoutData set ["carbines", [
	["gm_hk512_wud", "", "", "", ["gm_7Rnd_12ga_hk512_pellet", "gm_7Rnd_12ga_hk512_slug"], [], ""]
]];
if (_hasSOG) then {
    (_loadoutData get "carbines") pushBack ["vn_mp40", "", "", "", ["vn_mp40_mag"], [], ""]
};
_loadoutData set ["grenadeLaunchers", [
    ["gm_akm_pallad_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "1Rnd_HE_Grenade_shell"]]
]];
if (_hasSOG) then {
    (_loadoutData get "grenadeLaunchers") pushBack ["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_22mm_m1a2_frag_mag"], [], ""]
};
_loadoutData set ["machineGuns", [
    ["gm_lmgrpk74n_brn", "", "", "", ["gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""]
]];
_loadoutData set ["marksmanRifles", [
    ["gm_g3sg1_oli", "", "", "gm_diavari_da_stanagClaw_oli", ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""]
]];
if (_hasSOG) then {
    (_loadoutData get "marksmanRifles") pushBack ["vn_k98k", "", "", "", ["vn_k98k_mag"], [], ""]
};
_loadoutData set ["lightATLaunchers", ["gm_m72a3_oli"]];
_loadoutData set ["ATLaunchers", [
	["gm_rpg7_wud", "", "", "gm_pgo7v_blk", ["gm_1Rnd_40mm_heat_pg7v_rpg7", "gm_1Rnd_40mm_heat_pg7vl_rpg7"], [], ""],
	["gm_rpg7_prp", "", "", "gm_pgo7v_blk", ["gm_1Rnd_40mm_heat_pg7vl_rpg7"], [], ""],
	["gm_rpg7_wud", "", "", "", ["gm_1Rnd_40mm_heat_pg7v_rpg7"], [], ""]
]];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", [
["gm_pm_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["V_Simc_mk56_sks_alt"]];
_crewLoadoutData set ["helmets", ["gm_gc_army_headgear_crewhat_80_blk"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["gm_pl_army_vest_80_crew_gry"]];
_pilotLoadoutData set ["helmets", ["gm_ge_headgear_hat_beanie_crew_blk"]];


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
	["headgear"] call _fnc_setHelmet;
	if (random 100 > 60) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 > 60) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
	if (random 100 < 30) then {
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
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
	["headgear"] call _fnc_setHelmet;
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
	[selectRandom ["offheadgear"]] call _fnc_setHelmet;
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