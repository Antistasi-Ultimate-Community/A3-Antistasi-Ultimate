///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Loners"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_loners"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesBasic", ["CUP_C_TT650_RU"]];
_vehiclesData set ["vehiclesLightUnarmed", ["CUP_I_Datsun_4seat"]];
_vehiclesData set ["vehiclesLightArmed", ["CUP_I_Datsun_PK"]];
_vehiclesData set ["vehiclesTruck", ["CUP_C_Ural_Open_Civ_03"]];
_vehiclesData set ["vehiclesAT", ["CUP_I_Hilux_SPG9_NAPA"]];
_vehiclesData set ["vehiclesAA", ["CUP_I_Ural_ZU23_NAPA", "CUP_I_Hilux_igla_NAPA"]];
_vehiclesData set ["vehiclesBoat", ["I_G_Boat_Transport_01_F"]];

_vehiclesData set ["vehiclesPlane", ["CUP_C_DC3_CIV"]];
_vehiclesData set ["vehiclesCivPlane", ["CUP_C_CESSNA_CIV"]];
_vehiclesData set ["vehiclesMedical", ["CUP_O_GAZ_Vodnik_MedEvac_RU"]];

_vehiclesData set ["vehiclesCivCar", ["CUP_O_Hilux_unarmed_CR_CIV_Tan"]];
_vehiclesData set ["vehiclesCivTruck", ["CUP_C_Ural_Civ_01"]];
_vehiclesData set ["vehiclesCivHeli", ["CUP_C_Mi17_Civilian_RU"]];
_vehiclesData set ["vehiclesCivBoat", ["C_Rubberboat"]];
// _vehiclesData set ["vehiclesCivCar", []];
// _vehiclesData set ["vehiclesCivTruck", []];
// _vehiclesData set ["vehiclesCivHeli", []];
// _vehiclesData set ["vehiclesCivBoat", []];

_vehiclesData set ["staticMGs", ["CUP_I_DSHKM_NAPA"]];
_vehiclesData set ["staticAT", ["CUP_I_SPG9_NAPA"]];
_vehiclesData set ["staticAA", ["CUP_I_ZU23_NAPA"]];

_vehiclesData set ["staticMortars", ["CUP_I_2b14_82mm_NAPA"]];
_vehiclesData set ["staticMortarMagHE", "8Rnd_82mm_Mo_shells"];
_vehiclesData set ["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"];
_vehiclesData set ["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"];

_vehiclesData set ["minesAT", "CUP_MineE_M"];
_vehiclesData set ["minesAPERS", "APERSMine_Range_Mag"];

["vehiclesData", [
    _vehiclesData
]] call _fnc_saveVehiclesToTemplate;


["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate; //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

#include "STALKER_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_SKS",
    "CUP_10Rnd_762x39_SKS_M",
    "CUP_hgun_PMM", "CUP_12Rnd_9x18_PMM_M",
    ["CUP_launch_RPG18", 3],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_O_Ins_Carrier_Rig", "CUP_V_B_GER_Carrier_Rig_3_Brown", "CUP_V_O_SLA_M23_1_BRN", "CUP_V_O_SLA_M23_1_OD",
    "SE_Scavenger_Backpack",
    "Binocular"
];

if (["diwako_anomalies"] call A3U_fnc_hasAddon) then {_initialRebelEquipment append ["anomalydetector"]};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "tf_anprc155";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "TFAR_anprc155";
    _initialRebelEquipment pushBack "TFAR_anprc155_coyote";
};

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "SCE_Loner_1",
    "SCE_Loner_2",
    "SCE_Loner_3",
    "SCE_Loner_4",
    "SE_Assault_Fatigues_Loner"
];

private _rebUniformsAI = ["SCE_Bandit_Rags_2_3", "SCE_Bandit_Rags_1_3"] + _rebUniforms;

["uniforms", _rebUniforms + _rebUniformsAI] call _fnc_saveToTemplate;

["headgear", [
    "armst_Hood_closed_loner1",
    "armst_Hood_closed_loner2",
    "armst_Hood_closed_loner3",
    "armst_Hood_closed_loner4",
    "armst_Hood_closed_loner5",
    "armst_Hood_mid_loner1",
    "armst_Hood_mid_loner2",
    "armst_Hood_mid_loner3",
    "armst_Hood_mid_loner4",
    "armst_Hood_mid_loner5",
    "armst_Hood_full_loner1",
    "armst_Hood_full_loner2",
    "armst_Hood_full_loner3",
    "armst_Hood_full_loner4",
    "armst_Hood_full_loner5"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["RussianHead_1","RussianHead_2","RussianHead_3"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", ["CUP_G_Scarf_Face_Blk", "CUP_PMC_Facewrap_Black"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

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