///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Eastern Loyalists"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CUP\images\flag_old_soviet_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_soviet_ea"] call _fnc_saveToTemplate;

["vehiclesBasic", ["CUP_C_TT650_TK_CIV"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["a3u_cup_uaz_unarmed_convertible_1", "a3u_cup_uaz_unarmed_convertible_2", "CUP_B_UAZ_Open_CDF", "CUP_O_Hilux_unarmed_CHDKZ"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_UAZ_MG_CDF", "CUP_O_Hilux_DSHKM_CHDKZ"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["a3u_cup_kamaz_olive", "a3u_cup_kamaz_open_olive"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_B_UAZ_METIS_CDF", "CUP_O_Hilux_metis_CHDKZ", "CUP_O_Hilux_SPG9_CHDKZ"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_O_Hilux_igla_CHDKZ", "CUP_O_Hilux_zu23_CHDKZ"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_B_Su25_Dyn_CDF"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["CUP_C_CESSNA_CIV"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_C_Lada_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_Ural_Open_Civ_03"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_Mi17_Civilian_RU"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["CUP_C_Fishing_Boat_Chernarus"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_O_DSHKM_ChDKZ", "CUP_O_DSHkM_MiniTriPod_ChDKZ"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_O_SPG9_ChDKZ"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_ZU23_ChDKZ"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_O_2b14_82mm_ChDKZ"]] call _fnc_saveToTemplate;
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
    "CUP_srifle_Remington700", "CUP_arifle_SAIGA_MK03_Wood", "CUP_sgun_Saiga12K",
    "CUP_5Rnd_762x51_M24", "CUP_10Rnd_762x39_SaigaMk03_M", "CUP_5Rnd_B_Saiga12_Slug",
    "CUP_hgun_TT", "CUP_hgun_Compact", "CUP_8Rnd_762x25_TT", "CUP_10Rnd_9x19_Compact",
    ["CUP_launch_RPG7V", 10], ["CUP_PG7V_M", 25],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_OI_TKI_Jacket1_04", "CUP_V_O_SLA_Carrier_Belt02", "CUP_V_O_SLA_Carrier_Belt", "CUP_V_CDF_CrewBelt",
    "CUP_V_O_RUS_RPS_Smersh_AK_Brown", "CUP_V_B_GER_Carrier_Rig",
    "CUP_B_RUS_Backpack", "CUP_B_ACRPara_m95", "CUP_B_ACRScout_m95",
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
    "CUP_U_B_BDUv2_roll2_dirty_Alpenflage",
    "CUP_U_B_BDUv2_roll2_gloves_dirty_Alpenflage",
    "CUP_U_B_BDUv2_roll_gloves_dirty_Alpenflage",
    "CUP_U_O_TK_Green",
    "CUP_U_O_TK_MixedCamo",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_C_Woodlander_01"
]; //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "CUP_U_B_BDUv2_roll2_dirty_Alpenflage",
    "CUP_U_B_BDUv2_roll2_gloves_dirty_Alpenflage",
    "CUP_U_B_BDUv2_roll_gloves_dirty_Alpenflage",
    "CUP_U_O_TK_Green",
    "CUP_U_O_TK_MixedCamo",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_C_Woodlander_01"
]; //Uniforms given to AI Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "CUP_H_C_Beanie_04",
    "CUP_H_FR_BandanaWdl",
    "CUP_H_PMC_PRR_Headset",
    "H_Bandanna_gry",
    "H_Bandanna_camo",
    "CUP_H_C_Beanie_01",
    "H_Shemag_olive",
    "H_ShemagOpen_tan",
    "CUP_H_C_Ushanka_04"
]] call _fnc_saveToTemplate; //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR", "CUP_D_Male04_CZ_ACR", "CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;
"RussianMen" call _fnc_saveNames;

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
    "CUP_G_Bandanna_shades",
    "CUP_G_Shades_Black"
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