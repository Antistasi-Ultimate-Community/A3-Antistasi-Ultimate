//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "IJA"] call _fnc_saveToTemplate;
["spawnMarkerName", "IJA Reinforcements"] call _fnc_saveToTemplate;

["flag", "fow_Flag_Japan01"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\EAW\ija_flag.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_ija"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "LIB_4Rnd_RPzB"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["fow_v_truppenfahrrad_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1_camo","LIB_Kfz1_Hood_camo"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["EAW_Type94_1937","EAW_Panzar1","EAW_Crossley"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["EAW_Dodge1936_Pickup_Military_IJA","fow_v_type97_truck_open_ija","fow_v_type97_truck_ija"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["EAW_Dodge1936_Pickup_Military_IJA"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["EAW_Dodge1936_Pickup_Military_Ammo_IJA"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["EAW_Dodge1936_Pickup_Military_Fuel_IJA","fow_v_type97_truck_utility_ija"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["fow_v_type97_truck_fuel_ija"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["EAW_Dodge1936_Pickup_Military_Medical_IJA"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["fow_v_sdkfz_250_camo_foliage_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["fow_v_sdkfz_251_camo_foliage_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["EAW_Vickers6Ton", "fow_ija_type95_HaGo_3_ija"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["EAW_Type89_1937", "EAW_ChiHa_1941J","EAW_ChiHa_Kai_1941J"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["fow_v_sdkfz_250_camo_foliage_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["EAW_Vickers6Ton", "fow_ija_type95_HaGo_3_ija"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["EAW_Daihatsu_LC"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", []] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["EAW_A4N", "EAW_Ki43_II"];
["vehiclesPlanesLargeCAS", ["EAW_G3M"]] call _fnc_saveToTemplate;
private _vehiclesPlanesAA = ["EAW_Ki27", "EAW_Ki43_II"];
private _vehiclesPlanesTransport = ["A3U_LIB_C47_German"];

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS append ["sab_fl_a6m"];
	_vehiclesPlanesAA append ["sab_fl_a6m"];
	_vehiclesPlanesTransport = ["sab_fl_ju52"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
    _vehiclesPlanesCAS append ["sab_sw_d3a"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["LIB_SdKfz124"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_SdKfz124", ["LIB_20x_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr38_HE"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["EAW_Crossley"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["EAW_Dodge1936_Pickup_Military_IJA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Kfz1_camo","LIB_Kfz1_Hood_camo"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["fow_v_sdkfz_250_camo_foliage_ger_heer","fow_v_sdkfz_251_camo_foliage_ger_heer"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["EAW_Crossley"]] call _fnc_saveToTemplate;

["staticMGs", ["fow_w_type92_tripod_high_ija"]] call _fnc_saveToTemplate;
["staticAT", ["EAW_Type1_47mm_J"]] call _fnc_saveToTemplate;
["staticAA", ["EAW_T98_20mm_AA_1941J"]] call _fnc_saveToTemplate;
["staticMortars", ["EAW_IJA_Type97_Mortar_1941J"]] call _fnc_saveToTemplate;
["staticHowitzers", ["EAW_IJA_Type91_Gun_1941J_Arty"]] call _fnc_saveToTemplate;

["vehicleRadar", "EAW_IJA_Type99_88_AA_1941J"] call _fnc_saveToTemplate;
["vehicleSam", "EAW_IJA_Type99_88_AA_1941J"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "EAW_Type91_105mm_Arty_Magazine"] call _fnc_saveToTemplate;

["mortarMagazineHE", "EAW_Type97_81mm_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "EAW_Type97_81mm_Flare"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["LIB_TMI_42_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_shumine_42_MINE"]] call _fnc_saveToTemplate;


#include "EAW_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["LIB_aleksei_IF","LIB_boyartsev_IF","LIB_bykov_IF","LIB_Otto_IF","LIB_Volker_IF","LIB_Walter_IF","LIB_Wolf_IF"]] call _fnc_saveToTemplate;


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
["fow_w_pzfaust_30", "", "", "",[""], [], ""], 
["fow_w_pzfaust_60", "", "", "",[""], [], ""],
["fow_w_pzfaust_100", "", "", "",[""], [], ""], 
["fow_w_pzfaust_30_klein", "", "", "",[""], [], ""]]];
_loadoutData set ["ATLaunchers", [
["LIB_RPzB", "", "", "",["LIB_1Rnd_RPzB"], [], ""]]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["LIB_TMI_42_MINE_mag"]];
_loadoutData set ["APMines", ["LIB_shumine_42_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiInfantryGrenades", ["EAW_Type91_Mag", "EAW_Type97_Mag"]];
_loadoutData set ["antiTankGrenades", ["EAW_Type3_Grenade_Mag"]];
_loadoutData set ["smokeGrenades", ["LIB_NB39"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["radios", ["TFAR_SCR536"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["fow_i_dienstglas"]];
_loadoutData set ["rangefinders", ["fow_i_dienstglas"]];

_loadoutData set ["traitorUniforms", ["EAW_Type90_Captain_Uniform"]];
_loadoutData set ["traitorVests", ["EAW_Type90_RifleKit_Type95"]];
_loadoutData set ["traitorHats", ["EAW_IJA_Cap_Wool"]];

_loadoutData set ["officerUniforms", ["EAW_Type90_Captain_Uniform"]];
_loadoutData set ["officerVests", ["EAW_Type90_RifleKit_Type95"]];
_loadoutData set ["officerHats", ["EAW_IJA_Officer_Cap_Wool"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", ["B_LIB_GER_Radio"]];
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
_loadoutData set ["items_grenadier_extras", ["EAW_Type97_Mag","EAW_Type97_Mag"]];
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
_sfLoadoutData set ["uniforms", ["EAW_SNLF_Uniform_Lead_1940","EAW_SNLF_Uniform_1c_1940","EAW_SNLF_Uniform_2c_1940"]];
_sfLoadoutData set ["vests", ["EAW_SNLF_RifleKit_1","EAW_SNLF_Type11Kit_Bearer","EAW_SNLF_Type11Kit"]];
_sfLoadoutData set ["glVests", ["EAW_SNLF_GrenadierKit"]];
_sfLoadoutData set ["Hvests", ["EAW_SNLF_LMGKit_1"]];
_sfLoadoutData set ["backpacks", ["EAW_Japanese_Backpack_Type5","EAW_Japanese_Backpack_Type5_Hide"]];
_sfLoadoutData set ["helmets", ["EAW_SNLF_Helmet_1","EAW_SNLF_Helmet_2"]];
_sfLoadoutData set ["sniHats", ["EAW_SNLF_Helmet_Covered"]];
_sfLoadoutData set ["slHat", ["EAW_SNLF_Cap_1"]];
_sfLoadoutData set ["binoculars", ["fow_i_dienstglas"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
	["EAW_Type99", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_Magazine"], [], ""]
	]];
		
_sfLoadoutData set ["carbines", [
	["EAW_MP28", "", "", "", ["EAW_MP28_20_Magazine"], [], ""]
	]];
		
_sfLoadoutData set ["grenadeLaunchers", [
	["EAW_MP28", "", "", "", ["EAW_MP28_20_Magazine"], [], ""]
	]];
	
_sfLoadoutData set ["SMGs", [
	["EAW_MP28", "", "", "", ["EAW_MP28_20_Magazine"], [], ""]
	]];
		
_sfLoadoutData set ["machineGuns", [
	["EAW_Type99", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_Magazine"], [], ""]
	]];
		
_sfLoadoutData set ["marksmanRifles", [
	["EAW_Type97_Sniper", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""]
	]];
		
_sfLoadoutData set ["sniperRifles", [	
	["EAW_Type97_Sniper", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""]
	]];
	
_sfLoadoutData set ["sidearms", [
	["EAW_Type14", "", "", "", ["EAW_Type14_Magazine"], [], ""]
    ]];
		
/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["EAW_Type90_Uniform","EAW_Type90_Corporal_Uniform","EAW_Type90_LCorporal_Uniform","EAW_Type90_SenPrivate_Uniform"]];
_eliteLoadoutData set ["slUniforms", ["EAW_Type90_Sergeant_Uniform","EAW_Type90_SergeantMajor_Uniform"]];
_eliteLoadoutData set ["vests", ["EAW_Type90_RifleKit","EAW_Type90_RifleKit_Alt","EAW_IJA_SMG_Kit"]];
_eliteLoadoutData set ["glVests", ["EAW_IJA_LMG_AmmoBearer_Kit"]];
_eliteLoadoutData set ["Hvests", ["EAW_IJA_LMG_Kit"]];
_eliteLoadoutData set ["backpacks", ["EAW_Japanese_Backpack_Type5","EAW_Japanese_Backpack_Type5_Hide"]];
_eliteLoadoutData set ["helmets", ["EAW_Type92", "EAW_Type92_Back","EAW_Type92_Loose","EAW_IJA_Cap_Wool","EAW_Type92_Cover"]];
_eliteLoadoutData set ["sniHats", ["EAW_Type92_Net","EAW_Type92_Cover_Net"]];
_eliteLoadoutData set ["slHat", ["EAW_IJA_Officer_Cap_Wool"]];
_eliteLoadoutData set ["binoculars", ["fow_i_dienstglas"]];

_eliteLoadoutData set ["rifles", [
	["EAW_Type30_Rifle", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type30_Rifle", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""]
	]];

_eliteLoadoutData set ["carbines", [
	["EAW_Type38_Carbine", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""]
	]];

_eliteLoadoutData set ["SMGs", [
	["fow_w_type100", "", "", "", ["fow_32Rnd_8x22"], [], ""],
	["EAW_MP28", "", "", "", ["EAW_MP28_20_Magazine"], [], ""]
	]];

_eliteLoadoutData set ["grenadeLaunchers", [
	["fow_w_type100", "", "", "", ["fow_32Rnd_8x22"], [], ""],
	["EAW_MP28", "", "", "", ["EAW_MP28_20_Magazine"], [], ""]
	]];

_eliteLoadoutData set ["machineGuns", [
	["EAW_Type99", "", "", "", ["EAW_Type99_Magazine"], [], ""],
	["EAW_Type99", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_Magazine"], [], ""]
	]];

_eliteLoadoutData set ["marksmanRifles", [
	["EAW_Type99_Long", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""]
	]];

_eliteLoadoutData set ["sniperRifles", [
	["EAW_Type97_Sniper", "", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type97_Sniper", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""]
	]];

_eliteLoadoutData set ["sidearms", [
	["EAW_Type14", "", "", "", ["EAW_Type14_Magazine"], [], ""]
	]];
		
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["EAW_Type90_Uniform","EAW_Type90_Corporal_Uniform","EAW_Type90_LCorporal_Uniform","EAW_Type90_SenPrivate_Uniform"]];
_militaryLoadoutData set ["slUniforms", ["EAW_Type90_Sergeant_Uniform","EAW_Type90_SergeantMajor_Uniform"]];
_militaryLoadoutData set ["vests", ["EAW_Type90_RifleKit","EAW_Type90_RifleKit_Alt","EAW_IJA_SMG_Kit"]];
_militaryLoadoutData set ["glVests", ["EAW_IJA_LMG_AmmoBearer_Kit"]];
_militaryLoadoutData set ["Hvests", ["EAW_IJA_LMG_Kit"]];
_militaryLoadoutData set ["backpacks", ["EAW_Japanese_Backpack_Type5","EAW_Japanese_Backpack_Type5_Hide"]];
_militaryLoadoutData set ["helmets", ["EAW_Type92", "EAW_Type92_Back","EAW_Type92_Loose","EAW_IJA_Cap_Wool","EAW_Type92_Cover"]];
_militaryLoadoutData set ["sniHats", ["EAW_Type92_Net","EAW_Type92_Cover_Net"]];
_militaryLoadoutData set ["slHat", ["EAW_IJA_Officer_Cap_Wool"]];
_militaryLoadoutData set ["binoculars", ["fow_i_dienstglas"]];

_militaryLoadoutData set ["rifles", [
	["EAW_Type30_Rifle", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type30_Rifle", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""]
	]];

_militaryLoadoutData set ["carbines", [
	["EAW_Type38_Carbine", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""]
	]];

_militaryLoadoutData set ["SMGs", [
	["EAW_C96_Auto_Carbine", "", "", "", ["EAW_C96_Auto20_Magazine"], [], ""],
	["fow_w_type100", "", "", "", ["fow_32Rnd_8x22"], [], ""]
	]];

_militaryLoadoutData set ["grenadeLaunchers", [
	["EAW_C96_Carbine", "", "", "", ["EAW_C96_Magazine"], [], ""],
	["EAW_C96_Auto_Carbine", "", "", "", ["EAW_C96_Auto20_Magazine"], [], ""]
	]];

_militaryLoadoutData set ["machineGuns", [
	["EAW_Type96", "", "", "", ["EAW_Type96_Magazine"], [], ""],
	["EAW_Type96", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type96_Magazine"], [], ""],
	["EAW_Type99", "", "", "", ["EAW_Type99_Magazine"], [], ""],
	["EAW_Type99", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_Magazine"], [], ""]
	]];

_militaryLoadoutData set ["marksmanRifles", [
	["EAW_Type30_Rifle", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type30_Rifle", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""]
	]];

_militaryLoadoutData set ["sniperRifles", [
	["EAW_Type97_Sniper", "", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type97_Sniper", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""]
	]];

_militaryLoadoutData set ["sidearms", [
	["EAW_Type14", "", "", "", ["EAW_Type14_Magazine"], [], ""]
	]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["EAW_Type98_Uniform_Jyuban","EAW_Type98_Uniform_Jyuban_Rolled"]];
_policeLoadoutData set ["vests", ["EAW_Jyuban_RifleKit","EAW_Jyuban_Type11Kit","EAW_Jyuban_LMG_BearerKit","EAW_Jyuban_LMGKit"]];
_policeLoadoutData set ["helmets", ["EAW_IJA_Cap_Wool","EAW_IJA_Cap_Wool","EAW_IJA_Cap_Wool","EAW_Type92", "EAW_Type92_Back","EAW_Type92_Loose"]];
_policeLoadoutData set ["SMGs", [
	["EAW_Type38_Carbine", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "", "", "", ["EAW_Type38_Magazine"], [], ""]
	]];
_policeLoadoutData set ["sidearms", [
	["EAW_Type14", "", "", "", ["EAW_Type14_Magazine"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["EAW_Type90_Uniform","EAW_Type90_Corporal_Uniform","EAW_Type90_LCorporal_Uniform"]];
_militiaLoadoutData set ["vests", ["EAW_Type90_RifleKit","EAW_Type90_RifleKit_Alt","EAW_IJA_SMG_Kit"]];
_militiaLoadoutData set ["backpacks", ["EAW_IJA_LMG_AmmoBearer_Bag","EAW_Japanese_Backpack_Type5","EAW_Japanese_Backpack_Type5_Hide"]];
_militiaLoadoutData set ["helmets", ["EAW_Type92", "EAW_Type92_Back","EAW_Type92_Loose","EAW_IJA_Cap_Wool"]];
_militiaLoadoutData set ["sniHats", ["EAW_Type92_Net"]];
_militiaLoadoutData set ["slHat", ["EAW_IJA_Officer_Cap_Wool"]];

_militiaLoadoutData set ["rifles", [
	["EAW_Type30_Rifle", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type30_Rifle", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Short_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""]
	]];
		
_militiaLoadoutData set ["carbines", [
	["EAW_Type38_Carbine", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type38_Carbine_NoCover", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""]
	]]; 

_militiaLoadoutData set ["grenadeLaunchers", [
	["EAW_C96_Carbine", "", "", "", ["EAW_C96_Magazine"], [], ""],
	["EAW_C96_Auto_Carbine", "", "", "", ["EAW_C96_Auto20_Magazine"], [], ""]
	]];
		
_militiaLoadoutData set ["SMGs", [
	["EAW_C96_Carbine", "", "", "", ["EAW_C96_Magazine"], [], ""],
	["EAW_C96_Auto_Carbine", "", "", "", ["EAW_C96_Auto20_Magazine"], [], ""]
	]];

_militiaLoadoutData set ["shotguns", [
	["EAW_C96_Carbine", "", "", "", ["EAW_C96_Magazine"], [], ""]
	]];

_militiaLoadoutData set ["machineGuns", [
	["EAW_Type11_Base", "", "", "", ["EAW_Type11_Magazine"], [], ""],
	["EAW_Type11_Base", "", "", "", ["EAW_Type11_Magazine"], [], ""],
    ["EAW_Type96", "", "", "", ["EAW_Type96_Magazine"], [], ""],
	["EAW_Type96", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type96_Magazine"], [], ""]
	]];

_militiaLoadoutData set ["marksmanRifles", [
	["EAW_Type30_Rifle", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type30_Rifle", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""],
	["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type99_clip"], [], ""]
	]];

_militiaLoadoutData set ["sniperRifles", [
	["EAW_Type97_Sniper", "", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "", "", "EAW_Type97_Sniper_Scope", ["EAW_Type38_Magazine"], [], ""],
	["EAW_Type97_Sniper", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type97_Sniper_Stock2", "EAW_Type30_Bayonet_Attach", "", "", ["EAW_Type38_Magazine"], [], ""]
	]];

_militiaLoadoutData set ["sidearms", [
	["EAW_Type14", "", "", "", ["EAW_Type14_Magazine"], [], ""]
	]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["EAW_Type90_Uniform"]];
_crewLoadoutData set ["vests", ["EAW_Type90_RifleKit"]];
_crewLoadoutData set ["helmets", ["EAW_Type92","EAW_IJA_Cap_Wool"]];
_crewLoadoutData set ["carbines", [
    ["EAW_Type38_Carbine", "", "", "", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type38_Carbine_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["fow_u_ija_pilot"]];
_pilotLoadoutData set ["vests", ["fow_v_heer_p38"]];
_pilotLoadoutData set ["helmets", ["fow_h_ija_flight_helmet"]];
_pilotLoadoutData set ["carbines", [
    ["EAW_Type38_Carbine", "", "", "", ["EAW_Type38_Magazine"], [], ""],
    ["EAW_Type38_Carbine_Stock2", "", "", "", ["EAW_Type38_Magazine"], [], ""]
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
