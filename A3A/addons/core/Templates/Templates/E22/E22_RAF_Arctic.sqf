private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasSOG = "vn" in A3A_enabledDLC;
private _hasSPE = "spe" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "RAF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "RAF"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\E22\images\flag_e22_raf_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_E22_raf"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["I_SDV_01_F"]] call _fnc_saveToTemplate;

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["I_Quadbike_01_F"];
private _unarmedVehicles = ["E22_B_RAF_A_LSV_02_unarmed_F"];
private _armedVehicles = ["E22_B_RAF_A_LSV_02_armed_F", "E22_B_RAF_A_MRAP_02_hmg_F"];
private _Trucks = ["E22_B_RAF_A_Truck_03_transport_F", "E22_B_RAF_A_Truck_03_covered_F"];
private _cargoTrucks = ["E22_B_RAF_A_Truck_03_transport_F", "E22_B_RAF_A_Truck_03_covered_F"];
private _ammoTrucks = ["E22_B_RAF_A_Truck_03_ammo_F"];
private _repairTrucks = ["E22_B_RAF_A_Truck_03_repair_F"];
private _fuelTrucks = ["E22_B_RAF_A_Truck_03_fuel_F"];
private _medicalTrucks = ["E22_B_RAF_A_Truck_03_medical_F"];
private _lightAPCs = [];
private _APCs = ["E22_B_RAF_A_APC_Wheeled_02_rcws_F"];
private _IFVs = ["E22_B_RAF_A_APC_Tracked_02_cannon_AT_F"];
private _airborneVehicles = ["E22_B_RAF_A_APC_Wheeled_02_rcws_F","E22_B_RAF_A_APC_Tracked_02_cannon_AT_F"];
private _tanks = ["E22_B_RAF_A_MBT_04_cannon_F"];
private _lightTanks = ["E22_B_RAF_A_MBT_02_cannon_F"];
private _aa = ["E22_B_RAF_A_APC_Tracked_02_AA_F"];

private _transportBoat = ["E22_B_RAF_A_Boat_Transport_02_F"];
private _gunBoat = ["a3a_Boat_Armed_01_hmg_blufor_F"];

private _planesCAS = ["E22_B_RAF_A_Plane_CAS_02_dynamicLoadout_F"];
private _planesAA = ["E22_B_RAF_A_Plane_Fighter_02_Stealth_F"];

private _planesTransport = [];
private _gunship = [];

private _helisLight = ["E22_B_RAF_A_Heli_Light_02_unarmed_F"];
private _transportHelicopters = ["E22_B_RAF_A_Heli_Transport_04_covered_F", "E22_B_RAF_A_Heli_Transport_04_bench_F"];
private _helisLightAttack =  ["E22_B_RAF_A_Heli_Light_02_dynamicLoadout_F"];
private _helisAttack = ["E22_B_RAF_A_Heli_Attack_02_dynamicLoadout_F"];

private _airPatrol = ["E22_B_RAF_A_Heli_Light_02_dynamicLoadout_F", "E22_B_RAF_A_Heli_Attack_02_dynamicLoadout_F"];

if (_hasRF) then {
    _basic pushBack "B_Pickup_rf";
    _unarmedVehicles append ["B_Pickup_rf", "B_Pickup_Comms_rf"];
    _armedVehicles append ["B_Pickup_mmg_rf"];
    _aa pushBack "B_Pickup_aat_rf";
    _transportHelicopters pushBack "B_Heli_EC_04_military_RF";
    _helisAttack pushBack "B_Heli_EC_03_RF";
    _airPatrol pushBack "B_Heli_EC_03_RF";
    _policeVehs append ["B_GEN_Pickup_covered_rf"];
};

if (_hasEF) then {
    _transportBoat pushBack "EF_I_CombatBoat_Unarmed_AAF";
    _gunBoat pushBack "EF_I_CombatBoat_HMG_AAF";
};

if (_hasWS) then {
    _cargoTrucks pushBack "I_Truck_02_flatbed_lxWS";
};

private _artillery = ["E22_B_RAF_A_Truck_02_MRL_F"];
["magazines", createHashMapFromArray [
    ["E22_B_RAF_A_Truck_02_MRL_F", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["E22_B_RAF_A_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["I_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:

private _militiaLightArmed = ["E22_B_RAF_A_LSV_02_armed_F"];
private _militiaTrucks = ["E22_B_RAF_A_Truck_03_transport_F"];
private _militiaCars = ["E22_B_RAF_A_LSV_02_unarmed_F"];
private _militiaAPCs = ["E22_B_RAF_A_MRAP_02_hmg_F"];

private _policeVehs = ["B_GEN_Offroad_01_gen_F"];

if (_hasRF) then {
    _policeVehs = ["B_GEN_Pickup_covered_rf"];
};

if (_hasEF) then {
    _policeVehs append ["EF_B_Gyra_GEN", "EF_B_Gyra_HMG_GEN"];
};

if (_hasWS) then {
    _policeVehs pushBack "B_GEN_APC_Wheeled_02_hmg_lxWS";
};

private _staticMG = ["O_HMG_01_high_F"];
private _staticAT = ["I_static_AT_F","I_GMG_01_high_F"];
private _staticAA = ["I_static_AA_F"];
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
private _howitzers =  [];

private _radar = ["E22_B_RAF_A_Radar_System_02_F"];
private _SAM = ["E22_B_RAF_A_SAM_System_04_F"];

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

// (placeholder_mod_content) Benefits from CUP content. Vehicles + equipment.

["vehiclesAirPatrol", _airPatrol] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["howitzerMagazineHE", "",""] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _militiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _militiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _militiaCars] call _fnc_saveToTemplate;
["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;
["vehiclesBasic", _basic] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _planesTransport] call _fnc_saveToTemplate;
["vehiclesHelisLight", _helisLight] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _helisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _helisAttack] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
["staticHowitzers", _howitzers] call _fnc_saveToTemplate;
["vehicleRadar", _radar] call _fnc_saveToTemplate;
["vehicleSam", _SAM] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _planesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _planesAA] call _fnc_saveToTemplate;
["vehiclesArtillery", _artillery] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _lightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _IFVs] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _militiaAPCs] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _unarmedVehicles] call _fnc_saveToTemplate;
["vehiclesLightArmed", _armedVehicles] call _fnc_saveToTemplate;
["vehiclesLightTanks",  _lightTanks] call _fnc_saveToTemplate;
["vehiclesAirborne", _airborneVehicles] call _fnc_saveToTemplate;
["vehiclesAA", _aa] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesTrucks", _Trucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _ammoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _repairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _fuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _medicalTrucks] call _fnc_saveToTemplate;

#include "E22_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

private _faces = ["LivonianHead_1","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5",
"LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9",
"RussianHead_1","RussianHead_2","RussianHead_3","Sturrock",
"WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_12",
"WhiteHead_13","WhiteHead_14","WhiteHead_17","WhiteHead_18",
"WhiteHead_21","WhiteHead_30","RussianHead_4", "RussianHead_5"];

["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;

["insignia", ["", "", ""]] call _fnc_saveToTemplate;
["milInsignia", ["", "", ""]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

// Note on loadout array weighting:
// If a given loadoutData variable has a weighted array, make sure all mod/DLC compats also have a weighted array for the same.
// To simplify work on mod/DLC compats, the weighted arrays here are made to sum up to 10. This is so that compats have a consistent base to work off but is not strictly necessary.

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
    ["E22_RAF_launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""], 5,
    ["launch_B_Titan_short_F", "", "", "", ["Titan_AT", "Titan_AP"], [], ""], 5
]];
_loadoutData set ["ATLaunchers", [
    ["E22_RAF_launch_RPG32_black_F"], 10
]];
_loadoutData set ["missileATLaunchers", [
    ["E22_RAF_launch_Vorona_black_F", "", "", "", ["Vorona_HEAT"], [], ""], 10
]];
_loadoutData set ["AALaunchers", [
    ["launch_B_Titan_F", "", "", "", ["Titan_AA"], [], ""], 10
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["E22_RAF_U_CombatUniform_01_alpine_shortsleeve_F"]];
_loadoutData set ["traitorVests", ["JCA_V_CarrierRigKBT_01_compact_black_F", "JCA_V_CarrierRigKBT_01_command_black_F", "JCA_V_CarrierRigKBT_01_holster_black_F"]];
_loadoutData set ["traitorHats", ["JCA_H_balaclava_01_black_F","JCA_H_shemagh_01_glasses_black_F", "JCA_H_Beret_01_black_F"]];

_loadoutData set ["officerUniforms", ["E22_RAF_U_CombatUniform_01_alpine_shortsleeve_F"]];
_loadoutData set ["officerVests", ["E22_RAF_V_CarrierRigKBT_01_command_alpine_F"]];
_loadoutData set ["officerHats", ["JCA_H_Beret_01_black_F"]];

_loadoutData set ["cloakUniforms", ["U_O_GhillieSuit"]];
_loadoutData set ["cloakVests", ["JCA_V_CarrierRigKBT_01_recon_black_F", "E22_RAF_V_CarrierRigKBT_01_light_alpine_F"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["JCA_V_CarrierRigKBT_01_recon_black_F"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["E22_RAF_B_RadioBag_alpine"]];
_loadoutData set ["atBackpacks", ["E22_RAF_B_Kitbag_alpine"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["JCA_H_Beret_01_black_F", "H_Watchcap_blk"]];
_loadoutData set ["sniHats", ["JCA_H_balaclava_01_black_F"]];

_loadoutData set ["glasses", [
    "JCA_G_shemagh_01_black_F", 1,
    "JCA_G_shemagh_01_glasses_black_F", 1,
    "JCA_G_balaclava_01_black_F", 2,
    "JCA_G_balaclava_01_glasses_black_F", 2
]];
_loadoutData set ["goggles", [
    "E22_G_Goggles_Tactical_black_F", 1,
    "JCA_G_shemagh_01_black_F", 1,
    "JCA_G_shemagh_01_glasses_black_F", 1,
    "JCA_G_balaclava_01_black_F", 2,
    "JCA_G_balaclava_01_glasses_black_F", 2
]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries", "I_IR_Grenade"];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_alpine_F", 2, "E22_RAF_U_CombatUniform_01_alpine_shortsleeve_F", 2, "E22_RAF_U_CombatUniform_01_sweater_alpine_F", 4, "E22_RAF_U_CombatUniform_01_sweater_alpine_shortsleeve_F", 4]];
_sfLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_combat_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_compact_alpine_F", 3, "E22_RAF_V_CarrierRigKBT_01_CQB_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_light_alpine_F", 3]];
_sfLoadoutData set ["Hvests", ["E22_RAF_V_CarrierRigKBT_01_command_alpine_F", 10]];
_sfLoadoutData set ["backpacks", ["E22_RAF_B_Kitbag_alpine", 4, "E22_RAF_B_CombatPack_alpine", 4, "E22_RAF_B_TacticalPack_alpine", 2]];
_sfLoadoutData set ["helmets", ["H_Watchcap_blk", 3, "E22_RAF_H_Helmet_Sparrow_standard_alpine_cover_F", 3, "E22_RAF_H_Helmet_Sparrow_headset_alpine_cover_F", 3, "E22_RAF_H_HelmetHBK_alpine_F", 3, "E22_RAF_H_HelmetHBK_headset_alpine_F", 3]];
_sfLoadoutData set ["slHat", ["H_Watchcap_blk", 3, "E22_RAF_H_Helmet_Sparrow_standard_alpine_cover_F", 3, "E22_RAF_H_Helmet_Sparrow_headset_alpine_cover_F", 3, "E22_RAF_H_HelmetHBK_alpine_F", 3, "E22_RAF_H_HelmetHBK_headset_alpine_F", 3]];

_sfRifleOptics = ["optic_Hamr", 4, "optic_Yorris", 2];
_sfSlRifleOptics = ["optic_ACO_grn", 1, "optic_Hamr", 4];
_sfAttachments = ["acc_flashlight", 4, "acc_pointer_IR", 2, "", 6];

_sfLoadoutData set ["slRifles", [
    ["E22_RAF_arifle_AK12_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 6,
    ["E22_RAF_arifle_AK12_GL_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["E22_RAF_arifle_AK12_U_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 4,
    ["arifle_MSBS65_black_F", "muzzle_snds_H", _sfAttachments, _sfRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_sfLoadoutData set ["rifles", [
    ["E22_RAF_arifle_AK12_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5,
    ["arifle_MSBS65_black_F", "muzzle_snds_H", _sfAttachments, _sfRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_sfLoadoutData set ["carbines", [
    ["E22_RAF_arifle_AK12_U_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_U_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["E22_RAF_arifle_AK12_GL_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["arifle_MSBS65_GL_black_F", "muzzle_snds_H", _sfAttachments, _sfRifleOptics, ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6
]];

_sfSMGOptics = ["", 10];
_sfLoadoutData set ["SMGs", [
    ["SMG_03_black", "muzzle_snds_570", _sfAttachments, _sfSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_black", "muzzle_snds_570", _sfAttachments, _sfSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03_TR_black", "muzzle_snds_570", _sfAttachments, _sfSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_TR_black", "muzzle_snds_570", _sfAttachments, _sfSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3
]];

_sfMGOptics = ["optic_Arco_AK_blk_F", 3.5, "optic_Hamr", 4.5, "optic_DMS", 3.5];
_sfLoadoutData set ["machineGuns", [
    ["E22_RAF_arifle_RPK12_black_F", "E22_RAF_muzzle_snds_545_black", _sfAttachments, _sfMGOptics, ["E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F"], [], ""], 10
]];

_sfMarksmanOptics = ["optic_Arco_AK_blk_F", 3, "optic_MRCO", 3, "optic_DMS", 6];
_sfLoadoutData set ["marksmanRifles", [
    ["E22_RAF_srifle_SVD12_black_F", "muzzle_snds_B", _sfAttachments, _sfMarksmanOptics, ["E22_RAF_16Rnd_762x54_SVD12_Mag_black_F","E22_RAF_16Rnd_762x54_SVD12_Mag_black_F"], [], ""], 5,
    ["E22_RAF_srifle_DMR_01_black_F", "muzzle_snds_B", _sfAttachments, _sfMarksmanOptics, ["E22_RAF_10Rnd_762x54_VS121_Mag_black_F","E22_RAF_10Rnd_762x54_VS121_Mag_black_F"], [], "bipod_02_F_blk"], 5
]];

_sfSniperOptics = ["optic_DMS", 10];
_sfLoadoutData set ["sniperRifles", [
    ["arifle_MSBS65_Mark_black_F", "muzzle_snds_H", "", _sfSniperOptics, ["30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag"], [], "bipod_02_F_blk"], 10
]];

_sfLoadoutData set ["sidearms", ["hgun_Rook40_F", 10]];

if (_hasWS) then {
    (_sfLoadoutData get "slRifles") append [
        ["arifle_XMS_lxWS", "muzzle_snds_M", _sfAttachments, _sfSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "muzzle_snds_M", _sfAttachments, _sfSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
    (_sfLoadoutData get "rifles") append [
        ["arifle_XMS_lxWS", "muzzle_snds_M", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "muzzle_snds_M", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
};

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_alpine_F", 2, "E22_RAF_U_CombatUniform_01_alpine_shortsleeve_F", 2]];
_eliteLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_combat_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_compact_alpine_F", 3, "E22_RAF_V_CarrierRigKBT_01_CQB_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_light_alpine_F", 3]];
_eliteLoadoutData set ["Hvests", ["E22_RAF_V_CarrierRigKBT_01_command_alpine_F", 10]];
_eliteLoadoutData set ["backpacks", ["E22_RAF_B_Kitbag_alpine", 4, "E22_RAF_B_CombatPack_alpine", 4, "E22_RAF_B_TacticalPack_alpine", 2]];
_eliteLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Sparrow_standard_alpine_cover_F", 3, "E22_RAF_H_Helmet_Sparrow_headset_alpine_cover_F", 3, "E22_RAF_H_HelmetHBK_alpine_F", 3, "E22_RAF_H_HelmetHBK_headset_alpine_F", 3]];
_eliteLoadoutData set ["slHat", ["E22_RAF_H_Helmet_Sparrow_standard_alpine_cover_F", 3, "E22_RAF_H_Helmet_Sparrow_headset_alpine_cover_F", 3, "E22_RAF_H_HelmetHBK_alpine_F", 3, "E22_RAF_H_HelmetHBK_headset_alpine_F", 3]];

_eliteRifleOptics = ["optic_Hamr", 4, "optic_Yorris", 2];
_eliteSlRifleOptics = ["optic_ACO_grn", 1, "optic_Hamr", 4];
_eliteAttachments = ["acc_flashlight", 4, "acc_pointer_IR", 2, "", 6];

_eliteLoadoutData set ["slRifles", [
    ["E22_RAF_arifle_AK12_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 6,
    ["E22_RAF_arifle_AK12_GL_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["E22_RAF_arifle_AK12_U_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 4,
    ["arifle_MSBS65_black_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_eliteLoadoutData set ["rifles", [
    ["E22_RAF_arifle_AK12_black_F", "", _eliteAttachments, _eliteRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_black_F", "", _eliteAttachments, _eliteRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5,
    ["arifle_MSBS65_black_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_eliteLoadoutData set ["carbines", [
    ["E22_RAF_arifle_AK12_U_black_F", "", _eliteAttachments, _eliteRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_U_black_F", "", _eliteAttachments, _eliteRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["E22_RAF_arifle_AK12_GL_black_F", "", _eliteAttachments, _eliteRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["arifle_MSBS65_GL_black_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6
]];

_eliteSMGOptics = ["", 10];
_eliteLoadoutData set ["SMGs", [
    ["SMG_03_black", "", _eliteAttachments, _eliteSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_black", "", _eliteAttachments, _eliteSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03_TR_black", "", _eliteAttachments, _eliteSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_TR_black", "", _eliteAttachments, _eliteSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3
]];

_eliteMGOptics = ["optic_Arco_AK_blk_F", 3.5, "optic_Hamr", 4.5, "optic_DMS", 3.5];
_eliteLoadoutData set ["machineGuns", [
    ["E22_RAF_arifle_RPK12_black_F", "", _eliteAttachments, _eliteMGOptics, ["E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F"], [], ""], 10
]];

_eliteMarksmanOptics = ["optic_Arco_AK_blk_F", 3, "optic_MRCO", 3, "optic_DMS", 6];
_eliteLoadoutData set ["marksmanRifles", [
    ["E22_RAF_srifle_SVD12_black_F", "", _eliteAttachments, _eliteMarksmanOptics, ["E22_RAF_16Rnd_762x54_SVD12_Mag_black_F","E22_RAF_16Rnd_762x54_SVD12_Mag_black_F"], [], ""], 5,
    ["E22_RAF_srifle_DMR_01_black_F", "", _eliteAttachments, _eliteMarksmanOptics, ["E22_RAF_10Rnd_762x54_VS121_Mag_black_F","E22_RAF_10Rnd_762x54_VS121_Mag_black_F"], [], "bipod_02_F_blk"], 5
]];

_eliteSniperOptics = ["optic_DMS", 10];
_eliteLoadoutData set ["sniperRifles", [
    ["arifle_MSBS65_Mark_black_F", "", "", _eliteSniperOptics, ["30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag"], [], "bipod_02_F_blk"], 10
]];

_eliteLoadoutData set ["sidearms", ["hgun_Rook40_F", 10]];

if (_hasWS) then {
    (_eliteLoadoutData get "slRifles") append [
        ["arifle_XMS_lxWS", "", _eliteAttachments, _eliteSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "", _eliteAttachments, _eliteSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
    (_eliteLoadoutData get "rifles") append [
        ["arifle_XMS_lxWS", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
};

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_alpine_F", 4, "E22_RAF_U_CombatUniform_01_sweater_alpine_shortsleeve_F", 4]];
_militaryLoadoutData set ["slUniform", ["E22_RAF_U_CombatUniform_01_sweater_alpine_shortsleeve_F", 10]];
_militaryLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_combat_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_compact_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_CQB_alpine_F", 3, "E22_RAF_V_CarrierRigKBT_01_light_alpine_F", 5]];
_militaryLoadoutData set ["Hvests", ["E22_RAF_V_CarrierRigKBT_01_command_alpine_F", 10]];
_militaryLoadoutData set ["backpacks", ["E22_RAF_B_Kitbag_alpine", 4, "E22_RAF_B_CombatPack_alpine", 4, "E22_RAF_B_TacticalPack_alpine", 2]];
_militaryLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Sparrow_standard_alpine_F", 1, "E22_RAF_H_Helmet_Sparrow_headset_alpine_F", 1, "E22_RAF_H_Helmet_Sparrow_standard_alpine_cover_F", 3, "E22_RAF_H_Helmet_Sparrow_headset_alpine_cover_F", 3]];

_militaryRifleOptics = ["optic_ACO_grn", 4, "optic_Yorris", 4, "optic_Hamr", 2, "", 4];
_militarySlRifleOptics = ["optic_ACO_grn", 2, "optic_Yorris", 4, "optic_Hamr", 4];
_militaryAttachments = ["acc_flashlight", 4, "acc_pointer_IR", 2, "", 6];

_militaryLoadoutData set ["slRifles", [
    ["E22_RAF_arifle_AK12_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 6,
    ["E22_RAF_arifle_AK12_GL_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["E22_RAF_arifle_AK12_U_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 4,
    ["arifle_Katiba_GL_F", "", _militaryAttachments, _militarySlRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["arifle_Katiba_F", "", _militaryAttachments, _militarySlRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4,
    ["arifle_MSBS65_black_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_militaryLoadoutData set ["rifles", [
    ["E22_RAF_arifle_AK12_black_F", "", _militaryAttachments, _militaryRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_black_F", "", _militaryAttachments, _militaryRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5,
    ["arifle_Katiba_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4,
    ["arifle_MSBS65_black_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_militaryLoadoutData set ["carbines", [
    ["E22_RAF_arifle_AK12_U_black_F", "", _militaryAttachments, _militaryRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_U_black_F", "", _militaryAttachments, _militaryRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5,
    ["arifle_Katiba_C_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["arifle_Katiba_GL_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["E22_RAF_arifle_AK12_GL_black_F", "", _militaryAttachments, _militaryRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["arifle_MSBS65_GL_black_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6
]];

_militarySMGOptics = ["", 10];
_militaryLoadoutData set ["SMGs", [
    ["SMG_03_black", "", _militaryAttachments, _militarySMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_black", "", _militaryAttachments, _militarySMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03_TR_black", "", _militaryAttachments, _militarySMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_TR_black", "", _militaryAttachments, _militarySMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3
]];

_militaryMGOptics = ["optic_Arco_AK_blk_F", 3.5, "optic_Hamr", 2.5];
_militaryLoadoutData set ["machineGuns", [
    ["E22_RAF_arifle_RPK12_black_F", "", _militaryAttachments, _militaryMGOptics, ["E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F"], [], ""], 10
]];

_militaryMarksmanOptics = ["optic_Arco_AK_blk_F", 3, "optic_MRCO", 3, "optic_DMS", 6];
_militaryLoadoutData set ["marksmanRifles", [
    ["E22_RAF_srifle_SVD12_black_F", "", _militaryAttachments, _militaryMarksmanOptics, ["E22_RAF_16Rnd_762x54_SVD12_Mag_black_F","E22_RAF_16Rnd_762x54_SVD12_Mag_black_F"], [], ""], 5,
    ["E22_RAF_srifle_DMR_01_black_F", "", _militaryAttachments, _militaryMarksmanOptics, ["E22_RAF_10Rnd_762x54_VS121_Mag_black_F","E22_RAF_10Rnd_762x54_VS121_Mag_black_F"], [], "bipod_02_F_blk"], 5
]];

_militarySniperOptics = ["optic_DMS", 10];
_militaryLoadoutData set ["sniperRifles", [
    ["arifle_MSBS65_Mark_black_F", "", "", _militarySniperOptics, ["30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag"], [], "bipod_02_F_blk"], 10
]];

_militaryLoadoutData set ["sidearms", ["hgun_Rook40_F", 10]];

if (_hasWS) then {
    (_militaryLoadoutData get "slRifles") append [
        ["arifle_XMS_lxWS", "", _militaryAttachments, _militarySlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "", _militaryAttachments, _militarySlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
    (_militaryLoadoutData get "rifles") append [
        ["arifle_XMS_lxWS", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
};

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_sweater_alpine_F", 10]];
_policeLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_compact_black_F", 4, "JCA_V_CarrierRigKBT_01_command_black_F", 2]];
_policeLoadoutData set ["helmets", ["JCA_H_Beret_01_black_F", 10, "H_Watchcap_blk", 10, "JCA_H_balaclava_01_black_F", 5]];

_policeSMGOptics = ["", 10];
_policeAttachments = ["", 10];
_policeLoadoutData set ["SMGs", [
    ["SMG_03_black", "", _policeAttachments, _policeSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_black", "", _policeAttachments, _policeSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03_TR_black", "", _policeAttachments, _policeSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_TR_black", "", _policeAttachments, _policeSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3
]];
_policeLoadoutData set ["sidearms", ["hgun_Rook40_F", 10]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_sweater_alpine_F", 2, "E22_RAF_U_CombatUniform_01_sweater_alpine_shortsleeve_F", 4]];
_militiaLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_alpine_F", 5, "E22_RAF_V_CarrierRigKBT_01_combat_alpine_F", 3.75]];
_militiaLoadoutData set ["Hvests", ["E22_RAF_V_CarrierRigKBT_01_command_alpine_F", 10]];
_militiaLoadoutData set ["backpacks", ["E22_RAF_B_Kitbag_alpine", 4, "E22_RAF_B_CombatPack_alpine", 4, "E22_RAF_B_TacticalPack_alpine", 2]];
_militiaLoadoutData set ["helmets", ["H_Watchcap_blk", 5, "E22_RAF_H_Beret_01_alpine_F", 4, "E22_RAF_H_Helmet_Sparrow_standard_alpine_F", 2, "E22_RAF_H_Helmet_Sparrow_headset_alpine_F", 1]];

_militiaRifleOptics = ["optic_ACO_grn", 2, "optic_Yorris", 2, "", 8];
_militiaSlRifleOptics = ["optic_ACO_grn", 2, "optic_Hamr", 4, "", 5];
_militiaAttachments = ["acc_flashlight", 4, "acc_pointer_IR", 2, "", 6];

_militiaLoadoutData set ["slRifles", [
    ["E22_RAF_arifle_AK12_black_F", "", _militiaAttachments, _militiaSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 6,
    ["E22_RAF_arifle_AK12_GL_black_F", "", _militiaAttachments, _militiaSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["E22_RAF_arifle_AK12_U_black_F", "", _militiaAttachments, _militiaSlRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 4,
    ["arifle_Katiba_GL_F", "", _militiaAttachments, _militiaSlRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["arifle_Katiba_F", "", _militiaAttachments, _militiaSlRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_militiaLoadoutData set ["rifles", [
    ["E22_RAF_arifle_AK12_black_F", "", _militiaAttachments, _militiaRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_black_F", "", _militiaAttachments, _militiaRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5,
    ["arifle_Katiba_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_militiaLoadoutData set ["carbines", [
    ["E22_RAF_arifle_AK12_U_black_F", "", _militiaAttachments, _militiaRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 5.5,
    ["E22_RAF_arifle_AK12_U_black_F", "", _militiaAttachments, _militiaRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], [], ""], 3.5,
    ["arifle_Katiba_C_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], [], ""], 4
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["arifle_Katiba_GL_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6,
    ["E22_RAF_arifle_AK12_GL_black_F", "", _militiaAttachments, _militiaRifleOptics, ["E22_RAF_30Rnd_545x39_AK12_Mag_black_F", "E22_RAF_30Rnd_545x39_AK12_Mag_black_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6
]];

_militiaSMGOptics = ["", 10];
_militiaLoadoutData set ["SMGs", [
    ["SMG_03_black", "", _militiaAttachments, _militiaSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_black", "", _militiaAttachments, _militiaSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03_TR_black", "", _militiaAttachments, _militiaSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["SMG_03C_TR_black", "", _militiaAttachments, _militiaSMGOptics, ["50Rnd_570x28_SMG_03"], [], ""], 3
]];

_militiaMGOptics = ["optic_Arco_AK_blk_F", 3.5, "", 8.5];
_militiaLoadoutData set ["machineGuns", [
    ["E22_RAF_arifle_RPK12_black_F", "", _militiaAttachments, _militiaMGOptics, ["E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_F", "E22_RAF_75Rnd_545x39_RPK12_Mag_black_Green_F"], [], ""], 10
]];

_militiaMarksmanOptics = ["optic_Arco_AK_blk_F", 5, "optic_MRCO", 4, "optic_DMS", 3];
_militiaLoadoutData set ["marksmanRifles", [
    ["E22_RAF_srifle_SVD12_black_F", "", _militiaAttachments, _militiaMarksmanOptics, ["E22_RAF_16Rnd_762x54_SVD12_Mag_black_F","E22_RAF_16Rnd_762x54_SVD12_Mag_black_F"], [], ""], 5,
    ["E22_RAF_srifle_DMR_01_black_F", "", _militiaAttachments, _militiaMarksmanOptics, ["E22_RAF_10Rnd_762x54_VS121_Mag_black_F","E22_RAF_10Rnd_762x54_VS121_Mag_black_F"], [], "bipod_02_F_blk"], 5
]];

_militiaSniperOptics = ["optic_DMS", 10];
_militiaLoadoutData set ["sniperRifles", [
    ["arifle_MSBS65_Mark_black_F", "", "", _militiaSniperOptics, ["30Rnd_65x39_caseless_msbs_mag","30Rnd_65x39_caseless_msbs_mag"], [], "bipod_02_F_blk"], 10
]];

_militiaLoadoutData set ["sidearms", ["hgun_Rook40_F", 10]];

if (_hasWS) then {
    (_militiaLoadoutData get "slRifles") append [
        ["arifle_XMS_lxWS", "", _militiaAttachments, _militiaSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
        ["arifle_XMS_M_lxWS", "", _militiaAttachments, _militiaSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5
    ];
    (_militiaLoadoutData get "rifles") append [
        ["arifle_Velko_lxWS", "", _militiaAttachments, _militiaRifleOptics, ["35Rnd_556x45_Velko_reload_tracer_red_lxWS", "35Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""], 5.5,
        ["arifle_VelkoR5_lxWS", "", _militiaAttachments, _militiaRifleOptics, ["35Rnd_556x45_Velko_reload_tracer_red_lxWS", "35Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""], 5.5
    ];
    (_militiaLoadoutData get "machineGuns") append [
        ["LMG_S77_lxWS", "", _militiaAttachments, _militiaRifleOptics, ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS"], [], ""], 5.5,
        ["LMG_S77_Compact_lxWS", "", _militiaAttachments, _militiaRifleOptics, ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS"], [], ""], 5.5
    ];
};

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["E22_RAF_U_CombatUniform_01_alpine_shortsleeve_F", 10]];
_crewLoadoutData set ["vests", ["E22_RAF_V_CarrierRigKBT_01_crew_alpine_F", 10]];
_crewLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Crew_soft_F", 10]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["E22_RAF_U_coveralls_blue_F", 5]];
_pilotLoadoutData set ["vests", ["E22_RAF_V_PilotVest_white_F", 10]];
_pilotLoadoutData set ["helmets", ["E22_RAF_H_Helmet_Heli_VisorUp_white_F", 5, "E22_RAF_H_Helmet_Heli_white_F", 5]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


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

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    // [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    // [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    // [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    // [selectRandomWeighted ["glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
