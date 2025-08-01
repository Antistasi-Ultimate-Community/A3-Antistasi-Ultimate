//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Commonwealth"] call _fnc_saveToTemplate;
["spawnMarkerName", "Commonwealth support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_UK_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SPEX_CW_G503_MB"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SPEX_CW_G503_MB", "SPEX_CW_Bedford_MWD"]] call _fnc_saveToTemplate;
private _vehiclesLightArmed = ["SPEX_CW_G503_MB_M2", "SPEX_CW_Humber_LRC"];

if (isClass (configFile >> "CfgPatches" >> "SPEV_Core")) then {
    _vehiclesLightArmed append ["SPEV_CW_T17E1"];
};
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;

["vehiclesTrucks", ["SPEX_CW_Bedford_MWD_Open", "SPEX_CW_M5_Halftrack_Unarmed", "SPE_CCKW_353_Open", "SPE_CCKW_353"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SPE_CCKW_353_Ammo", "SPEX_CW_Bedford_MWD_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SPEX_CW_Bedford_MWD_Repair", "SPE_CCKW_353_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SPEX_CW_Bedford_MWD_Fuel", "SPE_CCKW_353_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SPEX_CW_M5_Halftrack_Ambulance", "SPEX_CW_G503_MB_Ambulance", "SPE_CCKW_353_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["SPE_CCKW_353_M2", "SPEX_CW_M5_Halftrack_Unarmed_Open"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SPEX_CW_M5_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["SPEX_CW_Cromwell_Mk6"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SPEX_CW_Cromwell_Mk5", "SPEX_CW_Sherman_I", "SPEX_CW_Sherman_I_Early", "SPEX_CW_Sherman_II_Late", "SPEX_CW_Sherman_Ic"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SPE_US_M16_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["SPEX_CW_Humber_MkII"]] call _fnc_saveToTemplate;
private _vehiclesLightTanks = ["SPEX_CW_Humber_MkIV_PLM", "SPEX_CW_Humber_MkIV"];

if (isClass (configFile >> "CfgPatches" >> "MWB_M24Chaffee")) then {
    _vehiclesLightTanks append ["MWB_M24Chaffee"];
};
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;

private _vehiclesTransportBoats = [];
private _vehiclesGunBoats = [];
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_c_Vehicles_Boats_c")) then {
    _vehiclesTransportBoats = ["SPEX_LCVP"];
	_vehiclesGunBoats = ["SPEX_LCVP"];
};
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["SPE_P47"];
private _vehiclesPlanesLargeCAS = [];
private _vehiclesPlanesAA = ["SPE_P47"];
private _vehiclesPlanesTransport = [];

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS = ["sab_fl_hurricane_2","sab_fl_tempest","sab_fl_dh98"];
	_vehiclesPlanesAA = ["sab_fl_hurricane","sab_fl_spitfire_mk1","sab_fl_spitfire_mk5","sab_fl_spitfire_mkxiv"];
};
if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
	_vehiclesPlanesLargeCAS append ["sab_sw_halifax"];
};
if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_m_Vehicles_Planes_m")) then {
    _vehiclesPlanesTransport append ["SPEX_CW_C47_Dakota"];
};
["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _vehiclesPlanesLargeCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;

["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SPE_M4A1_T34_Calliope", "SPE_M4A3_T34_Calliope"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SPE_M4A1_T34_Calliope", ["SPE_60Rnd_M8"]],
["SPE_M4A3_T34_Calliope", ["SPE_60Rnd_M8"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SPEX_CW_G503_MB_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPEX_CW_G503_MB"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SPE_M20_AUC"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["SPE_M1919_M2_Trench_Deployed"]] call _fnc_saveToTemplate;
["staticAT", ["SPEX_CW_QF_6_Pounder"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FR_M45_Quadmount"]] call _fnc_saveToTemplate;
["staticMortars", ["SPE_M1_81"]] call _fnc_saveToTemplate;
["staticHowitzers", ["SPE_105mm_M3"]] call _fnc_saveToTemplate;

["vehicleRadar", "SPE_FlaK_36_AA"] call _fnc_saveToTemplate;
["vehicleSam", "SPE_FlaK_36_AA"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "SPE_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;
["mortarMagazineHE", "SPE_8Rnd_81mmHE_M1_M43A1"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8rnd_81mm_M1_M57_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_US_M3_Pressure_MINE", "SPE_US_M3_MINE"]] call _fnc_saveToTemplate;

//#include "IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6", "SPE_Arnold", "SPE_boyartsev", "SPE_bykov", "SPE_Connors", "SPE_DAgostino", "SPE_Davidson", "SPE_Elliot", "SPE_Grishka", "SPE_Hauptmann", "SPE_Ivanych", "SPE_Jeppson", "SPE_Klimakov", "SPE_Krueger", "SPE_Kuzmin", "SPE_Neumann", "SPE_Oberst", "SPE_OBrien", "SPE_Seppmeyer", "SPE_Vasiliev", "SPE_Walter", "SPE_Wolf", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;

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
["SPEX_PIAT_Brown", "", "", "",["SPEX_1Rnd_89mm_PIAT"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["SPEX_PIAT", "", "", "",["SPEX_1Rnd_89mm_PIAT"], [], ""],
["SPE_M1A1_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6"], [], ""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["SPE_US_M1A1_ATMINE_mag"]];
_loadoutData set ["APMines", ["SPEX_CW_No5_Mk1_AP_Mag"]];
_loadoutData set ["lightExplosives", ["SPE_US_TNT_half_pound_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_US_TNT_4pound_mag"]];

_loadoutData set ["antiInfantryGrenades", ["SPEX_CW_No36_MKI","SPEX_CW_No82_Light"]];
_loadoutData set ["antiTankGrenades", ["SPEX_CW_No74_Grenade","SPEX_CW_No75_Grenade","SPEX_CW_No82_Heavy"]];
_loadoutData set ["smokeGrenades", ["SPEX_CW_No79","SPEX_CW_No77"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_US_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_US_ItemCompass"]];
_loadoutData set ["radios", ["TFAR_SCR536"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["SPEX_Binocular_CW"]];
_loadoutData set ["rangefinders", ["SPEX_Binocular_CW"]];

_loadoutData set ["traitorUniforms", ["U_SPEX_CW_BD_open"]];
_loadoutData set ["traitorVests", ["V_SPEX_cw_vest_p37_N97_no1_p39"]];
_loadoutData set ["traitorHats", ["H_SPEX_CW_Helmet_mk2_ifak"]];

_loadoutData set ["officerUniforms", ["U_SPEX_CW_BD_Jerkin_Officer"]];
_loadoutData set ["officerVests", ["V_SPEX_CW_Vest_P37_N97_offz"]];
_loadoutData set ["officerHats", ["H_SPEX_CW_beret_gs"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", ["B_SPE_US_Radio"]];
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
_sfLoadoutData set ["uniforms", ["U_SPEX_CW_Denis", "U_SPEX_CW_Denis_puttee", "U_SPEX_CW_Denis_tail", "U_SPEX_CW_Denis_kd_tail", "U_SPEX_CW_Denis_scarf", "U_SPEX_CW_Denis_kd_scarf"]];
_sfLoadoutData set ["vests", ["V_SPEX_cw_vest_p37_N103_no4_P41_bandoleer","V_SPEX_cw_vest_p37_N103_no4_P41_Canteen","V_SPEX_cw_vest_p37_N103_no4_P41_Tin","V_SPEX_cw_vest_p37_N103_no4_P41_2"]];
_sfLoadoutData set ["glVests", ["V_SPEX_cw_vest_p37_N103_sten_P41"]];
_sfLoadoutData set ["Hvests", ["V_SPEX_cw_vest_p37_N103_sten_P41_Canteen"]];
_sfLoadoutData set ["backpacks", ["B_SPEX_CW_Sack_P37_N103_rope_roll_1","B_SPEX_CW_Sack_P37_N103_rope_roll_2","B_SPEX_CW_Sack_P37_N103_rope_roll_3"]];
_sfLoadoutData set ["helmets", ["H_SPEX_CW_HSAT_mk2","H_SPEX_CW_HSAT_mk3","H_SPEX_CW_HSAT_mk2_net","H_SPEX_CW_HSAT_mk3_net","H_SPEX_CW_HSAT_mk2_scrim","H_SPEX_CW_HSAT_mk3_scrim"]];
_sfLoadoutData set ["sniHats", ["H_SPEX_CW_HSAT_mk2","H_SPEX_CW_HSAT_mk3","H_SPEX_CW_HSAT_mk2_net","H_SPEX_CW_HSAT_mk3_net","H_SPEX_CW_HSAT_mk2_scrim","H_SPEX_CW_HSAT_mk3_scrim"]];
_sfLoadoutData set ["slHat", ["H_SPEX_CW_HSAT_mk2","H_SPEX_CW_HSAT_mk3","H_SPEX_CW_HSAT_mk2_net","H_SPEX_CW_HSAT_mk3_net","H_SPEX_CW_HSAT_mk2_scrim","H_SPEX_CW_HSAT_mk3_scrim"]];
_sfLoadoutData set ["binoculars", ["SPEX_Binocular_CW"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
	["SPEX_No4_Mk1_Enfield_dunkel", "", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""]
	]];
_sfLoadoutData set ["carbines", [
	["SPEX_Sten_Mk5", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
	]];
_sfLoadoutData set ["grenadeLaunchers", [
	["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""]
	]];
_sfLoadoutData set ["SMGs", [
	["SPE_Sten_Mk2_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPEX_Sten_Mk6_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
	]];
_sfLoadoutData set ["machineGuns", [
	["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56_AP_MKI", "SPE_30Rnd_770x56_MKVIII"], [], ""]
	]];
_sfLoadoutData set ["marksmanRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56"], [], ""]
	]];
_sfLoadoutData set ["sniperRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56"], [], ""]
	]];
_sfLoadoutData set ["sidearms", [
	["SPEX_Enfield_No2", "", "", "", ["SPEX_6rnd_9x20R"], [], ""],
	["SPEX_Enfield_No2_late", "", "", "", ["SPEX_6rnd_9x20R"], [], ""]
	]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["U_SPEX_CW_BD_CAN", "U_SPEX_CW_BD_CAN_INV", "U_SPEX_CW_BD_CAN_INV_open", "U_SPEX_CW_BD_CAN_open", "U_SPEX_CW_BD_CAN_roll", "U_SPEX_CW_BD_CAN_INV_roll", "U_SPEX_CW_BD_CAN_INV_LCPL", "U_SPEX_CW_BD_CAN_LCPL"]];
_eliteLoadoutData set ["slUniforms", ["U_SPEX_CW_BD_CAN_SGT","U_SPEX_CW_BD_CAN_CSGT","U_SPEX_CW_BD_CAN_1LT","U_SPEX_CW_BD_CAN_CPT"]];
_eliteLoadoutData set ["vests", ["V_SPEX_CW_Vest_P37_N97_Rifle_P41","V_SPEX_CW_Vest_P37_N97_Rifle_no4_P41","V_SPEX_CW_Vest_P37_N97_Rifle_no4_P41_2","V_SPEX_CW_Vest_P37_N97","V_SPEX_cw_vest_p37_N97_sten"]];
_eliteLoadoutData set ["glVests", ["V_SPEX_cw_vest_p37_N97_sten_P41_Tin", "V_SPEX_cw_vest_p37_N97_no4_P41_bandoleer"]];
_eliteLoadoutData set ["Hvests", ["V_SPEX_cw_vest_p37_N97_sten_P41", "V_SPEX_cw_vest_p37_N97_sten_P41_2"]];
_eliteLoadoutData set ["backpacks", ["B_SPEX_CW_Sack_P37_N97_gas_assault_roll_1","B_SPEX_CW_Sack_P37_N97_gas_assault_roll_2","B_SPEX_CW_Sack_P37_N97_gas_assault_roll_3","B_SPEX_CW_Sack_P37_N97_gas_assault_shovel_roll","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_roll_3_side","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_roll_2_side","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_2","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_roll_1_side","B_SPEX_CW_Sack_P37_N97_gas_assault_PIAT"]];
_eliteLoadoutData set ["helmets", ["H_SPEX_CW_Helmet_mk3","H_SPEX_CW_Helmet_mk3_net","H_SPEX_CW_Helmet_mk3_ifak"]];
_eliteLoadoutData set ["sniHats", ["H_SPEX_CW_Helmet_mk3_scrim","H_SPEX_CW_Helmet_mk3_scrim_ifak"]];
_eliteLoadoutData set ["slHat", ["H_SPEX_CW_Helmet_mk3_scrim_ifak_tilt","H_SPEX_CW_Helmet_mk3_scrim_ifak_op_tilt"]];
_eliteLoadoutData set ["binoculars", ["SPEX_Binocular_CW"]];

_eliteLoadoutData set ["rifles", [
	["SPEX_No4_Mk1_Enfield_dunkel", "", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""]
	]];
_eliteLoadoutData set ["carbines", [
	["SPEX_No4_Mk1_Enfield_dunkel", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""]
	]];
_eliteLoadoutData set ["grenadeLaunchers", [
	["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""]
	]];
_eliteLoadoutData set ["SMGs", [
	["SPEX_Sten_Mk5", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
	]];
_eliteLoadoutData set ["machineGuns", [
	["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56_AP_MKI", "SPE_30Rnd_770x56_MKVIII"], [], ""]
	]];
_eliteLoadoutData set ["marksmanRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""]
	]];
_eliteLoadoutData set ["sniperRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""]
	]];
_eliteLoadoutData set ["sidearms", [
	["SPEX_Enfield_No2", "", "", "", ["SPEX_6rnd_9x20R"], [], ""],
	["SPEX_Enfield_No2_late", "", "", "", ["SPEX_6rnd_9x20R"], [], ""]
	]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_SPEX_CW_BD_P40", "U_SPEX_CW_BD_P40_open", "U_SPEX_CW_BD_P40_roll", "U_SPEX_CW_BD_P40_puttee"]];
_militaryLoadoutData set ["slUniforms", ["U_SPEX_CW_BD_P40_CSGT","U_SPEX_CW_BD_P40_SGT"]];
_militaryLoadoutData set ["vests", ["V_SPEX_cw_vest_p37_N97_P41","V_SPEX_cw_vest_p37_N97_P41_binoc","V_SPEX_cw_vest_p37_N97_P41_Canteen","V_SPEX_cw_vest_p37_N97_P41_Tin","V_SPEX_cw_vest_p37_N97_no4_P41"]];
_militaryLoadoutData set ["glVests", ["V_SPEX_cw_vest_p37_N97_sten_P41_Tin", "V_SPEX_cw_vest_p37_N97_no4_P41_bandoleer"]];
_militaryLoadoutData set ["Hvests", ["V_SPEX_cw_vest_p37_N97_sten_P41", "V_SPEX_cw_vest_p37_N97_sten_P41_2"]];
_militaryLoadoutData set ["backpacks", ["B_SPEX_CW_Sack_P37_N97_gas_assault_roll_1","B_SPEX_CW_Sack_P37_N97_gas_assault_roll_2","B_SPEX_CW_Sack_P37_N97_gas_assault_roll_3","B_SPEX_CW_Sack_P37_N97_gas_assault_shovel_roll","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_roll_3_side","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_roll_2_side","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_2","B_SPEX_CW_Sack_P37_N97_gas_assault_bren_roll_1_side","B_SPEX_CW_Sack_P37_N97_gas_assault_PIAT"]];
_militaryLoadoutData set ["helmets", ["H_SPEX_CW_Helmet_mk2","H_SPEX_CW_Helmet_mk2_op","H_SPEX_CW_Helmet_mk2_op_tilt","H_SPEX_CW_Helmet_mk2_tilt","H_SPEX_CW_Helmet_mk2_burlap","H_SPEX_CW_Helmet_mk2_burlap_op", "H_SPEX_CW_Helmet_mk2_ifak", "H_SPEX_CW_Helmet_mk2_hessian"]];
_militaryLoadoutData set ["sniHats", ["H_SPEX_CW_mutsdas","H_SPEX_CW_SIDECAP"]];
_militaryLoadoutData set ["slHat", ["H_SPEX_CW_beret_Essex"]];
_militaryLoadoutData set ["binoculars", ["SPEX_Binocular_CW"]];

_militaryLoadoutData set ["rifles", [
	["SPEX_No4_Mk1_Enfield_dunkel", "", "", "", ["SPEX_10Rnd_770x56"], [], ""]
	]];
_militaryLoadoutData set ["carbines", [
	["SPEX_No4_Mk1_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_late_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_mid_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""]
	]];
_militaryLoadoutData set ["grenadeLaunchers", [
	["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
	["SPEX_No1_Mk3_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
	["SPEX_No1_Mk3_mid_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""]
	]];
_militaryLoadoutData set ["SMGs", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
	]];
_militaryLoadoutData set ["machineGuns", [
	["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56"], [], ""]
	]];
_militaryLoadoutData set ["marksmanRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56", "SPE_5Rnd_770x56"], [], ""],
	["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56", "SPE_5Rnd_770x56"], [], ""]
	]];
_militaryLoadoutData set ["sniperRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56", "SPE_5Rnd_770x56"], [], ""],
	["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56", "SPE_5Rnd_770x56"], [], ""]
	]];
_militaryLoadoutData set ["sidearms", [
	["SPEX_Enfield_No2", "", "", "", ["SPEX_6rnd_9x20R"], [], ""],
	["SPEX_Enfield_No2_late", "", "", "", ["SPEX_6rnd_9x20R"], [], ""]
	]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_SPEX_CW_BD_CAN_INV_open", "U_SPEX_CW_BD_CAN_INV"]];
_policeLoadoutData set ["vests", ["V_SPEX_cw_vest_p37_N103_no4_P41", "V_SPEX_cw_vest_p37_N103_no4_P41_bandoleer", "V_SPEX_cw_vest_p37_N103_no4_P41_Canteen", "V_SPEX_cw_vest_p37_N103_no4_P41_Tin", "V_SPEX_cw_vest_p37_N103_no4_P41_2"]];
_policeLoadoutData set ["helmets", ["H_SPEX_CW_Helmet_mk3", "H_SPEX_CW_Helmet_mk3_op", "H_SPEX_CW_Helmet_mk3_net", "H_SPEX_CW_Helmet_mk3_scrim_ifak"]];
_policeLoadoutData set ["SMGs", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""],
	["SPE_Model_37_Trenchgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""],
	["SPEX_No1_Mk3_late_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_mid_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""]
	]];
_policeLoadoutData set ["sidearms", [
	["SPEX_Enfield_No2", "", "", "", ["SPEX_6rnd_9x20R"], [], ""],
	["SPEX_Enfield_No2_late", "", "", "", ["SPEX_6rnd_9x20R"], [], ""]
	]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_SPEX_CW_BD","U_SPEX_CW_BD_open","U_SPEX_CW_BD_roll"]];
_militiaLoadoutData set ["slUniforms", ["U_SPEX_CW_BD_SGT"]];
_militiaLoadoutData set ["vests", ["V_SPEX_CW_Vest_P37_N97_p39","V_SPEX_cw_vest_p37_N97_no1_p39","V_SPEX_cw_vest_p37_N97_no1_p39_bandoleer"]];
_militiaLoadoutData set ["glVests", ["V_SPEX_CW_Vest_P37_N97_Tin"]];
_militiaLoadoutData set ["Hvests", ["V_SPEX_cw_vest_p37_n97_no4"]];
_militiaLoadoutData set ["backpacks", ["B_SPEX_CW_Sack_P37_N97","B_SPEX_CW_Sack_P37_N97_cup","B_SPEX_CW_Sack_P37_N97_PIAT","B_SPEX_CW_Sack_P37_N97_shovel"]];
_militiaLoadoutData set ["helmets", ["H_SPEX_CW_Helmet_mk2","H_SPEX_CW_Helmet_mk2_op","H_SPEX_CW_Helmet_mk2_op_tilt","H_SPEX_CW_Helmet_mk2_tilt","H_SPEX_CW_Helmet_mk2_burlap","H_SPEX_CW_Helmet_mk2_ifak", "H_SPEX_CW_Helmet_mk2_hessian", "H_SPEX_CW_Helmet_mk2_net"]];
_militiaLoadoutData set ["sniHats", ["H_SPEX_CW_beret_gs"]];
_militiaLoadoutData set ["slHat", ["H_SPEX_CW_beret_GEWEHR_GS"]];

_militiaLoadoutData set ["rifles", [
	["SPEX_No1_Mk3_late_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_mid_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["carbines", [
	["SPEX_No1_Mk3_late_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPEX_No1_Mk3_mid_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["grenadeLaunchers", [
	["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
	["SPEX_No1_Mk3_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
	["SPEX_No1_Mk3_mid_Enfield", "SPEX_ACC_2HalfInch_GL_CUP", "", "", ["SPE_5Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""]
	]];
_militiaLoadoutData set ["SMGs", [
	["SPEX_M1928_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP"], [], ""],
	["SPEX_M1928A1_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP"], [], ""]
	]];
_militiaLoadoutData set ["machineGuns", [
	["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
	["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["marksmanRifles", [
	["SPEX_No4_Mk1_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
	["SPEX_No4_Mk1_Enfield_dunkel", "", "", "", ["SPEX_10Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["sniperRifles", [
	["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56", "SPE_5Rnd_770x56"], [], ""],
	["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56", "SPE_5Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["sidearms", [
	["SPEX_Enfield_No2", "", "", "", ["SPEX_6rnd_9x20R"], [], ""],
	["SPEX_Enfield_No2_late", "", "", "", ["SPEX_6rnd_9x20R"], [], ""]
	]];
	
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["U_SPEX_CW_BD_open","U_SPEX_CW_BD_roll"]];
_crewLoadoutData set ["vests", ["V_SPEX_CW_Vest_P37_N61_rac"]];
_crewLoadoutData set ["helmets", ["H_SPEX_CW_Helmet_RAC","H_SPEX_CW_Helmet_RAC_no38"]];
_crewLoadoutData set ["carbines", [
    ["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPEX_CW_RAF_BD","U_SPEX_CW_RAF_BD_glove"]];
_pilotLoadoutData set ["vests", ["V_SPEX_CW_RAF_Schwimm"]];
_pilotLoadoutData set ["helmets", ["H_SPEX_CW_RAF_visor","H_SPEX_CW_RAF_visor_EM","H_SPEX_CW_SIDECAP_RAF_EM","H_SPEX_CW_SIDECAP_RAF_OFFZ"]];
_pilotLoadoutData set ["carbines", [
    ["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
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
