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

["name", "Jointcom"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "Jointcom"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\E22\images\flag_e22_northstar_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_E22_northstar"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["I_SDV_01_F"]] call _fnc_saveToTemplate;

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["I_Quadbike_01_F"];
private _unarmedVehicles = ["E22_B_JTF_D_MRAP_01_F"];
private _armedVehicles = ["E22_B_JTF_D_MRAP_01_hmg_F", "E22_B_JTF_D_MRAP_03_hmg_F", "E22_B_JTF_D_LSV_02_armed_F"];
private _Trucks = ["E22_B_JTF_D_Truck_01_transport_F", "E22_B_JTF_D_Truck_01_covered_F"];
private _cargoTrucks = ["E22_B_JTF_D_Truck_01_transport_F", "E22_B_JTF_D_Truck_01_covered_F"];
private _ammoTrucks = ["E22_B_JTF_D_Truck_01_ammo_F"];
private _repairTrucks = ["E22_B_JTF_D_Truck_01_Repair_F"];
private _fuelTrucks = ["E22_B_JTF_D_Truck_01_fuel_F"];
private _medicalTrucks = ["E22_B_JTF_D_Truck_01_medical_F"];
private _lightAPCs = [];
private _APCs = ["E22_B_JTF_D_APC_Wheeled_03_cannon_F"];
private _IFVs = ["E22_B_JTF_D_APC_Wheeled_03_cannon_F"];
private _airborneVehicles = ["E22_B_JTF_D_APC_Wheeled_03_cannon_F","E22_B_JTF_D_APC_Wheeled_03_cannon_AA_F"];
private _tanks = ["E22_B_JTF_D_MBT_03_cannon_F", "E22_B_JTF_D_MBT_03_cannon_UP_F"];
private _lightTanks = [];
private _aa = ["E22_B_JTF_D_APC_Wheeled_03_cannon_AA_F"];

private _transportBoat = ["E22_B_JTF_D_Boat_Transport_02_F"];
private _gunBoat = ["E22_B_JTF_D_Boat_Armed_01_minigun_F"];

private _planesCAS = ["E22_B_JTF_D_Plane_Fighter_01_F"];
private _planesAA = ["E22_B_JTF_D_Plane_Fighter_01_stealth_F"];

private _planesTransport = ["E22_B_JTF_D_VTOL_01_infantry_F"];
private _gunship = ["E22_B_JTF_D_VTOL_01_armed_F"];

private _helisLight = ["E22_B_JTF_D_Heli_Transport_01_F"];
private _transportHelicopters = ["E22_B_JTF_D_Heli_Transport_03_F"];
private _helisLightAttack =  ["B_Heli_Light_01_dynamicLoadout_F"];
private _helisAttack = ["E22_B_JTF_D_Heli_Attack_03_F"];

private _airPatrol = ["E22_B_JTF_D_Heli_Attack_03_F", "E22_B_JTF_D_Heli_Transport_01_F"];

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

private _artillery = ["B_T_MBT_01_arty_F"];
["magazines", createHashMapFromArray [
    ["B_T_MBT_01_arty_F", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["E22_B_JTF_D_UAV_05_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["I_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:

private _militiaLightArmed = ["E22_B_JTF_D_LSV_02_armed_F"];
private _militiaTrucks = ["E22_B_JTF_D_Truck_01_transport_F"];
private _militiaCars = ["E22_B_JTF_D_LSV_01_unarmed_F"];
private _militiaAPCs = ["E22_B_JTF_D_MRAP_03_hmg_F"];

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

private _staticMG = ["E22_B_JTF_D_HMG_02_high_F"];
private _staticAT = ["I_static_AT_F","I_GMG_01_high_F"];
private _staticAA = ["I_static_AA_F"];
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
private _howitzers =  [];

private _radar = "E22_B_JC_D_Radar_system_01_F";
private _SAM = selectRandom ["E22_B_JC_D_SAM_system_01_F", "E22_B_JC_D_AAA_System_01_F"];

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

private _faces = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"];

["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG"]] call _fnc_saveToTemplate;

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
    ["JCA_launch_Mk153_black_F", "", "acc_pointer_IR", "", ["JCA_MK153_HE_F", "JCA_MK153_HEAT_F"], [], ""], 2.25,
    ["JCA_launch_Mk153_black_F", "", "acc_pointer_IR", "", ["JCA_MK153_HEAT_F", "JCA_MK153_HEAT_F"], [], ""], 1.5,
    ["JCA_launch_Mk153_black_F", "", "acc_pointer_IR", "", ["JCA_MK153_HEAT_F", "JCA_MK153_HE_F"], [], ""], 1.75
]];
_loadoutData set ["ATLaunchers", [
    ["JCA_launch_Mk153_PWS_black_F"], 10
]];
_loadoutData set ["missileATLaunchers", [
    ["JCA_launch_Mk153_black_F", "", "acc_pointer_IR", "", ["JCA_MK153_HEAT_F"], [], ""], 10
]];
_loadoutData set ["AALaunchers", [
    ["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""], 10
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

_loadoutData set ["traitorUniforms", ["E22_U_CombatUniform_01_desert_shortsleeve_F"]];
_loadoutData set ["traitorVests", ["JCA_V_CarrierRigKBT_01_compact_olive_F", "JCA_V_CarrierRigKBT_01_command_olive_F", "JCA_V_CarrierRigKBT_01_holster_olive_F"]];
_loadoutData set ["traitorHats", ["JCA_H_balaclava_01_sand_F","JCA_H_shemagh_01_glasses_sand_F", "JCA_H_Beret_01_sand_F"]];

_loadoutData set ["officerUniforms", ["E22_U_CombatUniform_01_desert_shortsleeve_F"]];
_loadoutData set ["officerVests", ["JCA_V_CarrierRigKBT_01_command_olive_F"]];
_loadoutData set ["officerHats", ["JCA_H_Beret_01_sand_F"]];

_loadoutData set ["cloakUniforms", ["U_B_GhillieSuit"]];
_loadoutData set ["cloakVests", ["JCA_V_CarrierRigKBT_01_recon_sand_F", "JCA_V_CarrierRigKBT_01_light_sand_F"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["JCA_V_CarrierRigKBT_01_recon_sand_F"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["E22_B_RadioBag_01_desert_F"]];
_loadoutData set ["atBackpacks", ["E22_B_Kitbag_desert"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["JCA_H_Beret_01_black_F", "JCA_H_shemagh_01_glasses_black_F"]];
_loadoutData set ["sniHats", ["JCA_H_balaclava_01_black_F"]];

_loadoutData set ["glasses", [
    "JCA_G_shemagh_01_sand_F",
    "JCA_G_shemagh_01_black_F",
    "JCA_G_Headset_Combat_01_black_F"
]];
_loadoutData set ["goggles", []];

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
_sfLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_F", 4]];
_sfLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_recon_sand_F", 6, "JCA_V_CarrierRigKBT_01_tactical_sand_F", 2, "JCA_V_CarrierRigKBT_01_command_sand_F", 4]];
_sfLoadoutData set ["Hvests", ["JCA_V_CarrierRigKBT_01_tactical_sand_F", 10]];
_sfLoadoutData set ["backpacks", ["E22_B_Kitbag_desert", 6, "E22_B_CombatPack_desert", 4, "B_TacticalPack_blk", 2]];
_sfLoadoutData set ["helmets", ["E22_H_HelmetHBK_desert_F", 2.5, "E22_H_HelmetHBK_desert_headset_F", 2.5, "E22_H_Cap_desert_F", 5, "E22_H_Booniehat_desert_F", 4, "E22_H_Watchcap_black_hs_F", 3, "E22_H_HelmetHBK_desert_F", 2]];
_sfLoadoutData set ["slHat", ["E22_H_HelmetHBK_desert_F", 2.5, "E22_H_HelmetHBK_desert_headset_F", 2.5, "E22_H_Cap_desert_F", 5, "E22_H_Booniehat_desert_F", 4, "E22_H_Watchcap_black_hs_F", 3, "E22_H_HelmetHBK_desert_F", 2]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];

_sfRifleOptics = ["JCA_optic_ACOG_sand", 4, "JCA_optic_IHO_sand_magnifier", 2, "JCA_optic_MROS_sand_magnifier", 2];
_sfSlRifleOptics = ["JCA_optic_ACOG_sand", 5.5, "JCA_optic_AICO_sand", 3.5, "JCA_optic_CRBS_sand", 4.5];
_sfAttachments = ["JCA_acc_DualMount_sand_Pointer", 4, "JCA_acc_LaserModule_sand_Pointer", 4, "JCA_acc_flashlight_tactical_sand", 2];

_sfLoadoutData set ["slRifles", [
    ["JCA_arifle_HK433_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 6,
    ["JCA_arifle_HK433_sand_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 4,
    ["JCA_arifle_HK437_AFG_black_F", "JCA_muzzle_snds_300_Enhanced_sand", _sfAttachments, _sfSlRifleOptics, ["JCA_30Rnd_300BLK_EMAG", "JCA_30Rnd_300BLK_EMAG"], [], ""], 6,
    ["JCA_arifle_HK437_AFG_sand_F", "JCA_muzzle_snds_300_Enhanced_sand", _sfAttachments, _sfSlRifleOptics, ["JCA_30Rnd_300BLK_EMAG", "JCA_30Rnd_300BLK_EMAG"], [], ""], 4
]];
_sfLoadoutData set ["rifles", [
    ["JCA_arifle_HK433_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 7.5,
    ["JCA_arifle_HK433_sand_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_M4A4_AFG_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
    ["JCA_arifle_M4A4_AFG_sand_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 3.5,
    ["JCA_arifle_M4A4_VFG_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
    ["JCA_arifle_M4A4_VFG_sand_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 3.5
]];
_sfLoadoutData set ["carbines", [
    ["JCA_arifle_HK433_short_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_HK433_short_sand_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3.5
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["JCA_arifle_M4A4_GL_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_Illumination_F"], ""], 5.5,
    ["JCA_arifle_M4A4_GL_sand_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_Illumination_F"], ""], 3.5
]];

_sfSMGOptics = ["JCA_optic_AHO_sand", 8, "JCA_optic_ROS_black", 4, "JCA_optic_MROS_sand", 6];
_sfLoadoutData set ["SMGs", [
    ["JCA_smg_MP5_VFG_black_F", "JCA_muzzle_snds_9MM_enhanced_sand", _sfAttachments, _sfSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 6,
    ["JCA_smg_MP5_VFG_sand_F", "JCA_muzzle_snds_9MM_enhanced_sand", _sfAttachments, _sfSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 4,
    ["JCA_smg_UMP_VFG_black_F", "JCA_muzzle_snds_45_tactical_sand", _sfAttachments, _sfSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 6,
    ["JCA_smg_UMP_VFG_sand_F", "JCA_muzzle_snds_45_tactical_sand", _sfAttachments, _sfSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 4
]];

_sfMGOptics = ["JCA_optic_ROS_black", 3.5, "", 8.5];
_sfLoadoutData set ["machineGuns", [
    ["E22_LMG_04_black_F", "JCA_muzzle_snds_556_advanced_sand", _sfAttachments, _sfMGOptics, ["E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_Red_F"], [], "JCA_bipod_04_sand"], 10
]];

_sfMarksmanOptics = ["JCA_optic_AICO_sand", 10, "JCA_optic_CRBS_sand", 5];
_sfLoadoutData set ["marksmanRifles", [
    ["JCA_arifle_SR10_VFG_black_F", "JCA_muzzle_snds_762_tactical_sand", "", _sfMarksmanOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3,
    ["JCA_arifle_SR10_VFG_sand_F", "JCA_muzzle_snds_762_tactical_sand", "", _sfMarksmanOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3,
    ["JCA_arifle_SR25_black_F", "JCA_muzzle_snds_762_tactical_sand", "", _sfMarksmanOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 5,
    ["JCA_arifle_SR25_sand_F", "JCA_muzzle_snds_762_tactical_sand", "", _sfMarksmanOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 3.5
]];

_sfSniperOptics = ["JCA_optic_MRPS_sand", 10, "JCA_optic_HPPO_sand", 5, "JCA_optic_HPCS_sand", 5];
_sfLoadoutData set ["sniperRifles", [
    ["JCA_srifle_AWM_black_F", "JCA_muzzle_snds_AWM_sand", "", _sfSniperOptics, ["JCA_5Rnd_338LM_AWM_Mag"], [], "JCA_bipod_04_sand"], 10,
    ["JCA_srifle_AWM_sand_F", "JCA_muzzle_snds_AWM_sand", "", _sfSniperOptics, ["JCA_5Rnd_338LM_AWM_Mag"], [], "JCA_bipod_04_sand"], 5
]];

_sfLoadoutData set ["sidearms", ["JCA_hgun_Mk23_black_F", 10, "JCA_hgun_Mk23_sand_F", 10]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_F", 6, "E22_U_CombatUniform_desert_shortsleeve_F", 3, "E22_U_CombatUniform_01_desert_shortsleeve_gloves_F", 3, "E22_U_CombatUniform_01_desert_shortsleeve_F", 3]];
_eliteLoadoutData set ["slUniforms", ["E22_U_CombatUniform_01_desert_F", 10]];
_eliteLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_combat_sand_F", 5, "JCA_V_CarrierRigKBT_01_light_sand_F", 5, "JCA_V_CarrierRigKBT_01_CQB_sand_F", 5]];
_eliteLoadoutData set ["Hvests", ["JCA_V_CarrierRigKBT_01_tactical_sand_F", 5, "JCA_V_CarrierRigKBT_01_heavy_sand_F", 3]];
_eliteLoadoutData set ["backpacks", ["E22_B_Kitbag_desert", 6, "E22_B_CombatPack_desert", 4, "B_TacticalPack_blk", 2]];
_eliteLoadoutData set ["helmets", ["E22_H_HelmetHBK_desert_F", 5, "E22_H_HelmetHBK_desert_headset_F", 5]];
_eliteLoadoutData set ["slHat", ["E22_H_HelmetHBK_desert_F", 5, "E22_H_HelmetHBK_desert_headset_F", 5]];

_eliteRifleOptics = ["JCA_optic_ACOG_sand", 4, "JCA_optic_IHO_sand_magnifier", 4, "JCA_optic_MROS_sand_magnifier", 4, "", 4];
_eliteSlRifleOptics = ["JCA_optic_ACOG_sand", 5.5, "JCA_optic_AICO_sand", 3.5, "JCA_optic_CRBS_sand", 4.5, "", 2];
_eliteAttachments = ["JCA_acc_DualMount_sand_Pointer", 4, "JCA_acc_LaserModule_sand_Pointer", 4, "JCA_acc_flashlight_tactical_sand", 2, "", 2];

_eliteLoadoutData set ["slRifles", [
    ["JCA_arifle_M4A4_AFG_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3,
    ["JCA_arifle_M4A4_GL_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 2,
    ["JCA_arifle_M4A4_AFG_sand_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3,
    ["JCA_arifle_M4A4_GL_sand_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 2,
    ["JCA_arifle_HK433_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 6,
    ["JCA_arifle_HK433_sand_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 4,
    ["JCA_arifle_HK437_AFG_black_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_300BLK_EMAG", "JCA_30Rnd_300BLK_EMAG"], [], ""], 6,
    ["JCA_arifle_HK437_AFG_sand_F", "", _eliteAttachments, _eliteSlRifleOptics, ["JCA_30Rnd_300BLK_EMAG", "JCA_30Rnd_300BLK_EMAG"], [], ""], 4
]];
_eliteLoadoutData set ["rifles", [
    ["JCA_arifle_M4A1_black_F", "", _eliteAttachments, _eliteRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 2.5,
    ["JCA_arifle_M4A1_sand_F", "", _eliteAttachments, _eliteRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 1.5,
    ["JCA_arifle_M4A4_AFG_black_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 7.5,
    ["JCA_arifle_M4A4_AFG_sand_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
    ["JCA_arifle_M4A4_VFG_black_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
    ["JCA_arifle_M4A4_VFG_sand_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 3.5
]];
_eliteLoadoutData set ["carbines", [
    ["JCA_arifle_M4A1_short_black_F", "", _eliteAttachments, _eliteRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_M4A1_short_sand_F", "", _eliteAttachments, _eliteRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3.5
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["JCA_arifle_M4A1_GL_black_F", "", _eliteAttachments, _eliteRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 3,
    ["JCA_arifle_M4A1_GL_sand_F", "", _eliteAttachments, _eliteRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 1.5,
    ["JCA_arifle_M4A4_GL_black_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_Illumination_F"], ""], 5.5,
    ["JCA_arifle_M4A4_GL_sand_F", "", _eliteAttachments, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_Illumination_F"], ""], 3.5
]];

_eliteSMGOptics = ["JCA_optic_AHO_sand", 4, "JCA_optic_IHO_sand", 4, "JCA_optic_ARO_sand", 6];
_eliteLoadoutData set ["SMGs", [
    ["JCA_smg_MP5_FL_black_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1.5,
    ["JCA_smg_MP5_FL_sand_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1.5,
    ["JCA_smg_MP5_AFG_black_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1.5,
    ["JCA_smg_MP5_AFG_sand_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1.5,
    ["JCA_smg_MP5_VFG_black_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 6,
    ["JCA_smg_MP5_VFG_sand_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 4,
    ["JCA_smg_UMP_black_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1.5,
    ["JCA_smg_UMP_sand_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1.5,
    ["JCA_smg_UMP_AFG_black_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1.5,
    ["JCA_smg_UMP_AFG_sand_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1.5,
    ["JCA_smg_UMP_VFG_black_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 6,
    ["JCA_smg_UMP_VFG_sand_F", "", _eliteAttachments, _eliteSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 4
]];

_eliteMGOptics = ["JCA_optic_ROS_black", 3.5, "", 8.5];
_eliteLoadoutData set ["machineGuns", [
    ["E22_LMG_04_black_F", "", _eliteAttachments, _eliteMGOptics, ["E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_Red_F"], [], "JCA_bipod_04_sand"], 10
]];

_eliteMarksmanOptics = ["JCA_optic_AICO_sand", 10, "JCA_optic_CRBS_sand", 5];
_eliteLoadoutData set ["marksmanRifles", [
    ["JCA_arifle_SR10_VFG_black_F", "", "", _eliteMarksmanOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3,
    ["JCA_arifle_SR10_VFG_sand_F", "", "", _eliteMarksmanOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3,
    ["JCA_arifle_SR25_black_F", "", "", _eliteMarksmanOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 5,
    ["JCA_arifle_SR25_sand_F", "", "", _eliteMarksmanOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 3.5
]];

_eliteSniperOptics = ["JCA_optic_MRPS_sand", 10, "JCA_optic_HPPO_sand", 5, "JCA_optic_HPCS_sand", 5];
_eliteLoadoutData set ["sniperRifles", [
    ["JCA_arifle_SR25_black_F", "", "", _eliteSniperOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 5,
    ["JCA_arifle_SR25_sand_F", "", "", _eliteSniperOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 3.5,
    ["JCA_arifle_SR10_VFG_black_F", "", "", _eliteSniperOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 5,
    ["JCA_arifle_SR10_VFG_sand_F", "", "", _eliteSniperOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3.5,
    ["JCA_srifle_AWM_black_F", "", "", _eliteSniperOptics, ["JCA_5Rnd_338LM_AWM_Mag"], [], "JCA_bipod_04_sand"], 10,
    ["JCA_srifle_AWM_sand_F", "", "", _eliteSniperOptics, ["JCA_5Rnd_338LM_AWM_Mag"], [], "JCA_bipod_04_sand"], 5
]];

_eliteLoadoutData set ["sidearms", ["JCA_hgun_P320_black_F", 10, "JCA_hgun_P320_sand_F", 10]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_F", 2, "E22_U_CombatUniform_desert_shortsleeve_F", 4, "E22_U_CombatUniform_01_desert_shortsleeve_gloves_F", 4, "E22_U_CombatUniform_01_desert_shortsleeve_F", 4]];
_militaryLoadoutData set ["slUniforms", ["E22_U_CombatUniform_01_desert_F", 10]];
_militaryLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_combat_sand_F", 5, "JCA_V_CarrierRigKBT_01_light_sand_F", 5, "JCA_V_CarrierRigKBT_01_CQB_sand_F", 5]];
_militaryLoadoutData set ["Hvests", ["JCA_V_CarrierRigKBT_01_tactical_sand_F", 5, "JCA_V_CarrierRigKBT_01_heavy_sand_F", 1]];
_militaryLoadoutData set ["backpacks", ["E22_B_Kitbag_desert", 4, "E22_B_CombatPack_desert", 4, "B_TacticalPack_blk", 2]];
_militaryLoadoutData set ["helmets", ["E22_H_HelmetHBK_desert_F", 5, "E22_H_HelmetHBK_desert_headset_F", 5, "E22_H_Cap_desert_F", 3, "E22_H_Booniehat_desert_F", 1, "E22_H_Watchcap_black_hs_F", 2]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryRifleOptics = ["JCA_optic_ACOG_sand", 4, "JCA_optic_IHO_sand_magnifier", 2, "JCA_optic_MROS_sand_magnifier", 2, "", 4];
_militarySlRifleOptics = ["JCA_optic_ACOG_sand", 5.5, "JCA_optic_AHO_sand", 3.5, "JCA_optic_ACOG_sand", 4.5, "", 2];
_militaryAttachments = ["JCA_acc_DualMount_sand_Pointer", 4, "JCA_acc_LaserModule_sand_Pointer", 4, "JCA_acc_flashlight_tactical_sand", 2, "", 4];

_militaryLoadoutData set ["slRifles", [
    ["JCA_arifle_M4A4_AFG_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 6,
    ["JCA_arifle_M4A4_GL_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["JCA_arifle_M4A4_AFG_sand_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 4,
    ["JCA_arifle_M4A4_GL_sand_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 2.5,
    ["JCA_arifle_HK433_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 4,
    ["JCA_arifle_HK433_sand_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 2,
    ["JCA_arifle_HK437_AFG_black_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_300BLK_EMAG", "JCA_30Rnd_300BLK_EMAG"], [], ""], 4,
    ["JCA_arifle_HK437_AFG_sand_F", "", _militaryAttachments, _militarySlRifleOptics, ["JCA_30Rnd_300BLK_EMAG", "JCA_30Rnd_300BLK_EMAG"], [], ""], 2
]];
_militaryLoadoutData set ["rifles", [
    ["JCA_arifle_M4A1_black_F", "", _militaryAttachments, _militaryRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_M4A1_sand_F", "", _militaryAttachments, _militaryRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3.5,
    ["JCA_arifle_M4A4_AFG_black_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
    ["JCA_arifle_M4A4_AFG_sand_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 3.5,
    ["JCA_arifle_M4A4_VFG_black_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 3.5,
    ["JCA_arifle_M4A4_VFG_sand_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 1.5
]];
_militaryLoadoutData set ["carbines", [
    ["JCA_arifle_M4A1_short_black_F", "", _militaryAttachments, _militaryRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_M4A1_short_sand_F", "", _militaryAttachments, _militaryRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3.5
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["JCA_arifle_M4A1_GL_black_F", "", _militaryAttachments, _militaryRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 5,
    ["JCA_arifle_M4A1_GL_sand_F", "", _militaryAttachments, _militaryRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 3.5,
    ["JCA_arifle_M4A4_GL_black_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_Illumination_F"], ""], 3.5,
    ["JCA_arifle_M4A4_GL_sand_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell", "UGL_FlareGreen_Illumination_F"], ""], 1.5
]];

_militarySMGOptics = ["JCA_optic_AHO_sand", 4, "JCA_optic_IHO_sand", 4, "JCA_optic_ARO_sand", 6];
_militaryLoadoutData set ["SMGs", [
    ["JCA_smg_MP5_FL_black_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 3,
    ["JCA_smg_MP5_FL_sand_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1.5,
    ["JCA_smg_MP5_AFG_black_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 6,
    ["JCA_smg_MP5_AFG_sand_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 3,
    ["JCA_smg_MP5_VFG_black_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 3,
    ["JCA_smg_MP5_VFG_sand_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1.5,
    ["JCA_smg_UMP_black_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 3,
    ["JCA_smg_UMP_sand_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1.5,
    ["JCA_smg_UMP_AFG_black_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 6,
    ["JCA_smg_UMP_AFG_sand_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 3,
    ["JCA_smg_UMP_VFG_black_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 3,
    ["JCA_smg_UMP_VFG_sand_F", "", _militaryAttachments, _militarySMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1.5
]];

_militaryMGOptics = ["JCA_optic_ROS_black", 3.5, "", 8.5];
_militaryLoadoutData set ["machineGuns", [
    ["E22_LMG_04_black_F", "", _militaryAttachments, _militaryMGOptics, ["E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_Red_F"], [], "JCA_bipod_04_sand"], 10
]];

_militaryMarksmanOptics = ["JCA_optic_AICO_sand", 10, "JCA_optic_CRBS_sand", 5];
_militaryLoadoutData set ["marksmanRifles", [
    ["JCA_arifle_SR10_VFG_black_F", "", "", _militaryMarksmanOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 5,
    ["JCA_arifle_SR10_VFG_sand_F", "", "", _militaryMarksmanOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3.5,
    ["JCA_arifle_SR25_black_F", "", "", _militaryMarksmanOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 3,
    ["JCA_arifle_SR25_sand_F", "", "", _militaryMarksmanOptics, ["JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_PMAG","JCA_20Rnd_762x51_SMAG"], [], "JCA_bipod_04_sand"], 1.5
]];

_militarySniperOptics = ["JCA_optic_MRPS_sand", 10, "JCA_optic_HPPO_sand", 5, "JCA_optic_HPCS_sand", 5];
_militaryLoadoutData set ["sniperRifles", [
    ["JCA_arifle_SR10_VFG_black_F", "", "", _militarySniperOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 5,
    ["JCA_arifle_SR10_VFG_sand_F", "", "", _militarySniperOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 3.5,
    ["JCA_srifle_AWM_black_F", "", "", _militarySniperOptics, ["JCA_5Rnd_338LM_AWM_Mag"], [], "JCA_bipod_04_sand"], 10,
    ["JCA_srifle_AWM_sand_F", "", "", _militarySniperOptics, ["JCA_5Rnd_338LM_AWM_Mag"], [], "JCA_bipod_04_sand"], 5
]];

_militaryLoadoutData set ["sidearms", ["JCA_hgun_P226_black_F", 10, "JCA_hgun_P226_sand_F", 10]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["E22_U_CombatUniform_01_navy_shortsleeve_gloves_F", 10, "E22_U_CombatUniform_01_navy_shortsleeve_F", 10]];
_policeLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_compact_black_F", 4, "JCA_V_CarrierRigKBT_01_light_black_F", 2]];
_policeLoadoutData set ["helmets", ["E22_H_Beret_01_JTF_blue_F", 10, "E22_H_Cap_navy_F", 10, "JCA_H_Beret_01_headset_black_F", 10]];

_policeSMGOptics = ["JCA_optic_ARO_black", 3, "", 4];
_policeAttachments = ["JCA_acc_flashlight_MP5_black", 6, "", 4];
_policeLoadoutData set ["SMGs", [
    ["JCA_smg_MP5_FL_black_F", "", _policeAttachments, _policeSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 3,
    ["JCA_smg_MP5_AFG_black_F", "", _policeAttachments, _policeSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 2,
    ["JCA_smg_MP5_VFG_black_F", "", _policeAttachments, _policeSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1,
    ["JCA_smg_UMP_black_F", "", _policeAttachments, _policeSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 3,
    ["JCA_smg_UMP_AFG_black_F", "", _policeAttachments, _policeSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 2,
    ["JCA_smg_UMP_VFG_black_F", "", _policeAttachments, _policeSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1
]];
_policeLoadoutData set ["sidearms", ["JCA_hgun_M9A1_black_F", 10]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["E22_U_CombatUniform_desert_tee_F", 3, "E22_U_CombatUniform_desert_Shirt_shemagh_F", 2, "E22_U_CombatUniform_desert_Shirt_F", 4]];
_militiaLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_holster_black_F", 1.25, "JCA_V_CarrierRigKBT_01_sand_F", 5, "JCA_V_CarrierRigKBT_01_olive_F", 3.75]];
_militiaLoadoutData set ["Hvests", ["JCA_V_CarrierRigKBT_01_command_sand_F", 10]];
_militiaLoadoutData set ["backpacks", ["E22_B_Kitbag_desert", 4, "E22_B_CombatPack_desert", 4, "B_TacticalPack_blk", 2]];
_militiaLoadoutData set ["helmets", ["E22_H_Cap_desert_F", 5, "E22_H_Booniehat_desert_F", 4, "E22_H_Watchcap_black_hs_F", 3, "E22_H_HelmetHBK_desert_F", 2]];

_militiaRifleOptics = ["JCA_optic_ACOG_sand", 2, "JCA_optic_IHO_sand_magnifier", 2, "JCA_optic_MROS_sand_magnifier", 2, "", 8];
_militiaSlRifleOptics = ["optic_ACO_grn", 3.5, "JCA_optic_ACOG_sand", 4.5, "", 2];
_militiaAttachments = ["JCA_acc_DualMount_sand_Pointer", 4, "JCA_acc_LaserModule_sand_Pointer", 4, "JCA_acc_flashlight_tactical_sand", 2, "", 6];

_militiaLoadoutData set ["slRifles", [
    ["JCA_arifle_M4A4_AFG_black_F", "", _militiaAttachments, _militiaSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 6,
    ["JCA_arifle_M4A4_GL_black_F", "", _militiaAttachments, _militiaSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["JCA_arifle_M4A4_AFG_sand_F", "", _militiaAttachments, _militiaSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 4,
    ["JCA_arifle_M4A4_GL_sand_F", "", _militiaAttachments, _militiaSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 2.5,
    ["JCA_arifle_M4A4_VFG_black_F", "", _militiaAttachments, _militiaSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 6,
    ["JCA_arifle_M4A4_VFG_sand_F", "", _militiaAttachments, _militiaSlRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 4
]];
_militiaLoadoutData set ["rifles", [
    ["JCA_arifle_M4A1_black_F", "", _militiaAttachments, _militiaRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_M4A1_sand_F", "", _militiaAttachments, _militiaRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3.5,
    ["JCA_arifle_M16A4_black_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 5.5,
    ["JCA_arifle_M16A4_sand_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], [], ""], 3.5
]];
_militiaLoadoutData set ["carbines", [
    ["JCA_arifle_M4A1_short_black_F", "", _militiaAttachments, _militiaRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 5.5,
    ["JCA_arifle_M4A1_short_sand_F", "", _militiaAttachments, _militiaRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], [], ""], 3.5
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["JCA_arifle_M16A4_GL_black_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 8,
    ["JCA_arifle_M16A4_GL_sand_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["JCA_arifle_M4A1_GL_black_F", "", _militiaAttachments, _militiaRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
    ["JCA_arifle_M4A1_GL_sand_F", "", _militiaAttachments, _militiaRifleOptics, ["JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_EMAG", "JCA_30Rnd_556x45_PMAG"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 2
]];

_militiaSMGOptics = ["JCA_optic_ARO_sand", 3, "JCA_optic_CRO_sand", 3, "", 7];
_militiaLoadoutData set ["SMGs", [
    ["JCA_smg_MP5_FL_black_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 3,
    ["JCA_smg_MP5_FL_sand_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1,
    ["JCA_smg_MP5_AFG_black_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 2,
    ["JCA_smg_MP5_AFG_sand_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1,
    ["JCA_smg_MP5_VFG_black_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 1,
    ["JCA_smg_MP5_VFG_sand_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag", "JCA_30Rnd_9x21_MP5_Mag"], [], ""], 0.5,
    ["JCA_smg_UMP_black_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 3,
    ["JCA_smg_UMP_sand_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1,
    ["JCA_smg_UMP_AFG_black_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 2,
    ["JCA_smg_UMP_AFG_sand_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1,
    ["JCA_smg_UMP_VFG_black_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 1,
    ["JCA_smg_UMP_VFG_sand_F", "", _militiaAttachments, _militiaSMGOptics, ["JCA_25Rnd_45ACP_UMP_Mag"], [], ""], 0.5
]];

_militiaMGOptics = ["JCA_optic_ROS_black", 3.5, "", 8.5];
_militiaLoadoutData set ["machineGuns", [
    ["E22_LMG_04_black_F", "", _militiaAttachments, _militiaMGOptics, ["E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_F", "E22_120Rnd_M30JLSW_Box_Red_F"], [], "JCA_bipod_04_sand"], 10
]];

_militiaMarksmanOptics = ["JCA_optic_AICO_sand", 3, "JCA_optic_ACOG_sand", 3, "JCA_optic_CRBS_sand", 6];
_militiaLoadoutData set ["marksmanRifles", [
    ["JCA_arifle_SR10_AFG_sand_F", "", _militiaAttachments, _militiaMarksmanOptics, ["10Rnd_Mk14_762x51_Mag","10Rnd_Mk14_762x51_Mag","10Rnd_Mk14_762x51_Mag"], [], "bipod_03_F_blk"], 10
]];

_militiaSniperOptics = ["JCA_optic_MRPS_sand", 10];
_militiaLoadoutData set ["sniperRifles", [
    ["JCA_arifle_SR10_VFG_black_F", "", "", _militiaSniperOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 10,
    ["JCA_arifle_SR10_VFG_sand_F", "", "", _militiaSniperOptics, ["JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_SMAG","JCA_20Rnd_762x51_PMAG"], [], "JCA_bipod_04_sand"], 5
]];

_militiaLoadoutData set ["sidearms", ["JCA_hgun_M9A1_black_F", 10, "JCA_hgun_M9A1_sand_F", 10]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["E22_U_Coveralls_desert_F", 10]];
_crewLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_crew_sand_F", 10]];
_crewLoadoutData set ["helmets", ["E22_H_Helmet_Crew_desert_F", 10]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["E22_U_Coveralls_desert_F", 5]];
_pilotLoadoutData set ["vests", ["JCA_V_CarrierRigKBT_01_compact_sand_F", 10]];
_pilotLoadoutData set ["helmets", ["E22_H_Helmet_Heli_JTF_VisorUp_desert_F", 5, "E22_H_Helmet_Heli_JTF_desert_F", 5]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
