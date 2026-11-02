//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "CUP_O_Hilux_unarmed_CR_CIV", 0.5
    , "CUP_C_Ikarus_Chernarus", 0.2
    , "CUP_C_SUV_CIV", 0.1
    , "CUP_C_Datsun", 0.5
	, "CUP_C_Datsun_Covered", 0.2
	, "CUP_C_Volha_CR_CIV", 0.5
	, "CUP_C_Lada_CIV", 0.5
    , "CUP_C_Golf4_CR_Civ", 0.5
    , "CUP_C_Octavia_CIV", 0.5
    , "CUP_C_Pickup_unarmed_CIV", 0.5
	, "CUP_C_Skoda_CR_CIV", 0.5
	, "CUP_C_S1203_CIV_CR", 0.5
	, "CUP_C_TT650_CIV", 0.2
	, "CUP_C_UAZ_Unarmed_TK_CIV", 0.1
	, "CUP_C_UAZ_Open_TK_CIV", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", [
    "CUP_C_Mi17_Civilian_RU", 0.5
    , "CUP_C_Mi17_VIV_RU", 0.5
	, "CUP_C_412", 0.5
	, "CUP_C_412_Luxury", 0.1
	, "CUP_C_SA330_Puma_HC1_ChernAvia", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "CUP_C_V3S_Open_TKC", 0.3
    , "CUP_C_V3S_Covered_TKC", 0.2
    , "CUP_C_Ural_Civ_03", 0.2
	, "CUP_C_Ural_Open_Civ_03", 0.1
	, "C_Truck_02_transport_F", 0.1
	, "C_Truck_02_covered_F", 0.1
	, "CUP_C_Tractor_CIV", 0.1
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
    "CUP_B_S1203_Ambulance_CR", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Truck_02_fuel_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivPlanes", [
    "CUP_C_AN2_CIV", 0.5
    , "CUP_C_DC3_ChernAvia_CIV", 0.5
]] call _fnc_saveToTemplate;

["variants", [
	["CUP_C_Ikarus_Chernarus", ["ChernaCiv", 1]],
	["CUP_C_Volha_CR_CIV", ["TKCiv1", 1, "TKCiv2", 1, "TKLimo", 1]],
	["CUP_C_Ural_Civ_03", ["CIV1", 1, "CIV2", 1, "CIV3", 1]],
	["CUP_C_Ural_Open_Civ_03", ["CIV1", 1, "CIV2", 1, "CIV3", 1]],
	["C_Truck_02_transport_F", ["Blue", 1, "Orange", 1]],
	["C_Truck_02_covered_F", ["BlueBlue", 0.5, "BlueOlive", 1, "OrangeBlue", 0.5, "OrangeOlive", 1]],
	["C_Truck_02_box_F", ["BlueGreen", 1, "BlueOrange", 0.5, "OrangeGreen", 1, "OrangeOrange", 0.5]],
	["C_Truck_02_fuel_F", ["Blue", 1, "Orange", 1]],
	["CUP_C_412", ["BlackWhite", 1, "Blue", 1, "Bluelines", 1, "Flamingo", 1, "Frostfire", 1, "Wave", 1, "Luxury", 1, "Parrot", 1, "Red", 1, "Redlines", 1, "Shark", 1, "Sun", 1, "Twilight", 1, "Vrana", 1, "Wasp", 1]],
	["CUP_C_412_Luxury", ["BlackWhite", 1, "Blue", 1, "Bluelines", 1, "Flamingo", 1, "Frostfire", 1, "Wave", 1, "Luxury", 1, "Parrot", 1, "Red", 1, "Redlines", 1, "Shark", 1, "Sun", 1, "Twilight", 1, "Vrana", 1, "Wasp", 1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
	"LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4", "LivonianHead_5",
	"LivonianHead_6", "LivonianHead_7", "LivonianHead_8", "LivonianHead_9", "LivonianHead_10",
	"RussianHead_1", "RussianHead_2", "RussianHead_3", "RussianHead_4", "RussianHead_5",
	"WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
	"WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08",
	"WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12",
	"WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16",
	"WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20",
	"WhiteHead_21", "WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
	"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29",
	"WhiteHead_30", "WhiteHead_31", "WhiteHead_32",
	"Sturrock"
]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;
"CzechMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "CUP_U_C_Citizen_02",
    "CUP_U_C_Citizen_01",
    "CUP_U_C_Citizen_04",
    "CUP_U_C_Citizen_03",
	"CUP_U_C_Labcoat_02",
	"CUP_U_C_Labcoat_03",
	"CUP_U_C_Labcoat_01",
    "CUP_U_C_Rocker_01",
    "CUP_U_C_Rocker_03",
    "CUP_U_C_Rocker_02",
    "CUP_U_C_Rocker_04",
    "CUP_U_C_Tracksuit_02",
    "CUP_U_C_Tracksuit_01",
	"CUP_U_C_Tracksuit_04",
    "CUP_U_C_Tracksuit_03",
	"CUP_U_C_Villager_01",
	"CUP_U_C_Villager_04",
	"CUP_U_C_Villager_02",
	"CUP_U_C_Villager_03",
	"CUP_U_C_Woodlander_01",
	"CUP_U_C_Woodlander_02",
	"CUP_U_C_Woodlander_03",
	"CUP_U_C_Woodlander_04",
	"CUP_U_C_Priest_01",
	"CUP_U_C_Profiteer_02",
	"CUP_U_C_Profiteer_03",
	"CUP_U_C_Profiteer_01",
	"CUP_U_C_Profiteer_04",
	"CUP_U_C_racketeer_01",
	"CUP_U_C_racketeer_04",
	"CUP_U_C_racketeer_02",
	"CUP_U_C_racketeer_03"
];          //Uniforms given to Players

private _civUniformsAI = [
    "CUP_U_C_Citizen_02",
    "CUP_U_C_Citizen_01",
    "CUP_U_C_Citizen_04",
    "CUP_U_C_Citizen_03",
	"CUP_U_C_Profiteer_02",
	"CUP_U_C_Profiteer_03",
	"CUP_U_C_Profiteer_01",
	"CUP_U_C_Profiteer_04",
	"CUP_U_C_racketeer_01",
	"CUP_U_C_racketeer_04",
	"CUP_U_C_racketeer_02",
	"CUP_U_C_racketeer_03",
    "CUP_U_C_Rocker_01",
    "CUP_U_C_Rocker_03",
    "CUP_U_C_Rocker_02",
    "CUP_U_C_Rocker_04",
    "CUP_U_C_Tracksuit_02",
    "CUP_U_C_Tracksuit_01",
	"CUP_U_C_Tracksuit_04",
    "CUP_U_C_Tracksuit_03",
	"CUP_U_C_Villager_01",
	"CUP_U_C_Villager_04",
	"CUP_U_C_Villager_02",
	"CUP_U_C_Villager_03",
	"CUP_U_C_Woodlander_01",
	"CUP_U_C_Woodlander_02",
	"CUP_U_C_Woodlander_03",
	"CUP_U_C_Woodlander_04"
];  //Uniforms given to AI

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

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _vipUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civHats = [
	"H_Cap_grn_BI",
	"H_Cap_blk",
	"H_Cap_blu",
	"H_Cap_red",
	"CUP_H_PMC_Cap_Tan",
	"CUP_H_PMC_Cap_Grey",
	"CUP_H_C_Beanie_01",
	"CUP_H_C_Beanie_02",
	"CUP_H_C_Beanie_03",
	"CUP_H_C_Beanie_04",
	"CUP_H_C_Beret_04",
	"CUP_H_C_Beret_01",
	"CUP_H_C_Beret_02",
	"CUP_H_C_Beret_03",
	"CUP_H_C_Ushanka_03",
	"CUP_H_C_Ushanka_02",
	"CUP_H_C_Ushanka_01",
	"CUP_H_C_Ushanka_04"
];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniformsAI];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];
_loadoutData set ["workerHelmets", ["H_Cap_blk", "H_Cap_blu", "H_Cap_red", "H_Cap_marshal", "CUP_H_PMC_Cap_Tan", "CUP_H_PMC_Cap_Grey"]];
_loadoutData set ["facewear", ["G_Aviator", "G_Shades_Black", "G_Spectacles", "G_Spectacles_Tinted", "G_Squares", "G_Squares_Tinted"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];

_loadoutData set ["vipUniforms", _vipUniforms];
_loadoutData set ["sidearms", ["CUP_hgun_SWM327MP", "CUP_hgun_CZ75", "CUP_hgun_Compact", "CUP_hgun_TT"]];

private _manTemplate = {
    [selectRandomWeighted [[], 2, "helmets", 1]] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["workerHelmets"] call _fnc_setHelmet;
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
	[selectRandomWeighted [[], 2, "helmets", 1]] call _fnc_setHelmet;
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
