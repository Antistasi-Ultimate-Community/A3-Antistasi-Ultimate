//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "CUP_O_Hilux_unarmed_TK_CIV", 0.5
    , "CUP_C_LR_Transport_CTK", 0.5
	, "CUP_C_Ikarus_TKC", 0.2
    , "CUP_C_Bus_City_TKCIV", 0.2
    , "CUP_C_SUV_TK", 0.1
    , "CUP_C_Datsun", 0.5
	, "CUP_C_Datsun_Covered", 0.2
	, "CUP_C_Volha_CR_CIV", 0.5
	, "CUP_C_Lada_CIV", 0.5
    , "CUP_C_Golf4_CR_Civ", 0.2
	, "CUP_C_Octavia_CIV", 0.2
	, "CUP_C_Pickup_unarmed_CIV", 0.5
	, "CUP_C_Skoda_CR_CIV", 0.5
	, "CUP_C_S1203_CIV", 0.5
	, "CUP_C_TT650_TK_CIV", 0.2
	, "CUP_C_UAZ_Unarmed_TK_CIV", 0.2
	, "CUP_C_UAZ_Open_TK_CIV", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", [
    "CUP_C_Mi17_Civilian_RU", 0.5
    , "CUP_C_Mi17_VIV_RU", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "CUP_C_V3S_Open_TKC", 0.3
    , "CUP_C_V3S_Covered_TKC", 0.2
    , "CUP_C_Ural_Civ_03", 0.2
	, "CUP_C_Ural_Open_Civ_03", 0.1
	, "C_Truck_02_transport_F", 0.1
	, "C_Truck_02_covered_F", 0.1
	, "CUP_C_Tractor_Old_CIV", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "CUP_C_Fishing_Boat_Chernarus", 0.2
    , "CUP_C_PBX_CIV", 0.7
    , "CUP_C_Zodiac_CIV", 0.7
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "C_Truck_02_box_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "CUP_C_S1203_Ambulance_CIV", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Truck_02_fuel_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivPlanes", [
	"CUP_C_AN2_AEROSCHROT_TK_CIV", 0.5
    , "CUP_C_AN2_AIRTAK_TK_CIV", 0.5
    , "CUP_C_DC3_CIV", 0.5
	, "CUP_C_C47_CIV", 0.5
]] call _fnc_saveToTemplate;

["variants", [
	["CUP_C_Volha_CR_CIV", ["TKCiv1", 1, "TKCiv2", 1, "TKLimo", 1]],
	["CUP_C_Ural_Civ_03", ["CIV1", 1, "CIV2", 1, "CIV3", 1]],
	["CUP_C_Ural_Open_Civ_03", ["CIV1", 1, "CIV2", 1, "CIV3", 1]],
	["C_Truck_02_transport_F", ["Blue", 1, "Orange", 1]],
	["C_Truck_02_covered_F", ["BlueBlue", 0.5, "BlueOlive", 1, "OrangeBlue", 0.5, "OrangeOlive", 1]],
	["C_Truck_02_box_F", ["BlueGreen", 1, "BlueOrange", 0.5, "OrangeGreen", 1, "OrangeOrange", 0.5]],
	["C_Truck_02_fuel_F", ["Blue", 1, "Orange", 1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_TK","CUP_D_Male02_TK","CUP_D_Male03_TK","CUP_D_Male04_TK","CUP_D_Male05_TK"]] call _fnc_saveToTemplate;
"TakistaniMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "CUP_O_TKI_Khet_Jeans_04",
    "CUP_O_TKI_Khet_Jeans_02",
    "CUP_O_TKI_Khet_Jeans_01",
    "CUP_O_TKI_Khet_Jeans_03",
    "CUP_O_TKI_Khet_Partug_04",
    "CUP_O_TKI_Khet_Partug_02",
    "CUP_O_TKI_Khet_Partug_01",
    "CUP_O_TKI_Khet_Partug_07",
    "CUP_O_TKI_Khet_Partug_08",
    "CUP_O_TKI_Khet_Partug_05",
    "CUP_O_TKI_Khet_Partug_06",
    "CUP_O_TKI_Khet_Partug_03",
    "CUP_U_C_Citizen_02",
    "CUP_U_C_Citizen_01",
    "CUP_U_C_Citizen_04",
    "CUP_U_C_Citizen_03",
	"CUP_U_C_Labcoat_02",
	"CUP_U_C_Labcoat_03",
	"CUP_U_C_Labcoat_01",
    "CUP_U_C_Tracksuit_02",
    "CUP_U_C_Tracksuit_01",
	"CUP_U_C_Tracksuit_04",
    "CUP_U_C_Tracksuit_03",
	"CUP_U_C_Villager_01",
	"CUP_U_C_Villager_04",
	"CUP_U_C_Villager_02",
	"CUP_U_C_Villager_03",
	"CUP_U_C_Profiteer_02",
	"CUP_U_C_Profiteer_03",
	"CUP_U_C_Profiteer_01",
	"CUP_U_C_Profiteer_04",
	"CUP_U_C_racketeer_01",
	"CUP_U_C_racketeer_04",
	"CUP_U_C_racketeer_02",
	"CUP_U_C_racketeer_03"
];

private _civUniformsAI = [
    "CUP_O_TKI_Khet_Jeans_04",
    "CUP_O_TKI_Khet_Jeans_02",
    "CUP_O_TKI_Khet_Jeans_01",
    "CUP_O_TKI_Khet_Jeans_03",
    "CUP_O_TKI_Khet_Partug_04",
    "CUP_O_TKI_Khet_Partug_02",
    "CUP_O_TKI_Khet_Partug_01",
    "CUP_O_TKI_Khet_Partug_07",
    "CUP_O_TKI_Khet_Partug_08",
    "CUP_O_TKI_Khet_Partug_05",
    "CUP_O_TKI_Khet_Partug_06",
    "CUP_O_TKI_Khet_Partug_03"
];

private _pressUniforms = ["U_C_Journalist", "U_Marshal"];            //Uniforms given to Press/Journalists

private _workerUniforms = [
	"CUP_U_C_Worker_03",
	"CUP_U_C_Worker_04",
	"CUP_U_C_Worker_02",
	"CUP_U_C_Worker_01",
	"CUP_U_C_Mechanic_02",
	"CUP_U_C_Mechanic_03",
	"CUP_U_C_Mechanic_01"
];           //Uniforms given to Workers at Factories/Resources

private _vipUniforms = [
    "CUP_U_C_Suit_01",
    "CUP_U_C_Suit_02",
    "CUP_U_C_Suit_03",
    "CUP_U_C_Functionary_jacket_02",
    "CUP_U_C_Functionary_jacket_01",
    "CUP_U_C_Functionary_jacket_03"
];

["uniforms", _civUniforms + _civUniformsAI + _pressUniforms + _workerUniforms + _vipUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civHats = [
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TKI_Lungee_Open_02",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Pakol_1_01",
	"CUP_H_TKI_Pakol_1_03",
	"CUP_H_TKI_Pakol_1_04",
	"CUP_H_TKI_Pakol_1_05",
	"CUP_H_TKI_Pakol_1_06",
	"CUP_H_TKI_Pakol_2_01",
	"CUP_H_TKI_Pakol_2_02",
	"CUP_H_TKI_Pakol_2_03",
    "CUP_H_TKI_SkullCap_01",
    "CUP_H_TKI_SkullCap_02",
    "CUP_H_TKI_SkullCap_03",
    "CUP_H_TKI_SkullCap_04",
    "CUP_H_TKI_SkullCap_05",
    "CUP_H_TKI_SkullCap_06"
];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.


private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniformsAI];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["vests", [
	"CUP_V_OI_TKI_Jacket1_04", "CUP_V_OI_TKI_Jacket1_06", "CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket5_04", "CUP_V_OI_TKI_Jacket5_05", "CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket6_04", "CUP_V_OI_TKI_Jacket6_05", "CUP_V_OI_TKI_Jacket6_06"
]];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];
_loadoutData set ["facewear", [
	"G_Aviator",
	"CUP_Beard_Black",
	"CUP_Beard_Brown",
	"CUP_TK_NeckScarf",
	"CUP_FR_NeckScarf",
	"CUP_FR_NeckScarf2",
	"CUP_FR_NeckScarf4",
	"CUP_FR_NeckScarf5",
	"CUP_G_TK_RoundGlasses",
	"CUP_G_TK_RoundGlasses_blk",
	"CUP_G_TK_RoundGlasses_gold"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["vipUniforms", _vipUniforms];
_loadoutData set ["sidearms", ["CUP_hgun_Browning_HP", "CUP_hgun_CZ75", "CUP_hgun_Makarov", "CUP_hgun_TT"]];


private _manTemplate = {
	[selectRandomWeighted [[], 1, "helmets", 2]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "vests", 2]] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
	[selectRandomWeighted [[], 1, "helmets", 2]] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _vipTemplate = {
    ["vipUniforms"] call _fnc_setUniform;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};
private _prefix = "militia";
private _unitTypes = [
    ["VIP", _vipTemplate],
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
