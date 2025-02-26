//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Wehrmacht"] call _fnc_saveToTemplate;
["spawnMarkerName", "WEH support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "ww2\spe_core_t\decals_t\german\flag_ger_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "SPE_Faction_WEHRMACHT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Weaponcrate_MP40_GER"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SPE_ST_R200_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SPE_GER_R200_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SPE_GER_R200_MG34", "SPE_ST_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SPE_ST_OpelBlitz_Open", "SPE_ST_OpelBlitz"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SPE_ST_OpelBlitz_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SPE_ST_OpelBlitz_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SPE_ST_OpelBlitz_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SPE_ST_OpelBlitz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SPE_ST_OpelBlitz_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["SPE_SdKfz250_1"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SPE_PzKpfwIII_J","SPE_PzKpfwIII_N", "SPE_PzKpfwIII_M", "SPE_PzKpfwIII_L"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["SPE_PzKpfwIII_N", "SPE_PzKpfwIII_M", "SPE_PzKpfwIII_L", "SPE_StuG_III_G_Early", "SPE_StuG_III_G_Late", "SPE_StuG_III_G_SKB", "SPE_StuH_42"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SPE_PzKpfwVI_H1", "SPE_PzKpfwV_G", "SPE_PzKpfwIV_G", "SPE_Jagdpanther_G1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SPE_ST_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["SPE_SdKfz250_1"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["SPE_PzKpfwIII_J","SPE_PzKpfwIII_N", "SPE_PzKpfwIII_M", "SPE_PzKpfwIII_L"]] call _fnc_saveToTemplate;

private _vehiclesTransportBoats = ["I_G_Boat_Transport_01_F"];
private _vehiclesGunBoats = ["I_G_Boat_Transport_01_F"];
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_c_Vehicles_Boats_c")) then {
    _vehiclesTransportBoats = ["SPEX_LCVP"];
	_vehiclesGunBoats = ["SPEX_LCVP"];
};
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SPE_FW190F8"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SPE_FW190F8"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["JK_B_C47_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SPE_leFH18"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SPE_leFH18", ["SPE_20x_Shell_105L28_Gr38_HE"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SPE_ST_R200_MG34"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPE_OpelBlitz"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPE_ST_R200_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SPE_SdKfz250_1"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_ST_GER_R200_Hood"]] call _fnc_saveToTemplate;

["staticMGs", ["SPE_MG42_Lafette_trench_Deployed", "SPE_MG34_Lafette_Trench_Deployed"]] call _fnc_saveToTemplate;
["staticAT", ["SPE_leFH18_AT", "SPE_Pak40"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FlaK_30", "SPE_FlaK_38"]] call _fnc_saveToTemplate;
["staticMortars", ["SPE_GrW278_1"]] call _fnc_saveToTemplate;
["staticHowitzers", ["SPE_leFH18"]] call _fnc_saveToTemplate;

["vehicleRadar", "SPE_FlaK_36_AA"] call _fnc_saveToTemplate;
["vehicleSam", "SPE_FlaK_36_AA"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "SPE_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;
["mortarMagazineHE", "SPE_8Rnd_81mm_FA_Mle_1932_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8Rnd_81mm_FA_Mle_1932_Smoke"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_TMI_42_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_SMI_35_Pressure_MINE", "SPE_SMI_35_MINE"]] call _fnc_saveToTemplate;


//#include "IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","SPE_boyartsev","SPE_bykov","SPE_Connors","SPE_DAgostino","SPE_Davidson","SPE_Elliot","SPE_Grishka","SPE_Hauptmann","SPE_Klimakov","SPE_Krueger","SPE_Kuzmin","SPE_Neumann","SPE_Oberst","SPE_OBrien","SPE_Vasiliev","SPE_Walter","SPE_Wolf","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["SPE_Male01GER", "SPE_Male02GER"]] call _fnc_saveToTemplate;


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
"SPE_PzFaust_60m", "SPE_PzFaust_30m", "SPE_Faustpatrone"
]];
_loadoutData set ["ATLaunchers", [
["SPE_RPzB_43", "", "", "",["SPE_1Rnd_RPzBGr_4322"], [], ""],
["SPE_RPzB_54", "", "", "",["SPE_1Rnd_RPzBGr_4322"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["SPE_TMI_42_MINE_mag"]];
_loadoutData set ["APMines", ["SPE_SMI_35_Pressure_MINE_mag"]];
_loadoutData set ["lightExplosives", ["SPE_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiInfantryGrenades", ["SPE_Shg24", "SPE_M39"]];
_loadoutData set ["antiTankGrenades", ["SPE_Shg24x7"]];
_loadoutData set ["smokeGrenades", ["SPE_NB39"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_GER_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_GER_ItemCompass_deg", "SPE_GER_ItemCompass"]];
_loadoutData set ["radios", ["TFAR_SCR536"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["SPE_Binocular_GER"]];
_loadoutData set ["rangefinders", ["SPE_Binocular_GER"]];

_loadoutData set ["traitorUniforms", ["U_SPE_ST_Soldier_E44_Camo"]];
_loadoutData set ["traitorVests", ["V_SPE_GER_VestKar98"]];
_loadoutData set ["traitorHats", ["H_SPE_ST_Helmet"]];

_loadoutData set ["officerUniforms", ["U_SPE_ST_Soldier_Camo"]];
_loadoutData set ["officerVests", ["V_SPE_GER_FieldOfficer"]];
_loadoutData set ["officerHats", ["H_SPE_GER_OfficerCap"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", ["B_SPE_GER_Radio", "B_SPE_GER_Radio_battery"]];
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
_sfLoadoutData set ["uniforms", ["U_SPE_FSJ_mk2","U_SPE_FSJ_mk2_gloves","U_SPE_FSJ_mk2_pads","U_SPE_FSJ_mk2_roll","U_SPE_FSJ_mk2_gefr","U_SPE_FSJ_mk2_gloves_pads","U_SPE_FSJ_mk2_pads_roll"]];
_sfLoadoutData set ["vests", ["V_SPE_GER_FSJ_VestKar98_Bandoleer","V_SPE_GER_FSJ_VestFG42_Bandoleer","V_SPE_GER_FSJ_G43","V_SPE_GER_FSJ_MG","V_SPE_GER_FSJ_VestKar98","V_SPE_GER_FSJ_SMG","V_SPE_GER_FSJ_STG","V_SPE_GER_FSJ_Sani2"]];
_sfLoadoutData set ["glVests", ["V_SPE_GER_FSJ_VestFG42_Bandoleer"]];
_sfLoadoutData set ["Hvests", ["V_SPE_GER_FSJ_NCO"]];
_sfLoadoutData set ["backpacks", ["B_SPE_GER_FSJ_Belt_bag_zelt","B_SPE_GER_FSJ_ammo_Belt_bag","B_SPE_GER_FSJ_ammo_Belt_bag_zelt","B_SPE_GER_FSJ_Belt_bag","B_SPE_GER_FSJ_Pzf_Belt_bag","B_SPE_GER_FSJ_Pzf_Belt_bag_zelt","B_SPE_GER_FSJ_RPzB_Belt_bag","B_SPE_GER_FSJ_RPzB_Belt_bag_zelt","B_SPE_GER_FSJ_ammo_Belt_bag_camo","B_SPE_GER_FSJ_ammo_Belt_bag_zelt_camo"]];
_sfLoadoutData set ["helmets", ["H_SPE_GER_FSJ_M38_Helmet","H_SPE_GER_FSJ_M38_Helmet_Net","H_SPE_GER_FSJ_M38_Helmet_BB","H_SPE_GER_FSJ_M38_Helmet_Wire","H_SPE_GER_FSJ_M38_Helmet_camo1","H_SPE_GER_FSJ_M38_Helmet_camo2","H_SPE_GER_FSJ_M38_Helmet_camo3","H_SPE_GER_FSJ_M38_Helmet_camo4","H_SPE_GER_FSJ_M38_Helmet_camo5","H_SPE_GER_FSJ_M38_Helmet_camo"]];
_sfLoadoutData set ["sniHats", ["H_SPE_GER_FSJ_M38_Helmet_camo1","H_SPE_GER_FSJ_M38_Helmet_camo2","H_SPE_GER_FSJ_M38_Helmet_camo3","H_SPE_GER_FSJ_M38_Helmet_camo4","H_SPE_GER_FSJ_M38_Helmet_camo5","H_SPE_GER_FSJ_M38_Helmet_camo"]];
_sfLoadoutData set ["slHat", ["H_SPE_GER_FSJ_M38_Helmet_camo1","H_SPE_GER_FSJ_M38_Helmet_camo2","H_SPE_GER_FSJ_M38_Helmet_camo3","H_SPE_GER_FSJ_M38_Helmet_camo4","H_SPE_GER_FSJ_M38_Helmet_camo5","H_SPE_GER_FSJ_M38_Helmet_camo"]];
_sfLoadoutData set ["binoculars", ["SPE_Binocular_GER"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""],
    ["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];
		
_sfLoadoutData set ["carbines", [
	["SPE_FG42_E", "", "", "", ["SPE_20Rnd_792x57"], [], ""]
	]];
		
_sfLoadoutData set ["grenadeLaunchers", [
	["SPE_K98", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""],
    ["SPE_K98_Late", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""]
	]];
	
_sfLoadoutData set ["SMGs", [
	["SPE_FG42_E", "", "", "", ["SPE_20Rnd_792x57"], [], ""],
    ["SPE_MP40", "", "", "", ["LIB_32Rnd_9x19","LIB_32Rnd_9x19","LIB_32rnd_9x19_t"], [], ""]
	]];
		
_sfLoadoutData set ["machineGuns", [
	["SPE_MG34", "", "", "", ["SPE_100Rnd_792x57"], [], ""],
    ["SPE_MG42", "", "", "", ["SPE_100Rnd_792x57"], [], ""]
	]];
		
_sfLoadoutData set ["marksmanRifles", [
	["SPE_FG42_E", "", "", "SPE_Optic_ZFG42", ["SPE_20Rnd_792x57_SMK"], [], ""]
	]];
		
_sfLoadoutData set ["sniperRifles", [	
	["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_FG42_E", "", "", "SPE_Optic_ZFG42", ["SPE_20Rnd_792x57_SMK"], [], ""]
	]];
	
_sfLoadoutData set ["sidearms", [
	["SPE_P08", "", "", "", ["SPE_8Rnd_9x19_P08"], [], ""]
	]];
		
/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["U_SPE_ST_Soldier_E44","U_SPE_ST_Soldier_E44_Boots","U_SPE_ST_Soldier_E44_Boots_rolled","U_SPE_ST_Soldier_E44_Unbloused"]];
_eliteLoadoutData set ["slUniforms", ["U_SPE_ST_Soldier_E44"]];
_eliteLoadoutData set ["vests", ["V_SPE_DAK_VestKar98","V_SPE_DAK_VestG43","V_SPE_DAK_VestSTG","V_SPE_DAK_VestMP40"]];
_eliteLoadoutData set ["glVests", ["V_SPE_DAK_SaniVest2"]];
_eliteLoadoutData set ["Hvests", ["V_SPE_DAK_VestUnterofficer"]];
_eliteLoadoutData set ["backpacks", ["B_SPE_GER_A_frame_ST","B_SPE_GER_A_frame_ST_Full","B_SPE_GER_Belt_bag_ST_zelt","B_SPE_ST_ammo_Belt_bag_zelt","B_SPE_GER_erla_bag_ST_zelt","B_SPE_ST_Pzf_Belt_bag_zelt","B_SPE_ST_RPzB_Belt_bag_zelt","B_SPE_GER_Belt_bag_ST_zelt_camo","B_SPE_ST_ammo_Belt_bag_zelt_camo","B_SPE_GER_Tonister41_Frame_ST","B_SPE_GER_Tonister41_Frame_Full_ST"]];
_eliteLoadoutData set ["helmets", ["H_SPE_ST_Helmet2","H_SPE_ST_Helmet2_OS","H_SPE_ST_Helmet6_OS","H_SPE_ST_Helmet4","H_SPE_ST_Helmet4_OS"]];
_eliteLoadoutData set ["sniHats", ["H_SPE_GER_Fieldcap2"]];
_eliteLoadoutData set ["slHat", ["H_SPE_ST_Helmet2","H_SPE_ST_Helmet2_OS","H_SPE_ST_Helmet6_OS","H_SPE_ST_Helmet4","H_SPE_ST_Helmet4_OS"]];
_eliteLoadoutData set ["binoculars", ["SPE_Binocular_GER"]];

_eliteLoadoutData set ["rifles", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""],
    ["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];

_eliteLoadoutData set ["carbines", [
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];

_eliteLoadoutData set ["SMGs", [
	["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];

_eliteLoadoutData set ["grenadeLaunchers", [
	["SPE_K98", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""],
    ["SPE_K98_Late", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""]
	]];

_eliteLoadoutData set ["machineGuns", [
	["SPE_MG34", "", "", "", ["SPE_100Rnd_792x57"], [], ""],
    ["SPE_MG42", "", "", "", ["SPE_100Rnd_792x57"], [], ""]
	]];

_eliteLoadoutData set ["marksmanRifles", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""]
	]];

_eliteLoadoutData set ["sniperRifles", [
	["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_eliteLoadoutData set ["sidearms", [
	["SPE_P08", "", "", "", ["SPE_8Rnd_9x19_P08"], [], ""]
	]];		
		
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_SPE_GER_Soldier_Boots","U_SPE_GER_Soldier_Boots_open","U_SPE_GER_Soldier_Boots_Rolled","U_SPE_GER_Soldier_Unbloused","U_SPE_GER_Gefreiter"]];
_militaryLoadoutData set ["slUniforms", ["U_SPE_GER_Unterofficer"]];
_militaryLoadoutData set ["vests", ["V_SPE_GER_VestKar98","V_SPE_GER_VestMP40","V_SPE_GER_VestG43","V_SPE_GER_SaniVest2"]];
_militaryLoadoutData set ["glVests", ["V_SPE_GER_VestSTG"]];
_militaryLoadoutData set ["Hvests", ["V_SPE_GER_VestUnterofficer"]];
_militaryLoadoutData set ["backpacks", ["B_SPE_GER_Tonister34_canvas","B_SPE_GER_Tonister41_Frame","B_SPE_GER_Tonister41_Frame_Full","B_SPE_GER_RPzB_Belt_bag_zelt","B_SPE_GER_RPzB_Belt_bag","B_SPE_GER_Pzf_Belt_bag_zelt","B_SPE_GER_Pzf_Belt_bag","B_SPE_GER_ammo_Belt_bag_zelt","B_SPE_GER_ammo_Belt_bag_alt","B_SPE_GER_ammo_Belt_bag","B_SPE_GER_A_frame_MGCan","B_SPE_GER_A_frame_MGCan_zelt"]];
_militaryLoadoutData set ["helmets", ["H_SPE_GER_Helmet","H_SPE_GER_Helmet","H_SPE_GER_Helmet","H_SPE_GER_Helmet_Glasses","H_SPE_GER_Helmet_net","H_SPE_GER_Helmet_ns","H_SPE_GER_Helmet_os","H_SPE_GER_Helmet_ns_wire"]];
_militaryLoadoutData set ["sniHats", ["H_SPE_GER_Cap"]];
_militaryLoadoutData set ["slHat", ["H_SPE_GER_Cap_Offz"]];
_militaryLoadoutData set ["binoculars", ["SPE_Binocular_GER"]];

_militaryLoadoutData set ["rifles", [
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
    ["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_militaryLoadoutData set ["carbines", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""],
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""],
	["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];

_militaryLoadoutData set ["SMGs", [
	["SPE_MP35", "", "", "", ["SPE_32Rnd_MP35_9x19", "SPE_32rnd_MP35_9x19_t"], [], ""],
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];

_militaryLoadoutData set ["grenadeLaunchers", [
	["SPE_K98", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""],
    ["SPE_K98_Late", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""]
	]];

_militaryLoadoutData set ["machineGuns", [
	["SPE_MG34", "", "", "", ["SPE_50Rnd_792x57","SPE_100Rnd_792x57"], [], ""],
    ["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57","SPE_100Rnd_792x57"], [], ""]
	]];

_militaryLoadoutData set ["marksmanRifles", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""]
	]];

_militaryLoadoutData set ["sniperRifles", [
	["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_militaryLoadoutData set ["sidearms", [
	["SPE_P08", "", "", "", ["SPE_8Rnd_9x19_P08"], [], ""]
	]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_SPE_LW_base"]];
_policeLoadoutData set ["vests", ["V_SPE_GER_FSJ_FWO"]];
_policeLoadoutData set ["helmets", ["H_SPE_GER_M40_LW","H_SPE_GER_Helmet_M35_LW","H_SPE_GER_Helmet_M35_LW_ns"]];
_policeLoadoutData set ["SMGs", [
	["SPE_MP35", "", "", "", ["SPE_24Rnd_MP35_9x19", "SPE_24rnd_MP35_9x19_t"], [], ""],
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19"], [], ""]
	]];
_policeLoadoutData set ["sidearms", [
	["SPE_P08", "", "", "", ["SPE_8Rnd_9x19_P08"], [], ""]
	]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_SPE_OST_base","U_SPE_OST_gefreiter","U_SPE_OST_op","U_SPE_OST_roll","U_SPE_OST_uffz"]];
_militiaLoadoutData set ["vests", ["V_SPE_erla_VestKar98","V_SPE_erla_VestMP40","V_SPE_erla_SaniVest2","V_SPE_erla_VestG43","V_SPE_erla_VestMG"]];
_militiaLoadoutData set ["backpacks", ["B_SPE_GER_Belt_bag_zelt","B_SPE_GER_Belt_bag","B_SPE_GER_erla_bag","B_SPE_GER_A_frame","B_SPE_GER_A_frame_sturm_licht","B_SPE_GER_A_frame_kit","B_SPE_GER_A_frame_sturm"]];
_militiaLoadoutData set ["helmets", ["H_SPE_GER_Helmet_M40", "H_SPE_GER_Helmet_M40_ns"]];
_militiaLoadoutData set ["sniHats", ["H_SPE_GER_M38"]];
_militiaLoadoutData set ["slHat", ["H_SPE_GER_OfficerCap"]];

_militiaLoadoutData set ["rifles", [
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
    ["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];
		
_militiaLoadoutData set ["carbines", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""],
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]]; 

_militiaLoadoutData set ["grenadeLaunchers", [
	["SPE_K98", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""],
    ["SPE_K98_Late", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""]
	]];
		
_militiaLoadoutData set ["SMGs", [
	["SPE_MP35", "", "", "", ["SPE_24Rnd_MP35_9x19", "SPE_24rnd_MP35_9x19_t"], [], ""],
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""]
	]];

_militiaLoadoutData set ["shotguns", [
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_militiaLoadoutData set ["machineGuns", [
	["SPE_MG34", "", "", "", ["SPE_50Rnd_792x57"], [], ""],
    ["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57"], [], ""]
	]];

_militiaLoadoutData set ["marksmanRifles", [
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
    ["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_militiaLoadoutData set ["sniperRifles", [
	["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_militiaLoadoutData set ["sidearms", [
	["SPE_P08", "", "", "", ["SPE_8Rnd_9x19_P08"], [], ""]
	]];
	
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["U_SPE_GER_Tank_crew_private","U_SPE_GER_Tank_crew_leutnant","U_SPE_GER_Tank_crew_unterofficer"]];
_crewLoadoutData set ["vests", ["V_SPE_GER_TankPrivateBelt"]];
_crewLoadoutData set ["helmets", ["H_SPE_GER_TankPrivateCap3","H_SPE_GER_TankPrivateCap","H_SPE_GER_TankPrivateCap2"]];
_crewLoadoutData set ["carbines", [
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPE_GER_LW_pilot","U_SPE_GER_LW_pilot_alt"]];
_pilotLoadoutData set ["vests", ["V_SPE_GER_PistolBelt"]];
_pilotLoadoutData set ["helmets", ["H_SPE_GER_LW_S_PilotHelmet", "H_SPE_GER_LW_PilotHelmet"]];
_pilotLoadoutData set ["carbines", [
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""]
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
