//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", localize "STR_A3AP_setupFactionsTab_OPTRE_Cov_name"] call _fnc_saveToTemplate; ///use localized name
["spawnMarkerName", localize "STR_supportcorridorCovenant"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_covenant_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_covenant"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death! ///replace it with OPTRE analog one day
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type ///replace it with OPTRE analog one day
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type ///replace it with OPTRE analog one day

["vehiclesBasic", ["OPTRE_FC_Ghost"]] call _fnc_saveToTemplate; ///need to write some compatability layer to transform regular one into driverless. Probably in addvehicle
["vehiclesLightUnarmed", ["OPTRE_FC_Spectre_Empty_Ultra","OPTRE_FC_Spectre_Empty_Needler","OPTRE_FC_Spectre_Empty"]] call _fnc_saveToTemplate; //driver + 2 troops 
["vehiclesLightArmed", ["OPTRE_FC_Ghost", "OPTRE_FC_Ghost_Armor", "OPTRE_FC_Ghost_Ultra", "OPTRE_FC_Ghost_Zealot", "OPTRE_FC_Ghost_FuelRod", "OPTRE_FC_Ghost_Needler"]] call _fnc_saveToTemplate; 
["vehiclesTrucks", ["OPTRE_FC_Spectre_Transport", "OPTRE_FC_Spectre_Transport_Needler", "OPTRE_FC_Spectre_Transport_Ultra"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_FC_Spectre_Transport", "OPTRE_FC_Spectre_Transport_Needler", "OPTRE_FC_Spectre_Transport_Ultra"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["a3a_OPTRE_FC_Spectre_Recovery_Needler_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["a3a_OPTRE_FC_Spectre_Recovery_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["a3a_OPTRE_FC_Spectre_Recovery_Ultra_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["a3a_OPTRE_FC_Spectre_Transport_Ultra_medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["OPTRE_FC_Spectre_AI", "OPTRE_FC_Spectre_AI_Needler", "OPTRE_FC_Spectre_AI_Ultra"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["OPTRE_FC_Ghost", "OPTRE_FC_Ghost_Armor", "OPTRE_FC_Ghost_Ultra", "OPTRE_FC_Ghost_Zealot", "OPTRE_FC_Ghost_FuelRod", "OPTRE_FC_Ghost_Needler"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["OPTRE_FC_Spectre_AT", "OPTRE_FC_Spectre_AT_Needler", "OPTRE_FC_Spectre_AT_Ultra"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_FC_Wraith_Tank"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["OPTRE_FC_Wraith"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_FC_AA_Wraith", "OPTRE_FC_AA_Wraith_NOFLAK", "OPTRE_FC_AA_Wraith_Needle", "OPTRE_FC_Spectre_AA", "OPTRE_FC_Spectre_AA_Needler", "OPTRE_FC_Spectre_AA_Ultra", "OPTRE_FC_Ghost_AA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["optre_catfish_ins_unarmed_f"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["optre_catfish_ins_mg_f"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["OPTRE_FC_Type26B_Banshee","OPTRE_FC_Type26B_Ultra_Banshee","OPTRE_FC_Type26N_Banshee","OPTRE_FC_Type27_Banshee"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_FC_Type26B_Ultra_Banshee","OPTRE_FC_Type26N_Banshee","OPTRE_FC_Type27_Banshee"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate; // I pray this works

["vehiclesPlanesGunship", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate;

if (["MEU_Covenant"] call A3U_fnc_hasAddon) then {
    ["vehiclesHelisTransport", ["MEU_Phantom_Light"]] call _fnc_saveToTemplate;
    ["vehiclesHelisAttack", ["MEU_Phantom"]] call _fnc_saveToTemplate;
} else {
    ["vehiclesHelisTransport", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate;
    ["vehiclesHelisAttack", ["OPTRE_FC_Spirit_Concussion"]] call _fnc_saveToTemplate;
};

["vehiclesHelisLightAttack", ["OPTRE_FC_Type26B_BansheeH","OPTRE_FC_Type26B_Ultra_BansheeH","OPTRE_FC_Type26N_BansheeH","OPTRE_FC_Type27_BansheeH"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", ["OPTRE_FC_Type26B_BansheeH","OPTRE_FC_Type26B_Ultra_BansheeH","OPTRE_FC_Type26N_BansheeH","OPTRE_FC_Type27_BansheeH"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["OPTRE_m1015_mule_mlr_ins_IND"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["OPTRE_m1015_mule_mlr_ins_IND", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["OPTRE_FC_Ghost"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["OPTRE_FC_Spectre_Transport"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["OPTRE_FC_Spectre_Empty"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["OPTRE_FC_Spectre_AI"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_FC_Spectre_Empty", "OPTRE_FC_Spectre_Transport"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_FC_Pek_Pattern_Plasma_Static_MMG_Base", "OPTRE_FC_Pek_Pattern_Plasma_Static_noShield_MMG_Base", "OPTRE_FC_Pek_Pattern_Plasma_Static_LMG",
"OPTRE_FC_Pek_Pattern_Plasma_Static_LMG_Brute_Shield",
"OPTRE_FC_Pek_Pattern_Plasma_Static_noShield_LMG",
"OPTRE_FC_Pek_Pattern_Plasma_Static_GMG",
"OPTRE_FC_Pek_Pattern_Plasma_Static_noShield_GMG"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_FC_T26_AT","OPTRE_FC_Locust"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_FC_T26_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["Plasma_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "O_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", ["OPTRE_FC_T29N_SAM"/* , "OPTRE_FC_TyrantAA_StandAlone" */]] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "Guided_Plasma_Mag_Test"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["OPTRE_FC_ModuleExplosive_Fuelrod_AT_Mine
OPTRE_FC_ModuleExplosive_Light_Plasma_AT_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["OPTRE_FC_ModuleExplosive_Needle_Mine
OPTRE_FC_ModuleExplosive_Needle_TallWide_Mine
OPTRE_FC_ModuleExplosive_Needle_Tall_Mine
OPTRE_FC_ModuleExplosive_Needle_Wide_Mine"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["Land_Pod_Heli_Transport_04_covered_F"]] call _fnc_saveToTemplate; 
["variants", [
    ["Land_Pod_Heli_Transport_04_covered_F", ["Black",1]]
]] call _fnc_saveToTemplate;

#include "OPTRE_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
["insignia", ["OPTRE_Insignia_emblems_skull", ""]] call _fnc_saveToTemplate;
["voices", ["EliteVO_1"]] call _fnc_saveToTemplate;
["faces", [
    "sangheiliHead_03","sangheiliHead_03S2","sangheiliHead_03S1",
    "sangheiliHead_LV","sangheiliHead_LVS2","sangheiliHead_LVS1",
    "sangheiliHead_02","sangheiliHead_02S2","sangheiliHead_02S1",
    "sangheiliHead_01","sangheiliHead_01S2","sangheiliHead_01S1",
    "sangheiliHead_VP","sangheiliHead_VPS2","sangheiliHead_VPS1"
]] call _fnc_saveToTemplate;
["sfVoices", ["EliteVO_2"]] call _fnc_saveToTemplate;
["sfFaces", [
    "sangheiliHead_03","sangheiliHead_03S2","sangheiliHead_03S1",
    "sangheiliHead_LV","sangheiliHead_LVS2","sangheiliHead_LVS1",
    "sangheiliHead_02","sangheiliHead_02S2","sangheiliHead_02S1",
    "sangheiliHead_01","sangheiliHead_01S2","sangheiliHead_01S1",
    "sangheiliHead_VP","sangheiliHead_VPS2","sangheiliHead_VPS1"
]] call _fnc_saveToTemplate;
["eliteFaces",[
    "sangheiliHead_03","sangheiliHead_03S2","sangheiliHead_03S1",
    "sangheiliHead_LV","sangheiliHead_LVS2","sangheiliHead_LVS1",
    "sangheiliHead_02","sangheiliHead_02S2","sangheiliHead_02S1",
    "sangheiliHead_01","sangheiliHead_01S2","sangheiliHead_01S1",
    "sangheiliHead_VP","sangheiliHead_VPS2","sangheiliHead_VPS1"
]] call _fnc_saveToTemplate;
["eliteVoices", ["EliteVO_2"]];

["polFaces", ["OPTRE_JackalFace_01", "OPTRE_JackalFace_02", "OPTRE_JackalFace_03"]] call _fnc_saveToTemplate; // so jackals don't have arma man heads... trust me that will stay in your mind
["polVoices", ["jackalvo_01"]] call _fnc_saveToTemplate;
["milFaces",  ["OPTRE_JackalFace_01", "OPTRE_JackalFace_02", "OPTRE_JackalFace_03"]] call _fnc_saveToTemplate;
["milVoices", ["jackalvo_01"]] call _fnc_saveToTemplate;

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

_loadoutData set ["ATLaunchers", [
    ["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack"], [], ""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", [
    ["OPTRE_FC_T33_FuelRod_Cannon_Guided", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack_Guided"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["OPTRE_FC_FuelRod_Mine","OPTRE_FC_PlasmaMine"]];
_loadoutData set ["APMines", ["OPTRE_FC_NeedleMine_Dispenser_AntiInfantry"]];
_loadoutData set ["lightExplosives", ["C7_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["C12_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["OPTRE_FC_PlasmaGrenade"]];
_loadoutData set ["smokeGrenades", ["OPTRE_M2_Smoke"]];
_loadoutData set ["signalsmokeGrenades", [
    "OPTRE_M2_Smoke_Blue",
    "OPTRE_M2_Smoke_Green",
    "OPTRE_M2_Smoke_Orange",
    "OPTRE_M2_Smoke_Purple",
    "OPTRE_M2_Smoke_Red",
    "OPTRE_M2_Smoke_Yellow",
    "OPTRE_M8_Flare_Blue",
    "OPTRE_M8_Flare_Green",
    "OPTRE_M8_Flare",
    "OPTRE_M8_Flare_White",
    "OPTRE_M8_Flare_Yellow"
]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["OPTRE_FC_NVG"]];
_loadoutData set ["binoculars", ["OPTRE_Binoculars"]];
_loadoutData set ["rangefinders", ["OPTRE_Smartfinder"]];

_loadoutData set ["traitorUniforms", ["OPTRE_UNSC_Army_Uniform_T2_BLK_SlimLeg"]]; //should probably just use a base class
_loadoutData set ["traitorVests", ["OPTRE_UNSC_M52D_Armor_Venom"]];
_loadoutData set ["traitorHats", ["OPTRE_UNSC_CH252D_Helmet_Venom"]];

_loadoutData set ["officerUniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_loadoutData set ["officerVests", ["OPTRE_FC_Elite_Armor_FieldMarshal"]];
_loadoutData set ["officerHats", ["OPTRE_FC_Elite_Helmet_FieldMarshal"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["sniUniforms", []];
_loadoutData set ["atVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["athelmets", []];
_loadoutData set ["enghelmets", []];
_loadoutData set ["glhelmets", []];
_loadoutData set ["medhelmets", []];
_loadoutData set ["mghelmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries", "OPTRE_FC_BubbleShield"];
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

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_sfLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_SpecOps"]];
_sfLoadoutData set ["slVests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_sfLoadoutData set ["mgVests", ["OPTRE_FC_Elite_Armor_SpecOps"]];
_sfLoadoutData set ["medVests", ["OPTRE_FC_Elite_Armor_SpecOps"]];
_sfLoadoutData set ["glVests", ["OPTRE_FC_Elite_Armor_SpecOps"]];
_sfLoadoutData set ["backpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan"]];
_sfLoadoutData set ["slBackpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan"]];
_sfLoadoutData set ["atBackpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan"]];
_sfLoadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515_Spartan"]];
_sfLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_SpecOps"]];
_sfLoadoutData set ["slHat", ["OPTRE_FC_Elite_Helmet_Ultra"]];
_sfLoadoutData set ["sniHats", ["OPTRE_FC_Elite_Helmet_SpecOps"]];

_sfLoadoutData set ["slRifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51B_Carbine", "", "", "", ["OPTRE_FC_Blamite_Mag", "OPTRE_FC_Blamite_Mag", "OPTRE_FC_Blamite_Mag"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""],
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""],
    ["OPTRE_FC_T25J_Rifle", "", "", "", ["OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T25J_Rifle", "", "", "", ["OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""],
    ["OPTRE_FC_T51B_Carbine", "", "", "", ["OPTRE_FC_Blamite_Mag", "OPTRE_FC_Blamite_Mag", "OPTRE_FC_Blamite_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle_Folded", "", "", "", ["OPTRE_FC_T25_Rifle_Battery"], [], ""],
    ["OPTRE_FC_T25J_Rifle_Folded", "", "", "", ["OPTRE_FC_T25J_Rifle_Battery"], [], ""]
]];

_sfLoadoutData set ["lightATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];
_sfLoadoutData set ["ATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_eliteLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_eliteLoadoutData set ["mgVests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_eliteLoadoutData set ["medVests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_eliteLoadoutData set ["slVests", ["OPTRE_FC_Elite_Armor_Officer"]];
_eliteLoadoutData set ["glVests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_eliteLoadoutData set ["engVests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_eliteLoadoutData set ["backpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan_Red"]];
_eliteLoadoutData set ["slBackpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan_Red"]];
_eliteLoadoutData set ["atBackpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan_Red"]];
_eliteLoadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515_Spartan"]];
_eliteLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Ultra"]];
_eliteLoadoutData set ["slHat", ["OPTRE_FC_Elite_Helmet_Officer"]];
_eliteLoadoutData set ["sniHats", ["OPTRE_FC_Elite_Helmet_Ultra"]];

_eliteLoadoutData set ["slRifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""],
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""],
    ["OPTRE_FC_T25J_Rifle", "", "", "", ["OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T25J_Rifle", "", "", "", ["OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery", "OPTRE_FC_T25J_Rifle_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""],
    ["OPTRE_FC_T51B_Carbine", "", "", "", ["OPTRE_FC_Blamite_Mag", "OPTRE_FC_Blamite_Mag", "OPTRE_FC_Blamite_Mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle_Folded", "", "", "", ["OPTRE_FC_T25_Rifle_Battery"], [], ""],
    ["OPTRE_FC_T25J_Rifle_Folded", "", "", "", ["OPTRE_FC_T25J_Rifle_Battery"], [], ""]
]];

_eliteLoadoutData set ["lightATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];
_eliteLoadoutData set ["ATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_militaryLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Minor"]];
_militaryLoadoutData set ["atVests", ["OPTRE_FC_Elite_Armor_Major"]];
_militaryLoadoutData set ["mgVests", ["OPTRE_FC_Elite_Armor_Major"]];
_militaryLoadoutData set ["medVests", ["OPTRE_FC_Elite_Armor_Minor"]];
_militaryLoadoutData set ["slVests", ["OPTRE_FC_Elite_Armor_Officer"]];
_militaryLoadoutData set ["glVests", ["OPTRE_FC_Elite_Armor_Major"]];
_militaryLoadoutData set ["engVests", ["OPTRE_FC_Elite_Armor_Minor"]];
_militaryLoadoutData set ["backpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan"]];
_militaryLoadoutData set ["slBackpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan_Orange"]];
_militaryLoadoutData set ["atBackpacks", ["OPTRE_FC_Gheocin_Combat_Support_Pod_Spartan_Orange"]];
_militaryLoadoutData  set ["longRangeRadios", ["OPTRE_ANPRC_515_Spartan"]];
_militaryLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Minor"]];
_militaryLoadoutData set ["athelmets", ["OPTRE_FC_Elite_Helmet_Major"]];
_militaryLoadoutData set ["enghelmets", ["OPTRE_FC_Elite_Helmet_Minor"]];
_militaryLoadoutData set ["glhelmets", ["OPTRE_FC_Elite_Helmet_Major"]];
_militaryLoadoutData set ["medhelmets", ["OPTRE_FC_Elite_Helmet_Minor"]];
_militaryLoadoutData set ["mghelmets", ["OPTRE_FC_Elite_Helmet_Major"]];
_militaryLoadoutData set ["slHat", ["OPTRE_FC_Elite_Helmet_Officer"]];
_militaryLoadoutData set ["sniHats", ["OPTRE_FC_Jackal_SO_Headgear","OPTRE_FC_Jackal_T_Headgear"]];
_militaryLoadoutData set ["sniVests", ["OPTRE_V_Jackal_vest","OPTRE_V_Jackal_Bracer_vest","OPTRE_V_Jackal_gold_vest","OPTRE_V_Jackal_red_vest"]];
_militaryLoadoutData set ["sniUniforms", ["OPTRE_U_Jackal_uniform"]];

_militaryLoadoutData set ["slRifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""],
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];

_militaryLoadoutData set ["lightATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];
_militaryLoadoutData set ["ATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["OPTRE_U_Jackal_uniform"]];
_policeLoadoutData set ["vests", ["OPTRE_V_Jackal_vest"]];
_policeLoadoutData set ["helmets", []];

_policeLoadoutData set ["SMGs", [
    ["OPTRE_FC_Jackal_Shield", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["OPTRE_U_Jackal_uniform"]];
_militiaLoadoutData set ["vests", ["OPTRE_V_Jackal_vest"]];
_militiaLoadoutData set ["atVests", ["OPTRE_V_Jackal_gold_vest"]];
_militiaLoadoutData set ["mgVests", ["OPTRE_V_Jackal_gold_vest"]];
_militiaLoadoutData set ["medVests", ["OPTRE_V_Jackal_red_vest"]];
_militiaLoadoutData set ["slVests", ["OPTRE_V_Jackal_Bracer_vest"]];
_militiaLoadoutData set ["glVests", ["OPTRE_V_Jackal_gold_vest"]];
_militiaLoadoutData set ["engVests", ["OPTRE_V_Jackal_red_vest"]];
_militiaLoadoutData set ["sniVests", ["OPTRE_V_Jackal_vest"]];
_militiaLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["atBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["helmets", ["OPTRE_FC_Jackal_SO_Headgear", ""]];
_militiaLoadoutData set ["slHat", ["OPTRE_FC_Jackal_SO_Headgear"]];
_militiaLoadoutData set ["sniHats", ["OPTRE_FC_Jackal_T_Headgear"]];
_militiaLoadoutData set ["glasses", ["OPTRE_FC_Jackal_Bracers", "", ""]];
_militiaLoadoutData set ["goggles", ["OPTRE_FC_Jackal_Bracers", "", ""]];

_militiaLoadoutData set ["slRifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], ""],
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""],
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""],
    ["OPTRE_FC_Jackal_Shield", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery", "OPTRE_FC_Plasma_Pistol_Battery", "OPTRE_FC_Plasma_Pistol_Battery"], [], ""],
    ["OPTRE_FC_Jackal_Shield_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""],
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""],
    ["OPTRE_FC_Jackal_Shield", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery", "OPTRE_FC_Plasma_Pistol_Battery", "OPTRE_FC_Plasma_Pistol_Battery"], [], ""],
    ["OPTRE_FC_Jackal_Shield_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""],
    ["OPTRE_FC_Jackal_Shield", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery", "OPTRE_FC_Plasma_Pistol_Battery", "OPTRE_FC_Plasma_Pistol_Battery"], [], ""],
    ["OPTRE_FC_Jackal_Shield_Needler", "", "", "", ["OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag", "OPTRE_FC_Needler_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];

_militiaLoadoutData set ["lightATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];
_militiaLoadoutData set ["ATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack", "OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_crewLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Zealot"]];
_crewLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Zealot"]];
_crewLoadoutData set ["carbines", [
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_pilotLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_pilotLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Ultra"]];
_pilotLoadoutData set ["carbines", [
    ["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
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
    [["medhelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    [["glhelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [["grenadeLaunchers", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    [["enghelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


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
    [["enghelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    [["athelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["atVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    [["athelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["atVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    [["athelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["atVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    [["mghelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["sniUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["glasses"] call _fnc_setFacewear;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    //["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    [["cloakVests", "sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms", "sniUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
    [["cloakVests", "sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms", "sniUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
private _eliteUnitSL = ["baseClass", "OPTRE_FC_Elite_Officer", false, true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit
private _eliteUnitMajor = ["baseClass", "OPTRE_FC_Elite_Major", false, true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit
private _eliteUnitMinor = ["baseClass", "OPTRE_FC_Elite_Minor", false, true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit
private _eliteUnitMinorAT = ["baseClass", "OPTRE_FC_Elite_MinorAT", false, true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit
private _eliteUnitMinorAA = ["baseClass", "OPTRE_FC_Elite_MinorAA", false, true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit
private _jackalUnit = ["baseClass", "OPTRE_Jackal_Infantry_F", false, true];

private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_eliteUnitSL], [_prefix]],
    ["Radioman", _radiomanTemplate, [_eliteUnitMinor], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_eliteUnitMinor], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _eliteUnitMinor], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _eliteUnitMajor], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _eliteUnitMajor], [_prefix]],
    ["Grenadier", _grenadierTemplate, [_eliteUnitMajor], [_prefix]],
    ["LAT", _latTemplate, [_eliteUnitMinorAT], [_prefix]],
    ["AT", _atTemplate, [_eliteUnitMinorAT], [_prefix]],
    ["AA", _aaTemplate, [_eliteUnitMinorAA], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_eliteUnitMajor], [_prefix]],
    ["Marksman", _marksmanTemplate, [_eliteUnitMajor], [_prefix]],
    ["Sniper", _sniperTemplate, [_eliteUnitMajor], [_prefix]]
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
    ["SquadLeader", _squadLeaderTemplate, [_eliteUnitSL], [_prefix]],
    ["Radioman", _radiomanTemplate, [_eliteUnitMinor], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_eliteUnitMinor], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _eliteUnitMinor], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _eliteUnitMajor], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _eliteUnitMajor], [_prefix]],
    ["Grenadier", _grenadierTemplate, [_eliteUnitMajor], [_prefix]],
    ["LAT", _latTemplate, [_eliteUnitMinorAT], [_prefix]],
    ["AT", _atTemplate, [_eliteUnitMinorAT], [_prefix]],
    ["AA", _aaTemplate, [_eliteUnitMinorAA], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_eliteUnitMajor], [_prefix]],
    ["Marksman", _marksmanTemplate, [_jackalUnit], [_prefix]],
    ["Sniper", _sniperTemplate, [_jackalUnit], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [_jackalUnit], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [_jackalUnit], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate, [["baseClass", "OPTRE_Jackal_base_F", false, true]], [_prefix]],
    ["Standard", _policeTemplate, [["baseClass", "OPTRE_Jackal_base_F", false, true]], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_jackalUnit], [_prefix]],
    ["Radioman", _radiomanTemplate, [_jackalUnit], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_jackalUnit], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _jackalUnit], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _jackalUnit], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _jackalUnit], [_prefix]],
    ["Grenadier", _grenadierTemplate, [_jackalUnit], [_prefix]],
    ["LAT", _latTemplate, [_jackalUnit], [_prefix]],
    ["AT", _atTemplate, [_jackalUnit], [_prefix]],
    ["AA", _aaTemplate, [_jackalUnit], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_jackalUnit], [_prefix]],
    ["Marksman", _marksmanTemplate, [_jackalUnit], [_prefix]],
    ["Sniper", _sniperTemplate, [_jackalUnit], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [_jackalUnit], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [_jackalUnit], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_eliteUnitSL], [_prefix]],
    ["Radioman", _radiomanTemplate, [_eliteUnitMinor], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_eliteUnitMinor], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _eliteUnitMinor], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _eliteUnitMajor], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _eliteUnitMajor], [_prefix]],
    ["Grenadier", _grenadierTemplate, [_eliteUnitMajor], [_prefix]],
    ["LAT", _latTemplate, [_eliteUnitMinorAT], [_prefix]],
    ["AT", _atTemplate, [_eliteUnitMinorAT], [_prefix]],
    ["AA", _aaTemplate, [_eliteUnitMinorAA], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_eliteUnitMajor], [_prefix]],
    ["Marksman", _marksmanTemplate, [_eliteUnitMajor], [_prefix]],
    ["Sniper", _sniperTemplate, [_eliteUnitMajor], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [_eliteUnitMajor], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [_eliteUnitMajor], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false, true]]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false, true]]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false, true]]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
