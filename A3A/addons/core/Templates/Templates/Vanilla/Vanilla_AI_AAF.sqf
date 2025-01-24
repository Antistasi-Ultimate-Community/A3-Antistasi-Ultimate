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

["name", "AAF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AAF"]] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_aaf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_AAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["I_SDV_01_F"]] call _fnc_saveToTemplate;

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["I_Quadbike_01_F"];
private _unarmedVehicles = ["I_MRAP_03_F"];
private _armedVehicles = ["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"];
private _Trucks = ["I_Truck_02_transport_F", "I_Truck_02_covered_F"];
private _cargoTrucks = ["I_Truck_02_transport_F", "I_Truck_02_covered_F","I_UGV_01_F"];
private _ammoTrucks = ["I_Truck_02_ammo_F"];
private _repairTrucks = ["I_Truck_02_box_F"];
private _fuelTrucks = ["I_Truck_02_fuel_F"];
private _medicalTrucks = ["I_Truck_02_medical_F"];
private _lightAPCs = [];
private _APCs = ["I_APC_Wheeled_03_cannon_F"];
private _IFVs = ["I_APC_tracked_03_cannon_F"];
private _airborneVehicles = ["I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F","I_UGV_01_rcws_F"];
private _tanks = ["I_MBT_03_cannon_F"];
private _lightTanks = ["I_UGV_01_rcws_F"];
private _aa = ["I_LT_01_AA_F"]; ///"B_APC_Tracked_01_AA_F"

private _transportBoat = ["I_Boat_Transport_01_F"];
private _gunBoat = ["I_Boat_Armed_01_minigun_F"];

private _planesCAS = ["I_Plane_Fighter_03_dynamicLoadout_F","I_UAV_02_dynamicLoadout_F"];
private _planesAA = ["I_Plane_Fighter_03_dynamicLoadout_F","I_UAV_02_dynamicLoadout_F"];

private _planesTransport = [];
private _gunship = [];

private _helisLight = ["I_Heli_light_03_unarmed_F"];
private _transportHelicopters = ["I_Heli_Transport_02_F"];
private _helisLightAttack =  ["I_Heli_light_03_dynamicLoadout_F"];
private _helisAttack = [];

private _airPatrol = ["I_Heli_light_03_unarmed_F", "I_Heli_light_03_dynamicLoadout_F"];

private _artillery = ["I_Truck_02_MRL_F"];
["magazines", createHashMapFromArray [
["I_Truck_02_MRL_F", ["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]],
["gm_pl_army_2s1",["gm_1Rnd_122x447mm_he_of462","gm_1Rnd_122x447mm_he_3of56"]],
["gm_pl_army_ural375d_mlrs",["gm_40Rnd_mlrs_122mm_he_9m22u","gm_40Rnd_mlrs_122mm_icm_9m218","gm_40Rnd_mlrs_122mm_mine_9m28k"]],
["gmx_aaf_m109_wdl",["gm_1Rnd_155mm_he_dm21","gm_1Rnd_155mm_he_dm111","gm_1Rnd_155mm_icm_dm602"]],
["gmx_aaf_kat1_463_mlrs_wdl",["gm_36Rnd_mlrs_110mm_he_dm21","gm_36Rnd_mlrs_110mm_icm_dm602","gm_36Rnd_mlrs_110mm_mine_dm711"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["I_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["I_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:

private _militiaLightArmed = ["B_G_Offroad_01_armed_F"];
private _militiaTrucks = ["I_Truck_02_transport_F", "I_Truck_02_covered_F"];
private _militiaCars = ["B_G_Offroad_01_F"];
private _militiaAPCs = []; 

private _policeVehs = ["B_GEN_Offroad_01_gen_F"];

private _staticMG = ["I_HMG_02_high_F","I_HMG_01_high_F"];
private _staticAT = ["I_static_AT_F","I_GMG_01_high_F"];
private _staticAA = ["I_static_AA_F"];
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
private _howitzers =  [];

private _radar = [];
private _SAM = [];

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

if (_hasContact) then {
    #include "..\DLC_content\vehicles\Contact\police_offroad.sqf"
};

if (_hasLawsOfWar) then {
    #include "..\DLC_content\vehicles\Lawsofwar\police_van.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\vehicles\Apex\Vanilla_AAF.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\vehicles\RF\Vanilla_AAF.sqf"
};

//If Tank DLC
if (_hasTanks) then {
    #include "..\DLC_content\vehicles\Tanks\Vanilla_AAF.sqf"
};
if (_hasJets) then {
	#include "..\DLC_content\vehicles\Jets\Vanilla_AAF.sqf"
};
//If Western Sahara DLC
if (_hasWs) then {
    #include "..\DLC_content\vehicles\WS\Vanilla_AAF.sqf"
};

//If GM cdlc + extra AAF mod
if (isClass (configFile >> "cfgVehicles" >> "gmx_aaf_m113a2dk_wdl") && _hasGM) then {
    #include "..\DLC_content\vehicles\GM\AAF_extramod.sqf"
};

if (_hasCSLA) then {
    #include "..\DLC_content\vehicles\CSLA\Vanilla_AAF.sqf"
};

if (_hasSOG) then {
    #include "..\DLC_content\vehicles\SOG\Vanilla_AAF.sqf"
};

if (_hasSPE) then {
    #include "..\DLC_content\vehicles\SPE\Vanilla_AAF.sqf"
};

if (_hasEF) then {
    #include "..\DLC_content\vehicles\EF\Vanilla_AAF.sqf"
};

//If CUP
if (isClass (configFile >> "cfgVehicles" >> "CUP_ZSU23_Base")) then {
    #include "..\MOD_content\CUP\Vanilla_AAF\Vehicles_AAF.sqf"
};

["vehiclesAirPatrol", _airPatrol] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _gunship] call _fnc_saveToTemplate;
["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["howitzerMagazineHE", "6Rnd_120mm_HE_shells_RF","2Rnd_120mm_Mo_Cluster_RF"] call _fnc_saveToTemplate;
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

#include "Vanilla_Vehicle_Attributes.sqf"

["animations", [
    #include "..\vehicleAnimations\vehicleAnimations_Vanilla.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_WS.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_RF.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_GM.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_GMX_AAF.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_CSLA.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_SOG.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_SPE.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_EF.sqf",
    #include "..\MOD_content\CUP\Vehicles_Animations.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    #include "..\vehicleVariants\Vanilla_AAF\CSLA_AAF.sqf",
    #include "..\vehicleVariants\GM_police.sqf",
    #include "..\vehicleVariants\Vanilla_AAF\RF_AAF.sqf",
    #include "..\vehicleVariants\Vanilla_AAF\SPE_AAF.sqf",
    #include "..\vehicleVariants\Vanilla_AAF\Vanilla_AAF.sqf",
    #include "..\vehicleVariants\Vanilla_AAF\WS_AAF.sqf",
    #include "..\MOD_content\CUP\Vanilla_AAF\Vehicles_variants.sqf"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _faces = [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros",
    "GreekHead_A3_10_l",
    "GreekHead_A3_10_sa",
    "GreekHead_A3_10_a"
];
if (_hasSOG) then {
    _faces append [
        #include "..\DLC_content\faces\SOG\SOG_faces_greek.sqf"
    ];
};
["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

["insignia", ["AAF_1stRegiment", "", ""]] call _fnc_saveToTemplate;
["milInsignia", ["AAF_3rdRegiment", "", ""]] call _fnc_saveToTemplate;

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
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""], 2.25,
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""], 1.5,
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""], 2,
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""], 1.75,
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""], 1,
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""], 1.5
]];
_loadoutData set ["ATLaunchers", [
["launch_NLAW_F"], 10
]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""], 10
]];
_loadoutData set ["AALaunchers", [
["launch_I_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""], 10
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
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["U_BG_Guerrilla_6_1"]];
_loadoutData set ["traitorVests", ["V_TacVest_oli", "V_TacVest_camo", "V_BandollierB_oli"]];
_loadoutData set ["traitorHats", ["H_Cap_grn","H_Cap_oli"]];


if (_hasArtOfWar) then {
	#include "..\DLC_content\gear\Artofwar\Vanilla_AAF.sqf"
} else {
	_loadoutData set ["officerUniforms", ["U_I_OfficerUniform"]];
	_loadoutData set ["officerVests", ["V_Rangemaster_belt"]];
	_loadoutData set ["officerHats", ["H_MilCap_dgtl", "H_Beret_grn"]];
};
_loadoutData set ["cloakUniforms", ["U_I_FullGhillie_ard", "U_I_FullGhillie_lsh", "U_I_FullGhillie_sard", "U_I_GhillieSuit"]];
_loadoutData set ["cloakVests", ["V_PlateCarrierIA1_dgtl", "V_BandollierB_oli", "V_Chestrig_oli", "V_TacVest_oli"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["V_Chestrig_oli"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_digi_F"]];
_loadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_blk", "H_MilCap_dgtl"]];
_loadoutData set ["sniHats", ["H_Booniehat_dgtl"]];

_loadoutData set ["glasses", [
    "G_Shades_Black", 1.5,
    "G_Shades_Blue", 0.5,
    "G_Shades_Green", 0.5,
    "G_Shades_Red", 0.5,
    "G_Aviator", 1,
    "G_Spectacles", 1.25,
    "G_Spectacles_Tinted", 0.75,
    "G_Sport_Blackred", 0.34,
    "G_Sport_BlackWhite", 0.34,
    "G_Sport_Blackyellow", 0.33,
    "G_Sport_Greenblack", 0.33,
    "G_Sport_Checkered", 0.33,
    "G_Sport_Red", 0.33,
    "G_Squares", 1.25,
    "G_Squares_Tinted", 0.75
]];
_loadoutData set ["goggles", [
    "G_Combat", 4, 
    "G_Lowprofile", 6
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
_sfLoadoutData set ["vests", ["V_TacVest_oli", 2, "V_PlateCarrierIA2_dgtl", 4, "V_PlateCarrierIA1_dgtl", 4]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrierIAGL_dgtl", 4, "V_PlateCarrierIAGL_oli", 6]];
_sfLoadoutData set ["backpacks", ["B_TacticalPack_oli", 2, "B_FieldPack_oli", 1, "B_Carryall_oli", 1, "B_AssaultPack_dgtl", 3, "B_Kitbag_sgg", 3]];
_sfLoadoutData set ["helmets", ["H_HelmetIA", 5, "H_Cap_blk_Raven", 1, "H_Cap_oli_hs", 0.25, "H_Cap_headphones", 0.25,"H_Booniehat_khk_hs", 0.25, "H_Booniehat_oli", 0.5, "H_Booniehat_dgtl", 1.5, "H_Watchcap_camo", 0.25,"H_Shemag_olive", 0.5, "H_Shemag_olive_hs", 0.5]];
_sfLoadoutData set ["uniforms", ["U_I_CombatUniform", 4, "U_I_CombatUniform_shortsleeve", 6]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];

_sfAccessories = ["acc_pointer_IR", 10];
_sfTlOptics = ["optic_ACO_grn", 1, "optic_Holosight_blk_F", 2, "optic_Hamr", 4, "optic_MRCO", 3];
_sfRifleOptics = ["optic_ACO_grn", 1.5, "optic_Holosight_blk_F", 3.5, "optic_Hamr", 3, "optic_MRCO", 2];

_sfLoadoutData set ["slRifles", [
["arifle_Mk20_F", "muzzle_snds_M", _sfAccessories, _sfTlOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 2.75,
["arifle_Mk20_plain_F", "muzzle_snds_M", _sfAccessories, _sfTlOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 1.25,
["arifle_Mk20_GL_F", "muzzle_snds_M", _sfAccessories, _sfTlOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4,
["arifle_Mk20_GL_plain_F", "muzzle_snds_M", _sfAccessories, _sfTlOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 2
]];
_sfLoadoutData set ["rifles", [
["arifle_Mk20_F", "muzzle_snds_M", _sfAccessories, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 6.5,
["arifle_Mk20_plain_F", "muzzle_snds_M", _sfAccessories, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 3.5
]];
_sfLoadoutData set ["carbines", [
["arifle_Mk20C_F", "muzzle_snds_M", _sfAccessories, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 6.5,
["arifle_Mk20C_plain_F", "muzzle_snds_M", _sfAccessories, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 3.5
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_Mk20_GL_F", "muzzle_snds_M", _sfAccessories, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""], 6.5,
["arifle_Mk20_GL_plain_F", "muzzle_snds_M", _sfAccessories, _sfRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""], 3.5
]];

_sfSMGOptics = ["optic_Aco_smg", 3, "optic_Holosight", 7];
_sfP90Optics = ["optic_Aco_smg", 3, "optic_Holosight_blk_F", 7];
_sfLoadoutData set ["SMGs", [
["SMG_01_F", "muzzle_snds_acp", "", _sfSMGOptics, [], [], ""], 2,
["SMG_03C_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 2,
["SMG_03C_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.5,
["SMG_03C_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.5,
["SMG_03C_TR_camo", "muzzle_snds_570", _sfAccessories, _sfP90Optics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 3,
["SMG_03C_TR_khaki", "muzzle_snds_570", _sfAccessories, _sfP90Optics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.75,
["SMG_03C_TR_black", "muzzle_snds_570", _sfAccessories, _sfP90Optics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.75,
["SMG_02_F", "muzzle_snds_L", _sfAccessories, _sfP90Optics, [], [], ""], 1.5
]];

_sfMGOptics = ["optic_tws_mg", 2.5, "optic_MRCO", 2, "optic_Holosight_blk_F", 2, "optic_Hamr", 3, "optic_ACO_grn", 1];
_sfLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", "muzzle_snds_H", _sfAccessories, _sfMGOptics, ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], ""], 1
]];

_sfMarksmanOptics = ["optic_TWS", 4, "optic_Nightstalker", 2, "optic_DMS", 2.5, "optic_SOS", 1.5];
_sfLoadoutData set ["marksmanRifles", [
    ["srifle_EBR_F", "muzzle_snds_B", _sfAccessories, _sfMarksmanOptics, ["20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], [], ""], 1
]];
_sfSniperOptics = ["optic_SOS", 2, "optic_LRPS", 5, "optic_Nightstalker", 3];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", _sfSniperOptics, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""], 1
]];
_sfLoadoutData set ["sidearms", [
["hgun_ACPC2_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", [], [], ""], 10
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["U_I_CombatUniform_shortsleeve", 5, "U_I_CombatUniform", 5]];
_eliteLoadoutData set ["slUniforms", ["U_I_OfficerUniform", 10]];
_eliteLoadoutData set ["vests", ["V_PlateCarrierIA2_dgtl", 3.75, "V_PlateCarrierIA1_dgtl", 3.75, "V_PlateCarrierIAGL_dgtl", 1.5,"V_PlateCarrierIAGL_oli", 1]];
_eliteLoadoutData set ["Hvests", ["V_PlateCarrierIAGL_dgtl", 6,"V_PlateCarrierIAGL_oli", 4]];
_eliteLoadoutData set ["backpacks", ["B_TacticalPack_oli", 2, "B_FieldPack_oli", 0.5, "B_Carryall_oli", 1, "B_AssaultPack_dgtl", 3,"B_Kitbag_sgg", 3.5]];
_eliteLoadoutData set ["helmets", ["H_HelmetIA", 6.75, "H_Cap_blk_Raven", 0.5, "H_Cap_oli_hs", 0.25, "H_Cap_headphones", 0.25, "H_Booniehat_oli", 0.5, "H_Booniehat_dgtl", 1.25, "H_Watchcap_camo", 0.25, "H_Booniehat_khk_hs", 0.25]];

_eliteLoadoutData set ["binoculars", ["Rangefinder"]];

_eliteSlOptics = ["optic_MRCO", 3, "optic_Hamr", 6, "optic_Holosight_blk_F", 1];
_eliteRifleOptics = ["optic_Holosight_blk_F", 7, "optic_MRCO", 2, "optic_Hamr", 1];
_eliteAccessories = ["acc_pointer_IR", 10];

_eliteLoadoutData set ["slRifles", [
["arifle_Mk20_F", "", _eliteAccessories, _eliteSlOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 4,
["arifle_Mk20_GL_F", "", _eliteAccessories, _eliteSlOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6
]];
_eliteLoadoutData set ["rifles", [
["arifle_Mk20_F", "", _eliteAccessories, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 10
]];
_eliteLoadoutData set ["carbines", [
["arifle_Mk20C_F", "", _eliteAccessories, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 10
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_Mk20_GL_F", "", _eliteAccessories, _eliteRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""], 10
]];

_eliteSMGOptics = ["optic_Aco_smg", 4, "optic_Holosight", 6];
_eliteP90Optics = ["optic_Aco_smg", 4, "optic_Holosight_blk_F", 6];

_eliteLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", _eliteSMGOptics, [], [], ""], 2,
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 1.25, 
["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.75,
["SMG_03C_TR_camo", "", _eliteAccessories, _eliteP90Optics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 3.5,
["SMG_03C_TR_khaki", "", _eliteAccessories, _eliteP90Optics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.75,
["SMG_03C_TR_black", "", _eliteAccessories, _eliteP90Optics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 1.25,
["SMG_02_F", "", _eliteAccessories, _eliteP90Optics, [], [], ""], 0.5
]];

_eliteMGOptics = ["optic_NVS", 0.75, "optic_MRCO", 4, "optic_Holosight_blk_F", 2.75, "optic_Hamr", 2.5];

_eliteLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", "", _eliteAccessories, _eliteMGOptics, ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], ""], 10
]];

_eliteMarksmanOptics = ["optic_DMS", 6, "optic_NVS", 1, "optic_SOS", 3];

_eliteLoadoutData set ["marksmanRifles", [
   ["srifle_EBR_F", "", _eliteAccessories, _eliteMarksmanOptics, ["20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], [], "bipod_03_F_blk"], 10
]];

_eliteSniperOptics = ["optic_LRPS", 5, "optic_SOS", 2, "optic_TWS", 3];

_eliteLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", _eliteSniperOptics, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""], 10
]];
_eliteLoadoutData set ["sidearms", [
["hgun_ACPC2_F", "", "acc_flashlight_pistol", "", [], [], ""], 10
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["U_I_CombatUniform_shortsleeve", 3, "U_I_CombatUniform", 3, "U_BG_Guerilla1_2_F", 2]];
_militaryLoadoutData set ["slUniforms", ["U_I_OfficerUniform", 10]];
_militaryLoadoutData set ["vests", ["V_TacVest_oli", 2, "V_PlateCarrierIA2_dgtl", 5, "V_PlateCarrierIA1_dgtl", 3]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrierIAGL_dgtl", 7,"V_PlateCarrierIAGL_oli", 3]];
_militaryLoadoutData set ["backpacks", ["B_TacticalPack_oli", 2.5, "B_FieldPack_oli", 1, "B_Carryall_oli", 1.5, "B_AssaultPack_dgtl", 2.5, "B_Kitbag_sgg", 2.5]];
_militaryLoadoutData set ["helmets", ["H_HelmetIA", 6.9, "H_Cap_blk_Raven", 1, "H_Cap_oli_hs", 0.5, "H_Cap_headphones", 0.1, "H_Booniehat_oli", 0.25, "H_Booniehat_dgtl", 1.25]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryRifleOptics = ["optic_ACO_grn", 6, "optic_Holosight_blk_F", 3, "", 1];
_militarySlRifleOptics = ["optic_Hamr", 2, "optic_MRCO", 6, "optic_Holosight_blk_F", 2];
_militaryAttachments = ["acc_flashlight", 7, "", 2, "acc_pointer_IR", 1];

_militaryLoadoutData set ["slRifles", [
["arifle_Mk20_F", "", _militaryAttachments, _militarySlRifleOptics , ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 4,
["arifle_Mk20_GL_F", "", _militaryAttachments, _militarySlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 6
]];
_militaryLoadoutData set ["rifles", [
["arifle_Mk20_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 10
]];
_militaryLoadoutData set ["carbines", [
["arifle_Mk20C_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 10
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_Mk20_GL_F", "", _militaryAttachments, _militaryRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""], 10
]];
_militarySMGOptics = ["optic_Holosight_smg_blk_F", 4, "optic_Aco_grn_smg", 6];
_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Holosight_smg", [], [], ""], 5,
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 1.25,
["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.25,
["SMG_03C_TR_camo", "", _militaryAttachments, _militarySMGOptics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.75,
["SMG_03C_TR_black", "", _militaryAttachments, _militarySMGOptics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.25,
["SMG_02_F", "", _militaryAttachments, _militarySMGOptics, [], [], ""], 2.5
]];
_militaryMGOptics = ["optic_MRCO", 2, "optic_Holosight_blk_F", 2, "optic_ACO_grn", 5, "optic_Hamr", 1];
_militaryLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", "", _militaryAttachments, _militaryMGOptics, ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], ""], 10
]];

_militaryMarksmanOptics = ["optic_DMS", 3, "optic_MRCO", 2.5, "optic_Hamr", 4.5];
_militaryLoadoutData set ["marksmanRifles", [
    ["srifle_EBR_F", "", _militaryAttachments, _militaryMarksmanOptics, [], [], "bipod_03_F_blk"], 10
]];
_militarySniperOptics = ["optic_SOS", 6, "optic_LRPS", 4];
_militaryLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", _militarySniperOptics , ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""], 10
]];
_militaryLoadoutData set ["sidearms", [
["hgun_ACPC2_F", "", "acc_flashlight_pistol", "", [], [], ""], 10
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_Marshal", 10]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE", 6, "V_Rangemaster_belt", 4]];
private _helmets = ["H_Cap_police", 10];

_policeLoadoutData set ["helmets", _helmets];
_policeSMGOptics = ["optic_Aco_smg", 3, "", 7];
_policeAttachments = ["acc_flashlight", 6, "", 4];
_policeLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", _policeSMGOptics, [], [], ""], 1.5,
["SMG_03_black", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.5,
["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 1,
["SMG_03_TR_black", "", _policeAttachments, _policeSMGOptics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.25,
["SMG_03C_TR_black", "", _policeAttachments, _policeSMGOptics, ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 0.75,
["SMG_02_F", "", _policeAttachments, _policeSMGOptics, [], [], ""], 6
]];
_policeLoadoutData set ["sidearms", ["hgun_Rook40_F", 10]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_I_CombatUniform", 3, "U_I_CombatUniform_shortsleeve", 3, "U_BG_Guerilla1_2_F", 4]];
_militiaLoadoutData set ["vests", ["V_BandollierB_oli", 1.25, "V_Chestrig_oli", 5, "V_TacVest_oli", 3.75]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_oli", 10]];
_militiaLoadoutData set ["backpacks", ["B_TacticalPack_oli", 4, "B_FieldPack_oli", 4, "B_AssaultPack_dgtl", 2]];
_militiaLoadoutData set ["helmets", ["H_HelmetIA", 4, "H_Booniehat_dgtl", 3, "H_Cap_blk_Raven", 2]];

_militiaRifleOptics = ["optic_ACO_grn", 2, "", 8];
_militiaSlRifleOptics = ["optic_ACO_grn", 3.5, "optic_MRCO", 4.5, "", 2];
_militiaAttachments = ["acc_flashlight", 4, "", 6];

_militiaLoadoutData set ["slRifles", [
["arifle_Mk20_F", "", _militiaAttachments, _militiaSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 6,
["arifle_Mk20_GL_F", "", _militiaAttachments, _militiaSlRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""], 4
]];
_militiaLoadoutData set ["rifles", [
["arifle_Mk20_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 7.5,
["arifle_TRG21_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 2.5
]];
_militiaLoadoutData set ["carbines", [
["arifle_Mk20C_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 7.5, 
["arifle_TRG20_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""], 2.5
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_Mk20_GL_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""], 7.5,
["arifle_TRG21_GL_F", "", _militiaAttachments, _militiaRifleOptics, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""], 2.5
]];

_militiaSMGOptics = ["optic_Aco_smg", 3, "", 7];

_militiaLoadoutData set ["SMGs", [
["SMG_01_F", "", _militiaAttachments, _militiaSMGOptics, [], [], ""], 1,
["SMG_03C_camo", "", _militiaAttachments, "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""], 1.5,
["SMG_02_F", "", _militiaAttachments, _militiaSMGOptics, [], [], ""], 7.5
]];

_militiaMGOptics = ["optic_ACO_grn", 1.5, "", 8.5];
_militiaLoadoutData set ["machineGuns", [
["LMG_Mk200_F", "", _militiaAttachments, _militiaMGOptics, ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_03_F_blk"], 10
]];

_militiaMarksmanOptics = ["optic_MRCO", 10];
_militiaLoadoutData set ["marksmanRifles", [
    ["srifle_EBR_F", "", _militiaAttachments, _militiaMarksmanOptics, [], [], "bipod_03_F_blk"], 10
]];

_militiaSniperOptics = ["optic_SOS", 10];
_militiaLoadoutData set ["sniperRifles", [
    ["srifle_EBR_F", "", "", _militiaSniperOptics, [], [], "bipod_03_F_blk"], 10
]];

_militiaLoadoutData set ["sidearms", ["hgun_ACPC2_F", 10]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_I_CombatUniform", 4, "U_I_CombatUniform_shortsleeve", 6]];
if (_hasTanks) then {
    _crewLoadoutData set ["uniforms", ["U_Tank_green_F", 10]];
};
_crewLoadoutData set ["vests", ["V_BandollierB_oli", 10]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I", 10]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_I_HeliPilotCoveralls", 5, "U_I_pilotCoveralls", 5]];
_pilotLoadoutData set ["vests", ["V_TacVest_oli", 10]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_I", 5, "H_CrewHelmetHeli_I", 5]];

////
if (_hasMarksman) then {
	#include "..\DLC_content\gear\Marksman\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\Marksman\Vanilla_AAF.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\gear\Apex\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\Apex\Vanilla_AAF.sqf"
};

if (_hasLawsOfWar) then {
    #include "..\DLC_content\gear\Lawsofwar\Vanilla_AAF.sqf"
};

if (_hasContact) then {
    #include "..\DLC_content\gear\Contact\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\Contact\Vanilla_AAF.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\gear\RF\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\RF\Vanilla_AAF.sqf"
};

if (_hasWs) then {
    #include "..\DLC_content\gear\WS\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\WS\Vanilla_AAF.sqf"
};

if (_hasCSLA) then {
    #include "..\DLC_content\gear\CSLA\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\CSLA\Vanilla_AAF.sqf"
};

if (_hasGM) then {
    #include "..\DLC_content\gear\GM\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\GM\Vanilla_AAF.sqf"
};

if (_hasSOG) then {
    #include "..\DLC_content\gear\SOG\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\SOG\Vanilla_AAF.sqf"
};

if (_hasSPE) then {
    #include "..\DLC_content\gear\SPE\Vanilla_AAF.sqf"
    #include "..\DLC_content\weapons\SPE\Vanilla_AAF.sqf"
};

if (_hasEF) then {
    #include "..\DLC_content\gear\EF\Vanilla_AAF.sqf"
};

//////mod content
//If CUP
if (isClass (configFile >> "cfgVehicles" >> "CUP_ZSU23_Base")) then {
    #include "..\MOD_content\CUP\Vanilla_AAF\Gear_AAF.sqf"
    #include "..\MOD_content\CUP\Vanilla_AAF\Weapons_AAF.sqf"
};

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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
