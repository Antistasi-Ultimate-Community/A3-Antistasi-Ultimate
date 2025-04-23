///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Norges Opprorere"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\NFtS\flag_norway.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Norway"] call _fnc_saveToTemplate;

["vehiclesBasic", ["NORTH_FIN_41_R75"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1_sernyt"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["LIB_Kfz1_MG42_sernyt"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["NORTH_FIN_FordV8"]] call _fnc_saveToTemplate;
["vehiclesAT", ["NORTH_FIN_BA10"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["LIB_LCVP"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["LIB_ACI_P39"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["LIB_GazM1","LIB_GazM1_dirty"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["LIB_Zis5v"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["NORTH_FIN_Syoksyvene"]] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["LIB_OpelBlitz_Tent_Y_Camo"]] call _fnc_saveToTemplate;

["staticMGs", ["NORTH_FIN_Maxim"]] call _fnc_saveToTemplate;
["staticAT", ["NORTH_FIN_45PSTK37"]] call _fnc_saveToTemplate;
["staticAA", ["NORTH_FIN_Lahti_L39AA","NORTH_SOV_Maxim_Quad"]] call _fnc_saveToTemplate;
["staticMortars", ["NORTH_SOV_50rm38"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "NORTH_10Shell_50mm_MortarHEshell_50krh38"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "NORTH_10Shell_50mm_MortarSmokeShell_50krh38"] call _fnc_saveToTemplate;

["mineAT", "LIB_TMI_42_MINE_mag"] call _fnc_saveToTemplate;
["mineAPERS", "LIB_shumine_42_MINE_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 2]]] call _fnc_saveToTemplate;

#include "NFtS_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "NORTH_nor_krag1894","LIB_PTRD",
    "NORTH_5Rnd_krag_bullets","LIB_1Rnd_145x114",
    "NORTH_m1893","NORTH_6Rnd_m1893_mag",
    ["NORTH_fin_panzerfaustKlein", 50],
    ["LIB_Ladung_Small_MINE_mag", 10], ["LIB_Ladung_Big_MINE_mag", 3],
    "NORTH_M32Grenade_mag","NORTH_molotov",
    "V_NORTH_Nor_Belt_Krag","V_NORTH_Nor_Belt_Officer","V_NORTH_Nor_Belt_Madsen22","V_NORTH_Nor_Belt_Madsen14","V_NORTH_Nor_Belt",
    "NORTH_fin_BreadBag", "NORTH_fin_BreadBag2","NORTH_fin_BreadBag3",
    "NORTH_Binocular_Zeiss"
];

//if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
//if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_NORTH_NOR_I_Uniform",
    "U_NORTH_NOR_I_Uniform1",
    "U_NORTH_NOR_I_Uniform2",
	"U_NORTH_NOR_I_Uniform3",
    "U_NORTH_NOR_I_Uniform4",
    "U_NORTH_NOR_I_Uniform_Sergeant",
	"U_NORTH_NOR_I_Uniform_Specialist"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_NORTH_Nor_Fieldcap",
    "H_NORTH_Nor_Fieldcap_2",
    "H_NORTH_Nor_Fieldcap_3",
	"H_NORTH_Nor_Fieldcap_4"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LIB_aleksei_IF","LIB_boyartsev_IF","LIB_bykov_IF",
"LIB_Otto_IF","LIB_Volker_IF", "LIB_Walter_IF", "LIB_Wolf_IF"]] call _fnc_saveToTemplate;
["voices", ["Male01FIN", "Male02FIN", "Male03FIN", "Male04FIN"]] call _fnc_saveToTemplate;

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
