private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasKart = "kart" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasSOG = "vn" in A3A_enabledDLC;
private _hasSPE = "spe" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

private _civCarsWithWeights = [
  "C_Quadbike_01_F", 0.3
  ,"C_Hatchback_01_F", 7.0
  ,"C_Hatchback_01_sport_F", 0.3
  ,"C_Offroad_01_F", 1.0
  ,"C_SUV_01_F", 1.0
];
private _civBoat = [
  "C_Boat_Civil_01_rescue_F", 0.1            // motorboats
  ,"C_Boat_Civil_01_police_F", 0.1
  ,"C_Boat_Civil_01_F", 1.0
  ,"C_Rubberboat", 1.0                    // rescue boat
];
private _civIndustrial = [
  "C_Van_01_transport_F", 1.0
  ,"C_Van_01_box_F", 0.8
  ,"C_Truck_02_transport_F", 0.5
  ,"C_Truck_02_covered_F", 0.5
];
private _civRepair = [
  "C_Offroad_01_repair_F", 0.3
  ,"C_Truck_02_box_F", 0.1
];
private _civMedical = [];
private _civFuel = [
  "C_Van_01_fuel_F", 0.2
  ,"C_Truck_02_fuel_F", 0.1
];

private _civPlanes = [];
private _civHelicopter = ["C_Heli_Light_01_civil_F", "a3a_C_Heli_Transport_02_F", "a3a_C_Heli_Light_02_blue_F"];

if (_hasRF) then {
  _civCarsWithWeights append [["C_Pickup_covered_rf", 5.0], ["C_Pickup_rf", 6.0]];
  _civHelicopter append ["C_IDAP_Heli_EC_01A_civ_RF", "C_Heli_EC_01_civ_RF", "C_Heli_EC_04_rescue_RF"];
  _civRepair append ["C_Pickup_repair_rf", 0.3];
  _civMedical append ["C_IDAP_Pickup_covered_rf", 0.3];
};

["vehiclesCivCar", _civCarsWithWeights] call _fnc_saveToTemplate;
["vehiclesCivHeli", _civHelicopter] call _fnc_saveToTemplate;
["vehiclesCivIndustrial", _civIndustrial] call _fnc_saveToTemplate;
["vehiclesCivBoat", _civBoat] call _fnc_saveToTemplate;
["vehiclesCivRepair", _civRepair] call _fnc_saveToTemplate;
["vehiclesCivMedical", _civMedical] call _fnc_saveToTemplate;
["vehiclesCivFuel", _civFuel] call _fnc_saveToTemplate;
["vehiclesCivPlanes", _civPlanes] call _fnc_saveToTemplate;

["animations", [
  #include "..\vehicleAnimations\vehicleAnimations_CSLA.sqf",
  #include "..\vehicleAnimations\vehicleAnimations_GM.sqf",
  #include "..\vehicleAnimations\vehicleAnimations_SPE.sqf",
  #include "..\vehicleAnimations\vehicleAnimations_SOG.sqf",
  #include "..\vehicleAnimations\vehicleAnimations_RF.sqf",
  #include "..\vehicleAnimations\vehicleAnimations_WS.sqf",
  #include "..\vehicleAnimations\vehicleAnimations_Vanilla.sqf"
]] call _fnc_saveToTemplate;

["variants", [
  #include "..\vehicleVariants\Vanilla_GM_CIV.sqf"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

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
  "Sturrock",
  "PersianHead_A3_01",
  "PersianHead_A3_02",
  "PersianHead_A3_03",
  "AsianHead_A3_01",
  "AsianHead_A3_02",
  "AsianHead_A3_03",
  "AsianHead_A3_04",
  "AsianHead_A3_05",
  "AsianHead_A3_06",
  "AsianHead_A3_07",
  "AfricanHead_01",
  "AfricanHead_02",
  "AfricanHead_03",
  "Barklem",
  "WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
  "WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08",
  "WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
  "WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
  "WhiteHead_21","WhiteHead_22","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
  "WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", 
  "WhiteHead_31", "WhiteHead_32",
  "TanoanHead_A3_01",
  "TanoanHead_A3_02",
  "TanoanHead_A3_03",
  "TanoanHead_A3_04",
  "TanoanHead_A3_05",
  "TanoanHead_A3_06",
  "TanoanHead_A3_07",
  "TanoanHead_A3_08",
  "TanoanHead_A3_09",
  "RussianHead_1",
  "RussianHead_2",
  "RussianHead_3",
  "RussianHead_4",
  "RussianHead_5",
  "LivonianHead_1",
  "LivonianHead_2",
  "LivonianHead_3",
  "LivonianHead_4",
  "LivonianHead_5",
  "LivonianHead_6",
  "LivonianHead_7",
  "LivonianHead_8",
  "LivonianHead_9",
  "LivonianHead_10"
];

["faces", _faces] call _fnc_saveToTemplate;

private _civUniforms = [
  "U_C_Man_casual_1_F",
  "U_C_Man_casual_2_F",
  "U_C_Man_casual_3_F",
  "U_C_Man_casual_4_F",
  "U_C_Man_casual_5_F",
  "U_C_Man_casual_6_F",
  "U_C_ArtTShirt_01_v1_F",
  "U_C_ArtTShirt_01_v2_F",
  "U_C_ArtTShirt_01_v3_F",
  "U_C_ArtTShirt_01_v4_F",
  "U_C_ArtTShirt_01_v5_F",
  "U_C_ArtTShirt_01_v6_F",
  "U_NikosBody",
  "U_NikosAgedBody",
  "U_C_Poloshirt_blue",
  "U_C_Poloshirt_burgundy",
  "U_C_Poloshirt_stripped",
  "U_C_Poloshirt_tricolour",
  "U_C_Poloshirt_salmon",
  "U_C_Poloshirt_redwhite",
  "U_OrestesBody",
  "U_C_Poor_1",
  "U_C_HunterBody_grn",
  "U_I_L_Uniform_01_tshirt_skull_F",
  "U_I_L_Uniform_01_tshirt_black_F",
  "U_I_L_Uniform_01_tshirt_sport_F",
  "U_C_Uniform_Scientist_02_formal_F",
  "U_C_Uniform_Scientist_02_F",
  "U_C_Uniform_Scientist_01_F"
];

private _pressUniforms = [
  "U_C_Journalist",
  "U_Marshal"
];

private _workerUniforms = [
  "U_C_WorkerCoveralls",
  "U_C_Uniform_Farmer_01_F"
];

private _dlcUniforms = [];

private _civHats = [
  "H_Cap_blk",
  "H_Cap_blu",
  "H_Cap_grn",
  "H_Cap_grn_BI",
  "H_Cap_oli",
  "H_Cap_red",
  "H_Cap_surfer",
  "H_Cap_tan",
  "H_StrawHat",
  "H_StrawHat_dark",
  "H_Hat_checker",
  "H_Hat_Safari_olive_F",
  "H_Hat_Safari_sand_F"
];

private _workerHelmets = ["H_Cap_marshal"];

private _dlcHats = [];

if (_hasRF) then {
  _dlcUniforms append [
    "U_C_PilotJacket_black_RF", 
    "U_C_PilotJacket_open_black_RF", 
    "U_C_PilotJacket_brown_RF", 
    "U_C_PilotJacket_open_brown_RF", 
    "U_C_PilotJacket_lbrown_RF", 
    "U_C_PilotJacket_open_lbrown_RF"
  ];

  _workerUniforms append [
    "U_C_FirefighterFatigues_RF",
    "U_C_FirefighterFatigues_RolledUp_RF"
  ];
  
  _workerHelmets = ["H_Helmet_HardHat_Black_RF", "H_Helmet_HardHat_Yellow_RF", "H_Helmet_HardHat_White_RF"];
};

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", _civHats + _dlcHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms + _dlcUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats + _dlcHats];
_loadoutData set ["workerHelmets", _workerHelmets];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];

private _manTemplate = {
  ["helmets"] call _fnc_setHelmet;
  ["uniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
  [["workerHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
  ["workerUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
  ["pressHelmets"] call _fnc_setHelmet;
  ["pressVests"] call _fnc_setVest;
  ["pressUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
  ["Press", _pressTemplate],
  ["Worker", _workerTemplate],
  ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
