//////////////////////////////
//   Civilian Information   //
//////////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["vn_o_item_firstaidkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["vn_o_item_medikit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.

//////////////////////////
//       Vehicles       //
//////////////////////////

private _civCarsWithWeights = [
    "vn_c_wheeled_m151_02", 1.8
    ,"vn_c_wheeled_m151_01", 1.8
	,"NORTH_FIN_41_Tempo", 0.1
	,"NORTH_FIN_41_R75", 1.5
	,"NORTH_CIV_FordV8", 0.5
    ,"vn_c_car_02_01", 1.5
    ,"vn_c_car_03_01", 1
    ,"vn_c_car_01_01", 0.8
    ,"vn_c_bicycle_01", 0.2
];

["vehiclesCivIndustrial", [
    "NORTH_CIV_FordV8", 0.2
    ,"vn_c_car_04_01", 1]] call _fnc_saveToTemplate;

private _civPlanes = [];

["vehiclesCivHeli", ["vn_b_air_uh1d_04_09"]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "vn_c_boat_02_02", 1
    ,"vn_c_boat_07_01", 0.6
    ,"vn_c_boat_08_01", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["vn_b_wheeled_m54_repair_airport", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", []] call _fnc_saveToTemplate;

["vehiclesCivFuel", ["vn_b_wheeled_m54_fuel_airport", 0.2]] call _fnc_saveToTemplate;

["vehiclesCivCar", _civCarsWithWeights] call _fnc_saveToTemplate;
["vehiclesCivPlanes", _civPlanes] call _fnc_saveToTemplate;

["uniforms", [
    "U_NORTH_CIV_Jacket_1",
    "U_NORTH_CIV_Jacket_2",
    "U_NORTH_CIV_Jacket_11",
    "U_NORTH_CIV_Jacket_3",
    "U_NORTH_CIV_Jacket_4",
    "U_NORTH_CIV_Jacket_9",
    "U_NORTH_CIV_Jacket_5",
    "U_NORTH_CIV_Jacket_6",
	"U_NORTH_CIV_Jacket_12",
    "U_NORTH_CIV_Jacket_7",
    "U_NORTH_CIV_Jacket_8",
    "U_NORTH_CIV_Jacket_10",
	"U_NORTH_CIV_Suit_1",
    "U_NORTH_CIV_Suit_2",
    "U_NORTH_CIV_Suit_3",
    "U_NORTH_CIV_Suit_4",
	"U_NORTH_CIV_Suit_5",
    "U_NORTH_CIV_Suit_10",
    "U_NORTH_CIV_Suit_6",
    "U_NORTH_CIV_Suit_7",
	"U_NORTH_CIV_Suit_11",
    "U_NORTH_CIV_Suit_8",
    "U_NORTH_CIV_Suit_9",
    "U_NORTH_CIV_Suit_12",
	"U_NORTH_CIV_Wool_1",
	"U_NORTH_CIV_Wool_2",
	"U_NORTH_CIV_Wool_3",
	"U_NORTH_CIV_Wool_4",
	"U_NORTH_CIV_Wool_5",
	"U_NORTH_CIV_Wool_6",
	"U_NORTH_CIV_Wool_7"
]] call _fnc_saveToTemplate;

["headgear", [
    "H_NORTH_Flatcap_Gr",
    "H_NORTH_Workercap_Be",
    "H_NORTH_Workercap_Bl",
    "H_NORTH_Workercap",
    "H_NORTH_Workercap_G",
	"H_NORTH_Fedora_Beige",
    "H_NORTH_Fedora_Beige_2",
    "H_NORTH_Fedora_Black",
    "H_NORTH_Fedora_Blue",
    "H_NORTH_Fedora_Black_2",
	"H_NORTH_Fedora_Blue_2",
    "H_NORTH_Fedora_Brown",
    "H_NORTH_Fedora_Brown_2",
    "H_NORTH_Fedora_Grey",
    "H_NORTH_Fedora_Olive",
	"H_NORTH_Fedora_Olive_2",
    "H_NORTH_Fedora_White",
    "H_NORTH_Fedora_White_2",
    "H_NORTH_Homburg_Black",
    "H_NORTH_Homburg_Grey",
    "H_NORTH_Workercap_R"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["NORTH_WhiteHead_24", "NORTH_WhiteHead_01", "NORTH_WhiteHead_02", "NORTH_WhiteHead_18", "NORTH_WhiteHead_05", "NORTH_WhiteHead_03", "NORTH_WhiteHead_04", "NORTH_WhiteHead_06", "NORTH_WhiteHead_25"]] call _fnc_saveToTemplate;
["currencySymbol", "$"] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_NORTH_CIV_Jacket_1",
    "U_NORTH_CIV_Jacket_11",
    "U_NORTH_CIV_Jacket_3",
    "U_NORTH_CIV_Jacket_4",
    "U_NORTH_CIV_Jacket_9",
    "U_NORTH_CIV_Jacket_5",
    "U_NORTH_CIV_Jacket_6",
	"U_NORTH_CIV_Jacket_12",
    "U_NORTH_CIV_Jacket_7",
    "U_NORTH_CIV_Jacket_8",
    "U_NORTH_CIV_Jacket_10"
];

private _pressUniforms = [
    "U_NORTH_CIV_Jacket_2"
    ];

private _vipUniforms = [
    "U_NORTH_CIV_Wool_6",
    "U_NORTH_CIV_Wool_7"
];

["uniforms", _civUniforms + _pressUniforms + _vipUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "H_NORTH_Flatcap_Gr",
    "H_NORTH_Workercap_Be",
    "H_NORTH_Workercap_Bl",
    "H_NORTH_Workercap",
    "H_NORTH_Workercap_G",
	"H_NORTH_Fedora_Beige",
    "H_NORTH_Fedora_Beige_2",
    "H_NORTH_Fedora_Black",
    "H_NORTH_Fedora_Blue",
    "H_NORTH_Fedora_Black_2",
	"H_NORTH_Fedora_Blue_2",
    "H_NORTH_Fedora_Brown",
    "H_NORTH_Fedora_Brown_2",
    "H_NORTH_Fedora_Grey",
    "H_NORTH_Fedora_Olive",
	"H_NORTH_Fedora_Olive_2",
    "H_NORTH_Fedora_White",
    "H_NORTH_Fedora_White_2",
    "H_NORTH_Homburg_Black",
    "H_NORTH_Homburg_Grey",
    "H_NORTH_Workercap_R"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerHelmets", [
	"H_NORTH_Workercap_Be",
    "H_NORTH_Workercap_Bl",
    "H_NORTH_Workercap",
    "H_NORTH_Workercap_G"]];
_loadoutData set ["helmets", _civHats];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["vipUniforms", _vipUniforms];
_loadoutData set ["sidearms", ["NORTH_TT33", "NORTH_l35", "NORTH_M44"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["workerHelmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _vipTemplate = {
    ["vipUniforms"] call _fnc_setUniform;

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
