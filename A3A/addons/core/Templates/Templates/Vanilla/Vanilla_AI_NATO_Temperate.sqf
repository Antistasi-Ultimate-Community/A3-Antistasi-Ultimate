private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
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

["name", "NATO"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "NATO"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_NATO"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["B_SDV_01_F"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["SpaceshipCapsule_01_F"]] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["B_T_Quadbike_01_F"];
private _unarmedVehicles = ["B_T_MRAP_01_F"];
private _armedVehicles = ["B_T_MRAP_01_gmg_F", "B_T_MRAP_01_hmg_F"];
private _Trucks = ["B_T_Truck_01_covered_F", "B_T_Truck_01_transport_F"];
private _cargoTrucks = ["B_T_Truck_01_flatbed_F", "B_T_Truck_01_cargo_F","B_T_UGV_01_olive_F"];
private _ammoTrucks = ["B_T_Truck_01_ammo_F"];
private _repairTrucks = ["B_T_Truck_01_Repair_F","B_T_APC_Tracked_01_CRV_F"];
private _fuelTrucks = ["B_T_Truck_01_fuel_F"];
private _medicalTrucks = ["B_T_Truck_01_medical_F"];
private _lightAPCs = ["B_T_APC_Wheeled_01_cannon_F"];
private _APCs = ["B_T_APC_Wheeled_01_cannon_F"];           // CRV has no cargo: "B_APC_Tracked_01_CRV_F"
private _IFVs = ["B_T_APC_Tracked_01_rcws_F"];

private _airborneVehicles = ["B_T_APC_Wheeled_01_cannon_F","B_T_UGV_01_olive_F"];
private _lightTanks = ["B_T_UGV_01_olive_F"];
private _tanks = ["B_T_MBT_01_cannon_F", "B_T_MBT_01_TUSK_F"];
private _aa = ["B_T_APC_Tracked_01_AA_F"];

private _transportBoat = ["B_T_Boat_Transport_01_F"];
private _gunBoat = ["B_T_Boat_Armed_01_minigun_F","a3a_Boat_Armed_01_hmg_blufor_F"];

private _planesCAS = ["B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F"];
private _planesLargeCAS = [];

private _planesAA = ["B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F"];
private _planesLargeAA = [];
["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", ["B_T_VTOL_01_armed_F"]] call _fnc_saveToTemplate;

private _transportHelicopters = ["B_Heli_Transport_01_F","B_CTRG_Heli_Transport_01_tropic_F"];

private _helisLight = ["B_Heli_Light_01_F"];
private _helisLightAttack = ["B_Heli_Light_01_dynamicLoadout_F"];
private _helisAttack = ["B_Heli_Attack_01_dynamicLoadout_F"];

private _artillery = ["B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"];

["magazines", createHashMapFromArray [
    ["B_T_MBT_01_arty_F",["32Rnd_155mm_Mo_shells", "2Rnd_155mm_Mo_Cluster", "6Rnd_155mm_Mo_mine"]],
    ["B_T_MBT_01_mlrs_F",["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]],
    ["APC_Wheeled_01_mortar_base_lxWS",["64Rnd_60mm_Mo_guided_lxWS"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_T_UAV_03_dynamicLoadout_F", "B_UAV_05_F", "B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = ["B_UAV_01_F"];

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
private _militiaLightArmed = ["B_G_Offroad_01_armed_F"];
private _militiaTrucks = ["B_T_Truck_01_transport_F", "B_T_Truck_01_covered_F"];
private _militiaCars = ["B_G_Offroad_01_F"];
private _militiaAPCs = [];

private _policeVehs = ["B_GEN_Offroad_01_gen_F"];

private _staticMG = ["B_G_HMG_02_high_F", "B_HMG_01_high_F"];
private _staticAT = ["B_T_Static_AT_F","B_GMG_01_high_F"];
["staticAA", ["B_T_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_T_Mortar_01_F"]] call _fnc_saveToTemplate;
private _howitzers = [];

private _radar = [];
private _SAM = [];

["howitzerMagazineHE", "magazine_ShipCannon_120mm_HE_shells_x32","magazine_ShipCannon_120mm_HE_cluster_shells_x2"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

if (_hasHelicopters) then {
    #include "..\DLC_content\vehicles\Helicopters\Vanilla_NATO.sqf"
};

if (_hasJets) then {
	#include "..\DLC_content\vehicles\Jets\Vanilla_NATO.sqf"
};

if (_hasContact) then {
    #include "..\DLC_content\vehicles\Contact\police_offroad.sqf"
};

if (_hasLawsOfWar) then {
    #include "..\DLC_content\vehicles\Lawsofwar\police_van.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\vehicles\Apex\Vanilla_NATO_Temparate.sqf"
};

if (_hasTanks) then {
    #include "..\DLC_content\vehicles\Tanks\Vanilla_NATO_Temparate.sqf"
};

//If Western Sahara DLC
if (_hasWs) then {
    #include "..\DLC_content\vehicles\WS\Vanilla_NATO_Temparate.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\vehicles\RF\Vanilla_NATO_Temparate.sqf"
};

if (_hasGM) then {
    #include "..\DLC_content\vehicles\GM\Vanilla_NATO_Temparate.sqf"
};

if (_hasCSLA) then {
    #include "..\DLC_content\vehicles\CSLA\Vanilla_NATO_Temparate.sqf"
};

if (_hasEF) then {
    #include "..\DLC_content\vehicles\EF\Vanilla_NATO_Temparate.sqf"
};

["vehiclesGunBoats", _gunBoat] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _planesLargeCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeAA", _planesLargeAA] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _transportBoat] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _militiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _militiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _militiaCars] call _fnc_saveToTemplate;
["vehiclesAA", _aa] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["vehiclesTrucks", _Trucks] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _ammoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _repairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _fuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _medicalTrucks] call _fnc_saveToTemplate;
["vehiclesBasic", _basic] call _fnc_saveToTemplate;
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _helisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisLight", _helisLight] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _helisAttack] call _fnc_saveToTemplate;
["staticHowitzers", _howitzers] call _fnc_saveToTemplate;
["vehicleRadar", _radar] call _fnc_saveToTemplate;
["vehicleSam", _SAM] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _planesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _planesAA] call _fnc_saveToTemplate;
["vehiclesArtillery", _artillery] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _lightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _IFVs] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _unarmedVehicles] call _fnc_saveToTemplate;
["vehiclesLightArmed", _armedVehicles] call _fnc_saveToTemplate;
["vehiclesLightTanks",  _lightTanks] call _fnc_saveToTemplate;
["vehiclesAirborne", _airborneVehicles] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _militiaAPCs] call _fnc_saveToTemplate;

#include "Vanilla_Vehicle_Attributes.sqf"

["animations", [
    #include "..\vehicleAnimations\vehicleAnimations_Vanilla.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_WS.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_RF.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_GM.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_CSLA.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_EF.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\CSLA_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\GM_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\RF_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\Vanilla_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\WS_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\EF_NATO_Temparate.sqf"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _voices = ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG","Male01ENGFRE","Male02ENGFRE","Male01FRE","Male02FRE","Male03FRE"];
private _sfVoices = ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"];
private _faces = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32",
"TanoanHead_A3_02","TanoanHead_A3_04","TanoanHead_A3_03","TanoanHead_A3_05","TanoanHead_A3_07","TanoanHead_A3_01","TanoanHead_A3_06","TanoanHead_A3_09",
"TanoanHead_A3_08","RussianHead_4","LivonianHead_5","LivonianHead_2","LivonianHead_9","RussianHead_1","LivonianHead_6","LivonianHead_3","RussianHead_3",
"LivonianHead_1","RussianHead_2","LivonianHead_10","LivonianHead_8","LivonianHead_4","LivonianHead_7","RussianHead_5","Sturrock",
"WhiteHead_22_l","WhiteHead_22_sa","WhiteHead_22_a"
];
if (_hasSPE) then {
    _faces append [
        #include "..\DLC_content\faces\SPE\SPE_white.sqf"
    ];
    _voices append [
        #include "..\DLC_content\voices\SPE_german.sqf",
        #include "..\DLC_content\voices\SPE_french.sqf"
    ];
};
if (_hasSOG) then {
    _faces append [
        #include "..\DLC_content\faces\SOG\SOG_faces_livonian.sqf",
        #include "..\DLC_content\faces\SOG\SOG_faces_white.sqf",
        #include "..\DLC_content\faces\SOG\SOG_faces_african.sqf",
        #include "..\DLC_content\faces\SOG\SOG_faces_russian.sqf",
        #include "..\DLC_content\faces\SOG\SOG_faces_tanoa.sqf"
    ];
};
if (_hasRF) then {
    _faces append [
        #include "..\DLC_content\faces\RF\RF_white.sqf"
    ];
};
if (_hasGM) then {
    _faces append [
        #include "..\DLC_content\faces\GM\GM_white.sqf"
    ];
    _voices append [
        #include "..\DLC_content\voices\GM_german.sqf"
    ];
};
if (_hasWS) then {
    _faces append [
        #include "..\DLC_content\faces\WS\WS_white.sqf"
    ];
};
if (_hasEF) then {
    _faces append [
        #include "..\DLC_content\faces\EF\EF_white.sqf", ///probaly need to separate by camos
        #include "..\DLC_content\faces\EF\EF_african.sqf"
    ];
};
["voices", _voices] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;
["eliteVoices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG",
"Male10ENG","Male11ENG","Male12ENG","Male01ENGFRE","Male02ENGFRE","Male01FRE","Male02FRE","Male03FRE","Male01POL","Male02POL","Male03POL"]] call _fnc_saveToTemplate;
["faces", _faces] call _fnc_saveToTemplate;
["insignia", ["111thID", "", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["CTRG"]] call _fnc_saveToTemplate;

"NATOMen" call _fnc_saveNames;

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
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["launch_NLAW_F"]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_olive_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", ["hgun_P07_khk_F", "hgun_P07_blk_F"]];

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

_loadoutData set ["traitorUniforms", ["U_I_L_Uniform_01_tshirt_olive_F"]];
_loadoutData set ["traitorVests", ["V_BandollierB_oli", "V_TacVest_oli"]];
_loadoutData set ["traitorHats", ["H_Cap_grn", "H_Cap_oli"]];

_loadoutData set ["officerUniforms", ["U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CombatUniform_mcam_wdl_f"]];
_loadoutData set ["officerVests", ["V_TacVest_oli"]];
_loadoutData set ["officerHats", ["H_MilCap_wdl", "H_Beret_Colonel", "H_Beret_02"]];

if (_hasArtOfWar) then {
	#include "..\DLC_content\gear\Artofwar\Vanilla_NATO.sqf"
};

_loadoutData set ["cloakUniforms", ["U_B_T_Sniper_F", "U_B_T_FullGhillie_tna_F"]];
_loadoutData set ["cloakVests", ["V_Chestrig_oli"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_wdl_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_02"]];
_loadoutData set ["sniHats", ["H_Booniehat_wdl"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries", "B_IR_Grenade"];
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
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "G_Tactical_Clear",
    "G_Tactical_Black"
]];
_loadoutData set ["goggles", ["G_Combat"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["NVGs", ["NVGoggles"]];
_sfLoadoutData set ["uniforms", ["U_B_CTRG_1", "U_B_CTRG_3", "U_B_CTRG_2"]];  
_sfLoadoutData set ["vests", ["V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_PlateCarrier1_blk","V_PlateCarrier2_blk"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrierH_CTRG","V_PlateCarrier2_blk"]];
_sfLoadoutData set ["glVests", ["V_PlateCarrierH_CTRG","V_PlateCarrier2_blk","V_PlateCarrierIAGL_oli"]];
_sfLoadoutData set ["backpacks", ["B_Kitbag_rgr", "B_AssaultPack_rgr", "B_Carryall_wdl_F", "B_Carryall_green_F"]];
_sfLoadoutData set ["atBackpacks", ["B_Kitbag_rgr","B_Carryall_wdl_F", "B_Carryall_green_F"]];
_sfLoadoutData set ["helmets", ["H_HelmetSpecB", "H_HelmetB_light_black", "H_Bandanna_khk_hs","H_Watchcap_camo", "H_HelmetB_TI_tna_F"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["glasses", [
    "G_Aviator",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "G_Tactical_Clear",
    "G_Tactical_Black"
]];
_sfLoadoutData set ["goggles", ["G_Combat"]];

_sfLoadoutData set ["slRifles", [
    ["arifle_MX_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["arifle_MX_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["arifle_MX_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
    ["arifle_MX_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
    ["arifle_MX_GL_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["arifle_MX_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
    ["arifle_MX_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["arifle_MXC_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
    ["arifle_MXC_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["arifle_MX_GL_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_MX_GL_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
    ["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_NVS", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
    ["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
    ["LMG_Mk200_black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_NVS", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"]
]];

_sfLoadoutData set ["marksmanRifles", [
    ["arifle_MXM_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_khk"],
    ["arifle_MXM_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_NVS", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_khk"],
    ["arifle_MXM_khk_F", "muzzle_snds_H_khk_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_khk"],
    ["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"]
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

_sfLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""],
["hgun_P07_F", "muzzle_snds_L", "", "", [], [], ""],
["hgun_ACPC2_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["NVGs", ["NVGoggles"]]; 
_eliteLoadoutData set ["uniforms", ["U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CombatUniform_mcam_wdl_f"]];
_eliteLoadoutData set ["helmets", ["H_HelmetB_plain_wdl", "H_HelmetSpecB_wdl", "H_HelmetB_light_wdl"]];
_eliteLoadoutData set ["vests", ["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl", "V_PlateCarrierSpec_wdl"]];
_eliteLoadoutData set ["Hvests", ["V_PlateCarrierSpec_wdl"]];
_eliteLoadoutData set ["glVests", ["V_PlateCarrierGL_wdl"]];
_eliteLoadoutData set ["backpacks", ["B_Carryall_wdl_F", "B_Kitbag_sgg"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData set ["glasses", [
    "G_Aviator",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "G_Tactical_Clear",
    "G_Tactical_Black"
]];
_eliteLoadoutData set ["goggles", ["G_Combat"]];

_eliteLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
    ["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["arifle_MX_khk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
    ["arifle_MX_khk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
    ["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_khk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_khk_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];

_eliteLoadoutData set ["machineGuns", [
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Aco", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Holosight", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"]
]];

_eliteLoadoutData set ["marksmanRifles", [
    ["arifle_MXM_Black_F", "", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MXM_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CombatUniform_mcam_wdl_f"]];
_militaryLoadoutData set ["vests", ["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl"]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl", "V_PlateCarrierSpec_wdl"]];
_militaryLoadoutData set ["glVests", ["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl", "V_PlateCarrierGL_wdl"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_wdl_F", "B_Kitbag_sgg", "B_AssaultPack_rgr", "B_Kitbag_mcamo"]];
_militaryLoadoutData set ["atBackpacks", ["B_Carryall_wdl_F", "B_AssaultPack_rgr", "B_Kitbag_mcamo"]];
_militaryLoadoutData set ["helmets", ["H_HelmetB_plain_wdl", "H_HelmetSpecB_wdl", "H_HelmetB_light_wdl"]];

_militaryLoadoutData set ["slRifles", [
["arifle_MX_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_MX_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Holosight", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "", "acc_flashlight", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Holosight_blk_F", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["arifle_MX_SW_Black_F", "", "", "optic_NVS", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "acc_flashlight", "optic_Aco", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "", [], [], ""],
["hgun_P07_blk_F", "", "", "", [], [], ""],
["hgun_P07_khk_F", "", "", "", [], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
    ["arifle_MXM_Black_F", "", "acc_flashlight", "optic_NVS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MXM_Black_F", "", "acc_flashlight", "optic_SOS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MXM_Black_F", "", "acc_flashlight", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "", "acc_flashlight", "optic_SOS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "", "acc_flashlight", "optic_Hamr", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "", "acc_flashlight", "optic_NVS", [], [], "bipod_01_F_blk"]
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

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CombatUniform_mcam_wdl_f"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_oli", "V_PlateCarrier1_wdl","V_TacVestIR_blk","V_CarrierRigKBT_01_Olive_F"]];
_militiaLoadoutData set ["Hvests", ["V_PlateCarrier2_wdl"]];
_militiaLoadoutData set ["glVests", ["V_Chestrig_oli", "V_PlateCarrier1_wdl","V_TacVestIR_blk"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_wdl_F","B_FieldPack_oli","B_FieldPack_green_F"]];
_militiaLoadoutData set ["atBackpacks", ["B_Carryall_wdl_F","B_TacticalPack_oli"]];
_militiaLoadoutData set ["helmets", ["H_HelmetB_light_wdl", "H_MilCap_wdl", "H_Bandanna_camo"]];

_militiaLoadoutData set ["slRifles", [
    ["arifle_MX_GL_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["arifle_MX_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["arifle_MXC_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["arifle_MX_GL_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["arifle_MX_SW_Black_F", "", "acc_flashlight", "", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["arifle_MXM_Black_F", "", "acc_flashlight", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "", "acc_flashlight", "optic_Hamr", [], [], "bipod_01_F_blk"],
    ["arifle_MXM_Black_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
    ["srifle_EBR_F", "", "acc_flashlight", "optic_MRCO", [], [], "bipod_01_F_blk"]
]];

_militiaLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_camo", "", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];

_militiaLoadoutData set ["sniperRifles", [
    ["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
    ["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_ACPC2_F", "hgun_P07_blk_F", "hgun_P07_khk_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CombatUniform_mcam_wdl_f"]];
_crewLoadoutData set ["vests", ["V_Chestrig_oli", "V_TacVest_oli"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_B"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_HeliPilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_TacVest_oli"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_B", "H_PilotHelmetHeli_B"]];

//
if (_hasMarksman) then {
    #include "..\DLC_content\weapons\Marksman\Vanilla_NATO_Temparate.sqf"
};

if (_hasLawsOfWar) then {
    #include "..\DLC_content\gear\Lawsofwar\Vanilla_NATO.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\gear\Apex\Vanilla_NATO_Temparate.sqf"
    #include "..\DLC_content\weapons\Apex\Vanilla_NATO_Temparate.sqf"
};

if (_hasContact) then {
    #include "..\DLC_content\gear\Contact\Vanilla_NATO_Temparate.sqf"
    #include "..\DLC_content\weapons\Contact\Vanilla_NATO_Temparate.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\gear\RF\Vanilla_NATO_Temparate.sqf"
    #include "..\DLC_content\weapons\RF\Vanilla_NATO_Temparate.sqf"
};

if (_hasWs) then {
    #include "..\DLC_content\gear\WS\Vanilla_NATO_Temparate.sqf"
    #include "..\DLC_content\weapons\WS\Vanilla_NATO_Temparate.sqf"
};

if (_hasGM) then {
    #include "..\DLC_content\weapons\GM\Vanilla_NATO.sqf"
};

if (_hasSOG) then {
    #include "..\DLC_content\gear\SOG\Vanilla_NATO.sqf"
    #include "..\DLC_content\weapons\SOG\Vanilla_NATO.sqf"
};

if (_hasEF) then {
    #include "..\DLC_content\gear\EF\Vanilla_NATO_Temparate.sqf"
    #include "..\DLC_content\weapons\EF\Vanilla_NATO_Temparate.sqf"
};
//

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["backpacks"] call _fnc_setBackpack;

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
