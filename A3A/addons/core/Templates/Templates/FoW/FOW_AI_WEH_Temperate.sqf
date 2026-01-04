//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Wehrmacht"] call _fnc_saveToTemplate;
["spawnMarkerName", "Wehrmacht Reinforcements"] call _fnc_saveToTemplate;

["flag", "LIB_FlagCarrier_GER"] call _fnc_saveToTemplate;
["flagTexture", "ww2\core_t\if_decals_t\german\flag_ger_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "LIB_faction_WEHRMACHT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "LIB_4Rnd_RPzB"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["fow_v_truppenfahrrad_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1","LIB_Kfz1_camo","LIB_Kfz1_Hood"]] call _fnc_saveToTemplate;
private _vehiclesLightArmed = ["LIB_Kfz1_MG42","LIB_Kfz1_MG42_camo","fow_v_sdkfz_250_9_camo_ger_heer","fow_v_sdkfz_222_camo_ger_heer"]; 
["vehiclesTrucks", ["LIB_OpelBlitz_Open_Y_Camo","LIB_OpelBlitz_Tent_Y_Camo","LIB_SdKfz_7"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_OpelBlitz_Open_Y_Camo","LIB_SdKfz_7"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_OpelBlitz_Ammo", "LIB_SdKfz_7_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_OpelBlitz_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_OpelBlitz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_OpelBlitz_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["fow_v_sdkfz_250_camo_ger_heer","fow_v_sdkfz_250_camo_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_SdKfz_7_AA", "fow_v_sdkfz_251_camo_ger_heer","fow_v_sdkfz_251_camo_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["LIB_PzKpfwIV_H", "LIB_StuG_III_G"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["fow_v_panther_camo_ger_heer", "fow_v_panther_camo_ger_heer", "fow_v_panther_camo_ger_heer", "LIB_PzKpfwVI_E", "LIB_PzKpfwVI_B_tarn51c"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_FlakPanzerIV_Wirbelwind"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["fow_v_sdkfz_250_camo_ger_heer"]] call _fnc_saveToTemplate;
private _vehiclesLightTanks = ["LIB_StuG_III_G"]; 

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesLightArmed append ["FA_BA64_Captured","FA_Sdkfz231", "FA_Sdkfz234", "FA_Sdkfz234_4", "FA_Sdkfz231"]; 
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesLightTanks append ["FA_Panzer2","FA_Pz38t"];
};
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", []] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["LIB_Ju87"];
private _vehiclesPlanesLargeCAS = [];
private _vehiclesPlanesAA = ["LIB_FW190F8"];
private _vehiclesPlanesTransport = ["A3U_LIB_C47_German"];

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS append ["sab_fl_bf109g"];
	_vehiclesPlanesLargeCAS append ["sab_fl_ju88a","sab_fl_ju86"];
	_vehiclesPlanesAA append ["sab_fl_bf109e","sab_fl_bf109f","sab_fl_bf109g","sab_fl_bf109k","sab_fl_fw190a","sab_fl_fw190d"];
	_vehiclesPlanesTransport = ["sab_fl_ju52"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
    _vehiclesPlanesCAS append ["sab_sw_bf110"];
	_vehiclesPlanesLargeCAS append ["sab_sw_he111","sab_sw_he177"];
	_vehiclesPlanesAA append ["sab_sw_me262","sab_sw_bf110"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _vehiclesPlanesLargeCAS] call _fnc_saveToTemplate;
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
["vehiclesMilitiaLightArmed", ["LIB_Kfz1_MG42","LIB_Kfz1_MG42_camo","fow_v_sdkfz_222_camo_ger_heer"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_OpelBlitz_Open_Y_Camo","LIB_OpelBlitz_Tent_Y_Camo"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Kfz1","LIB_Kfz1_camo","LIB_Kfz1_Hood"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["fow_v_sdkfz_251_camo_ger_heer","fow_v_sdkfz_250_9_camo_ger_heer"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_Kfz1_sernyt"]] call _fnc_saveToTemplate;

["staticMGs", ["fow_w_mg42_deployed_high_ger_heer"]] call _fnc_saveToTemplate;
["staticAT", ["fow_w_pak40_camo_ger_heer"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_FlaK_38"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_GrWr34"]] call _fnc_saveToTemplate;
["staticHowitzers", ["LIB_leFH18"]] call _fnc_saveToTemplate;

["vehicleRadar", "fow_w_flak36_camo_ger_heer"] call _fnc_saveToTemplate;
["vehicleSam", "fow_w_flak36_camo_ger_heer"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "LIB_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_81mmHE_GRWR34"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_81mm_GRWR34_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["LIB_TMI_42_MINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_shumine_42_MINE"]] call _fnc_saveToTemplate;


#include "FOW_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01Ger","Male02Ger","Male03Ger","Male04Ger","Male05Ger","Male06Ger"]] call _fnc_saveToTemplate;
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

_loadoutData set ["antiInfantryGrenades", ["lib_shg24", "LIB_M39"]];
_loadoutData set ["antiTankGrenades", ["lib_shg24x7"]];
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

_loadoutData set ["traitorUniforms", ["U_LIB_GER_Soldier2"]];
_loadoutData set ["traitorVests", ["V_LIB_GER_OfficerVest"]];
_loadoutData set ["traitorHats", ["H_LIB_GER_Helmet"]];

_loadoutData set ["officerUniforms", ["U_LIB_GER_Unterofficer"]];
_loadoutData set ["officerVests", ["V_LIB_GER_OfficerVest"]];
_loadoutData set ["officerHats", ["H_LIB_GER_OfficerCap"]];

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
_sfLoadoutData set ["uniforms", ["fow_u_ger_fall_01_private","fow_u_ger_fall_01_corporal","fow_u_ger_fall_01_lance_corporal","fow_u_ger_fall_01_sergeant"]];
_sfLoadoutData set ["vests", ["fow_v_heer_k98","fow_v_heer_mp40","fow_v_heer_g43"]];
_sfLoadoutData set ["glVests", ["fow_v_heer_mp44"]];
_sfLoadoutData set ["Hvests", ["fow_v_heer_mg"]];
_sfLoadoutData set ["backpacks", ["fow_b_grenadebag","fow_b_tornister_medic"]];
_sfLoadoutData set ["helmets", ["fow_h_ger_m40_fall_01","fow_h_ger_m40_fall_01_camo"]];
_sfLoadoutData set ["sniHats", ["fow_h_ger_m40_fall_01_net"]];
_sfLoadoutData set ["slHat", ["fow_h_ger_m40_fall_01_camo"]];
_sfLoadoutData set ["binoculars", ["fow_i_dienstglas"]];

//SF Weapons
_sfLoadoutData set ["rifles", [["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_SMK","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""]]];
		
_sfLoadoutData set ["carbines", [["fow_w_stg44", "", "", "", ["fow_30Rnd_792x33","fow_30Rnd_792x33","LIB_30rnd_792x33_t"], [], ""],
        ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40","fow_32Rnd_9x19_mp40","LIB_32rnd_9x19_t"], [], ""]]];
		
_sfLoadoutData set ["grenadeLaunchers", [["LIB_MP44", "lib_acc_gw_sb_empty", "", "", ["fow_30Rnd_792x33","fow_30Rnd_792x33","LIB_30rnd_792x33_t"], ["LIB_1Rnd_G_PZGR_40"], ""],
        ["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
	["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];
	
_sfLoadoutData set ["SMGs", [["LIB_FG42G", "", "", "", ["LIB_20Rnd_792x57"], [], ""],
        ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40","fow_32Rnd_9x19_mp40","LIB_32rnd_9x19_t"], [], ""]]];
		
_sfLoadoutData set ["machineGuns", [["fow_w_mg42", "", "", "", ["LIB_50Rnd_792x57_SMK"], [], ""],
        ["fow_w_mg34", "", "", "", ["LIB_50Rnd_792x57_SMK"], [], ""]]];
		
_sfLoadoutData set ["marksmanRifles", [["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_SMK","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""]]];
		
_sfLoadoutData set ["sniperRifles", [	
	["fow_w_k98_scoped", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_sS","LIB_5Rnd_792x57_t"], [], ""]]];
	
_sfLoadoutData set ["sidearms", [["fow_w_p08", "", "", "", ["fow_8Rnd_9x19"], [], ""],
        ["LIB_P38", "", "", "", ["LIB_8Rnd_9x19"], [], ""]]];
		
/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["fow_u_ger_m43_01_private","fow_u_ger_m43_01_lance_corporal","fow_u_ger_m43_01_corporal"]];
_eliteLoadoutData set ["slUniforms", ["fow_u_ger_m43_01_corporal"]];
_eliteLoadoutData set ["vests", ["fow_v_heer_k98","fow_v_heer_k98_light","fow_v_heer_mp40","fow_v_heer_g43"]];
_eliteLoadoutData set ["glVests", ["fow_v_heer_mp44"]];
_eliteLoadoutData set ["Hvests", ["fow_v_heer_mg"]];
_eliteLoadoutData set ["backpacks", ["fow_b_heer_aframe","fow_b_heer_ammo_belt","fow_b_ammoboxes","fow_b_ammoboxes_mg34_42","fow_b_grenadebag","fow_b_tornister_medic"]];
_eliteLoadoutData set ["helmets", ["fow_h_ger_m40_heer_01", "fow_h_ger_m40_heer_02"]];
_eliteLoadoutData set ["sniHats", ["fow_h_ger_m40_heer_01_net"]];
_eliteLoadoutData set ["slHat", ["fow_h_ger_officer_cap"]];
_eliteLoadoutData set ["binoculars", ["fow_i_dienstglas"]];

_eliteLoadoutData set ["rifles", [["fow_w_k98", "", "", "", ["fow_5Rnd_792x57"], [], ""]]];

_eliteLoadoutData set ["carbines", [
	["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
	["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40","fow_32Rnd_9x19_mp40","LIB_32rnd_9x19_t"], [], ""]
	]];

_eliteLoadoutData set ["SMGs", [["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40","fow_32Rnd_9x19_mp40","LIB_32rnd_9x19_t"], [], ""]]];

_eliteLoadoutData set ["grenadeLaunchers", [["LIB_MP44", "lib_acc_gw_sb_empty", "", "", ["fow_30Rnd_792x33","fow_30Rnd_792x33","LIB_30rnd_792x33_t"], ["LIB_1Rnd_G_PZGR_40"], ""],
        ["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
	["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];

_eliteLoadoutData set ["machineGuns", [["fow_w_mg42", "", "", "", ["LIB_50Rnd_792x57_sS"], [], ""],
        ["fow_w_mg34", "", "", "", ["LIB_50Rnd_792x57_sS"], [], ""]]];

_eliteLoadoutData set ["marksmanRifles", [["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
        ["LIB_G41", "", "", "", ["LIB_10Rnd_792x57_clip"], [], ""]]];

_eliteLoadoutData set ["sniperRifles", [
	["fow_w_k98_scoped", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_sS","LIB_5Rnd_792x57_t"], [], ""]
	]];

_eliteLoadoutData set ["sidearms", [["fow_w_p08", "", "", "", ["fow_8Rnd_9x19"], [], ""]]];		
		
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["fow_u_ger_m43_01_private","fow_u_ger_m43_01_lance_corporal","fow_u_ger_m43_01_corporal"]];
_militaryLoadoutData set ["slUniforms", ["fow_u_ger_m43_01_corporal"]];
_militaryLoadoutData set ["vests", ["fow_v_heer_k98","fow_v_heer_k98_light","fow_v_heer_mp40","fow_v_heer_g43"]];
_militaryLoadoutData set ["glVests", ["fow_v_heer_mp44"]];
_militaryLoadoutData set ["Hvests", ["fow_v_heer_mg"]];
_militaryLoadoutData set ["backpacks", ["fow_b_heer_aframe","fow_b_heer_ammo_belt","fow_b_ammoboxes","fow_b_ammoboxes_mg34_42","fow_b_grenadebag","fow_b_tornister_medic"]];
_militaryLoadoutData set ["helmets", ["fow_h_ger_m40_heer_01", "fow_h_ger_m40_heer_02"]];
_militaryLoadoutData set ["sniHats", ["fow_h_ger_m40_heer_01_net"]];
_militaryLoadoutData set ["slHat", ["fow_h_ger_officer_cap"]];
_militaryLoadoutData set ["binoculars", ["fow_i_dienstglas"]];

_militaryLoadoutData set ["rifles", [["fow_w_k98", "", "", "", ["fow_5Rnd_792x57"], [], ""]]];

_militaryLoadoutData set ["carbines", [
	["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""],
	["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40","fow_32Rnd_9x19_mp40","LIB_32rnd_9x19_t"], [], ""]
	]];

_militaryLoadoutData set ["SMGs", [["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40","fow_32Rnd_9x19_mp40","LIB_32rnd_9x19_t"], [], ""]]];

_militaryLoadoutData set ["grenadeLaunchers", [["LIB_MP44", "lib_acc_gw_sb_empty", "", "", ["fow_30Rnd_792x33","fow_30Rnd_792x33","LIB_30rnd_792x33_t"], ["LIB_1Rnd_G_PZGR_40"], ""],
        ["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
	["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];

_militaryLoadoutData set ["machineGuns", [["fow_w_mg42", "", "", "", ["LIB_50Rnd_792x57_sS"], [], ""],
        ["fow_w_mg34", "", "", "", ["LIB_50Rnd_792x57_sS"], [], ""]]];

_militaryLoadoutData set ["marksmanRifles", [["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_T","LIB_10Rnd_792x57_sS","LIB_10Rnd_792x57_T2"], [], ""]]];

_militaryLoadoutData set ["sniperRifles", [
	["fow_w_k98_scoped", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_sS","LIB_5Rnd_792x57_t"], [], ""]
	]];

_militaryLoadoutData set ["sidearms", [["fow_w_p08", "", "", "", ["fow_8Rnd_9x19"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["fow_u_ger_m43_ss_01_private"]];
_policeLoadoutData set ["vests", ["fow_v_heer_mp40_nco"]];
_policeLoadoutData set ["helmets", ["fow_h_ger_officer_cap_ss","fow_h_ger_m42_heer_01"]];
_policeLoadoutData set ["SMGs", [["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""],
        ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""]]];
_policeLoadoutData set ["sidearms", [
	["fow_w_p08", "", "", "", ["fow_8Rnd_9x19"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["fow_u_ger_m43_02_corporal","fow_u_ger_m43_02_lance_corporal","fow_u_ger_m43_02_private"]];
_militiaLoadoutData set ["vests", ["fow_v_heer_k98","fow_v_heer_k98_light","fow_v_heer_mp40"]];
_militiaLoadoutData set ["backpacks", ["fow_b_heer_aframe","fow_b_heer_ammo_belt","fow_b_ammoboxes"]];
_militiaLoadoutData set ["helmets", ["fow_h_ger_m40_heer_01", "fow_h_ger_m40_heer_02","fow_h_ger_feldmutze","fow_h_ger_m38_feldmutze"]];
_militiaLoadoutData set ["sniHats", ["fow_h_ger_m40_heer_01_net"]];
_militiaLoadoutData set ["slHat", ["fow_h_ger_officer_cap"]];

_militiaLoadoutData set ["rifles", [["fow_w_k98", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];
		
_militiaLoadoutData set ["carbines", [
	["fow_w_g43", "", "", "", ["fow_10nd_792x57","fow_10nd_792x57","LIB_10Rnd_792x57_T"], [], ""],
	["fow_w_k98", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
	["fow_w_k98", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]
	]]; 

_militiaLoadoutData set ["grenadeLaunchers", [["LIB_K98", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_30"], ""],
        ["LIB_K98_Late", "lib_acc_gw_sb_empty", "", "", ["fow_5Rnd_792x57"], ["LIB_1Rnd_G_PZGR_40"], ""]]];
		
_militiaLoadoutData set ["SMGs", [["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""]]];

_militiaLoadoutData set ["shotguns", [["fow_w_k98", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];

_militiaLoadoutData set ["machineGuns", [["fow_w_mg34", "", "", "", ["fow_50Rnd_792x57"], [], ""],
        ["fow_w_mg42", "", "", "", ["fow_50Rnd_792x57"], [], ""]
		]];

_militiaLoadoutData set ["marksmanRifles", [["fow_w_k98", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]]];

_militiaLoadoutData set ["sniperRifles", [["fow_w_k98_scoped", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""],
        ["fow_w_k98", "", "", "", ["fow_5Rnd_792x57","LIB_5Rnd_792x57_t"], [], ""]
	]];

_militiaLoadoutData set ["sidearms", [["fow_w_p08", "", "", "", ["fow_8Rnd_9x19"], [], ""]]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["fow_u_ger_tankcrew_01","fow_u_ger_tankcrew_02","fow_u_ger_tankcrew_01_shutz"]];
_crewLoadoutData set ["vests", ["fow_v_heer_tankcrew_p38"]];
_crewLoadoutData set ["helmets", ["fow_h_ger_feldmutze_panzer","fow_h_ger_headset"]];
_crewLoadoutData set ["carbines", [
    ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""],
    ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_GER_LW_pilot","U_LIB_GER_LW_pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_GER_OfficerBelt"]];
_pilotLoadoutData set ["helmets", ["H_LIB_GER_LW_PilotHelmet"]];
_pilotLoadoutData set ["carbines", [
    ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""],
    ["fow_w_mp40", "", "", "", ["fow_32Rnd_9x19_mp40"], [], ""]
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
