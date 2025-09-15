///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "TST"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CUP\images\flag_old_science_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_science"] call _fnc_saveToTemplate;

["vehiclesBasic", ["C_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_LR_Transport_GB_W", "a3u_cup_m1025_unarmed_olive"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["a3u_cup_lr_mg_wl", "a3u_cup_m1025_m240_olive", "a3u_cup_m1025_sov_m2_olive"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["a3u_cup_mtvr_wl"]] call _fnc_saveToTemplate;
["vehiclesAT", ["a3u_cup_m1036_tow_olive"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_M163_Vulcan_USA", "CUP_B_nM1097_AVENGER_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["CUP_B_RHIB_USMC"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["a3u_cup_cessna", "CUP_C_C47_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_C_S1203_Ambulance_CIV"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_C_LR_Transport_CTK", "CUP_C_Golf4_black_Civ", "CUP_C_Golf4_kitty_Civ"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_Ural_Civ_03"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["CUP_C_Fishing_Boat_Chernarus"]] call _fnc_saveToTemplate;

["staticMGs", ["I_E_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_I_SPG9_NAPA"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_I_ZU23_NAPA"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_2b14_82mm_NAPA"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate; //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

#include "CUP_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    ["CUP_arifle_FNFAL5061_wooden", 10], "CUP_srifle_CZ550_rail", "CUP_smg_M3A1_blk",
    ["CUP_10Rnd_762x51_FNFAL_M", 300], "CUP_5x_22_LR_17_HMR_M", "CUP_30Rnd_45ACP_M3A1_BLK_M",
    "CUP_hgun_TEC9", "CUP_32Rnd_9x19_TEC9",
    ["CUP_launch_RPG18", 50],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_I_Carrier_Belt", "CUP_V_I_RACS_Carrier_Rig_2", "CUP_V_I_RACS_Carrier_Rig_wdl_2", "CUP_V_O_SLA_Carrier_Belt02",
    "CUP_V_RUS_Smersh_New_Light", "CUP_V_OI_TKI_Jacket5_05", "CUP_V_OI_TKI_Jacket5_06", "CUP_V_OI_TKI_Jacket3_04", "CUP_V_B_GER_Carrier_Rig_3_Brown",
    "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oli","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk","CUP_B_Bergen_BAF",
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
    "U_C_Scientist"
];          //Uniforms given to Normal Rebels

private _rebUniformsAI = [
    "U_C_Scientist"
];

["uniforms", _rebUniforms + _rebUniformsAI] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "CUP_H_NAPA_Fedora"
]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_30","WhiteHead_15","WhiteHead_14"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_GB_PMC","CUP_D_Male02_GB_PMC","CUP_D_Male03_GB_PMC","CUP_D_Male04_GB_PMC","CUP_D_Male05_GB_PMC"]] call _fnc_saveToTemplate;
"CzechMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", ["CUP_Beard_Black", "None", "CUP_Beard_Brown", "CUP_TK_NeckScarf"]];

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