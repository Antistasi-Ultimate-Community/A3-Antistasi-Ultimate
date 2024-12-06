private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
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

["name", "CSATxSFIA"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "CSAT"]] call _fnc_saveToTemplate;

["flag", "Flag_CSAT_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\WS\flags\CSAT_SFIA.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_csatandsfia_co"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["O_SDV_01_F"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["Land_Pod_Heli_Transport_04_covered_F"]] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_East_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_CSAT_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["O_Quadbike_01_F"];

private _unarmedVehicles = ["O_MRAP_02_F"];
private _armedVehicles = ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"];
private _Trucks = ["O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_02_covered_F"];
private _cargoTrucks = ["O_Truck_02_cargo_lxWS","O_Truck_02_flatbed_lxWS","O_UGV_01_F","O_SFIA_Truck_02_cargo_lxWS","O_SFIA_Truck_02_flatbed_lxWS"];
private _ammoTrucks = ["O_Truck_02_Ammo_F","O_Truck_03_ammo_F","O_SFIA_Truck_02_Ammo_lxWS"];
private _repairTrucks = ["O_Truck_03_repair_F","O_Truck_02_box_F","O_SFIA_Truck_02_box_lxWS"];
private _fuelTrucks = ["O_Truck_03_fuel_F","O_Truck_02_fuel_F","O_SFIA_Truck_02_fuel_lxWS"];
private _medicalTrucks = ["O_Truck_03_medical_F","O_Truck_02_medical_F","a3a_SFIA_Truck_02_medical_F"];
private _lightAPCs = ["O_APC_Wheeled_02_hmg_lxWS","O_APC_Wheeled_02_unarmed_lxWS"];
private _APCs = ["O_APC_Wheeled_02_rcws_v2_F"];
private _IFVs = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_30mm_lxWS"];
private _airborneVehicles = ["O_APC_Wheeled_02_rcws_v2_F","O_APC_Wheeled_02_hmg_lxWS"];
private _lightTanks = ["O_UGV_01_rcws_F"];
private _tanks = ["O_MBT_02_cannon_F","O_MBT_02_railgun_F","O_SFIA_MBT_02_cannon_lxWS"];
private _aa = ["O_APC_Tracked_02_AA_F","O_SFIA_Truck_02_aa_lxWS","O_SFIA_APC_Tracked_02_AA_lxWS"];

private _transportBoat = ["O_Boat_Transport_01_F"];
private _gunBoat = ["O_Boat_Armed_01_hmg_F"];

private _planesCAS = ["O_Plane_CAS_02_dynamicLoadout_F","O_UAV_02_dynamicLoadout_F"];
private _planesAA = ["O_Plane_CAS_02_dynamicLoadout_F","O_UAV_02_dynamicLoadout_F"];

private _planesTransport = [];
private _gunship = [];

private _helisLight = ["O_Heli_Light_02_unarmed_F"];
private _transportHelicopters = [];

private _helisLightAttack = ["O_Heli_Light_02_dynamicLoadout_F"];
private _helisAttack = ["O_Heli_Attack_02_dynamicLoadout_F","O_SFIA_Heli_Attack_02_dynamicLoadout_lxWS"];

private _artillery = ["O_MBT_02_arty_F", "O_SFIA_Truck_02_MRL_lxWS"];
["magazines", createHashMapFromArray [
["O_SFIA_Truck_02_MRL_lxWS", ["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]],
["O_MBT_02_arty_F",["32Rnd_155mm_Mo_shells_O", "2Rnd_155mm_Mo_Cluster_O", "6Rnd_155mm_Mo_mine_O"]],
["gm_pl_army_2s1",["gm_1Rnd_122x447mm_he_of462","gm_1Rnd_122x447mm_he_3of56"]],
["gm_pl_army_ural375d_mlrs",["gm_40Rnd_mlrs_122mm_he_9m22u","gm_40Rnd_mlrs_122mm_icm_9m218","gm_40Rnd_mlrs_122mm_mine_9m28k"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_UAV_02_dynamicLoadout_F", "O_T_UAV_04_CAS_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["I_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
private _militiaTrucks = ["O_SFIA_Truck_02_transport_lxWS","O_SFIA_Truck_02_covered_lxWS"];
private _militiaLightArmed = ["O_SFIA_Offroad_AT_lxWS","O_SFIA_Offroad_armed_lxWS"];
private _militiaCars = ["O_SFIA_Offroad_lxWS"];
private _militiaAPCs = ["O_SFIA_APC_Tracked_02_cannon_lxWS","O_SFIA_APC_Tracked_02_30mm_lxWS","O_SFIA_APC_Wheeled_02_hmg_lxWS","O_SFIA_APC_Wheeled_02_unarmed_lxWS"];

private _policeVehs = ["B_GEN_Offroad_01_gen_F"];

private _staticMG = ["I_HMG_02_high_F","O_HMG_01_high_F"];
private _staticAT = ["O_static_AT_F","O_GMG_01_high_F"];
private _staticAA = ["O_static_AA_F","O_SFIA_ZU23_lxWS"];
["staticMortars", ["O_Mortar_01_F"]] call _fnc_saveToTemplate;
private _howitzers = [];

private _radar = [];
private _SAM = [];

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "6Rnd_120mm_HE_shells_RF","2Rnd_120mm_Mo_Cluster_RF"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

if (_hasJets) then {
	#include "..\DLC_content\vehicles\Jets\Vanilla_CSAT.sqf"
};

if (_hasHelicopters) then {
    #include "..\DLC_content\vehicles\Helicopters\Vanilla_CSAT.sqf"
};

if (_hasContact) then {
    #include "..\DLC_content\vehicles\Contact\police_offroad.sqf"
};

if (_hasLawsOfWar) then {
    #include "..\DLC_content\vehicles\Lawsofwar\police_van.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\vehicles\Apex\Vanilla_CSAT_Arid.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\vehicles\RF\WS_CSAT&SFIA.sqf"
};

if (_hasTanks) then {
    #include "..\DLC_content\vehicles\Tanks\Vanilla_CSAT_Arid.sqf"
};

//If GM cdlc + extra AAF mod
if (_hasGM) then {
    #include "..\DLC_content\vehicles\GM\WS_SFIA_militia.sqf"
};

if (_hasCSLA) then {
    #include "..\DLC_content\vehicles\CSLA\WS_SFIA_militia.sqf"
};

if (_hasSOG) then {
    #include "..\DLC_content\vehicles\SOG\Vanilla_AAF.sqf"
};

if (_hasSPE) then {
    #include "..\DLC_content\vehicles\SPE\Vanilla_AAF.sqf"
};

if (_hasEF) then {
    #include "..\DLC_content\vehicles\EF\Vanilla_CSAT.sqf"
};

["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
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

#include "WS_Vehicle_Attributes.sqf"

["animations", [
    #include "..\vehicleAnimations\vehicleAnimations_Vanilla.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_WS.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_RF.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_GM_desert.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_CSLA.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_SOG.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_SPE.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    #include "..\vehicleVariants\Vanilla_CSAT_Arid\Vanilla_CSAT_Arid.sqf",
    #include "..\vehicleVariants\WS_SFIA\WS_CSAT&SFIA.sqf",
    #include "..\vehicleVariants\GM_police.sqf",
	#include "..\vehicleVariants\WS_SFIA\GM_SFIA.sqf",
	#include "..\vehicleVariants\WS_SFIA\CSLA_SFIA.sqf"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
["sfVoices", ["male01rus","male02rus","male03rus"]] call _fnc_saveToTemplate;

private _faces = [
    "PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","PersianHead_A3_04_a","PersianHead_A3_04_l","PersianHead_A3_04_sa"
];
private _sffaces = ["RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4","RussianHead_5"];
if (_hasWs) then {
    _faces append [
        #include "..\DLC_content\faces\WS\WS_african.sqf"
    ];
};
if (_hasSOG) then {
    _faces append [
        #include "..\DLC_content\faces\SOG\SOG_faces_persian.sqf"
    ];
    _sffaces append [
        #include "..\DLC_content\faces\SOG\SOG_faces_russian.sqf"
    ];
};

["milInsignia", ["Camel_lxWS", "", ""]] call _fnc_saveToTemplate;

["faces", _faces] call _fnc_saveToTemplate;

["sfFaces", _sffaces] call _fnc_saveToTemplate;
["sfInsignia", ["Spetsnaz223rdDetachment", "", ""]] call _fnc_saveToTemplate;

["insignia", ["GryffinRegiment", "", ""]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

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
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F","MRAWS_HEAT55_F"], [], ""],
["launch_RPG32_tan_lxWS", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_tan_lxWS", "", "", "", ["RPG32_HE_F", "RPG32_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_O_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT", "Titan_AP"], [], ""],
["launch_O_Vorona_brown_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["antiTankGrenades", []];
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
if (_hasApex) then {
   (_loadoutData get "NVGs") pushBack "O_NVGoggles_hex_F";
};
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["officerUniforms", ["U_O_OfficerUniform_ocamo"]];
_loadoutData set ["officerVests", ["V_TacVest_khk"]];
_loadoutData set ["officerHats", ["H_MilCap_ocamo", "H_Beret_CSAT_01_F"]];

if (_hasArtOfWar) then {
	#include "..\DLC_content\gear\Artofwar\Vanilla_CSAT.sqf"
};
_loadoutData set ["cloakUniforms", ["U_O_FullGhillie_ard", "U_O_FullGhillie_sard", "U_O_GhillieSuit"]];
_loadoutData set ["cloakVests", ["V_HarnessO_brn", "V_TacVest_khk"]];

_loadoutData set ["traitorUniforms", ["U_O_officer_noInsignia_hex_F"]];
_loadoutData set ["traitorVests", ["V_TacVest_brn", "V_TacVest_khk", "V_BandollierB_cbr", "V_BandollierB_khk"]];
_loadoutData set ["traitorHats", ["H_Cap_tan", "H_Beret_CSAT_01_F"]];

_loadoutData set ["uniforms", ["U_O_CombatUniform_ocamo"]];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Carryall_ocamo"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_hex_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_CSAT_01_F", "H_MilCap_ocamo"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries", "O_IR_Grenade"];
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

_loadoutData set ["glasses", [
    "G_Aviator",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack"
]];

_loadoutData set ["goggles", ["G_Lowprofile","G_Combat_lxWS"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["binoculars", ["Rangefinder"]];
_sfLoadoutData set ["vests", ["V_Chestrig_khk","V_HarnessO_brn"]];
_sfLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_sfLoadoutData set ["Hvests", ["V_TacVest_brn","V_TacVest_khk","V_TacVestIR_blk","V_lxWS_TacVestIR_oli"]];
_sfLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["H_HelmetSpecO_ocamo","lxWS_H_bmask_base"]];

_sfLoadoutData set ["slRifles", [
["arifle_Katiba_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Galat_lxWS","suppressor_h_lxWS","acc_pointer_IR_sand_lxWS","optic_Hamr",["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"], [], ""],
["arifle_SLR_V_lxWS","suppressor_h_lxWS","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS","suppressor_l_lxWS","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""]

]];
_sfLoadoutData set ["rifles", [
["arifle_Katiba_F", "muzzle_snds_H", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Galat_lxWS","suppressor_h_lxWS","acc_pointer_IR_sand_lxWS","optic_Hamr",["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"], [], ""],
["arifle_SLR_V_lxWS","suppressor_h_lxWS","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS","suppressor_l_lxWS","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""]

]];
_sfLoadoutData set ["carbines", [
["arifle_Katiba_C_F", "muzzle_snds_H", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_VelkoR5_lxWS","suppressor_l_lxWS","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS"], ""],
["arifle_SLR_Para_lxWS", "suppressor_h_lxWS", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_Para_snake_lxWS", "suppressor_h_lxWS", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""]

]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_V_GL_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_VelkoR5_GL_lxWS","suppressor_l_lxWS","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS"], ""]

]];

_sfLoadoutData set ["designatedGrenadeLaunchers", [
    ["glaunch_GLX_lxWS", "", "acc_pointer_IR", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["glaunch_GLX_hex_lxWS", "", "acc_pointer_IR", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], [], ""]
]];

_sfLoadoutData set ["SMGs", [
["SMG_01_F", "muzzle_snds_acp", "", "optic_Holosight", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];

_sfLoadoutData set ["machineGuns",  [
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Aco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_ACO_grn", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_NVS", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
	["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "suppressor_h_lxWS", "acc_pointer_IR_sand_lxWS", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]

]];

_sfLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_DMS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_NVS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_SOS", [], [], "bipod_02_F_hex"]
]];

_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Rook40_F", "muzzle_snds_L", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["U_O_CombatUniform_ocamo"]];
_eliteLoadoutData set ["vests", ["V_Chestrig_khk","V_HarnessO_brn","V_lxWS_HarnessO_oli"]];
_eliteLoadoutData set ["glVests", ["V_TacVest_brn","V_TacVest_khk","V_TacVestIR_blk"]];
_eliteLoadoutData set ["Hvests", ["V_TacVest_brn","V_lxWS_TacVestIR_oli"]];
_eliteLoadoutData set ["helmets", ["H_HelmetO_ocamo", "H_HelmetLeaderO_ocamo","lxWS_H_bmask_base"]];
_eliteLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr","O_shield_backpack_lxWS"]];
_eliteLoadoutData set ["binoculars", ["Rangefinder"]];

_eliteLoadoutData set ["slRifles", [
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Galat_lxWS","","acc_pointer_IR_sand_lxWS","optic_Hamr",["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"], [], ""],
["arifle_SLR_V_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS","","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""]

]];
_eliteLoadoutData set ["rifles", [
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Galat_lxWS","","acc_pointer_IR_sand_lxWS","optic_Hamr",["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"], [], ""],
["arifle_SLR_V_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS","","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""]

]];
_eliteLoadoutData set ["carbines", [
["arifle_Katiba_C_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_VelkoR5_lxWS","","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS"], ""],
["arifle_SLR_Para_lxWS", "", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_Para_snake_lxWS", "", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""]

]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_V_GL_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_VelkoR5_GL_lxWS","","acc_pointer_IR_sand_lxWS","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS"], ""]

]];

_eliteLoadoutData set ["designatedGrenadeLaunchers", [
   ["glaunch_GLX_lxWS", "", "acc_pointer_IR_sand_lxWS", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], ["1Rnd_Smoke_Grenade_shell"], ""],
   ["glaunch_GLX_hex_lxWS", "", "acc_pointer_IR_sand_lxWS", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], [], ""]
]];

_eliteLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];

_eliteLoadoutData set ["machineGuns",  [
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Aco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_ACO_grn", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_NVS", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
	["LMG_S77_Hex_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]

]];

_eliteLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_01_F", "", "", "optic_DMS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_NVS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_SOS", [], [], "bipod_02_F_hex"]
]];

_eliteLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Rook40_F", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_O_officer_noInsignia_hex_F","U_O_CombatUniform_ocamo","U_O_LCF_noInsignia_hex_lxws"]]; 
_militaryLoadoutData set ["vests", ["V_Chestrig_khk","V_HarnessO_brn","V_lxWS_HarnessO_oli"]];
_militaryLoadoutData set ["glVests", ["V_HarnessOGL_brn","V_TacVest_khk","V_TacVestIR_blk"]];
_militaryLoadoutData set ["Hvests", ["V_TacVest_brn","V_TacVest_khk","V_TacVestIR_blk","V_lxWS_TacVestIR_oli"]];
_militaryLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_militaryLoadoutData set ["helmets", ["H_HelmetO_ocamo", "H_HelmetLeaderO_ocamo","H_Cap_brn_SPECOPS", "H_Bandanna_cbr", "H_ShemagOpen_tan","lxWS_H_bmask_base","lxWS_H_bmask_hex"]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryLoadoutData set ["slRifles", [
["arifle_Katiba_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_flashlight", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_flashlight", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Galat_lxWS","","acc_flashlight","optic_Hamr",["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"], [], ""],
["arifle_SLR_V_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS","","acc_flashlight","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""]

]];
_militaryLoadoutData set ["rifles", [
["arifle_Katiba_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Velko_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS","","acc_flashlight","",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"],[],""],
["arifle_SLR_V_lxWS","","","",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Galat_lxWS", "", "acc_flashlight", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Galat_lxWS","","acc_flashlight","optic_Hamr",["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F"], [], ""],
["arifle_SLR_V_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS","","acc_flashlight","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], [], ""]

]];
_militaryLoadoutData set ["carbines", [
["arifle_Katiba_C_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_C_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_VelkoR5_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_lxWS","","acc_flashlight","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS"], ""],
["arifle_SLR_Para_lxWS", "", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_Para_snake_lxWS", "", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""]

]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_GL_lxWS","","acc_flashlight","",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_VelkoR5_GL_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_V_GL_lxWS","","","",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_SLR_V_GL_lxWS","","","optic_Hamr",["30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","30Rnd_762x51_slr_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_VelkoR5_GL_lxWS","","acc_flashlight","optic_Hamr",["35Rnd_556x45_Velko_reload_tracer_red_lxWS","35Rnd_556x45_Velko_reload_tracer_red_lxWS","50Rnd_556x45_Velko_reload_tracer_red_lxWS"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS"], ""]

]];

_militaryLoadoutData set ["designatedGrenadeLaunchers", [
    ["glaunch_GLX_lxWS", "", "acc_flashlight", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["glaunch_GLX_hex_lxWS", "", "acc_flashlight", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], [], ""]
]];

_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_01_F", "", "", "optic_DMS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_NVS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_SOS", [], [], "bipod_02_F_hex"],
	["srifle_DMR_01_F", "", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_Arco_blk_F", [], [], "bipod_02_F_hex"],
	["arifle_SLR_lxWS", "", "", "optic_MRCO", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
    ["arifle_SLR_lxWS", "", "", "optic_MRCO", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]

]];

_militaryLoadoutData set ["machineGuns", [
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_Aco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_ACO_grn", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_NVS", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
	["LMG_Zafir_F", "", "acc_flashlight", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
	["LMG_S77_lxWS", "", "acc_flashlight", "optic_MRCO", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
    ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
	["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
    ["LMG_S77_Compact_lxWS", "", "acc_flashlight", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]

]];

_militaryLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_DMR_01_F","","","optic_DMS",["10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag"],[],""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Rook40_F", "", "", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_Marshal"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE","V_Rangemaster_belt"]];
private _helmets = ["H_Cap_police"];

_policeLoadoutData set ["helmets", _helmets];
_policeLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _milSights = ["optic_r1_low_lxWS","optic_r1_high_lxWS","optic_ACO_grn"];

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_lxWS_SFIA_soldier_2_O","U_lxWS_SFIA_deserter","U_lxWS_SFIA_soldier_1_O"]];
_militiaLoadoutData set ["slUniforms", ["U_lxWS_SFIA_Officer_1_O"]];
_militiaLoadoutData set ["vests", ["V_lxWS_HarnessO_oli","V_lxWS_TacVestIR_oli", "V_TacVestIR_blk","V_PlateCarrier1_blk", "V_PlateCarrier1_rgr_noflag_F"]];
_militiaLoadoutData set ["Hvests", ["V_PlateCarrier1_rgr_noflag_F", "V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_blk"]];
_militiaLoadoutData set ["glVests", ["V_HarnessOGL_brn","V_HarnessOGL_brn","V_PlateCarrier2_blk", "V_PlateCarrier2_rgr_noflag_F"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_khk","B_Kitbag_tan", "B_Kitbag_cbr", "B_Kitbag_rgr","B_ViperHarness_oli_F","B_ViperLightHarness_oli_F"]];
_militiaLoadoutData set ["atBackpacks", ["B_Kitbag_tan", "B_Kitbag_cbr", "B_Kitbag_rgr","B_ViperHarness_oli_F","B_ViperLightHarness_oli_F"]];
_militiaLoadoutData set ["longRangeRadios", ["B_RadioBag_01_hex_F"]];
_militiaLoadoutData set ["helmets", ["H_turban_02_mask_black_lxws","lxWS_H_ssh40_sand","lxWS_H_ssh40_green","lxWS_H_turban_03_green","lxWS_H_turban_02_sand","lxWS_H_turban_02_green","lxWS_H_turban_02_black","lxWS_H_turban_03_sand","lxWS_H_turban_03_green","lxWS_H_turban_03_black"]];
_militiaLoadoutData set ["facewear", ["G_Balaclava_blk_lxWS","G_Aviator","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Lowprofile"]];
_militiaLoadoutData set ["slHat", ["lxWS_H_turban_01_red", "lxWS_H_turban_02_red", "lxWS_H_turban_03_red"]];
_militiaLoadoutData set ["sniHats", ["lxWS_H_turban_02_sand", "lxWS_H_turban_03_sand"]];
_militiaLoadoutData set ["binoculars", ["Binocular"]];

_militiaLoadoutData set ["slRifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_MRCO", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_D_lxWS", "", "acc_flashlight", selectRandom _milSights, ["20Rnd_762x51_slr_desert_lxWS"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Velko_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "optic_MRCO", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Galat_lxWS", "suppressor_h_arid_lxWS", "saber_light_ir_arid_lxWS", "optic_MRCO", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_VelkoR5_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_VelkoR5_GL_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]

]];
_militiaLoadoutData set ["rifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", selectRandom _milSights, ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "", "", selectRandom _milSights, ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "", "", "optic_MRCO", ["30Rnd_762x51_slr_reload_tracer_green_lxWS", "30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_MRCO", ["30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_r1_low_sand_lxWS", ["30Rnd_762x51_slr_lxWS"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_SLR_Para_lxWS", "suppressor_l_sand_lxWS", "saber_light_ir_lxWS", "optic_r1_high_lxWS", ["30Rnd_762x51_slr_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","20Rnd_762x51_slr_tracer_green_lxWS","20Rnd_762x51_slr_lxWS"], [], ""]

]];
_militiaLoadoutData set ["carbines", [
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Galat_lxWS", "", "", "", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_Galat_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_SLR_Para_lxWS", "suppressor_l_sand_lxWS", "saber_light_ir_lxWS", "optic_r1_high_lxWS", ["30Rnd_762x51_slr_tracer_green_lxWS","30Rnd_762x51_slr_reload_tracer_green_lxWS","20Rnd_762x51_slr_tracer_green_lxWS","20Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_Para_snake_lxWS", "suppressor_h_snake_lxWS", "acc_pointer_IR_snake_lxWS", "optic_Hamr_snake_lxWS", ["30Rnd_762x51_slr_Snake_tracer_Red_lxWS","30Rnd_762x51_slr_Snake_reload_tracer_Red_lxWS","20Rnd_762x51_slr_Snake_tracer_Red_lxWS","20Rnd_762x51_slr_Snake_reload_tracer_Red_lxWS"], [], ""]

]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_SLR_GL_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_SLR_GL_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_58mm_AT_lxWS","1Rnd_40mm_HE_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SLR_GL_lxWS", "", "acc_flashlight", "", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_SLR_V_GL_lxWS", "", "", selectRandom _milSights, ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_58mm_AT_lxWS","1Rnd_50mm_Smoke_lxWS"], ""],
["arifle_VelkoR5_GL_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["glaunch_GLX_lxWS", "", "", "optic_MRCO", ["1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareGreen_F"], ""]
   
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_Galat_lxWS", "", "saber_light_lxWS", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""],
["arifle_SLR_V_lxWS", "", "", "", ["30Rnd_762x51_slr_reload_tracer_green_lxWS", "30Rnd_762x51_slr_tracer_green_lxWS"], [], ""],
["LMG_S77_Compact_Snakeskin_lxWS", "", "acc_pointer_IR_snake_lxWS", "optic_Holosight_snake_lxWS", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["LMG_S77_Compact_lxWS", "", "acc_pointer_IR_snake_lxWS", "optic_ACO_grn_smg", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["LMG_S77_Desert_lxWS", "", "acc_pointer_IR_sand_lxWS", "optic_Arco_arid_F", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["arifle_Galat_lxWS", "suppressor_h_arid_lxWS", "saber_light_ir_arid_lxWS", "optic_MRCO", ["75Rnd_762x39_Mag_F","75Rnd_762x39_Mag_F","75Rnd_762x39_Mag_Tracer_F"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_MRCO", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]


]];
_militiaLoadoutData set ["marksmanRifles", [
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_MRCO", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_SOS", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_lxWS", "", "acc_flashlight", "optic_SOS", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "", "", "optic_DMS", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["LMG_S77_lxWS", "", "", "", ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["LMG_S77_lxWS", "", "", selectRandom _milSights, ["100Rnd_762x51_S77_Green_lxWS", "100Rnd_762x51_S77_Green_Tracer_lxWS"], [], ""],
["arifle_Velko_lxWS", "", "", "optic_MRCO", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_KHS_blk", ["20Rnd_762x51_slr_lxWS"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_DMS", ["20Rnd_762x51_slr_lxWS"], [], ""],
["arifle_Velko_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_DMS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]

]];

_militiaLoadoutData set ["SMGs", [
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_ACO_grn_smg", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_ACO_grn_smg", [], [], ""],
["hgun_PDW2000_F"],
["hgun_PDW2000_F", "", "", selectRandom _milSights, [], [], ""],
["hgun_PDW2000_F", "", "", selectRandom _milSights, [], [], ""],
["arifle_VelkoR5_lxWS", "suppressor_l_sand_lxWS", "acc_pointer_IR_sand_lxWS", "optic_r1_high_sand_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS","35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
["sgun_aa40_lxWS", "muzzle_snds_12Gauge_lxWS", "acc_pointer_IR", "optic_r1_high_lxWS", ["20Rnd_12Gauge_AA40_Pellets_lxWS"], [], ""]

]];
_militiaLoadoutData set ["sniperRifles", [
["arifle_SLR_V_lxWS", "", "", "optic_KHS_blk", ["20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag"], [], ""],
["arifle_SLR_V_lxWS", "suppressor_h_lxWS", "", "optic_LRPS", ["20Rnd_762x51_slr_lxWS"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]  
]];
_militiaLoadoutData set ["sidearms", [
["hgun_Rook40_F"],["hgun_ACPC2_F"],
["hgun_ACPC2_F", "muzzle_snds_acp", "", "", [], [], ""],
["hgun_Rook40_F", "muzzle_snds_L", "", "", ["30Rnd_9x21_Mag","16Rnd_9x21_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_O_CombatUniform_ocamo"]];
_crewLoadoutData set ["vests", ["V_HarnessO_brn"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_O"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_O_PilotCoveralls","U_O_PilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_BandollierB_khk"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_O", "H_PilotHelmetHeli_O"]];

if (_hasLawsOfWar) then {
    #include "..\DLC_content\gear\Lawsofwar\WS_CSAT&SFIA.sqf"
};

if (_hasTanks) then {
    #include "..\DLC_content\gear\Tanks\Vanilla_CSAT.sqf"
    #include "..\DLC_content\weapons\Tanks\Vanilla_CSAT_Arid.sqf"
};

if (_hasContact) then {
    #include "..\DLC_content\gear\Contact\WS_CSAT&SFIA.sqf"
    #include "..\DLC_content\weapons\Contact\WS_CSAT&SFIA.sqf"
};

if (_hasMarksman) then {
	#include "..\DLC_content\gear\Marksman\Vanilla_CSAT&AAF.sqf"
    #include "..\DLC_content\weapons\Marksman\Vanilla_CSAT&AAF.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\gear\Apex\WS_CSAT&SFIA.sqf"
    #include "..\DLC_content\weapons\Apex\WS_CSAT&SFIA.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\gear\RF\WS_CSAT&SFIA.sqf"
    #include "..\DLC_content\weapons\RF\WS_CSAT&SFIA.sqf"
};

if (_hasCSLA) then {
	#include "..\DLC_content\gear\CSLA\Vanilla_NATO&AAF.sqf"
    #include "..\DLC_content\weapons\CSLA\WS_CSAT&SFIA.sqf"
};

if (_hasGM) then {
	#include "..\DLC_content\gear\GM\WS_CSAT&SFIA.sqf"
    #include "..\DLC_content\weapons\GM\WS_CSAT&SFIA.sqf"
};

if (_hasSOG) then {
	#include "..\DLC_content\gear\SOG\Vanilla_AAF_militia.sqf"
    #include "..\DLC_content\weapons\SOG\WS_CSAT&SFIA.sqf"
};

if (_hasSPE) then {
    #include "..\DLC_content\gear\SPE\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\SPE\Vanilla_AAF.sqf"
};

if (_hasEF) then {
    #include "..\DLC_content\gear\EF\WS_CSAT&SFIA.sqf"
};

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

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
      [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
