///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "AAF Loyalists"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CUP\images\flag_aaf_torn_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_aaf_torn_co"] call _fnc_saveToTemplate;

["vehiclesBasic", ["CUP_I_SUV_ION"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_I_LR_Transport_AAF", "a3u_cup_m1025_unarmed_olive"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_I_LR_MG_AAF", "a3u_cup_m1025_m240_olive", "a3u_cup_m1025_sov_m2_olive"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["a3u_cup_mtvr_wl"]] call _fnc_saveToTemplate;
["vehiclesAT", ["a3u_cup_m1036_tow_olive"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_LR_AA_AAF", "CUP_I_ZSU23_AAF"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["CUP_B_RHIB_USMC"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_I_AV8B_DYN_AAF"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["CUP_I_C130J_AAF"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_C_LR_Transport_CTK"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["CUP_C_Fishing_Boat_Chernarus"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US", "CUP_B_M2StaticMG_MiniTripod_US"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_L16A2_BAF_WDL"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

#include "CUP_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_arifle_G3A3_modern_ris", "CUP_arifle_Mk16_STD_AFG_woodland", "CUP_arifle_AK12_black",
    "CUP_20Rnd_762x51_G3", "CUP_20Rnd_556x45_Stanag", "CUP_30Rnd_545x39_AK12_M",
    "CUP_hgun_Glock17_blk", "CUP_hgun_M9", "CUP_17Rnd_9x19_glock17", "CUP_15Rnd_9x19_M9",
    ["CUP_launch_M72A6", 50], ["CUP_launch_FIM92Stinger", 5],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_M67", "SmokeShell",
    "CUP_V_CZ_NPP2006_nk_black", "V_PlateCarrierIA1_dgtl", "V_PlateCarrierIA2_dgtl",
    "CUP_V_B_Interceptor_Base_Olive", "CUP_V_I_RACS_Carrier_Rig_wdl_3", "CUP_V_B_RRV_Scout",
    "CUP_B_ACRPara_m95", "CUP_B_ACRScout_m95", "CUP_B_USMC_AssaultPack","CUP_B_Kombat_Olive","CUP_B_Kombat_Radio_Olive","CUP_B_RUS_Backpack",
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
    "U_I_CombatUniform"
]; //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "U_I_CombatUniform"
]; //Uniforms given to AI Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "H_HelmetIA",
    "CUP_H_CZ_Helmet10",
    "CUP_H_OpsCore_Covered_AAF_NoHS"
]] call _fnc_saveToTemplate; //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", [
    "None",
    "CUP_G_Balaclava_blk",
    "CUP_G_Balaclava_oli",
    "CUP_G_Bandanna_aviator",
    "CUP_G_Bandanna_beast",
    "CUP_G_Bandanna_blk",
    "CUP_G_Bandanna_khk",
    "CUP_G_Bandanna_oli",
    "CUP_G_Bandanna_shades"
]];

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