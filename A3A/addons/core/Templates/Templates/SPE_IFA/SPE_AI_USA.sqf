//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "SPE_Faction_US"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SPE_US_G503_MB_Open"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SPE_US_G503_MB", "SPE_US_G503_MB_Armoured"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SPE_US_G503_MB_M1919_Armoured", "SPE_US_G503_MB_M2_Armoured", "SPE_US_G503_MB_M2_PATROL", "SPE_US_G503_MB_M1919_PATROL"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SPE_US_M3_Halftrack_Unarmed", "SPE_CCKW_353_Open", "SPE_CCKW_353"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SPE_US_M3_Halftrack_Ammo", "SPE_CCKW_353_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SPE_US_M3_Halftrack_Repair", "SPE_CCKW_353_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SPE_US_M3_Halftrack_Fuel", "SPE_CCKW_353_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SPE_US_M3_Halftrack_Ambulance", "SPE_US_G503_MB_Ambulance", "SPE_CCKW_353_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["SPE_CCKW_353_M2", "SPE_US_M3_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SPE_US_M3_Halftrack", "SPE_US_M16_Halftrack", "SPE_US_M3_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["SPE_M18_Hellcat", "SPE_M10", "SPE_M8_LAC_ringMount", "SPE_M8_LAC"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SPE_M4A0_75_Early", "SPE_M4A0_75", "SPE_M4A1_76", "SPE_M4A1_75", "SPE_M4A0_composite", "SPE_M4A0_105", "SPE_M4A1_75_erla", "SPE_M4A3_105", "SPE_M4A3_75", "SPE_M4A3_76"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SPE_US_M16_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["SPE_M20_AUC"]] call _fnc_saveToTemplate;
private _vehiclesLightTanks = ["SPE_M8_LAC_ringMount", "SPE_M8_LAC"];

if (isClass (configFile >> "CfgPatches" >> "MWB_M24Chaffee")) then {
    _vehiclesLightTanks append ["MWB_M24Chaffee"];
};
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;

private _vehiclesTransportBoats = ["I_G_Boat_Transport_01_F"];
private _vehiclesGunBoats = ["I_G_Boat_Transport_01_F"];
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_c_Vehicles_Boats_c")) then {
    _vehiclesTransportBoats = ["SPEX_LCVP"];
	_vehiclesGunBoats = ["SPEX_LCVP"];
};
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SPE_P47"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SPE_P47"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["JK_B_C47_F"]] call _fnc_saveToTemplate;

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
["vehiclesMilitiaLightArmed", ["SPE_US_G503_MB_M1919", "SPE_US_G503_MB_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPE_US_G503_MB_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SPE_M20_AUC"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["SPE_M1919_M2_Trench_Deployed"]] call _fnc_saveToTemplate;
["staticAT", ["SPE_57mm_M1", "SPE_105mm_M3_Direct"]] call _fnc_saveToTemplate;
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
["SPE_M1A1_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["SPE_M9_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6A3"], [], ""],
["SPE_M9A1_Bazooka", "", "", "",["SPE_1Rnd_60mm_M6A3"], [], ""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["SPE_US_M1A1_ATMINE_mag"]];
_loadoutData set ["APMines", ["SPE_US_M3_Pressure_MINE_mag"]];
_loadoutData set ["lightExplosives", ["SPE_US_TNT_half_pound_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_US_TNT_4pound_mag"]];

_loadoutData set ["antiInfantryGrenades", ["SPE_US_Mk_2"]];
_loadoutData set ["antiTankGrenades", ["SPE_US_AN_M14"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_US_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_US_ItemCompass"]];
_loadoutData set ["radios", ["TFAR_SCR536"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["SPE_Binocular_US"]];
_loadoutData set ["rangefinders", ["SPE_Binocular_US"]];

_loadoutData set ["traitorUniforms", ["U_SPE_US_Private_1st"]];
_loadoutData set ["traitorVests", ["V_SPE_US_Vest_Garand"]];
_loadoutData set ["traitorHats", ["H_SPE_US_Helmet"]];

_loadoutData set ["officerUniforms", ["U_SPE_US_CC_1LT"]];
_loadoutData set ["officerVests", ["V_SPE_US_Vest_Carbine_nco_Radio"]];
_loadoutData set ["officerHats", ["H_SPE_US_Helmet_Cap"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", ["B_SPE_US_Radio", "B_SPE_US_Radio_alt"]];
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
_sfLoadoutData set ["uniforms", ["U_SPE_US_AB_Uniform_M42_padded_gas", "U_SPE_US_AB_Uniform_M42_padded_gas_glove", "U_SPE_US_AB_Uniform_M42_padded_gas_knife", "U_SPE_US_AB_Uniform_M42_padded_gas_506", "", ""]];
_sfLoadoutData set ["vests", ["V_SPE_US_Vest_AB_padded_1","V_SPE_US_Vest_AB_padded_thompson","V_SPE_US_Vest_AB_padded_mk2"]];
_sfLoadoutData set ["glVests", ["V_SPE_US_Vest_AB_padded_eng"]];
_sfLoadoutData set ["Hvests", ["V_SPE_US_Vest_AB_padded_M1919"]];
_sfLoadoutData set ["backpacks", ["B_SPE_US_M36","B_SPE_US_M36_Bandoleer","B_SPE_US_M36_m6","B_SPE_US_M36_Rocketbag","B_SPE_US_M36_Rope","B_SPE_US_M36_m6_Bandoleer","B_SPE_US_M36_roll","B_SPE_US_M36_roll_2","B_SPE_US_M36_Bandoleer_mk2"]];
_sfLoadoutData set ["helmets", ["H_SPE_US_AB_Helmet","H_SPE_US_AB_Helmet_Net","H_SPE_US_AB_Helmet_polar","H_SPE_US_AB_Helmet_os","H_SPE_US_AB_Helmet_Scrim","H_SPE_US_AB_Helmet_Net_os"]];
_sfLoadoutData set ["sniHats", ["H_SPE_US_AB_Helmet","H_SPE_US_AB_Helmet_Net","H_SPE_US_AB_Helmet_polar","H_SPE_US_AB_Helmet_os","H_SPE_US_AB_Helmet_Scrim","H_SPE_US_AB_Helmet_Net_os"]];
_sfLoadoutData set ["slHat", ["H_SPE_US_AB_Helmet_CO", "H_SPE_US_AB_Helmet_CO_ns"]];
_sfLoadoutData set ["binoculars", ["LIB_Binocular_US"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
	["SPE_M1A1_Carbine", "", "", "", ["SPE_15Rnd_762x33"], [], ""]
	]];
_sfLoadoutData set ["carbines", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""]
	]];
_sfLoadoutData set ["grenadeLaunchers", [
	["SPE_M1_Garand", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63"], ["SPE_1Rnd_G_M9A1","SPE_1Rnd_G_Mk2"], ""]
	]];
_sfLoadoutData set ["SMGs", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""]
	]];
_sfLoadoutData set ["machineGuns", [
	["SPE_M1919A4", "", "", "", ["SPE_100Rnd_762x63", "SPE_50Rnd_762x63"], [], ""]
	]];
_sfLoadoutData set ["marksmanRifles", [
	["SPE_M1A1_Carbine", "", "", "", ["SPE_15Rnd_762x33"], [], ""]
	]];
_sfLoadoutData set ["sniperRifles", [
	["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_M2_AP"], [], ""]
	]];
_sfLoadoutData set ["sidearms", [
	["SPE_M1911", "", "", "", ["SPE_7Rnd_45ACP_1911"], [], ""]
	]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["U_SPE_US_HBT44", "U_SPE_US_HBT44_roll", "U_SPE_US_HBT44_tuck", "U_SPE_US_HBT44_late", "U_SPE_US_HBT44_Half", "U_SPE_US_HBT44_trop", "U_SPE_US_HBT44_tuck_late"]];
_eliteLoadoutData set ["slUniforms", ["U_SPE_US_HBT44_tuck"]];
_eliteLoadoutData set ["vests", ["V_SPE_US_Vest_Carbine_m43","V_SPE_US_Vest_Carbine_eng","V_SPE_US_Vest_Carbine","V_SPE_US_Vest_Carbine_mk2"]];
_eliteLoadoutData set ["glVests", ["V_SPE_US_Vest_Thompson_M43", "V_SPE_US_Vest_Thompson"]];
_eliteLoadoutData set ["Hvests", ["V_SPE_US_Vest_Asst_MG", "V_SPE_US_Vest_M1919"]];
_eliteLoadoutData set ["backpacks", ["B_SPE_US_M36","B_SPE_US_M36_Bandoleer","B_SPE_US_M36_m6","B_SPE_US_M36_Rocketbag","B_SPE_US_M36_Rope","B_SPE_US_M36_m6_Bandoleer","B_SPE_US_M36_roll","B_SPE_US_M36_roll_2","B_SPE_US_M36_Bandoleer_mk2"]];
_eliteLoadoutData set ["helmets", ["H_SPE_US_Helmet","H_SPE_US_Helmet_os","H_SPE_US_Helmet_Net","H_SPE_US_Helmet_band_net","H_SPE_US_Helmet_ns","H_SPE_US_Helmet_band_net_up", "H_SPE_US_Helmet_band_net_os", "H_SPE_US_Helmet_band_net_ns"]];
_eliteLoadoutData set ["sniHats", ["H_SPE_US_Helmet","H_SPE_US_Helmet_os","H_SPE_US_Helmet_Net","H_SPE_US_Helmet_band_net","H_SPE_US_Helmet_ns","H_SPE_US_Helmet_band_net_up", "H_SPE_US_Helmet_band_net_os", "H_SPE_US_Helmet_band_net_ns"]];
_eliteLoadoutData set ["slHat", ["H_SPE_US_Helmet_First_lieutenant"]];
_eliteLoadoutData set ["binoculars", ["SPE_Binocular_US"]];

_eliteLoadoutData set ["rifles", [
	["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63"], [], ""]
	]];
_eliteLoadoutData set ["carbines", [
	["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33"], [], ""]
	]];
_eliteLoadoutData set ["grenadeLaunchers", [
	["SPE_M1_Garand", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63"], ["SPE_1Rnd_G_M9A1","SPE_1Rnd_G_Mk2"], ""]
	]];
_eliteLoadoutData set ["SMGs", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""],
	["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
	]];
_eliteLoadoutData set ["machineGuns", [
	["SPE_M1918A2_BAR", "", "", "", ["SPE_20Rnd_762x63"], [], ""],
    ["SPE_M1919A6", "", "", "", ["SPE_100Rnd_762x63", "SPE_50Rnd_762x63"], [], ""]
	]];
_eliteLoadoutData set ["marksmanRifles", [
	["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63"], [], ""]
	]];
_eliteLoadoutData set ["sniperRifles", [
	["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_t"], [], ""]
	]];
_eliteLoadoutData set ["sidearms", [
	["SPE_M1911", "", "", "", ["SPE_7Rnd_45ACP_1911"], [], ""]
	]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_SPE_US_CC_EM", "U_SPE_US_CC_EM_roll", "U_SPE_US_CC_EM_late", "U_SPE_US_CC_EM_late_roll"]];
_militaryLoadoutData set ["slUniforms", ["U_SPE_US_CC_1LT"]];
_militaryLoadoutData set ["vests", ["V_SPE_US_Vest_Carbine_m43","V_SPE_US_Vest_Carbine_eng","V_SPE_US_Vest_Carbine","V_SPE_US_Vest_Carbine_mk2"]];
_militaryLoadoutData set ["glVests", ["V_SPE_US_Vest_Thompson_M43", "V_SPE_US_Vest_Thompson"]];
_militaryLoadoutData set ["Hvests", ["V_SPE_US_Vest_Asst_MG", "V_SPE_US_Vest_M1919"]];
_militaryLoadoutData set ["backpacks", ["B_SPE_US_M36","B_SPE_US_M36_Bandoleer","B_SPE_US_M36_m6","B_SPE_US_M36_Rocketbag","B_SPE_US_M36_Rope","B_SPE_US_M36_m6_Bandoleer","B_SPE_US_M36_roll","B_SPE_US_M36_roll_2","B_SPE_US_M36_Bandoleer_mk2"]];
_militaryLoadoutData set ["helmets", ["H_SPE_US_Helmet","H_SPE_US_Helmet_os","H_SPE_US_Helmet_Net","H_SPE_US_Helmet_band_net","H_SPE_US_Helmet_ns","H_SPE_US_Helmet_band_net_up", "H_SPE_US_Helmet_band_net_os", "H_SPE_US_Helmet_band_net_ns"]];
_militaryLoadoutData set ["sniHats", ["H_SPE_US_Helmet","H_SPE_US_Helmet_os","H_SPE_US_Helmet_Net","H_SPE_US_Helmet_band_net","H_SPE_US_Helmet_ns","H_SPE_US_Helmet_band_net_up", "H_SPE_US_Helmet_band_net_os", "H_SPE_US_Helmet_band_net_ns"]];
_militaryLoadoutData set ["slHat", ["H_SPE_US_Helmet_First_lieutenant"]];
_militaryLoadoutData set ["binoculars", ["SPE_Binocular_US"]];

_militaryLoadoutData set ["rifles", [
	["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63"], [], ""]
	]];
_militaryLoadoutData set ["carbines", [
	["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33"], [], ""]
	]];
_militaryLoadoutData set ["grenadeLaunchers", [
	["SPE_M1_Garand", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63"], ["SPE_1Rnd_G_M9A1","SPE_1Rnd_G_Mk2"], ""]
	]];
_militaryLoadoutData set ["SMGs", [
	["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP"], [], ""],
	["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
	]];
_militaryLoadoutData set ["machineGuns", [
	["SPE_M1918A2_erla_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M1"], [], "SPE_M1918A2_BAR_Bipod"],
    ["SPE_M1919A6", "", "", "", ["SPE_50Rnd_762x63"], [], ""]
	]];
_militaryLoadoutData set ["marksmanRifles", [
	["SPE_M1903A3_Springfield", "", "", "", ["SPE_5Rnd_762x63_M1"], [], ""],
    ["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63"], [], ""]
	]];
_militaryLoadoutData set ["sniperRifles", [
	["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_t"], [], ""]
	]];
_militaryLoadoutData set ["sidearms", [
	["SPE_M1911", "", "", "", ["SPE_7Rnd_45ACP_1911"], [], ""]
	]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_SPE_FR_HBT_Uniform", "U_SPE_FR_HBT_Uniform_Trop"]];
_policeLoadoutData set ["vests", ["V_SPE_US_Vest_Garand", "V_SPE_US_Vest_Garand_45", "V_SPE_US_Vest_Garand_mk2", "V_SPE_US_Vest_Garand_map"]];
_policeLoadoutData set ["helmets", ["H_SPE_FR_Adrian", "H_SPE_FR_Adrian_ns", "H_SPE_FR_Adrian_net", "H_SPE_FR_Adrian_net_ns"]];
_policeLoadoutData set ["SMGs", [
	["SPE_MAS_36", "", "", "", ["SPE_5Rnd_75x54"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPE_MAS_36", "", "", "", ["SPE_5Rnd_75x54"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPE_MAS_36", "", "", "", ["SPE_5Rnd_75x54"], [], ""],
	["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
	["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""],
	["SPE_Model_37_Trenchgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""],
	["SPE_Fusil_Mle_208_12", "", "", "", ["SPE_2Rnd_12x65_Pellets"], [], ""],
	["SPE_Fusil_Mle_208_12_Sawedoff", "", "", "", ["SPE_2Rnd_12x65_Pellets"], [], ""],
	["SPE_No3_Mk1_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""],
	["SPE_No3_Mk1_Enfield", "", "", "", ["SPE_5Rnd_770x56"], [], ""]
	]];
_policeLoadoutData set ["sidearms", [
	["SPE_M1911", "", "", "", ["SPE_7Rnd_45ACP_1911"], [], ""]
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

_militiaLoadoutData set ["rifles", [
	["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63"], [], ""],
	["SPE_M1903A3_Springfield", "", "", "", ["SPE_5Rnd_762x63"], [], ""]
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
	["SPE_M1918A0_BAR", "", "", "", ["SPE_20Rnd_762x63"], [], ""]
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
	
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["U_SPE_US_Tank_Coverall","U_SPE_US_Tank_Coverall_Legging","U_SPE_US_Tank_Coverall_Trop","U_SPE_US_Tank_Coverall_Trop_Legging"]];
_crewLoadoutData set ["vests", ["V_SPE_US_Vest_45"]];
_crewLoadoutData set ["helmets", ["H_SPE_US_Helmet_Tank_NG","H_SPE_US_Helmet_Tank"]];
_crewLoadoutData set ["carbines", [
    ["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPE_US_Pilot","U_SPE_US_Pilot_boot","U_SPE_US_Pilot_glove"]];
_pilotLoadoutData set ["vests", ["V_SPE_US_Vest_45_high"]];
_pilotLoadoutData set ["helmets", ["H_SPE_US_Helmet_Pilot","H_SPE_US_Helmet_Pilot_Glasses_Up","H_SPE_US_Helmet_Pilot_Glasses_Down","H_SPE_US_Helmet_Pilot_Op"]];
_pilotLoadoutData set ["carbines", [
    ["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
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
