//////////////////////////
//   Side Information   //
//////////////////////////

["name", "USSR"] call _fnc_saveToTemplate;
["spawnMarkerName", "Soviet Reinforcements"] call _fnc_saveToTemplate;

["flag", "LIB_FlagCarrier_SU"] call _fnc_saveToTemplate;
["flagTexture", "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "LIB_Faction_RKKA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "LIB_AmmoCrate_Arty_SU"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["NORTH_SOV_R75"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Willys_MB","LIB_Willys_MB_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["NORTH_SOV_T38","NORTH_SOV_T20","NORTH_SOV_BA10","NORTH_SOV_BA6","NORTH_SOV_T60"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["LIB_US6_Tent","LIB_US6_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US6_Open_Cargo","LIB_US6_Tent_Cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US6_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_Zis6_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_Zis5v_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_Med"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["LIB_Scout_M3_FFV","LIB_Scout_M3"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_Scout_M3_FFV","LIB_SOV_M3_Halftrack","NORTH_SOV_T34_76_1941"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["LIB_SU85","NORTH_SOV_T34_76_1943","NORTH_SOV_T28","NORTH_SOV_T28e","NORTH_SOV_T28_com"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["NORTH_SOV_KV1_1940","NORTH_SOV_KV1_1941","NORTH_SOV_KV1_1942","NORTH_SOV_KV1E_1940","NORTH_SOV_T34_85","NORTH_SOV_T34_85_45","NORTH_SOV_T34_85","NORTH_SOV_T34_85_45","LIB_JS2_43","LIB_JS2_43","LIB_JS2_43"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["LIB_Scout_M3_FFV","NORTH_SOV_T60","NORTH_SOV_T70"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["NORTH_SOV_T26_M33","NORTH_SOV_T26_M38","NORTH_SOV_T26_M39","NORTH_SOV_T26_M33com","NORTH_SOV_T70","NORTH_SOV_41_BT5","NORTH_SOV_41_BT5Com","NORTH_SOV_41_BT7","NORTH_SOV_41_BT7A","NORTH_SOV_41_BT7Com_M35","NORTH_SOV_41_T26_M33_OT","NORTH_SOV_41_T26_M39_OT"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", []] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["LIB_Pe2"];
private _vehiclesPlanesAA = ["LIB_P39"];
["vehiclesPlanesTransport", ["LIB_Li2"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
	_vehiclesPlanesAA append ["sab_fl_yak3"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
	_vehiclesPlanesCAS append ["sab_sw_il2"];
	_vehiclesPlanesAA append ["sab_sw_i16","sab_sw_i16_2"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["LIB_US6_BM13"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_US6_BM13", ["LIB_16Rnd_BM13"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["LIB_Kfz1_MG42_sernyt"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["LIB_Scout_M3"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;

["staticMGs", ["NORTH_FIN_Maxim_High"]] call _fnc_saveToTemplate;
["staticAT", ["NORTH_SOV_76mm1936"]] call _fnc_saveToTemplate;
["staticAA", ["NORTH_SOV_Maxim_Quad"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_BM37"]] call _fnc_saveToTemplate;
["staticHowitzers", ["NORTH_SOV_152mm1938"]] call _fnc_saveToTemplate;

["vehicleRadar", "LIB_61k"] call _fnc_saveToTemplate;
["vehicleSam", "LIB_61k"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "NORTH_10Shell_152mmHE_152h38"] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_82mmHE_BM37"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_82mm_BM37_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["LIB_TM44_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_PMD6_MINE"]] call _fnc_saveToTemplate;

#include "NFtS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01SU","Male02SU","Male03SU"]] call _fnc_saveToTemplate;
["faces", ["RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5"]] call _fnc_saveToTemplate;


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
_loadoutData set ["lightATLaunchers", [
["LIB_PzFaust_30m", "", "", "",[""], [], ""], 
["LIB_PzFaust_60m", "", "", "",[""], [], ""]]];
_loadoutData set ["ATLaunchers", [
["LIB_M1A1_Bazooka", "", "", "",["LIB_1Rnd_60mm_M6"], [], ""]]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["LIB_TM44_MINE_mag"]];
_loadoutData set ["APMines", ["LIB_PMD6_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiInfantryGrenades", ["LIB_Rg42"]];
_loadoutData set ["antiTankGrenades", ["LIB_Rpg6"]];
_loadoutData set ["smokeGrenades", ["LIB_RDG"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["radios", []];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_SU"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_SU"]];

_loadoutData set ["traitorUniforms", ["U_LIB_SOV_Strelok_summer"]];
_loadoutData set ["traitorVests", ["V_LIB_SOV_RA_OfficerVest"]];
_loadoutData set ["traitorHats", ["H_LIB_SOV_RA_PrivateCap"]];

_loadoutData set ["officerUniforms", ["U_LIB_SOV_Kapitan_summer"]];
_loadoutData set ["officerVests", ["V_LIB_SOV_RA_OfficerVest"]];
_loadoutData set ["officerHats", ["H_LIB_NKVD_OfficerCap"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", ["B_LIB_SOV_RA_Radio"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["TFAR_SCR536"];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr37_43_MKK_3"]];
_sfLoadoutData set ["vests", ["V_NORTH_SOV_SN42"]];
_sfLoadoutData set ["glVests", ["V_NORTH_SOV_SN42"]];
_sfLoadoutData set ["Hvests", ["V_NORTH_SOV_SN42"]];
_sfLoadoutData set ["backpacks", ["NORTH_SOV_Veshmeshok_Gasmaskbag","NORTH_SOV_Veshmeshok_Gasmaskbag_2","NORTH_SOV_Veshmeshok_Gasmaskbag_3"]];
_sfLoadoutData set ["helmets", ["H_NORTH_SOV_SSh40_Helmet_camo","H_NORTH_SOV_SSh40_Helmet_camo_2","H_NORTH_SOV_SSh40_Helmet_camo_3","H_NORTH_SOV_SSh40_Helmet_camo_4","H_NORTH_SOV_SSh40_Helmet_camo_5","H_NORTH_SOV_SSh40_Helmet_camo_6"]];
_sfLoadoutData set ["sniHats", ["H_NORTH_SOV_SSh40_Helmet_camo","H_NORTH_SOV_SSh40_Helmet_camo_2","H_NORTH_SOV_SSh40_Helmet_camo_3","H_NORTH_SOV_SSh40_Helmet_camo_4","H_NORTH_SOV_SSh40_Helmet_camo_5","H_NORTH_SOV_SSh40_Helmet_camo_6"]];
_sfLoadoutData set ["slHat", ["H_NORTH_SOV_Obr35_Furazhka","H_NORTH_SOV_Obr35_Furazhka_2","H_NORTH_SOV_Obr35_Furazhka_3","H_NORTH_SOV_Obr35_Furazhka_4","H_NORTH_SOV_Obr35_Furazhka_5","H_NORTH_SOV_Obr35_Furazhka_6"]];
_sfLoadoutData set ["binoculars", ["LIB_Binocular_SU"]];

//SF Weapons
_sfLoadoutData set ["rifles", [["NORTH_Fedorov_Avtomat", "", "", "", ["NORTH_25rnd_Fedorov_mag"], [], ""],
        ["NORTH_AVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]]];
_sfLoadoutData set ["carbines", [["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""],
        ["NORTH_ppsh41", "", "", "", ["NORTH_35rnd_ppsh41_mag"], [], ""]]];
_sfLoadoutData set ["grenadeLaunchers", [["LIB_M9130", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_sfLoadoutData set ["SMGs", [["NORTH_ppsh41", "", "", "", ["NORTH_71rnd_ppsh41_mag"], [], ""],
        ["NORTH_ppsh41", "", "", "", ["NORTH_35rnd_ppsh41_mag"], [], ""]]];
_sfLoadoutData set ["machineGuns", [["NORTH_DT_hand", "", "", "", ["NORTH_63rnd_dt_mag"], [], ""],
        ["NORTH_DT_hand", "", "", "", ["NORTH_63rnd_dt_mag"], [], ""],
	["NORTH_dp27", "", "", "", ["NORTH_47rnd_dp27_mag"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""],
        ["NORTH_ppsh41", "", "", "", ["NORTH_71rnd_ppsh41_mag"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [["NORTH_sov_m9130_PU", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
		["NORTH_SVT40PU", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]]];
_sfLoadoutData set ["sidearms", [["NORTH_TT33", "", "", "", ["NORTH_8Rnd_tt33_mag"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr43_Uniform_Private","U_NORTH_SOV_Obr43_Uniform_Private_2","U_NORTH_SOV_Obr43_Uniform_Private_3","U_NORTH_SOV_Obr43_Uniform_Private_4","U_NORTH_SOV_Obr43_Uniform_Private_5","U_NORTH_SOV_Obr43_Uniform_Private_6"]];
_eliteLoadoutData set ["slUniforms", ["U_NORTH_SOV_Obr43_Uniform_1stLt"]];
_eliteLoadoutData set ["vests", ["V_NORTH_SOV_Belt_Late_Mosin_1","V_NORTH_SOV_Belt_Late_Mosin_2","V_NORTH_SOV_Belt_Late_Mosin_3","V_NORTH_SOV_Belt_Late_Mosin_4","V_NORTH_SOV_Belt_Late_SMG","V_NORTH_SOV_Belt_Late_SMG_2","V_NORTH_SOV_Belt_Late_SMG_3","V_NORTH_SOV_Belt_Late_SMG_4"]];
_eliteLoadoutData set ["glVests", ["V_NORTH_SOV_Belt_Late_SVT","V_NORTH_SOV_Belt_Late_SVT_2"]];
_eliteLoadoutData set ["Hvests", ["V_NORTH_SOV_SN42"]];
_eliteLoadoutData set ["backpacks", ["NORTH_SOV_Veshmeshok_Gasmaskbag_Shinel","NORTH_SOV_Veshmeshok_Gasmaskbag_Shinel_2","NORTH_SOV_Veshmeshok_Gasmaskbag_Shinel_3"]];
_eliteLoadoutData set ["helmets", ["H_NORTH_SOV_SSh40_Helmet","H_NORTH_SOV_SSh40_Helmet_2","H_NORTH_SOV_SSh40_Helmet_3","H_NORTH_SOV_SSh40_Helmet_4","H_NORTH_SOV_SSh40_Helmet_5"]];
_eliteLoadoutData set ["sniHats", ["H_NORTH_SOV_SSh40_Helmet_Moss_1","H_NORTH_SOV_SSh40_Helmet_Moss_2","H_NORTH_SOV_SSh40_Helmet_Moss_3"]];
_eliteLoadoutData set ["slHat", ["H_NORTH_SOV_Obr35_Pilotka_Off"]];
_eliteLoadoutData set ["binoculars", ["LIB_Binocular_SU"]];

_eliteLoadoutData set ["rifles", [
	["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
    ["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
	["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]
	]];
_eliteLoadoutData set ["carbines", [
	["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""],
        ["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
	["NORTH_SVT38", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]
	]];
_eliteLoadoutData set ["grenadeLaunchers", [["LIB_M9130", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_eliteLoadoutData set ["SMGs", [["NORTH_ppsh41", "", "", "", ["NORTH_35rnd_ppsh41_mag"], [], ""],
        ["NORTH_ppsh41", "", "", "", ["NORTH_71rnd_ppsh41_mag"], [], ""]]];
_eliteLoadoutData set ["machineGuns", [["NORTH_DT_hand", "", "", "", ["NORTH_63rnd_dt_mag"], [], ""],
        ["NORTH_dp27", "", "", "", ["NORTH_47rnd_dp27_mag"], [], ""]]];
_eliteLoadoutData set ["marksmanRifles", [["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]]];
_eliteLoadoutData set ["sniperRifles", [["NORTH_sov_m9130_PU", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
		["NORTH_SVT40PU", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""],
		["NORTH_sov_m9130_PEM", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]]];
_eliteLoadoutData set ["sidearms", [["NORTH_TT33", "", "", "", ["NORTH_8Rnd_tt33_mag"], [], ""]]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr43_Uniform_Private","U_NORTH_SOV_Obr43_Uniform_Private_2","U_NORTH_SOV_Obr43_Uniform_Private_3","U_NORTH_SOV_Obr43_Uniform_Private_4","U_NORTH_SOV_Obr43_Uniform_Private_5","U_NORTH_SOV_Obr43_Uniform_Private_6"]];
_militaryLoadoutData set ["slUniforms", ["U_NORTH_SOV_Obr43_Uniform_2ndLt","U_NORTH_SOV_Obr43_Uniform_1stLt"]];
_militaryLoadoutData set ["vests", ["V_NORTH_SOV_Belt_Late_Mosin_1","V_NORTH_SOV_Belt_Late_Mosin_2","V_NORTH_SOV_Belt_Late_Mosin_3","V_NORTH_SOV_Belt_Late_Mosin_4"]];
_militaryLoadoutData set ["glVests", ["V_NORTH_SOV_Belt_Late_SVT","V_NORTH_SOV_Belt_Late_SVT_2"]];
_militaryLoadoutData set ["Hvests", ["V_NORTH_SOV_Belt_Late_SMG","V_NORTH_SOV_Belt_Late_SMG_2","V_NORTH_SOV_Belt_Late_SMG_3","V_NORTH_SOV_Belt_Late_SMG_4"]];
_militaryLoadoutData set ["backpacks", ["NORTH_SOV_Veshmeshok_Gasmaskbag","NORTH_SOV_Veshmeshok_Gasmaskbag_2","NORTH_SOV_Veshmeshok_Gasmaskbag_3"]];
_militaryLoadoutData set ["helmets", ["H_NORTH_SOV_SSh39_Helmet","H_NORTH_SOV_SSh39_Helmet_2","H_NORTH_SOV_SSh40_Helmet","H_NORTH_SOV_SSh40_Helmet_2","H_NORTH_SOV_SSh40_Helmet_3","H_NORTH_SOV_SSh40_Helmet_4","H_NORTH_SOV_SSh40_Helmet_5"]];
_militaryLoadoutData set ["sniHats", ["H_NORTH_SOV_SSh40_Helmet_Moss_1","H_NORTH_SOV_SSh40_Helmet_Moss_2","H_NORTH_SOV_SSh40_Helmet_Moss_3"]];
_militaryLoadoutData set ["slHat", ["H_NORTH_SOV_Obr35_Pilotka_Off"]];
_militaryLoadoutData set ["binoculars", ["LIB_Binocular_SU"]];

_militaryLoadoutData set ["rifles", [
	["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
	["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
	["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
    ["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
	["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]
	]];
_militaryLoadoutData set ["carbines", [
	["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""],
    ["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
	["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]
	]];
_militaryLoadoutData set ["grenadeLaunchers", [["LIB_M9130", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_militaryLoadoutData set ["SMGs", [["NORTH_ppsh41", "", "", "", ["NORTH_35rnd_ppsh41_mag"], [], ""],
        ["NORTH_ppsh41", "", "", "", ["NORTH_35rnd_ppsh41_mag"], [], ""],
		["NORTH_PPS43", "", "", "", ["NORTH_35rnd_pps43_mag"], [], ""],
		["NORTH_PPD34_38", "", "", "", ["NORTH_71rnd_PPD34_38_mag"], [], ""],
		["NORTH_PPD40", "", "", "", ["NORTH_71rnd_PPD40_mag"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["NORTH_DT_hand", "", "", "", ["NORTH_63rnd_dt_mag"], [], ""],
        ["NORTH_dp27", "", "", "", ["NORTH_47rnd_dp27_mag"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""],
		["NORTH_sov_m9130_PEM", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
        ["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["NORTH_sov_m9130_PU", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
		["NORTH_sov_m9130_PEM", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["NORTH_TT33", "", "", "", ["NORTH_8Rnd_tt33_mag"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr43_Uniform_NKVD_Private_1CL","U_NORTH_SOV_Obr43_Uniform_NKVD_Private_1CL_2","U_NORTH_SOV_Obr43_Uniform_NKVD_Private_1CL_3","U_NORTH_SOV_Obr43_Uniform_NKVD_Private_1CL_4"]];
_policeLoadoutData set ["vests", ["V_NORTH_SOV_Belt_Officer_Assault","V_NORTH_SOV_Belt_Officer_Assault_2","V_NORTH_SOV_Belt_Officer_Assault_3","V_NORTH_SOV_Belt_Officer_Assault_4"]];
_policeLoadoutData set ["helmets", ["H_NORTH_SOV_Obr35_Furazhka_NKVD","H_NORTH_SOV_Obr35_Furazhka_NKVD_2","H_NORTH_SOV_Obr35_Furazhka_NKVD_3","H_NORTH_SOV_Obr35_Furazhka_NKVD_4"]];
_policeLoadoutData set ["SMGs", [
	["NORTH_ppsh41", "", "", "", ["NORTH_35rnd_ppsh41_mag"], [], ""],
	["NORTH_PPS43", "", "", "", ["NORTH_35rnd_pps43_mag"], [], ""],
    ["NORTH_PPD34", "", "", "", ["NORTH_34rnd_PPD_mag"], [], ""]]];
_policeLoadoutData set ["sidearms", [["NORTH_TT33", "", "", "", ["NORTH_8Rnd_tt33_mag"], [], ""],
        ["NORTH_m1895", "", "", "", ["NORTH_6Rnd_m1895_mag"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr35_Uniform_Early_Private","U_NORTH_SOV_Obr35_Uniform_Early_Private_2","U_NORTH_SOV_Obr35_Uniform_Early_Private_3","U_NORTH_SOV_Obr35_Uniform_Early_Private_4","U_NORTH_SOV_Obr35_Uniform_Early_Private_5","U_NORTH_SOV_Obr35_Uniform_Early_Private_6"]];
_militiaLoadoutData set ["slUniforms", ["U_NORTH_SOV_Obr35_Uniform_Early_2ndLt","U_NORTH_SOV_Obr35_Uniform_Early_2ndLt_2"]];
_militiaLoadoutData set ["vests", ["V_NORTH_SOV_Belt_Mosin","V_NORTH_SOV_Belt_Mosin_2","V_NORTH_SOV_Belt_Mosin_3","V_NORTH_SOV_Belt_Mosin_4","V_NORTH_SOV_Belt_Mosin_5","V_NORTH_SOV_Belt_SMG","V_NORTH_SOV_Belt_SMG_2","V_NORTH_SOV_Belt_SMG_3","V_NORTH_SOV_Belt_SMG_4","V_NORTH_SOV_Belt_SMG_5"]];
_militiaLoadoutData set ["glVests", ["V_NORTH_SOV_Belt_SVT","V_NORTH_SOV_Belt_SVT_2"]];
_militiaLoadoutData set ["Hvests", ["V_NORTH_SOV_Belt_Officer_Assault","V_NORTH_SOV_Belt_Officer_Assault_2","V_NORTH_SOV_Belt_Officer_Assault_3","V_NORTH_SOV_Belt_Officer_Assault_4"]];
_militiaLoadoutData set ["backpacks", ["NORTH_SOV_Veshmeshok","NORTH_SOV_Veshmeshok_2","NORTH_SOV_Veshmeshok_3"]];
_militiaLoadoutData set ["helmets", ["H_NORTH_SOV_Obr35_Pilotka","H_NORTH_SOV_Obr35_Pilotka_2","H_NORTH_SOV_Obr35_Pilotka_3","H_NORTH_SOV_Obr35_Pilotka_4","H_NORTH_SOV_SSh36_Helmet","H_NORTH_SOV_SSh36_Helmet_2","H_NORTH_SOV_SSh36_Helmet_3","H_NORTH_SOV_SSh36_Helmet_4"]];
_militiaLoadoutData set ["sniHats", ["H_NORTH_SOV_Obr35_Pilotka","H_NORTH_SOV_Obr35_Pilotka_2","H_NORTH_SOV_Obr35_Pilotka_3","H_NORTH_SOV_Obr35_Pilotka_4"]];
_militiaLoadoutData set ["slHat", ["H_NORTH_SOV_Obr35_Furazhka","H_NORTH_SOV_Obr35_Furazhka_2","H_NORTH_SOV_Obr35_Furazhka_3","H_NORTH_SOV_Obr35_Furazhka_4","H_NORTH_SOV_Obr35_Furazhka_5","H_NORTH_SOV_Obr35_Furazhka_6"]];

_militiaLoadoutData set ["rifles", [["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
        ["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]]];
_militiaLoadoutData set ["carbines", [["NORTH_SOV_M38", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["LIB_M9130", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_militiaLoadoutData set ["SMGs", [["NORTH_PPS43", "", "", "", ["NORTH_35rnd_pps43_mag"], [], ""],
        ["NORTH_PPD34", "", "", "", ["NORTH_34rnd_PPD_mag"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["NORTH_dp27", "", "", "", ["NORTH_47rnd_dp27_mag"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
        ["NORTH_SVT40", "", "", "", ["NORTH_10rnd_SVT_mag"], [], ""]]];
_militiaLoadoutData set ["sniperRifles", [["NORTH_sov_M9130", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
		["NORTH_sov_m9130_PEM", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""],
        ["NORTH_sov_m9130_PU", "", "", "", ["NORTH_5Rnd_m39_mag"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["NORTH_TT33", "", "", "", ["NORTH_8Rnd_tt33_mag"], [], ""],
        ["NORTH_m1895", "", "", "", ["NORTH_6Rnd_m1895_mag"], [], ""]]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr43_Uniform_CAV_Private","U_NORTH_SOV_Obr43_Uniform_CAV_Private_2","U_NORTH_SOV_Obr43_Uniform_CAV_Private_3"]];
_crewLoadoutData set ["vests", ["V_NORTH_SOV_Belt_Late_Pistol","V_NORTH_SOV_Belt_Late_Pistol_3"]];
_crewLoadoutData set ["helmets", ["H_NORTH_SOV_Tankerhelmet","H_NORTH_SOV_Tankerhelmet_open","H_NORTH_SOV_Tankerhelmet_dustgoggles","H_NORTH_SOV_Tankerhelmet_dustgoggles_open"]];
_crewLoadoutData set ["carbines", [
    ["NORTH_PPS43", "", "", "", ["NORTH_35rnd_pps43_mag"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_NORTH_SOV_Obr43_Uniform_AIR_Private","U_NORTH_SOV_Obr43_Uniform_AIR_Private_2"]];
_pilotLoadoutData set ["vests", ["V_NORTH_SOV_Belt_Late_Pistol","V_NORTH_SOV_Belt_Late_Pistol_3"]];
_pilotLoadoutData set ["helmets", ["H_NORTH_SOV_AIR_helmet","H_NORTH_SOV_AIR_helmet_goggles","H_NORTH_SOV_AIR_helmet_goggles_2"]];
_pilotLoadoutData set ["carbines", [
    ["NORTH_PPS43", "", "", "", ["NORTH_35rnd_pps43_mag"], [], ""]
]];	




/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;
    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
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
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
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

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

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
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
