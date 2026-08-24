//////////////////////////
//   Side Information   //
//////////////////////////

["name", "USAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F", "vn_b_wheeled_m274_01_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_b_wheeled_m151_01", "vn_b_wheeled_m151_02", "CUP_B_M1152_WDL_USA", "CUP_B_M1151_WDL_USA", "CUP_B_nM1038_4s_USA_WDL", "CUP_B_nM1038_4s_DF_USA_WDL", "CUP_B_nM1038_DF_USA_WDL", "CUP_B_nM1038_USA_WDL", "CUP_B_nM1025_Unarmed_DF_USA_WDL", "CUP_B_nM1025_Unarmed_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["vn_b_wheeled_m151_mg_02", "vn_b_wheeled_m151_mg_04", "vn_b_wheeled_m151_mg_06", "vn_b_wheeled_m151_mg_03", "vn_b_wheeled_m151_mg_05", "vn_b_wheeled_m54_mg_02", "vn_b_armor_m132_01", "CUP_B_M1167_WDL_USA", "CUP_B_M1165_GMV_WDL_USA", "CUP_B_M1151_Mk19_WDL_USA", "CUP_B_M1151_Deploy_WDL_USA", "CUP_B_M1151_M2_WDL_USA", "CUP_B_nM1036_TOW_DF_USA_WDL", "CUP_B_nM1036_TOW_USA_WDL", "CUP_B_nM1025_SOV_Mk19_USA_WDL", "CUP_B_nM1025_SOV_M2_USA_WDL", "CUP_B_nM1025_Mk19_DF_USA_WDL", "CUP_B_nM1025_Mk19_USA_WDL", "CUP_B_nM1025_M240_DF_USA_WDL", "CUP_B_nM1025_M240_USA_WDL", "CUP_B_nM1025_M2_DF_USA_WDL", "CUP_B_nM1025_M2_USA_WDL",  "CUP_B_M1135_ATGMV_Woodland"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["vn_b_wheeled_m54_01", "vn_b_wheeled_m54_02", "CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["vn_b_wheeled_m54_ammo", "CUP_B_MTVR_Ammo_USA", "CUP_B_nM1038_Ammo_USA_WDL", "CUP_B_nM1038_Ammo_DF_USA_WDL", "SPE_US_M3_Halftrack_Ammo", "SPE_CCKW_353_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["vn_b_wheeled_m54_repair", "CUP_B_nM1038_Repair_DF_USA_WDL", "CUP_B_nM1038_Repair_USA_WDL", "CUP_B_MTVR_Repair_USA", "SPE_US_M3_Halftrack_Repair", "SPE_CCKW_353_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["vn_b_wheeled_m54_fuel", "CUP_B_MTVR_Refuel_USA", "SPE_US_M3_Halftrack_Fuel", "SPE_CCKW_353_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["vn_b_armor_m577_02", "CUP_B_nM997_DF_USA_WDL", "CUP_B_nM997_USA_WDL", "CUP_B_M1133_MEV_Woodland", "SPE_US_M3_Halftrack_Ambulance", "SPE_US_G503_MB_Ambulance", "SPE_CCKW_353_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["vn_b_wheeled_m54_mg_03", "vn_b_wheeled_m54_mg_01", "vn_b_armor_m113_01", "CUP_B_M113A3_USA", "CUP_B_M113A3_USA", "CUP_B_RG31E_M2_OD_USA", "CUP_B_RG31_Mk19_OD_USA", "CUP_B_RG31_M2_OD_GC_USA", "CUP_B_RG31_M2_OD_USA"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["vn_b_armor_m113_acav_04", "vn_b_armor_m113_acav_02", "vn_b_armor_m113_acav_01", "vn_b_armor_m113_acav_06", "vn_b_armor_m113_acav_03", "vn_b_armor_m113_acav_05", "vn_b_armor_m113_01", "CUP_B_M2Bradley_USA_W", "CUP_B_M1126_ICV_M2_Woodland", "CUP_B_M1126_ICV_MK19_Woodland"]] call _fnc_saveToTemplate;            // mortar carrier: "CUP_B_M1129_MC_MK19_Woodland"
["vehiclesIFVs", ["CUP_B_M2Bradley_USA_W", "CUP_B_M7Bradley_USA_W", "CUP_B_M2A3Bradley_USA_W", "CUP_B_M2A3Bradley_USA_W"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["vn_b_armor_m48_01_01", "vn_b_armor_m67_01_01", "CUP_B_M1A2C_TUSK_Woodland_US_Army", "CUP_B_M1A2C_TUSK_II_Woodland_US_Army", "CUP_B_M1A2C_Woodland_US_Army", "CUP_B_M1A2SEP_TUSK_Woodland_US_Army", "CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army", "CUP_B_M1A2SEP_Woodland_US_Army", "CUP_B_M1A1SA_TUSK_Woodland_US_Army", "CUP_B_M1A1SA_Woodland_US_Army", "CUP_B_M1128_MGS_Woodland"]] call _fnc_saveToTemplate;
["vehiclesAA", ["vn_b_wheeled_m54_mg_02", "CUP_B_M6LineBacker_USA_W", "CUP_B_nM1097_AVENGER_USA_WDL", "CUP_B_M163_Vulcan_USA", "SPE_US_M16_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["vn_b_armor_m113_01", "CUP_B_M113A3_USA", "CUP_B_M113A3_USA"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["vn_b_armor_m41_01_01", "CUP_B_M2Bradley_USA_W", "CUP_B_M7Bradley_USA_W", "CUP_B_M2A3Bradley_USA_W", "CUP_B_M2A3Bradley_USA_W"]] call _fnc_saveToTemplate;

private _vehiclesTransportBoats = ["vn_o_boat_02_01", "vn_b_boat_10_01", "vn_b_boat_09_01", "I_G_Boat_Transport_01_F"];
private _vehiclesGunBoats = ["vn_b_boat_13_02", "vn_b_boat_06_02", "vn_b_boat_05_02", "vn_b_boat_12_02", "CUP_B_RHIB2Turret_USMC"];
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_c_Vehicles_Boats_c")) then {
    _vehiclesTransportBoats append ["SPEX_LCVP"];
};
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["SPE_P47", "CUP_B_A10_DYN_USA", "vn_b_air_f4c_at", "vn_b_air_f100d_at"];
private _vehiclesPlanesAA = ["SPE_P47", "CUP_B_AV8B_DYN_USMC", "vn_b_air_f4c_cap", "vn_b_air_f100d_cap", "CUP_B_F35B_USMC"];

private _vehiclesPlanesTransport = ["CUP_B_C130J_USMC", "CUP_B_MV22_USMC_RAMPGUN"];
if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_m_Vehicles_Planes_m")) then {
    _vehiclesPlanesTransport append ["SPEX_C47_Skytrain"];
};
if (isClass (configFile >> "CfgPatches" >> "JK_US_Air_F_DC3")) then {
    _vehiclesPlanesTransport append ["JK_B_C47_F"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS append ["sab_fl_p51d","sab_fl_p51b","sab_fl_f4f","sab_fl_sbd","sab_fl_f4u","sab_fl_f4u"];
	_vehiclesPlanesAA append ["sab_fl_p51d","sab_fl_p51b"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
    _vehiclesPlanesCAS append ["sab_sw_tbf","sab_sw_p40"];
	_vehiclesPlanesLargeCAS append ["sab_sw_a26"];
	_vehiclesPlanesAA append ["sab_sw_p40","sab_sw_p38"];
};

private _gunship = [];
if (isClass (configFile >> "cfgVehicles" >> "vnx_b_air_ac119_02_01")) then {
	_gunship pushBack "vnx_b_air_ac119_01_01";
  	_vehiclesPlanesTransport append ["vnx_b_air_ac119_02_01","vnx_b_air_ac119_02_02"];
	_vehiclesPlanesCAS pushBack "vnx_b_air_ac119_04_01";
};

["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_B_MH6M_USA", "CUP_B_MH6J_USA", "vn_b_air_ch34_01_01"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_B_UH60M_US", "CUP_B_UH60M_FFV_US", "CUP_B_UH60M_Unarmed_US", "CUP_B_UH60M_Unarmed_FFV_US", "vn_b_air_uh1c_07_01", "vn_b_air_uh1d_02_01", "vn_b_air_ch34_01_01", "vn_b_air_ch34_03_01", "vn_b_air_ch47_04_02", "vn_b_air_ch47_04_01", "vn_b_air_ch47_01_02", "vn_b_air_ch47_01_01"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["CUP_B_AH6M_USA", "CUP_B_AH6J_USA", "vn_b_air_uh1c_01_01", "vn_b_air_uh1c_02_01", "vn_b_air_uh1c_03_01", "vn_b_air_ach47_04_01", "vn_b_air_ach47_05_01", "vn_b_air_ach47_03_01", "vn_b_air_ach47_01_01", "vn_b_air_ach47_02_01"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH64D_DL_USA", "vn_b_air_ah1g_02", "vn_b_air_ah1g_03", "vn_b_air_ah1g_04", "vn_b_air_ah1g_07", "vn_b_air_ah1g_08", "vn_b_air_ah1g_09"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", ["CUP_B_MH6M_USA", "CUP_B_MH6J_USA","CUP_B_AH6M_USA", "CUP_B_AH6J_USA"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SPE_M4A1_T34_Calliope", "SPE_M4A3_T34_Calliope", "CUP_B_M270_HE_USA", "vn_b_army_static_m101_02"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SPE_M4A1_T34_Calliope", ["SPE_60Rnd_M8"]],
["SPE_M4A3_T34_Calliope", ["SPE_60Rnd_M8"]],
["CUP_B_M270_HE_USA", ["CUP_12Rnd_MLRS_HE"]],
["vn_b_army_static_m101_02", ["vn_cannon_m101_mag_he_x8", "vn_cannon_m101_mag_ab_x8", "vn_cannon_m101_mag_wp_x8"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SPE_US_G503_MB_M1919", "SPE_US_G503_MB_M2", "SPE_US_G503_MB_M1919_Armoured", "SPE_US_G503_MB_M2_Armoured", "SPE_US_G503_MB_M2_PATROL", "SPE_US_G503_MB_M1919_PATROL"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPE_CCKW_353_Open", "SPE_CCKW_353", "SPE_CCKW_353_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPE_US_G503_MB_Open", "SPE_US_G503_MB"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SPE_M20_AUC", "SPE_US_M3_Halftrack", "SPE_M18_Hellcat", "SPE_M10", "SPE_M8_LAC_ringMount", "SPE_M8_LAC", "SPE_M4A0_75_Early", "SPE_M4A0_75", "SPE_M4A1_76", "SPE_M4A1_75", "SPE_M4A0_composite", "SPE_M4A0_105", "SPE_M4A1_75_erla", "SPE_M4A3_105", "SPE_M4A3_75", "SPE_M4A3_76"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_US_G503_MB_Armoured"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US", "vn_b_army_static_m2_high", "vn_b_army_static_m60_high", "vn_b_army_static_m2_scoped_high"]] call _fnc_saveToTemplate;
["staticAT", ["SPE_57mm_M1", "SPE_105mm_M3_Direct", "CUP_B_TOW2_TriPod_US", "vn_b_army_static_tow", "vn_b_army_static_m40a1rr"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FR_M45_Quadmount", "CUP_B_CUP_Stinger_AA_pod_US", "vn_b_army_static_m45", "vn_b_navy_static_l70mk2", "vn_b_navy_static_l60mk3"]] call _fnc_saveToTemplate;
["staticMortars", ["SPE_M1_81"]] call _fnc_saveToTemplate;
["staticHowitzers", ["SPE_105mm_M3"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "SPE_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;
["mortarMagazineHE", "SPE_8Rnd_81mmHE_M1_M43A1"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8rnd_81mm_M1_M57_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_US_M1A1_ATMINE", "vn_mine_m15", "CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_US_M3_Pressure_MINE", "SPE_US_M3_MINE", "vn_mine_m14", "APERSMine"]] call _fnc_saveToTemplate;

#include "ERA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6", "SPE_Arnold", "SPE_boyartsev", "SPE_bykov", "SPE_Connors", "SPE_DAgostino", "SPE_Davidson", "SPE_Elliot", "SPE_Grishka", "SPE_Hauptmann", "SPE_Ivanych", "SPE_Jeppson", "SPE_Klimakov", "SPE_Krueger", "SPE_Kuzmin", "SPE_Neumann", "SPE_Oberst", "SPE_OBrien", "SPE_Seppmeyer", "SPE_Vasiliev", "SPE_Walter", "SPE_Wolf", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

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
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["SPE_US_M1A1_ATMINE_mag","vn_mine_m15_mag"]];
_loadoutData set ["APMines", ["SPE_US_M3_Pressure_MINE_mag","vn_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["SPE_US_TNT_half_pound_mag","vn_mine_m112_remote_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_US_TNT_4pound_mag","vn_mine_satchel_remote_02_mag"]];

_loadoutData set ["antiInfantryGrenades", ["SPE_US_Mk_2", "vn_m67_grenade_mag", "vn_m61_grenade_mag", "vn_m34_grenade_mag", "vn_m14_early_grenade_mag", "vn_m14_grenade_mag"]];
_loadoutData set ["antiTankGrenades", ["SPE_US_AN_M14"]];
_loadoutData set ["smokeGrenades", ["SmokeShell", "vn_m18_white_mag"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue", "vn_m18_yellow_mag", "vn_m18_red_mag", "vn_m18_purple_mag", "vn_m18_green_mag"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_US_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_US_ItemCompass"]];
_loadoutData set ["radios", ["TFAR_SCR536", "vn_b_item_radio_urc10"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_loadoutData set ["binoculars", ["SPE_Binocular_US", "vn_mk21_binocs"]];
_loadoutData set ["rangefinders", ["SPE_Binocular_US"]];

_loadoutData set ["traitorUniforms", ["vn_o_uniform_vc_mf_01_07"]];
_loadoutData set ["traitorVests", ["vn_o_vest_05", "vn_o_vest_04"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["vn_b_uniform_macv_01_01", "vn_b_uniform_macv_01_07"]];
_loadoutData set ["officerVests", ["vn_b_vest_usarmy_09"]];
_loadoutData set ["officerHats", ["vn_b_beret_03_01"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", []];
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
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["CUP_U_CRYE_G3C_MC_US", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_V1_Full"]];
_sfLoadoutData set ["vests", ["CUP_V_CPC_Fastbelt_mc"]];
_sfLoadoutData set ["mgVests", ["CUP_V_CPC_weapons_mc"]];
_sfLoadoutData set ["medVests", ["CUP_V_JPC_medicalbelt_mc"]];
_sfLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_Khaki_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr", "B_Carryall_cbr"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_US_IIID_OEFCP"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Spray_SF", "CUP_H_OpsCore_Covered_MTP_SF", "CUP_H_OpsCore_Covered_MTP"]];
_sfLoadoutData set ["slHat", ["CUP_H_USA_Cap_Mcam_DEF"]];
_sfLoadoutData set ["sniHats", ["CUP_H_USArmy_Boonie_hs_OCP"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_GL_carryhandle", "CUP_muzzle_snds_M16", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "CUP_muzzle_snds_M16", "", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_mk18_m203_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_mk18_m203_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_CompM2_low", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""],
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_Mk48", "", "CUP_acc_ANPEQ_15", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_Mk48", "", "CUP_acc_ANPEQ_15", "CUP_optic_G33_HWS_BLK", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_m249_pip1", "", "", "CUP_optic_G33_HWS_BLK", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip1", "", "", "CUP_optic_Eotech553_Black", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_B", "", "CUP_acc_ANPEQ_15", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M240_B", "", "CUP_acc_ANPEQ_15", "CUP_optic_G33_HWS_BLK", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_Mk20_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_30Rnd_TE1_Red_Tracer_762x51_2_SCAR", "CUP_30Rnd_TE1_White_Tracer_762x51_2_SCAR"], [], "bipod_01_F_blk"],
    ["CUP_arifle_Mk20_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_30Rnd_TE1_Red_Tracer_762x51_2_SCAR", "CUP_30Rnd_TE1_White_Tracer_762x51_2_SCAR"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""],
    ["CUP_launch_M136", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_sfLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""],
	["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
	["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP", "CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OEFCP"]];
_eliteLoadoutData set ["vests", ["CUP_V_B_IOTV_OEFCP_Rifleman_USArmy"]];
_eliteLoadoutData set ["slVests", ["CUP_V_B_IOTV_OEFCP_TL_USArmy"]];
_eliteLoadoutData set ["mgVests", ["CUP_V_B_IOTV_OEFCP_MG_USArmy"]];
_eliteLoadoutData set ["glVests", ["CUP_V_B_IOTV_OEFCP_Grenadier_USArmy"]];
_eliteLoadoutData set ["backpacks", ["B_Carryall_cbr", "CUP_B_AssaultPack_Coyote", "B_AssaultPack_cbr"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_cbr"]];
_eliteLoadoutData set ["helmets", ["CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OEFCP", "CUP_H_USArmy_HelmetACH_ESS_Headset_OEFCP", "CUP_H_USArmy_HelmetACH_OEFCP"]];
_eliteLoadoutData set ["slHat", ["CUP_H_USArmy_Boonie_OEFCP"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];


_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk17_STD_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk17_STD_black", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];

_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_Mk16_CQC_FG", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk17_CQC_Black", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
    ["CUP_arifle_Mk17_CQC_Black", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];

_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM_black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk17_STD_EGLM_black", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk17_STD_EGLM_black", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_m249_pip1", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip4", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M240_B", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M240_B", "", "CUP_acc_ANPEQ_15", "CUP_optic_ACOG_TA648_308_Black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_Mk20", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
    ["CUP_arifle_Mk20", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_ACOG_TA648_308_Black", ["CUP_20Rnd_762x51_B_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_SB_11_4x20_PM", ["30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_LeupoldMk4", ["30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_LeupoldM3LR", ["30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""],
	["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
	["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["vn_b_uniform_macv_02_01", "vn_b_uniform_macv_02_07", "vn_b_uniform_macv_01_01", "vn_b_uniform_macv_06_01", "vn_b_uniform_macv_04_01"]];
_militaryLoadoutData set ["vests", ["vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"]];
_militaryLoadoutData set ["glVests", ["vn_b_vest_usarmy_05"]];
_militaryLoadoutData set ["sniVests", ["vn_b_vest_usarmy_08"]];
_militaryLoadoutData set ["medVests", ["vn_o_vest_06", "vn_b_vest_usarmy_12"]];
_militaryLoadoutData set ["engVests", ["vn_b_vest_usarmy_12", "vn_b_vest_usarmy_11"]];
_militaryLoadoutData set ["mgVests", ["vn_b_vest_usarmy_06"]];
_militaryLoadoutData set ["slVests", ["vn_b_vest_usarmy_09", "vn_b_vest_usarmy_11"]];
_militaryLoadoutData set ["backpacks", ["vn_b_pack_lw_01", "vn_b_pack_lw_03"]];
_militaryLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_militaryLoadoutData set ["MGbackpacks", ["vn_b_pack_lw_02", "vn_b_pack_lw_05", "vn_b_pack_trp_01_02"]];
_militaryLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_militaryLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_militaryLoadoutData set ["helmets", ["vn_b_helmet_m1_02_01", "vn_b_helmet_m1_03_01", "vn_b_helmet_m1_05_01", "vn_b_helmet_m1_06_01", "vn_b_helmet_m1_07_01"]];
_militaryLoadoutData set ["GLhelmets", ["vn_b_helmet_m1_04_02"]];
_militaryLoadoutData set ["MGhelmets", ["vn_b_helmet_m1_08_01"]];
_militaryLoadoutData set ["binoculars", ["vn_anpvs2_binoc"]];
_militaryLoadoutData set ["longRangeRadios", ["vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_militaryLoadoutData set ["gpses", []];
_militaryLoadoutData set ["NVGs", []];

_militaryLoadoutData set ["slRifles", [
["vn_m16", "", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m16", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""]
]];
_militaryLoadoutData set ["rifles", [
["vn_m16", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m16", "", "vn_b_m16", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["vn_m2carbine", "", "vn_b_carbine", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m2carbine", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m1928a1_tommy", "", "", "", ["vn_m1a1_30_mag", "vn_m1a1_30_mag", "vn_m1a1_30_t_mag"], [], ""],
["vn_m1928a1_tommy", "", "", "", ["vn_m1a1_30_mag", "vn_m1a1_30_mag", "vn_m1a1_30_t_mag"], [], ""],
["vn_xm177", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_xm177", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["vn_m1a1_tommy_so", "", "", "", ["vn_m1a1_20_mag", "vn_m1a1_20_mag", "vn_m1a1_20_t_mag"], [], ""],
["vn_m3a1", "", "", "", ["vn_m3a1_mag", "vn_m3a1_mag", "vn_m3a1_t_mag"], [], ""]
]];
_militaryLoadoutData set ["designatedGrenadeLaunchers", [
["vn_m79", "", "", "", [], ["vn_40mm_m406_he_mag", "vn_40mm_m406_he_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m79", "", "", "", [], ["vn_40mm_m406_he_mag", "vn_40mm_m406_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m680_smoke_w_mag"], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["vn_m2carbine_gl", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], ["vn_22mm_m17_frag_mag", "vn_22mm_m17_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["vn_m16", "", "", "vn_o_9x_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m16", "", "", "vn_o_4x_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m16", "", "", "vn_o_anpvs2_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m14_camo", "", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_m14_camo", "", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14_camo", "", "", "vn_o_anpvs2_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"]
]];
_militaryLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
"vn_m1911",
"vn_mx991_m1911",
"vn_p38s"
]];
_militaryLoadoutData set ["lightATLaunchers", ["vn_m72"]];
_militaryLoadoutData set ["ATLaunchers", [
	["vn_m20a1b1_01", "", "", "", ["vn_m20a1b1_heat_mag", "vn_m20a1b1_heat_mag", "vn_m20a1b1_heat_mag"], [], ""],
	["vn_m20a1b1_01", "", "", "", ["vn_m20a1b1_heat_mag", "vn_m20a1b1_heat_mag", "vn_m20a1b1_wp_mag"], [], ""]
]];
_militaryLoadoutData set ["missileATLaunchers", []];
_militaryLoadoutData set ["AALaunchers", [
	["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_03"]];
_policeLoadoutData set ["vests", ["vn_b_vest_usarmy_01"]];
_policeLoadoutData set ["helmets", ["vn_b_helmet_m1_01_02","vn_b_boonie_02_01"]];

_policeLoadoutData set ["rifles", [
["vn_m1a1_tommy", "", "", "", ["vn_m1a1_20_mag", "vn_m1a1_20_mag", "vn_m1a1_20_t_mag"], [], ""],
["vn_m1carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""]
]];

_policeLoadoutData set ["shotguns", [
["vn_m1897", "", "", "", ["vn_m1897_buck_mag", "vn_m1897_fl_mag"], [], ""]
]];

_policeLoadoutData set ["sidearms", [
"vn_m1911",
"vn_mx991_m1911",
"vn_p38s"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_SPE_US_SC_EM","U_SPE_US_SC_EM_roll"]];
_militiaLoadoutData set ["slUniforms", ["U_SPE_US_SC_EM_tie"]];
_militiaLoadoutData set ["vests", ["V_SPE_US_Vest_Garand","V_SPE_US_Vest_Garand_map","V_SPE_US_Vest_Garand_mk2"]];
_militiaLoadoutData set ["glVests", ["V_SPE_US_Vest_Grenadier"]];
_militiaLoadoutData set ["Hvests", ["V_SPE_US_Vest_Garand_eng"]];
_militiaLoadoutData set ["backpacks", ["B_SPE_US_Backpack","B_SPE_US_Backpack_Bandoleer","B_SPE_US_Backpack_roll","B_SPE_US_Backpack_M7_rear","B_SPE_US_Backpack_pick"]];
_militiaLoadoutData set ["helmets", ["H_SPE_US_Helmet","H_SPE_US_Helmet_os","H_SPE_US_Helmet_Net","H_SPE_US_Helmet_band_net","H_SPE_US_Helmet_ns","H_SPE_US_Helmet_band_net_up", "H_SPE_US_Helmet_band_net_os", "H_SPE_US_Helmet_band_net_ns"]];
_militiaLoadoutData set ["sniHats", ["H_SPE_US_jeep_cap","H_SPE_US_jeep_cap_rear"]];
_militiaLoadoutData set ["slHat", ["H_SPE_US_Helmet_CO"]];
_militiaLoadoutData set ["longRangeRadios", ["B_SPE_US_Radio", "B_SPE_US_Radio_alt"]];
_militiaLoadoutData set ["gpses", []];
_militiaLoadoutData set ["NVGs", []];

_militiaLoadoutData set ["rifles", [
	["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63"], [], ""]
	]];
_militiaLoadoutData set ["carbines", [
	["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33"], [], ""],
	["SPE_M1903A3_Springfield", "", "", "", ["SPE_5Rnd_762x63"], [], ""]
	]];
_militiaLoadoutData set ["grenadeLaunchers", [
	["SPE_M1_Garand", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63"], ["SPE_1Rnd_G_M9A1","SPE_1Rnd_G_Mk2"], ""]
	]];
_militiaLoadoutData set ["SMGs", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""],
	["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
	]];
_militiaLoadoutData set ["machineGuns", [
	["SPE_M1918A0_BAR", "", "", "", ["SPE_20Rnd_762x63"], [], ""],
	["SPE_M1918A2_BAR", "", "", "", ["SPE_20Rnd_762x63"], [], ""],
    ["SPE_M1919A6", "", "", "", ["SPE_100Rnd_762x63", "SPE_50Rnd_762x63"], [], ""]
	]];
_militiaLoadoutData set ["marksmanRifles", [
	["SPE_M1903A3_Springfield", "", "", "", ["SPE_5Rnd_762x63"], [], ""]
	]];
_militiaLoadoutData set ["sniperRifles", [
	["SPE_M1903A3_Springfield", "", "", "", ["SPE_5Rnd_762x63", "SPE_5Rnd_762x63_t"], [], ""],
	["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], [], ""]
	]];
_militiaLoadoutData set ["sidearms", [
	["SPE_M1911", "", "", "", ["SPE_7Rnd_45ACP_1911"], [], ""]
	]];

_militiaLoadoutData set ["lightATLaunchers", [
	["SPE_M1A1_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6"], [], ""]
	]];
_militiaLoadoutData set ["ATLaunchers", [
	["SPE_M9_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6A3"], [], ""],
	["SPE_M9A1_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6A3"], [], ""]
]];
_militiaLoadoutData set ["missileATLaunchers", []];
_militiaLoadoutData set ["AALaunchers", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["CUP_U_B_USArmy_ACU_OEFCP"]];
_crewLoadoutData set ["vests", ["CUP_V_B_IOTV_OEFCP_TL_USArmy"]];
_crewLoadoutData set ["helmets", ["CUP_H_CVC"]];
_crewLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_USArmy_PilotVest"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];
_pilotLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
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
