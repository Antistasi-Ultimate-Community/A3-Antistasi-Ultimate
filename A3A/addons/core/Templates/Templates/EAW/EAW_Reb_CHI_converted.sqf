///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "ROC"] call _fnc_saveToTemplate;

["flag", "Flag_Red_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\EAW\roc_flag.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_roc"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesBasic", ["fow_v_truppenfahrrad_ger_heer"]];
_vehiclesData set ["vehiclesLightUnarmed", ["LIB_Willys_MB"]];
_vehiclesData set ["vehiclesLightArmed", ["LIB_US_Willys_MB_M1919"]];
_vehiclesData set ["vehiclesTruck", ["EAW_Dodge1936_Pickup_Military_ROC"]];
_vehiclesData set ["vehiclesAT", ["EAW_Vickers6Ton"]];
_vehiclesData set ["vehiclesAA", ["LIB_Zis5v_61K"]];

_vehiclesData set ["vehiclesBoat", ["EAW_Daihatsu_LC"]];

_vehiclesData set ["vehiclesPlane", ["LIB_RAAF_P39"]];

_vehiclesData set ["vehiclesCivCar", ["LIB_GazM1","LIB_GazM1_dirty"]];
_vehiclesData set ["vehiclesCivTruck", ["EAW_Dodge1936_Pickup"]];
_vehiclesData set ["vehiclesCivHeli", []];
_vehiclesData set ["vehiclesCivBoat", ["LIB_LCA"]];
_vehiclesData set ["vehiclesCivSupply", ["fow_v_type97_truck_ija"]];

_vehiclesData set ["staticMGs", ["EAW_Type24_MG"]];
_vehiclesData set ["staticAT", ["EAW_ROC_Pak36"]];
_vehiclesData set ["staticAA", ["LIB_FlaK_30"]];
_vehiclesData set ["staticMortars", ["EAW_ROC_Type20_Mortar"]];
_vehiclesData set ["staticMortarMagHE", "EAW_Type97_81mm_HE"];
_vehiclesData set ["staticMortarMagSmoke", "EAW_Type97_81mm_Flare"];

_vehiclesData set ["minesAT", "LIB_TMI_42_MINE_mag"];
_vehiclesData set ["minesAPERS", "LIB_shumine_42_MINE_mag"];

["vehiclesData", [
    _vehiclesData
]] call _fnc_saveVehiclesToTemplate;


["breachingExplosivesAPC", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 2]]] call _fnc_saveToTemplate;

#include "EAW_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "EAW_Hanyang88_Base","LIB_PTRD",
    "EAW_Hanyang88_Magazine","LIB_1Rnd_145x114",
    "LIB_M1895","LIB_7Rnd_762x38",
    ["LIB_Ladung_Small_MINE_mag", 10], ["LIB_Ladung_Big_MINE_mag", 3],
    "EAW_Chinese_Grenade_Mag",
    "EAW_C96_Vest","EAW_Chinese_MP28_Kit","EAW_NRA_PouchesBottom",
    "EAW_Bedroll_2_Tan", "EAW_Bedroll_2_Green","EAW_Bedroll_2_Brown","EAW_Bedroll_2_Blue",
    "LIB_Binocular_GER"
];

// if (A3A_hasTFAR) then {_initialRebelEquipment append ["TFAR_SCR536"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
// if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_SCR536"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "EAW_Chinese_Uniform",
    "EAW_Chinese_Uniform_Brown",
    "EAW_Chinese_Uniform_Green",
	"EAW_Chinese_Uniform_Tan"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "EAW_Adrian",
    "EAW_ROC_Brodie_Blue",
	"EAW_ROC_Brodie_Green",
    "EAW_M35"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LIB_aleksei_IF","LIB_boyartsev_IF","LIB_bykov_IF",
"LIB_Otto_IF","LIB_Volker_IF", "LIB_Walter_IF", "LIB_Wolf_IF"]] call _fnc_saveToTemplate;
["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["binoculars", ["LIB_Binocular_GER"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_LIB_Dienst_Brille", "G_LIB_Dienst_Brille2"]];
_loadoutData set ["goggles", ["G_LIB_Dust_Goggles"]];
_loadoutData set ["facemask", ["G_LIB_Headwrap", "G_LIB_Scarf2_B", "G_LIB_Scarf2_G", "G_LIB_Scarf_B", "G_LIB_Scarf_G"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
