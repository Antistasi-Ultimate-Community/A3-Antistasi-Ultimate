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

["vehiclesBasic", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Willys_MB","LIB_Willys_MB_Hood"]] call _fnc_saveToTemplate;
private _vehiclesLightArmed = ["LIB_Scout_M3"]; 
["vehiclesTrucks", ["LIB_US6_Tent","LIB_US6_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US6_Open_Cargo","LIB_US6_Tent_Cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US6_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_Zis6_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_Zis5v_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_Med"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["LIB_Scout_M3_FFV","LIB_Scout_M3"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_Scout_M3_FFV","LIB_SOV_M3_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["LIB_SU85", "LIB_T34_76"]] call _fnc_saveToTemplate;
private _vehiclesTanks = ["LIB_T34_85","LIB_T34_85","LIB_T34_85","LIB_JS2_43"];
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["LIB_Scout_M3_FFV"]] call _fnc_saveToTemplate;
private _vehiclesLightTanks = ["LIB_T34_76"]; 

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesLightArmed append ["FA_BA64","FA_BA10M"]; 
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesLightTanks append ["FA_T26","FA_T26"];
	_vehiclesTanks append ["FA_KV1"];
};
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate;

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

["staticMGs", ["LIB_MG34_Lafette_Deployed","LIB_MG42_Lafette_Deployed"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Zis3"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_BM37"]] call _fnc_saveToTemplate;
["staticHowitzers", ["LIB_leFH18"]] call _fnc_saveToTemplate;

["vehicleRadar", "LIB_FlaK_36_AA"] call _fnc_saveToTemplate;
["vehicleSam", "LIB_FlaK_36_AA"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "LIB_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_82mmHE_BM37"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_82mm_BM37_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["LIB_TM44_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_PMD6_MINE"]] call _fnc_saveToTemplate;

#include "IFA_Vehicle_Attributes.sqf"

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
_loadoutData set ["radios", ["TFAR_SCR536"]];
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
private _slItems = [];
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
_sfLoadoutData set ["uniforms", ["U_LIB_SOV_Razvedchik_am"]];
_sfLoadoutData set ["vests", ["V_LIB_SOV_IShBrVestPPShMag","V_LIB_SOV_IShBrVestPPShDisc","V_LIB_SOV_IShBrVestMG"]];
_sfLoadoutData set ["glVests", ["V_LIB_SOV_IShBrVestPPShDisc"]];
_sfLoadoutData set ["Hvests", ["V_LIB_SOV_IShBrVestPPShMag"]];
_sfLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack2_Gas_Kit_Shinel_Green"]];
_sfLoadoutData set ["helmets", ["H_LIB_SOV_RA_Helmet"]];
_sfLoadoutData set ["sniHats", ["H_LIB_SOV_RA_Helmet"]];
_sfLoadoutData set ["slHat", ["H_LIB_SOV_RA_Helmet"]];
_sfLoadoutData set ["binoculars", ["LIB_Binocular_SU"]];

//SF Weapons
_sfLoadoutData set ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_b30","LIB_5Rnd_762x54_D"], [], ""],
        ["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_sfLoadoutData set ["carbines", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""]]];
_sfLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_sfLoadoutData set ["SMGs", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25_ap"], [], ""],
        ["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""]]];
_sfLoadoutData set ["machineGuns", [["LIB_DT_OPTIC", "", "", "", ["LIB_63Rnd_762x54d"], [], ""],
        ["LIB_DT", "", "", "", ["LIB_63Rnd_762x54"], [], ""],
	["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54_b30"], [], ""]]];
_sfLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok_summer"]];
_eliteLoadoutData set ["slUniforms", ["U_LIB_SOV_Kapitan_summer"]];
_eliteLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_eliteLoadoutData set ["glVests", ["V_LIB_SOV_RA_SVTBelt"]];
_eliteLoadoutData set ["Hvests", ["V_LIB_SOV_RA_OfficerVest"]];
_eliteLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack_Green"]];
_eliteLoadoutData set ["helmets", ["H_LIB_SOV_RA_PrivateCap","H_LIB_SOV_RA_Helmet"]];
_eliteLoadoutData set ["sniHats", ["H_LIB_SOV_RA_PrivateCap","H_LIB_SOV_RA_Helmet"]];
_eliteLoadoutData set ["slHat", ["H_LIB_SOV_RA_Helmet"]];
_eliteLoadoutData set ["binoculars", ["LIB_Binocular_SU"]];

_eliteLoadoutData set ["rifles", [
	["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
    ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""]
	]];
_eliteLoadoutData set ["carbines", [
	["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""]
	]];
_eliteLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_eliteLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""],
        ["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25_t2"], [], ""]]];
_eliteLoadoutData set ["machineGuns", [["LIB_DT", "", "", "", ["LIB_63Rnd_762x54"], [], ""],
        ["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_eliteLoadoutData set ["marksmanRifles", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_eliteLoadoutData set ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54_b30","LIB_5Rnd_762x54","LIB_5Rnd_762x54"], [], ""]]];
_eliteLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok_summer"]];
_militaryLoadoutData set ["slUniforms", ["U_LIB_SOV_Kapitan_summer"]];
_militaryLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_militaryLoadoutData set ["glVests", ["V_LIB_SOV_RA_SVTBelt"]];
_militaryLoadoutData set ["Hvests", ["V_LIB_SOV_RA_OfficerVest"]];
_militaryLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack_Green"]];
_militaryLoadoutData set ["helmets", ["H_LIB_SOV_RA_PrivateCap","H_LIB_SOV_RA_Helmet"]];
_militaryLoadoutData set ["sniHats", ["H_LIB_SOV_RA_PrivateCap","H_LIB_SOV_RA_Helmet"]];
_militaryLoadoutData set ["slHat", ["H_LIB_SOV_RA_Helmet"]];
_militaryLoadoutData set ["binoculars", ["LIB_Binocular_SU"]];

_militaryLoadoutData set ["rifles", [
	["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
    ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""]
	]];
_militaryLoadoutData set ["carbines", [
	["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54_D"], [], ""]
	]];
_militaryLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_militaryLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""],
        ["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25_t2"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["LIB_DT", "", "", "", ["LIB_63Rnd_762x54"], [], ""],
        ["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""],
        ["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54_b30","LIB_5Rnd_762x54","LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_LIB_NKVD_Leutenant"]];
_policeLoadoutData set ["vests", ["V_LIB_SOV_RA_OfficerVest"]];
_policeLoadoutData set ["helmets", ["H_LIB_NKVD_OfficerCap"]];
_policeLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25"], [], ""]]];
_policeLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""],
        ["LIB_M1896", "", "", "", ["LIB_10Rnd_9x19_M1896"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_LIB_SOV_Strelok_summer"]];
_militiaLoadoutData set ["slUniforms", ["U_LIB_SOV_Sergeant"]];
_militiaLoadoutData set ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_militiaLoadoutData set ["glVests", ["V_LIB_SOV_RA_SVTBelt"]];
_militiaLoadoutData set ["Hvests", ["V_LIB_SOV_RA_OfficerVest"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_SOV_RA_Rucksack_Green"]];
_militiaLoadoutData set ["helmets", ["H_LIB_SOV_RA_PrivateCap"]];
_militiaLoadoutData set ["sniHats", ["H_LIB_SOV_RA_PrivateCap"]];
_militiaLoadoutData set ["slHat", ["H_LIB_SOV_RA_PrivateCap"]];

_militiaLoadoutData set ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""],
        ["LIB_M38", "", "", "", ["LIB_5Rnd_762x54"], [], ""],
	["LIB_M44", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["carbines", [["LIB_M38", "", "", "", ["LIB_5Rnd_762x54"], [], ""],
        ["LIB_M44", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["LIB_M9130_DYAKONOV", "LIB_ACC_GL_DYAKONOV_Empty", "", "", ["LIB_5Rnd_762x54"], ["LIB_1Rnd_G_DYAKONOV"], ""]]];
_militiaLoadoutData set ["SMGs", [["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""],
        ["LIB_MP40", "", "", "", ["LIB_32rnd_9x19"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_t30"], [], ""],
        ["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["sniperRifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54_t46"], [], ""],
        ["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""],
        ["LIB_M1896", "", "", "", ["LIB_10Rnd_9x19_M1896"], [], ""]]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["U_LIB_SOV_Tank_ryadovoi"]];
_crewLoadoutData set ["vests", ["V_LIB_SOV_RAZV_MGBelt"]];
_crewLoadoutData set ["helmets", ["H_LIB_SOV_TankHelmet"]];
_crewLoadoutData set ["carbines", [
    ["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_SOV_Pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_SOV_RA_Belt"]];
_pilotLoadoutData set ["helmets", ["H_LIB_SOV_PilotHelmet"]];
_pilotLoadoutData set ["carbines", [
    ["LIB_PPSh41_m", "", "", "", ["LIB_35Rnd_762x25_t"], [], ""]
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
