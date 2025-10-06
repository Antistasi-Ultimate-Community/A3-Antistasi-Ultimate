///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Loners"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_loners"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesBasic", ["rhsgref_cdf_b_reg_uaz_open"]];
_vehiclesData set ["vehiclesLightUnarmed", ["rhsgref_cdf_b_reg_uaz"]];
_vehiclesData set ["vehiclesLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm"]];
_vehiclesData set ["vehiclesTruck", ["rhsgref_cdf_b_zil131"]];
_vehiclesData set ["vehiclesAT", ["rhsgref_cdf_b_reg_uaz_spg9"]];
//_vehiclesData set ["vehiclesAA", ["rhs_gaz66_zu23_msv"]];
_vehiclesData set ["vehiclesBoat", ["I_G_Boat_Transport_01_F"]];

_vehiclesData set ["vehiclesPlane", ["RHS_AN2_B"]];
//_vehiclesData set ["vehiclesCivPlane", [""]];
//_vehiclesData set ["vehiclesMedical", ["C_Van_02_medevac_F"]];

_vehiclesData set ["vehiclesCivCar", ["C_Quadbike_01_F"]];
_vehiclesData set ["vehiclesCivTruck", ["C_Offroad_01_F"]];
_vehiclesData set ["vehiclesCivHeli", ["RHS_Mi8t_civilian"]];
_vehiclesData set ["vehiclesCivBoat", ["C_Rubberboat"]];
// _vehiclesData set ["vehiclesCivCar", []];
// _vehiclesData set ["vehiclesCivTruck", []];
// _vehiclesData set ["vehiclesCivHeli", []];
// _vehiclesData set ["vehiclesCivBoat", []];

_vehiclesData set ["staticMGs", ["rhsgref_ins_DSHKM"]];
_vehiclesData set ["staticAT", ["rhsgref_ins_SPG9"]];
_vehiclesData set ["staticAA", ["rhsgref_ins_ZU23"]];

_vehiclesData set ["staticMortars", ["rhsgref_ins_2b14"]];
_vehiclesData set ["staticMortarMagHE", "8Rnd_82mm_Mo_shells"];
_vehiclesData set ["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"];
_vehiclesData set ["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"];

_vehiclesData set ["minesAT", "ATMine"];
_vehiclesData set ["minesAPERS", "APERSMine_Range_Mag"];

["vehiclesData", [
    _vehiclesData
]] call _fnc_saveVehiclesToTemplate;


["breachingExplosivesAPC", [["rhsusf_m112_mag", 1],["rhsusf_m112x4_mag", 1],["DemoCharge_Remote_Mag", 1],["rhsusf_tm100_mag", 1],["rhssaf_tm200_mag", 1],["rhssaf_tm500_mag", 1],["rhs_ec200_sand_mag", 1],["rhs_ec200_mag", 1],["rhs_ec400_sand_mag", 1],["rhs_ec400_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhsusf_m112_mag", 3],["rhsusf_m112x4_mag", 1],["DemoCharge_Remote_Mag", 2],["rhsusf_tm100_mag", 3],["rhssaf_tm200_mag", 2],["rhssaf_tm500_mag", 1],["rhs_ec200_sand_mag", 2],["rhs_ec200_mag", 2],["rhs_ec400_sand_mag", 1],["rhs_ec400_mag", 1]]] call _fnc_saveToTemplate; //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

#include "STALKER_Reb_Vehicle_Attributes_RHS.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "rhs_weap_m38","rhs_weap_M590_5RD",
    "rhsgref_5Rnd_762x54_m38","rhsusf_5Rnd_00Buck","rhsusf_5Rnd_Slug",
    "rhs_weap_tt33","rhs_weap_makarov_pm", "rhs_mag_762x25_8","rhs_mag_9x18_8_57N181S",
    ["rhs_weap_rpg18", 3],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "rhs_mag_rgd5", "SmokeShell",
    "SCE_Coat_Long_3", "SCE_Coat_Short_3", "SE_Eastern_Chest_Rig_Black", "SE_Eastern_Chest_Rig_Brown","SE_Eastern_Chest_Rig_Green",
    "SE_Alice_Backpack", "SE_Hunting_Backpack", "SE_Explorer_Backpack","SE_Scavenger_Backpack",
    "Binocular"
];

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
	"SE_SEVA_Loner",
	"SCE_Loner_4",
	"SCE_Loner_3",
	"SCE_Loner_2",
	"SCE_Loner_1",
	"SCE_Loner_CBRN",
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
_loadoutData set ["facewear", ["rhsusf_shemagh_grn", "rhsusf_shemagh_od"]];

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