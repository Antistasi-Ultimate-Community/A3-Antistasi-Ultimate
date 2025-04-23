private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "S-ZAVB" ] call _fnc_saveToTemplate;
["nameLeader", "Alexei Kozlov"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", [
	"LivonianHead_5", 
	"LivonianHead_2", 
	"LivonianHead_7", 
	"LivonianHead_6", 
	"LivonianHead_3", 
	"LivonianHead_1", 
	"LivonianHead_10", 
	"LivonianHead_8", 
	"LivonianHead_4", 
	"LivonianHead_9"
]] call _fnc_saveToTemplate; 
["voices", [
	"RHS_Male01RUS",
	"RHS_Male02RUS",
	"RHS_Male03RUS",
	"RHS_Male04RUS",
	"RHS_Male05RUS",
	"Male01RUS",
	"Male02RUS",
	"Male03RUS"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["ACM_O_SZAVB_Vehicle_UAZ_dshkm", "ACM_O_SZAVB_Vehicle_UAZ_AGS", "ACM_O_SZAVB_Vehicle_UAZ_spg9"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["ACM_O_SZAVB_Vehicle_Gaz66o", "ACM_O_SZAVB_Vehicle_Gaz66", "ACM_O_SZAVB_Vehicle_Gaz66_ammo"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["ACM_O_SZAVB_Vehicle_UAZ_open", "ACM_O_SZAVB_Vehicle_UAZ"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["ACM_O_SZAVB_Vehicle_BTR70", "ACM_O_SZAVB_Vehicle_bmd1", "ACM_O_SZAVB_Vehicle_bmd1k", "ACM_O_SZAVB_Vehicle_bmd1r", "ACM_O_SZAVB_Vehicle_bmd2", "ACM_O_SZAVB_Vehicle_bmp1", "ACM_O_SZAVB_Vehicle_bmp1p", "ACM_O_SZAVB_Vehicle_bmp2e", "ACM_O_SZAVB_Vehicle_brm1k", "ACM_O_SZAVB_Vehicle_prp3"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["rhs_t72ba_tv", "rhs_t72bb_tv", "rhs_t72bc_tv", "rhs_t72bd_tv", "rhs_t72be_tv", "rhs_t80", "rhs_t80a"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["RHS_Mi8AMT_vvsc"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;			

["staticLowWeapons", ["ACM_O_SZAVB_Turret_DSHKM_mini", "ACM_O_SZAVB_Turret_KORD", "ACM_O_SZAVB_Turret_AGS30"]] call _fnc_saveToTemplate;
["staticAT", ["ACM_O_SZAVB_Turret_Metis", "ACM_O_SZAVB_Turret_spg9", "ACM_O_SZAVB_Turret_spg9M"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_vdv"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

/*
	["Weapon Classname", "Muzzle Classname", "Accessory Classname", "Scope Classname", ["Magazine Classname 1", "Magazine Classname 2"], ["GL Magazine Classname 1"], "Bipod Classname"]
*/
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["rifles", [
	["rhs_weap_ak74", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74_2", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74m", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74m_fullplum", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74n", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74n_2", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_loadoutData set ["tunedRifles", [
	["rhs_weap_ak74m_npz", "", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74m_npz", "", "rhs_acc_2dpZenit", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74m_npz", "", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],

	["rhs_weap_ak74m_fullplum_npz", "", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74m_fullplum_npz", "", "rhs_acc_2dpZenit", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74m_fullplum_npz", "", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],

	["rhs_weap_ak74n_npz", "", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74n_npz", "", "rhs_acc_2dpZenit", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74n_npz", "", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],

	["rhs_weap_ak74n_2_npz", "", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74n_2_npz", "", "rhs_acc_2dpZenit", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak74n_2_npz", "", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
	["rhs_weap_aks74", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74_2", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74n", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74n_2", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74n_2_npz", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_loadoutData set ["carbines", [
	["rhs_weap_aks74", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74_2", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74n", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74n_2", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74n_2_npz", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
	["rhs_weap_ak74_gp25", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74m_gp25", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74m_gp25_npz", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74m_fullplum_gp25", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74m_fullplum_gp25_npz", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],

	["rhs_weap_ak74n_gp25", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74n_gp25_npz", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74n_2_gp25", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""],
	["rhs_weap_ak74n_2_gp25_npz", "", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25"], ""]
]];
_loadoutData set ["machineGuns", [
	["rhs_weap_pkp", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_loadoutData set ["marksmanRifles", [
	["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
	["rhs_weap_svdp", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
	["rhs_weap_svds", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
	["rhs_weap_svds", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_loadoutData set ["lightATLaunchers", [
	["rhs_weap_rpg26", "", "", "", [], [], ""],
	["rhs_weap_rpg18", "", "", "", [], [], ""],
	["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7V_mag"], [], ""]
]];
_loadoutData set ["lightHELaunchers", [
	["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_OG7V_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
	["rhs_weap_igla", "", "", "", ["rhs_mag_9k38_rocket"], [], ""]
]];
_loadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

_loadoutData set ["ATMines", ["rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec75_sand", "rhs_ec75", "rhs_ec200", "rhs_ec200_sand"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400", "rhs_ec400_sand"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_rgn", "rhs_mag_rgo"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData set ["facewear", ["rhs_facewear_6m2", "rhs_facewear_6m2_1", "None"]];
_loadoutData set ["fullmask", ["rhs_balaclava", "rhs_balaclava1_olive", "None"]];

_loadoutData set ["headgear", [
	"ACM_szavb_R_Fieldcap"
]];

_loadoutData set ["uniforms", [
	"acm_szavb_r_clothes1_1",
	"acm_szavb_r_clothes2_1"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

_loadoutData set ["offuniforms", ["acm_szavb_r_clothes1_1"]];
_loadoutData set ["vests", ["ACM_szavb_r_vest_6B23", "ACM_szavb_r_vest_6B23_6sh116", "ACM_szavb_r_vest_6B23_6sh116_Headset", "ACM_szavb_r_vest_6B23_6sh116_Headset_Map", "ACM_szavb_r_vest_6B23_VOG", "ACM_szavb_r_vest_6B23_Hydra"]];
_loadoutData set ["heavyVests", ["ACM_szavb_r_vest_6B23_6sh116_Headset_Spzn", "ACM_szavb_r_vest_6B23_VOG_Spzn"]];
_loadoutData set ["backpacks", ["gsb_rhs_22_bp_kitbag", "gsb_rhs_22_bp_compact", "gsb_rhs_22_bp_RadioBag_01", "gsb_rhs_22_bp_carryall"]];
_loadoutData set ["helmets", ["ACM_szavb_R_6B47_6B50", "ACM_szavb_R_6B47_NVG", "ACM_szavb_R_6B47_Patchless"]];
_loadoutData set ["crewHelmets", ["ACM_szavb_R_STSH"]];

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


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["V_BandollierB_oli"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["V_BandollierB_oli"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O"]];


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
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

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

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
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
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
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

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

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
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 2] call _fnc_addMagazines;
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
	["heavyVests"] call _fnc_setVest;
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

	["lightATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

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
	["crewHelmets"] call _fnc_setHelmet;
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