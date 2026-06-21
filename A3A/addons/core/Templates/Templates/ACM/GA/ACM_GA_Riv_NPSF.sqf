private _hasSOG = "vn" in A3A_enabledDLC;
private _hasRHS = count (["@RHSAFRF", "@RHSUSAF", "@RHSGREF"] arrayIntersect (getLoadedModsInfo apply {_x select 1})) == 3;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "NPSF"] call _fnc_saveToTemplate;
["nameLeader", "Alexandros Papadopoulos"] call _fnc_saveToTemplate;

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

_vehiclesRivalsLightArmed = ["acm_gm_aaf2028_npsf_wheeled_MB4WD_LMG", "acm_gm_aaf2028_npsf_wheeled_MB4WD_AT", "acm_gm_aaf2028_npsf_wheeled_Iltis_Milan", "acm_gm_aaf2028_npsf_wheeled_Iltis_MG3"];
_vehiclesRivalsTrucks = ["acm_gm_aaf2028_npsf_wheeled_Iltis_cargo"];
_vehiclesRivalsCars = ["acm_gm_aaf2028_npsf_wheeled_van", "acm_gm_aaf2028_npsf_wheeled_van_transport", "acm_gm_aaf2028_npsf_wheeled_MB4WD_Unarmed"];
_vehiclesRivalsAPCs = ["acm_gm_aaf2028_npsf_tracked_bmp1", "acm_gm_aaf2028_npsf_wheeled_brdm2_car", "acm_gm_aaf2028_npsf_brdm2um_car", "acm_gm_aaf2028_npsf_tracked_m113a1dk_apc"];
_vehiclesRivalsTanks = ["acm_gm_aaf2028_npsf_tracked_pt76"];
_vehiclesRivalsHelis = [];
_vehiclesRivalsUavs = [];
_staticLowWeapons = [
	"acm_gm_aaf2028_npsf_Turret_dshkn_tripod", "acm_gm_aaf2028_npsf_Turret_Milan_Tripod", "acm_gm_aaf2028_npsf_Turret_HMG_02", 
	"acm_gm_aaf2028_npsf_Turret_HMG_High_02", "acm_gm_aaf2028_npsf_Turret_MG3_Tripod", "acm_gm_aaf2028_npsf_Turret_spg9_tripod"
];
_staticMortars = ["acm_gm_aaf2028_npsf_Turret_Mortar_01"];

if (_hasRHS) then {
    _vehiclesRivalsTrucks append ["acm_gm_aaf2028_npsf_wheeled_ural4320_reammo", "acm_gm_aaf2028_npsf_wheeled_ural375d_refuel", "acm_gm_aaf2028_npsf_wheeled_ural4320_cargo"];
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

_loadoutData set ["facewear", [
	"G_tweed_peltor",
	"G_tweed_peltor",
	"G_Bandanna_aviator",
	"G_tweed_tacticool_oranje_peltor",
	"G_Bandanna_khk",
	"gm_xx_facewear_scarf_02_wht"
]];
_loadoutData set ["fullmask", [
	"gm_ge_facewear_stormhood_blk"
]];

_loadoutData set ["headgear", [
	"acm_gm_aaf2028_npsf_beret"
]];
_loadoutData set ["offheadgear", [
	"acm_gm_aaf2028_npsf_beret"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["gm_df7x40_blk"]];
_loadoutData set ["Rangefinder", ["gm_df7x40_blk"]];

_loadoutData set ["uniforms", [
	"acm_gm_aaf2028_npsf_clothes_1_1", "acm_gm_aaf2028_npsf_clothes_1_2"
]];
_loadoutData set ["offuniforms", []];

_loadoutData set ["vests", ["V_Simc_SF_mk56_5", "V_Simc_mk56_alt", "V_sns_M58_p37_m43", "V_Simc_mk56", "V_Simc_mk56_alt", "V_Simc_mk56_alt", "V_Simc_mk56_sks", "V_Simc_mk56_alt", "V_sns_m58_p37", "V_Simc_mk56_alt", "V_Simc_mk56", "gm_pl_army_vest_80_leader_gry"]];
_loadoutData set ["medVests", ["V_Simc_56_med"]];
_loadoutData set ["heavyVests", ["gm_ge_bgs_vest_type3a1_oli", "gm_ge_bgs_vest_type18_grn"]];
_loadoutData set ["glVests", ["V_Simc_56_4cm"]];
_loadoutData set ["medBackpacks", ["gm_ge_army_backpack_medic_80_oli"]];
_loadoutData set ["atBackpacks", ["B_Simc_MC_packboard_3", "gm_milan_launcher_weaponBag", "B_Simc_MC_packboard_3"]];
_loadoutData set ["backpacks", ["B_simc_USMC65_M68", "B_simc_USMC65_M41_Roll", "B_simc_USMCFLAK_M41_mortar", "B_simc_packboard_MG_1", "B_simc_USMC65_M68", "B_simc_USMC65_M68_M43", "B_simc_USMC65_M68_M43_roll"]];
_loadoutData set ["helmets", ["acm_gm_aaf2028_npsf_pith"]];
_loadoutData set ["heavyHelmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["gm_repairkit_01", "MineDetector"];
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
	["gm_mpikms72_brn", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_mpikms72_brn", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_akm_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_akm_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_akms_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_akm_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_akms_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_akm_wud", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""]
]];
_loadoutData set ["tunedRifles", [
	["arifle_Katiba_C_F", "", "", "", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
    ["gm_mpikms72_brn", "", "gm_pka_dovetail_blk", "", ["gm_75Rnd_762x39mm_AP_7N23_ak47_blk", "gm_75Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_mpiaks74n_brn", "", "gm_pgo7v_blk", "", ["gm_45Rnd_545x39mm_B_7N6_ak74_prp", "gm_45Rnd_545x39mm_B_T_7T3_ak74_prp"], [], ""]
]];
_loadoutData set ["carbines", [
	["gm_mpikms72k_brn", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_mpikms72k_brn", "", "", "", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], [], ""],
	["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
	["gm_akm_pallad_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_loadoutData set ["machineGuns", [
	["gm_lmgrpk74n_brn", "", "", "", ["gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_hmgpkm_prp", "", "", "", ["gm_100Rnd_762x54mmR_API_7bz3_pk_grn"]]
]];
_loadoutData set ["marksmanRifles", [
    ["gm_g3sg1_oli", "", "", "gm_diavari_da_stanagClaw_oli", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["gm_m72a3_oli"]];
_loadoutData set ["ATLaunchers", [
	["gm_pzf44_2_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2"], [], ""],
	["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf"], [], ""]
]];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["AALaunchers", ["gm_fim43_oli"]];
_loadoutData set ["sidearms", [
	["hgun_ACPC2_F", "", "", "", ["9Rnd_45ACP_Mag"], [], ""],
	["gm_m49_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""]
]];

///////////////////////////////////////
//    NPSF Paramilitary Loadouts     //
///////////////////////////////////////

private _paraLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_paraLoadoutData set ["facewear", [
	"G_Bandanna_khk"
]];
_paraLoadoutData set ["fullmask", [
	"gm_ge_facewear_stormhood_blk"
]];

_paraLoadoutData set ["headgear", [
	"acm_gm_aaf2028_npsf_beret"
]];
_paraLoadoutData set ["offheadgear", [
	"acm_gm_aaf2028_npsf_beret"
]];

_paraLoadoutData set ["uniforms", [
	"U_Simc_DCU_blench", "U_Simc_DCU_blench_knee_trop", "U_Simc_DCU_blench_gas_knee", "U_Simc_DCU_blench_knee"
]];
_paraLoadoutData set ["offuniforms", []];

_paraLoadoutData set ["vests", ["gm_ge_bgs_vest_type3a1_oli", "gm_ge_bgs_vest_type3_oli", "V_TacVest_oli"]];
_paraLoadoutData set ["medVests", ["gm_ge_bgs_vest_type18_grn"]];
_paraLoadoutData set ["heavyVests", ["gm_ge_vest_sov_armor_80_oli"]];
_paraLoadoutData set ["glVests", ["gm_ge_bgs_vest_type3a1_gry"]];
_paraLoadoutData set ["medBackpacks", []];
_paraLoadoutData set ["atBackpacks", ["gm_pl_army_backpack_at_80_gry"]];
_paraLoadoutData set ["backpacks", ["gm_dk_army_backpack_73_oli", "gm_dk_army_backpack_73_oli", "gm_pl_army_backpack_80_oli", "gm_pl_army_backpack_80_oli", "B_Simc_packboard_flak_MG_1", "B_simc_pack_56"]];
_paraLoadoutData set ["helmets", ["H_Simc_pasgt_dcu", "H_Simc_pasgt_dcu_SWDG", "H_Simc_pasgt_dcu_scrim_SWDG", "H_Simc_pasgt_dcu_scrim_alt", "H_Simc_pasgt_dcu_SWDG_low_b", "H_Simc_pasgt_dcu_scrim"]];
_paraLoadoutData set ["heavyHelmets", []];

_paraLoadoutData set ["rifles", [
	["arifle_Katiba_F", "", "", "optic_ACO_grn", ["30Rnd_65x39_caseless_green"], [], ""],
	["arifle_Katiba_F", "", "", "optic_ACO_grn", ["30Rnd_65x39_caseless_green"], [], ""],
	["arifle_Katiba_F", "", "", "optic_ACO_grn", ["30Rnd_65x39_caseless_green"], [], ""],
	["arifle_Katiba_F", "", "", "", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_paraLoadoutData set ["tunedRifles", [
	["arifle_Katiba_F", "", "", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_paraLoadoutData set ["enforcerRifles", [
    ["arifle_Katiba_F", "", "", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_paraLoadoutData set ["carbines", [
	["arifle_Katiba_C_F", "", "", "optic_ACO_grn", ["30Rnd_65x39_caseless_green"], [], ""],
	["arifle_Katiba_C_F", "", "", "optic_ACO_grn", ["30Rnd_65x39_caseless_green"], [], ""],
	["arifle_Katiba_C_F", "", "", "", ["30Rnd_65x39_caseless_green"], [], ""]
]];
_paraLoadoutData set ["grenadeLaunchers", [
	["arifle_Katiba_GL_F", "", "", "optic_ACO_grn", ["30Rnd_65x39_caseless_green"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_paraLoadoutData set ["machineGuns", [
	["gm_lmgrpk74n_blk", "", "", "gm_zfk4x25_blk", ["gm_45Rnd_545x39mm_B_7N6_ak74_blk"], [], ""],
	["LMG_Zafir_F", "", "", "", ["150Rnd_762x54_Box"], [], ""]
]];
_paraLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_07_blk_F", "", "", "optic_DMS", ["20Rnd_650x39_Cased_Mag_F"], [], ""]
]];
_paraLoadoutData set ["lightATLaunchers", ["gm_rpg18_oli"]];
_paraLoadoutData set ["ATLaunchers", [
	["gm_rpg7_prp_pgo7v", "", "", "gm_pgo7v_blk", ["gm_1Rnd_40mm_heat_pg7v_rpg7"], [], ""],
	["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT"], [], ""]
]];
_paraLoadoutData set ["lightHELaunchers", []];
_paraLoadoutData set ["AALaunchers", [
	["gm_9k32m_oli", "", "", "", ["gm_1Rnd_72mm_he_9m32m"], [], ""]
]];
_paraLoadoutData set ["sidearms", [
	["gm_pm63_handgun_blk", "", "", "", ["gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["gm_gc_army_uniform_soldier_80_blk"]];
_crewLoadoutData set ["vests", ["V_Simc_flak_M56_open_45"]];
_crewLoadoutData set ["helmets", ["gm_ge_headgear_headset_crew_oli"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["gm_ge_army_vest_pilot_oli"]];
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
	["medVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["medBackpacks"] call _fnc_setBackpack;

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
	["glVests"] call _fnc_setVest;
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

// * on each restart of the server, 50% chance that the rival forces will be normal NPSF or NPSF paramilitary for a little variety in the faction
if (random 10 < 5) then {
	[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate
} else {
	[_prefix, _unitTypes, _paraLoadoutData] call _fnc_generateAndSaveUnitsToTemplate
};

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;