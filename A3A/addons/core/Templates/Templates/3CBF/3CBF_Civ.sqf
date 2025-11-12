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

["vehiclesCivCar", [
    "UK3CB_C_Datsun_Closed", 0.5
    ,"UK3CB_C_Datsun_Open", 1.0            // cargo capable
    ,"UK3CB_C_Gaz24", 1
    ,"UK3CB_C_Golf", 1
    ,"UK3CB_C_Hatchback", 1
    ,"UK3CB_C_Hilux_Closed", 0.5
    ,"UK3CB_C_Hilux_Open", 0.5            // cargo capable
    ,"UK3CB_C_Lada", 0.9
    ,"UK3CB_TKC_C_Lada_Taxi", 0.1
    ,"UK3CB_C_LandRover_Softtop_Transport_Closed", 0.5        // land rovers
    ,"UK3CB_C_LandRover_Softtop_Transport_Open", 0.5
    ,"UK3CB_C_Landcruiser", 1
    ,"UK3CB_C_MMT", 1
    ,"UK3CB_C_Octavia", 1
    ,"UK3CB_C_OLD_BIKE", 1
    ,"UK3CB_C_Pickup",1
    ,"UK3CB_C_S1203", 1
    ,"UK3CB_C_Sedan", 1
    ,"UK3CB_C_Skoda", 1
    ,"UK3CB_C_SUV", 0.3
    ,"UK3CB_C_Tractor_Old", 0.05
    ,"UK3CB_C_TT650", 1
    ,"UK3CB_C_YAVA", 1

]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "UK3CB_C_Kamaz_Covered", 0.3
    ,"UK3CB_C_Kamaz_Open", 0.3
    ,"UK3CB_C_Ural_Covered", 0.3                // Urals
    ,"UK3CB_C_Ural_Open", 0.3
    ,"UK3CB_C_V3S_Closed", 0.3
    ,"UK3CB_C_V3S_Open", 0.3
    ,"RHS_Ural_Civ_01", 0.3
    ,"RHS_Ural_Civ_02", 0.3
    ,"RHS_Ural_Civ_03", 0.3
    ,"RHS_Ural_Open_Civ_01", 0.3
    ,"RHS_Ural_Open_Civ_02", 0.3
    ,"RHS_Ural_Open_Civ_03", 0.3
    ,"UK3CB_C_Forklift", 0.1
    ,"UK3CB_C_Tractor", 0.1
    ,"UK3CB_C_UAZ_Closed", 0.1
    ,"UK3CB_C_UAZ_Open", 0.2
	  ,"UK3CB_C_Ural_Recovery", 0.01
    ]] 
    
    call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "UK3CB_C_Fishing_Boat", 0.3
    ,"UK3CB_C_Fishing_Boat_Smuggler_VIV_FFV", 0.1
    ,"UK3CB_C_Fishing_Boat_Smuggler", 0.2
    ,"UK3CB_C_Fishing_Boat_VIV_FFV", 0.1
    ,"UK3CB_C_Small_Boat_Closed", 0.7
    ,"UK3CB_C_Small_Boat_Open", 0.8
    ,"UK3CB_C_Small_Boat_Wood", 0.9
    ,"rhsgref_civ_canoe", 1
    ]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "UK3CB_C_Ural_Repair", 0.1
    ,"UK3CB_C_V3S_Repair", 0.1
	  ,"UK3CB_C_Kamaz_Repair", 0.1
    ]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
	"UK3CB_C_Hilux_Ambulance", 0.1
	,"UK3CB_C_LandRover_Hardtop_Ambulance", 0.1
	,"UK3CB_C_S1203_Ambulance", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "UK3CB_C_Kamaz_Fuel", 0.1
    ,"UK3CB_C_Ural_Fuel", 0.1                // Ural
    ,"UK3CB_C_V3S_Refuel", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivPlanes", [
  "UK3CB_C_AC500", 1
  ,"UK3CB_C_Antonov_An2", 1
  ,"UK3CB_C_Cessna_172", 2
  ,"UK3CB_C_DC3", 1
  ,"UK3CB_MEC_C_C400", 1
  ]
  ]  
  
  call _fnc_saveToTemplate;

["vehiclesCivHeli", [
  "UK3CB_C_Bell412_Medic", 0.5
  ,"RHS_Mi8amt_civilian", 1
  ,"RHS_Mi8t_civilian", 1
  ,"UK3CB_C_Bell412_Medic", 0.5
  ,"UK3CB_C_Bell412_Luxury", 0.2
  ,"UK3CB_C_Bell412_Civ", 1
  ,"UK3CB_C_UH1H", 1
  ,"UK3CB_C_Bell412_Civ_IDAP", 0.1
  ,"UK3CB_C_Bell412_FLIR_IDAP", 0.1
  ,"UK3CB_C_Bell412_Medic_IDAP", 0.1
  ,"UK3CB_C_Bell412_Luxury_IDAP", 0.1
  ,"UK3CB_C_UH1H_MED_IDAP", 0.1
  ]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

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
    "U_C_Scientist",
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

private _civhats = [
    "H_Bandanna_blu",
    "H_Bandanna_cbr",
    "H_Bandanna_gry",
    "H_Bandanna_khk",
    "H_Bandanna_sand",
    "H_Bandanna_sgg",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
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

private _dlchats = [];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", _civHats + _dlchats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

if (_hasCSLA) then {
  #include "..\DLC_content\gear\CSLA\Vanilla_CIV.sqf"
};

if (_hasApex) then {
  #include "..\DLC_content\gear\Apex\Vanilla_CIV.sqf"
};
if (_hasArtOfWar) then {
  #include "..\DLC_content\gear\Artofwar\Vanilla_CIV.sqf"
};
if (_hasContact) then {
  #include "..\DLC_content\gear\Contact\Vanilla_CIV.sqf"
};

if (_hasLawsOfWar) then {
  #include "..\DLC_content\gear\Lawsofwar\Vanilla_CIV.sqf"
};

if (_hasGM) then {
  #include "..\DLC_content\gear\GM\Vanilla_CIV.sqf"
};

if (_hasWs) then {
  #include "..\DLC_content\gear\WS\Vanilla_CIV.sqf"
};

if (_hasWs && {(toLowerANSI worldName) in ["sefrouramal", "takistan"]}) then {
  #include "..\DLC_content\gear\WS\Vanilla_CIV_desert.sqf"
};

if (_hasRF) then {
  #include "..\DLC_content\gear\RF\Vanilla_CIV.sqf"
};

if (_hasSOG) then {
  #include "..\DLC_content\gear\SOG\Vanilla_CIV.sqf"
};

if (_hasSPE) then {
  #include "..\DLC_content\gear\SPE\Vanilla_CIV.sqf"
};

_loadoutData set ["uniforms", _civUniforms + _dlcUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats + _dlchats];
_loadoutData set ["workerHelmets", _workerHelmets];
_loadoutData set ["pressHelmets", ["H_Cap_press", "rhsgref_helmet_pasgt_press"]];
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
