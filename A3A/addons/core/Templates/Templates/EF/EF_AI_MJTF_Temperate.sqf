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

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "MJTF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "MJTF"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\ef\ef_data\data\Flag_29thMEU_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "EF_flag_29thMEU"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["EF_B_SDV_01_MJTF_Des"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["SpaceshipCapsule_01_F"]] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _basic = ["B_T_Quadbike_01_F"];
private _unarmedVehicles = ["B_T_MRAP_01_F"];
private _armedVehicles = ["B_T_MRAP_01_gmg_F", "B_T_MRAP_01_hmg_F", "EF_B_MRAP_01_AT_MJTF_Wdl", "EF_B_MRAP_01_FSV_MJTF_Wdl","EF_B_MRAP_01_LAAD_MJTF_Wdl"];
private _Trucks = ["B_Truck_01_covered_F", "B_Truck_01_transport_F"];
private _cargoTrucks = ["B_T_Truck_01_cargo_F", "B_T_Truck_01_flatbed_F"];
private _ammoTrucks = ["B_T_Truck_01_ammo_F"];
private _repairTrucks = ["B_T_Truck_01_Repair_F","B_T_APC_Tracked_01_CRV_F"];
private _fuelTrucks = ["B_T_Truck_01_fuel_F"];
private _medicalTrucks = ["B_T_Truck_01_medical_F"];
private _lightAPCs = [];
private _APCs = ["B_T_APC_Wheeled_01_cannon_F"];
private _IFVs = ["EF_B_AAV9_MJTF_Wdl", "EF_B_AAV9_MJTF_Wdl", "EF_B_AAV9_50mm_MJTF_Wdl"];

private _airborneVehicles = ["B_T_APC_Wheeled_01_cannon_F","B_T_UGV_01_olive_F"];
private _lightTanks = ["B_T_UGV_01_olive_F"];
private _tanks = ["B_T_MBT_01_cannon_F", "B_T_MBT_01_TUSK_F"];
private _aa = ["EF_B_MRAP_01_LAAD_MJTF_Wdl", "B_T_APC_Tracked_01_AA_F"];

private _transportBoat = ["B_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"];
["vehiclesGunBoats", ["EF_B_CombatBoat_HMG_MJTF_Wdl", "EF_B_CombatBoat_AT_MJTF_Wdl"]] call _fnc_saveToTemplate;
//["vehiclesAmphibious", []] call _fnc_saveToTemplate; not now

private _planesCAS = ["B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F"];
private _planesLargeCAS = [];

private _planesAA = ["B_Plane_CAS_01_dynamicLoadout_F","B_UAV_02_dynamicLoadout_F"];
private _planesLargeAA = [];
["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", ["B_T_VTOL_01_armed_F"]] call _fnc_saveToTemplate;

private _helisLight = ["a3a_Heli_Light_01_ION_F"];
private _transportHelicopters =  ["EF_B_Heli_Transport_01_MJTF_Des"];
private _helisLightAttack = ["B_Heli_Light_01_dynamicLoadout_F"];
private _helisAttack = ["EF_B_AH99J_MJTF_Des", "B_Heli_Attack_01_dynamicLoadout_F"];

private _artillery = ["B_T_MBT_01_mlrs_F"];

["magazines", createHashMapFromArray [
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

private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F"];

private _staticMG = ["B_G_HMG_02_high_F", "B_HMG_01_high_F"];
private _staticAT = ["B_T_Static_AT_F","B_GMG_01_high_F"];
["staticAA", ["B_T_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_T_Mortar_01_F"]] call _fnc_saveToTemplate;
private _howitzers = [];

private _radar = [];
private _SAM = ["EF_LPD_Turret_1_MJTF_Wdl"];

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
["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;
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

#include "..\Vanilla\Vanilla_Vehicle_Attributes.sqf"

["animations", [
    #include "..\vehicleAnimations\vehicleAnimations_Vanilla.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_WS.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_RF.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_GM.sqf",
    #include "..\vehicleAnimations\vehicleAnimations_CSLA.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\CSLA_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\GM_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\RF_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\Vanilla_NATO_Temparate.sqf",
    #include "..\vehicleVariants\Vanilla_NATO_Temparate\WS_NATO_Temparate.sqf"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _voices = [
"Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG",
"Male10ENG","Male11ENG","Male12ENG","Male01ENGFRE","Male02ENGFRE","Male01FRE","Male02FRE","Male03FRE"
];
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
"WhiteHead_22_l","WhiteHead_22_sa","WhiteHead_22_a",
"EF_Black_01","EF_Black_01_lush","EF_White_01","EF_White_01_lush",
"EF_White_02","EF_White_02_lush","EF_Black_02","EF_Black_02_lush"
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

["voices", _voices] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;
["eliteVoices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG",
"Male10ENG","Male11ENG","Male12ENG","Male01ENGFRE","Male02ENGFRE","Male01FRE","Male02FRE","Male03FRE","Male01POL","Male02POL","Male03POL"]] call _fnc_saveToTemplate;
["faces", _faces] call _fnc_saveToTemplate;
["insignia", ["EF_29th_MEU_Color", "EF_29th_MEU_Color", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["EF_29th_MEU_LowVis"]] call _fnc_saveToTemplate;


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
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["launch_NLAW_F"]];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_tna_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", ["hgun_P07_khk_F", "hgun_P07_blk_F"]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


///Basic equipment. Shouldn't need touching most of the time.
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
_loadoutData set ["sniHats", ["EF_H_Booniehat_Wdl"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["EF_U_B_MarineCombatUniform_Diver_Wdl"]];//this line determines uniforms for special forces -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_sfLoadoutData set ["vests", ["EF_V_AAV_Rifleman_Black", "EF_V_AAV_Scout_Black"]];
_sfLoadoutData set ["glVests", ["EF_V_AAV_Support_Black"]];
_sfLoadoutData set ["Hvests", ["EF_V_AAV_TL_Black"]];
_sfLoadoutData set ["backpacks", ["EF_B_RaiderPack_black"]];
_sfLoadoutData set ["helmets", ["EF_H_HelmetB_light_black_slick", "EF_H_MCH_BasicNet_Black", "EF_H_MCH_FullCamo_Black"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["NVGs", ["EF_LPNVG_Tan", "EF_LPNVG"]];
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
["arifle_MX_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["ef_arifle_mxar_black", "ef_snds_mxar", "acc_pointer_IR", "ef_optic_mbs", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_GL_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_black", "ef_snds_mxar", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""]
]];
_sfLoadoutData set ["rifles", [
["ef_arifle_mxar_black", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_MX_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_MX_GL_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_black", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SMG_01_F", "muzzle_snds_acp", "", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "ef_optic_microsight", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["arifle_MX_SW_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_Hamr", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
["arifle_MXM_Black_F", "ef_snds_mxar", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MXM_Black_F", "ef_snds_mxar", "acc_pointer_IR", "ef_optic_mbs", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "ef_optic_mbs", [], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["ef_hgun_Pistol_heavy_01_coy", "muzzle_snds_acp", "acc_flashlight_pistol", "ef_optic_microsight_pistol_coy", [], [], ""],
["hgun_P07_khk_F", "muzzle_snds_L", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["EF_U_B_MarineCombatUniform_Diver_Wdl"]];//this line determines uniforms for special forces -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_eliteLoadoutData set ["vests", ["EF_V_AAV_Rifleman_Black", "EF_V_AAV_Scout_Black"]];
_eliteLoadoutData set ["glVests", ["EF_V_AAV_Support_Black"]];
_eliteLoadoutData set ["Hvests", ["EF_V_AAV_TL_Black"]];
_eliteLoadoutData set ["backpacks", ["EF_B_RaiderPack_black"]];
_eliteLoadoutData set ["helmets", ["EF_H_HelmetB_light_black_slick", "EF_H_MCH_BasicNet_Black", "EF_H_MCH_FullCamo_Black"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData set ["NVGs", ["EF_LPNVG_Tan", "EF_LPNVG"]];
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

_eliteLoadoutData set ["slRifles", [
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["ef_arifle_mxar_black", "", "acc_pointer_IR", "ef_optic_mbs", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_black", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["ef_arifle_mxar_black", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_MX_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_MX_GL_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_black", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Holosight_smg_blk_F", [], [], ""],
["SMG_01_F", "", "", "ef_optic_microsight", [], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_Hamr", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["arifle_MXM_Black_F", "", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MXM_Black_F", "", "acc_pointer_IR", "ef_optic_mbs", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_F", "", "acc_pointer_IR", "ef_optic_mbs", [], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["ef_hgun_Pistol_heavy_01_coy", "", "acc_flashlight_pistol", "ef_optic_microsight_pistol_coy", [], [], ""],
["hgun_P07_khk_F", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["EF_U_B_MarineCombatUniform_Wdl_5", "EF_U_B_MarineCombatUniform_Wdl_4"]];
_militaryLoadoutData set ["vests", ["EF_V_AAV_Rifleman_Olive", "EF_V_AAV_Scout_Olive"]];
_militaryLoadoutData set ["Hvests", ["EF_V_AAV_TL_Olive"]];
_militaryLoadoutData set ["glVests", ["EF_V_AAV_Support_Olive"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_oli", "B_Kitbag_sgg", "B_Kitbag_sgg", "EF_B_RaiderPack_olive", "EF_B_RaiderPack_olive"]];
_militaryLoadoutData set ["helmets", ["EF_H_MCH_BasicNet_Olive", "EF_H_MCH_BasicNet_Wdl", "EF_H_MCH_FullCamo_Olive", "EF_H_MCH_FullCamo_Wdl"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["arifle_MX_khk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["ef_arifle_mxar_khk", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["arifle_MX_GL_khk_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_khk", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["ef_arifle_mxar_khk", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["ef_arifle_mxar_khk", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["ef_arifle_mxar_khk", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_MX_khk_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["arifle_MX_khk_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["arifle_MXC_khk_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["arifle_MXC_khk_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["arifle_MXC_khk_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_MX_GL_khk_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_MX_GL_khk_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_khk", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_khk", "", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["ef_arifle_mxar_gl_khk", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "ef_optic_microsight_coy", [], [], ""],
["SMG_01_F", "", "", "ef_optic_Holosight_smg_coy", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "ef_optic_microsight", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "ef_optic_microsight", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["arifle_MX_SW_khk_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["EF_100Rnd_65x39_caseless_coy_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MX_SW_khk_F", "", "acc_pointer_IR", "optic_Aco", ["EF_100Rnd_65x39_caseless_coy_mag_Tracer", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_snd"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
["LMG_Mk200_black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Tracer_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red"], [], "bipod_01_F_snd"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_MXM_khk_F", "", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_snd"],
["arifle_MXM_khk_F", "", "acc_pointer_IR", "ef_optic_mbs_khk", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], "bipod_01_F_snd"],
["srifle_EBR_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
["srifle_EBR_F", "", "acc_pointer_IR", "ef_optic_mbs", [], [], "bipod_01_F_snd"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["ef_hgun_Pistol_heavy_01_coy", "", "acc_flashlight_pistol", "", [], [], ""],
["hgun_P07_khk_F", "", "", "", [], [], ""],
["hgun_P07_khk_F", "", "", "", [], [], ""]
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
_policeLoadoutData set ["sidearms", ["hgun_P07_blk_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["EF_U_B_MarineCombatUniform_Wdl_1", "EF_U_B_MarineCombatUniform_Wdl_2", "EF_U_B_MarineCombatUniform_Wdl_3","EF_U_B_MarineCombatUniform_Wdl_6"]];
_militiaLoadoutData set ["vests", ["EF_V_CCR_Rifleman_Olive", "EF_V_CCR_Scout_Olive"]];
_militiaLoadoutData set ["Hvests", ["EF_V_CCR_TL_Olive"]];
_militiaLoadoutData set ["glVests", ["EF_V_CCR_Support_Olive"]];
_militiaLoadoutData set ["backpacks", ["EF_B_RaiderPack_olive"]];
_militiaLoadoutData set ["helmets", ["EF_H_HelmetB_light_wdl_slick", "EF_H_UtilityCap_Wdl", "H_Bandanna_sgg"]];

_militiaLoadoutData set ["ATLaunchers", [
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""]
]];
_militiaLoadoutData set ["missileATLaunchers", [
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_olive_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""]
]];

_militiaLoadoutData set ["rifles", [
["arifle_SPAR_01_khk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SMG_01_F", "", "acc_flashlight_smg_01", "", [], [], ""],
["arifle_SPAR_01_khk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_SPAR_01_GL_khk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["arifle_SPAR_02_khk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_khk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red"], [], ""],
["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_Red_F"], [], ""],
["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_Tracer_Red_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Red_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["arifle_SPAR_03_khk_F", "", "acc_flashlight", "optic_Hamr", [], [], ""],
["arifle_SPAR_03_khk_F", "", "acc_flashlight", "optic_MRCO", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_P07_khk_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["EF_U_B_MarineCombatUniform_Wdl_5"]];
_crewLoadoutData set ["vests", ["EF_V_AAV_Olive"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_B"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_HeliPilotCoveralls"]];
_pilotLoadoutData set ["vests", ["EF_V_AAV_Olive"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_B", "H_PilotHelmetHeli_B"]];
_pilotLoadoutData set ["facewear", ["G_Aviator","G_Squares_Tinted","G_Tactical_Black"]];

private _officerLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["uniforms", ["U_B_ParadeUniform_01_US_F", "U_B_ParadeUniform_01_US_decorated_F"]];
_officerLoadoutData set ["vests", ["V_TacVest_oli", "V_LegStrapBag_coyote_F"]];
_officerLoadoutData set ["helmets", ["H_ParadeDressCap_01_US_F", "H_Beret_Colonel"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["SMGs", [
["arifle_MXC_khk_F", "", "acc_pointer_IR", "optic_Holosight_khk_F", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""],
["arifle_MXC_khk_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag", "30Rnd_65x39_caseless_khaki_mag_Tracer"], [], ""]
]];

//
if (_hasMarksman) then {
    #include "..\DLC_content\weapons\Marksman\Vanilla_NATO_Arid.sqf"
};

if (_hasLawsOfWar) then {
    #include "..\DLC_content\gear\Lawsofwar\Vanilla_NATO.sqf"
};

if (_hasApex) then {
    #include "..\DLC_content\gear\Apex\Vanilla_NATO_Arid.sqf"
    #include "..\DLC_content\weapons\Apex\Vanilla_NATO_Arid.sqf"
};

if (_hasContact) then {
    #include "..\DLC_content\gear\Contact\Vanilla_NATO_Arid.sqf"
    #include "..\DLC_content\weapons\Contact\Vanilla_NATO_Arid.sqf"
};

if (_hasRF) then {
    #include "..\DLC_content\gear\RF\Vanilla_NATO_Arid.sqf"
    #include "..\DLC_content\weapons\RF\Vanilla_NATO_Arid.sqf"
};

if (_hasWs) then {
    #include "..\DLC_content\gear\WS\Vanilla_NATO_Arid.sqf"
    #include "..\DLC_content\weapons\WS\Vanilla_NATO_Arid.sqf"
};

if (_hasGM) then {
    #include "..\DLC_content\gear\GM\Vanilla_NATO_Arid.sqf"
    #include "..\DLC_content\weapons\GM\Vanilla_NATO.sqf"
};

if (_hasSOG) then {
    #include "..\DLC_content\gear\SOG\Vanilla_NATO.sqf"
    #include "..\DLC_content\weapons\SOG\Vanilla_NATO.sqf"
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
