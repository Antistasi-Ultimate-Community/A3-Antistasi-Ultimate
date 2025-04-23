///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Suomi Armeija"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\NFtS\flag_finland.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_FIN"] call _fnc_saveToTemplate;

["vehiclesBasic", ["NORTH_FIN_41_R75"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1_w"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["LIB_Kfz1_MG42_sernyt"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["NORTH_FIN_W_FordV8"]] call _fnc_saveToTemplate;
["vehiclesAT", ["NORTH_FIN_W_BA10"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["LIB_LCVP"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["LIB_ACI_P39"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["LIB_GazM1","LIB_GazM1_dirty"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["LIB_Zis5v_w"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["NORTH_FIN_Syoksyvene"]] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["LIB_US6_Tent"]] call _fnc_saveToTemplate;

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
    "NORTH_fin_m27rv","LIB_PTRD",
    "NORTH_5Rnd_m39_mag","LIB_1Rnd_145x114",
    "NORTH_l35","NORTH_8Rnd_l35_mag",
    ["NORTH_fin_panzerfaustKlein", 50],
    ["LIB_Ladung_Small_MINE_mag", 10], ["LIB_Ladung_Big_MINE_mag", 3],
    "NORTH_M32Grenade_mag","NORTH_molotov",
    "V_NORTH_FIN_Rifleman_1","V_NORTH_FIN_Rifleman_2","V_NORTH_FIN_Rifleman_3","V_NORTH_FIN_Rifleman_4","V_NORTH_FIN_Rifleman_5","V_NORTH_FIN_Rifleman_6","V_NORTH_FIN_Rifleman_7","V_NORTH_FIN_Rifleman_8","V_NORTH_FIN_Rifleman_9","V_NORTH_FIN_Rifleman_10","V_NORTH_FIN_Rifleman_11","V_NORTH_FIN_Rifleman_12",
    "NORTH_fin_BreadBag", "NORTH_fin_BreadBag2","NORTH_fin_BreadBag3",
    "NORTH_Binocular_Zeiss"
];

//if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
//if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_NORTH_FIN_M27_W_Uniform_Private",
    "U_NORTH_FIN_M27_W_Uniform_Private_2",
    "U_NORTH_FIN_M27_W_Uniform_Private_3",
	"U_NORTH_FIN_M27_W_Uniform_CPL",
    "U_NORTH_FIN_M27_W_Uniform_CPL_2",
    "U_NORTH_FIN_M27_W_Uniform_SGT",
	"U_NORTH_FIN_M27_W_Uniform_SGT_2",
    "U_NORTH_FIN_M27_W_Uniform_Private_1CL",
    "U_NORTH_FIN_M27_W_Uniform_Private_1CL_2"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_NORTH_FIN_M27_civilguardhat",
    "H_NORTH_FIN_M27_civilguardhat_2",
    "H_NORTH_FIN_M27_civilguardhat_3",
	"H_NORTH_FIN_M27_civilguardhat_4"
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
