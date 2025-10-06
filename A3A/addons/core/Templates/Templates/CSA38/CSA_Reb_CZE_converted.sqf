///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "UVOD"] call _fnc_saveToTemplate;

["flag", "FlagCarrierCzechRepublic_EP1"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CSA38\flag_Czech.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_CzechRepublic_EP1"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesBasic", ["CSA38_kolo"]];
_vehiclesData set ["vehiclesLightUnarmed", ["LIB_Willys_MB"]];
_vehiclesData set ["vehiclesLightArmed", ["LIB_US_Willys_MB_M1919"]];
_vehiclesData set ["vehiclesTruck", ["CSA38_pragaRV4", "CSA38_pragaRV"]];
_vehiclesData set ["vehiclesAT", ["CSA38_ltvz34"]];
_vehiclesData set ["vehiclesAA", ["LIB_Zis5v_61K"]];

_vehiclesData set ["vehiclesBoat", ["LIB_LCVP"]];

_vehiclesData set ["vehiclesPlane", ["LIB_RAAF_P39"]];

_vehiclesData set ["vehiclesCivCar", ["LIB_GazM1","LIB_GazM1_dirty"]];
_vehiclesData set ["vehiclesCivTruck", ["LIB_Zis5v"]];
_vehiclesData set ["vehiclesCivHeli", []];
_vehiclesData set ["vehiclesCivBoat", ["LIB_LCA"]];
_vehiclesData set ["vehiclesCivSupply", ["LIB_OpelBlitz_Tent_Y_Camo"]];

_vehiclesData set ["staticMGs", ["LIB_M1919_M2"]];
_vehiclesData set ["staticAT", ["csa38_pak35_FR"]];
_vehiclesData set ["staticAA", ["LIB_FlaK_30"]];
_vehiclesData set ["staticMortars", ["LIB_M2_60"]];
_vehiclesData set ["staticMortarMagHE", "LIB_8Rnd_60mmHE_M2"];
_vehiclesData set ["staticMortarMagSmoke", "LIB_60mm_M2_SmokeShell"];

_vehiclesData set ["minesAT", "LIB_TMI_42_MINE_mag"];
_vehiclesData set ["minesAPERS", "LIB_shumine_42_MINE_mag"];

["vehiclesData", [
    _vehiclesData
]] call _fnc_saveVehiclesToTemplate;


["breachingExplosivesAPC", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["LIB_Ladung_Big_MINE_mag", 1], ["LIB_Ladung_Small_MINE_mag", 2]]] call _fnc_saveToTemplate;

#include "CSA_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CSA38_vz23","LIB_PTRD",
    "CSA38_7_92_5xMauser","LIB_1Rnd_145x114",
    "csa38_czvz22","CSA38_9mm_8xBrowning",
    ["LIB_Faustpatrone", 50],
    ["LIB_Ladung_Small_MINE_mag", 10], ["LIB_Ladung_Big_MINE_mag", 3],
    "LIB_Shg24",
    "V_csa38_equip_CZ01","V_csa38_equip_CZ02","V_csa38_equip_CZ12",
    "csa38_GeMedicbag", "csa38_pouzdrovz23",
    "CSA38_Binocular", "csa38_Binocular2"
];

//if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
//if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["B_LIB_US_Radio"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_csa38_uniCZ10",
    "U_csa38_uniCZ01",
	"U_csa38_uniCZ09",
	"U_csa38_uniCZ04",
	"U_csa38_uniCZ08",
	"U_csa38_uniCZ03",
	"U_csa38_uniCZ07",
	"U_csa38_uniCZ05",
	"U_csa38_uniCZ06",
    "U_csa38_uniCZ02"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "Headgear_csa38_CZbaret3",
    "Headgear_csa38_vz31",
	"Headgear_csa38_lodicka1",
    "Headgear_csa38_vz32"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LIB_aleksei_IF","LIB_boyartsev_IF","LIB_bykov_IF",
"LIB_Otto_IF","LIB_Volker_IF", "LIB_Walter_IF", "LIB_Wolf_IF"]] call _fnc_saveToTemplate;
["voices", ["Male01CZ", "Male02CZ", "Male03CZ", "Male04CZ", "Male05CZ"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["binoculars", ["CSA38_Binocular"]];

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
