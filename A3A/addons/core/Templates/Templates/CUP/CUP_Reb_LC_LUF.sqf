///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "LUF"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "Flex_CUP_LUF_Faction\Data\Flag\LUF_Flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "CUP_LC_LUF"] call _fnc_saveToTemplate;

["vehiclesBasic", ["Flex_CUP_LUF_TT650"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["Flex_CUP_LUF_Datsun_4seat", "Flex_CUP_LUF_Hilux_unarmed", "Flex_CUP_LUF_Hilux_armored_unarmed"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["Flex_CUP_LUF_Datsun_PK", "Flex_CUP_LUF_Hilux_DSHKM", "Flex_CUP_LUF_Hilux_M2", "Flex_CUP_LUF_Hilux_armored_DSHKM", "Flex_CUP_LUF_Hilux_armored_M2", "Flex_CUP_LUF_BTR40_MG"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["Flex_CUP_LUF_V3S_Open", "Flex_CUP_LUF_V3S_Covered", "Flex_CUP_LUF_BTR40"]] call _fnc_saveToTemplate;
["vehiclesAT", ["Flex_CUP_LUF_Hilux_SPG9", "Flex_CUP_LUF_Hilux_UB32", "Flex_CUP_LUF_Hilux_armored_SPG9", "Flex_CUP_LUF_Hilux_armored_UB32"]] call _fnc_saveToTemplate;
["vehiclesAA", ["Flex_CUP_LUF_Hilux_zu23", "Flex_CUP_LUF_Hilux_armored_zu23"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["Flex_CUP_LUF_Boat_2"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["Flex_CUP_LUF_CESSNA"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["CUP_C_AN2_AEROSCHROT_TK_CIV", "CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_C_Skoda_CR_CIV", "CUP_O_Hilux_unarmed_TK_CIV", "CUP_C_LR_Transport_CTK", "CUP_C_UAZ_Open_TK_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_V3S_Open_TKC", "CUP_C_V3S_Covered_TKC", "CUP_C_Ural_Civ_01"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_Mi17_Civilian_RU", "CUP_C_SA330_Puma_HC1_ChernAvia"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["Flex_CUP_LUF_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["Flex_CUP_LUF_DSHKM", "Flex_CUP_LUF_HMG_high"]] call _fnc_saveToTemplate;
["staticAT", ["Flex_CUP_LUF_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["Flex_CUP_LUF_ZU23"]] call _fnc_saveToTemplate;

["staticMortars", ["Flex_CUP_LUF_L16A2"]] call _fnc_saveToTemplate;
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
    "CUP_srifle_LeeEnfield", "CUP_srifle_CS550", "CUP_arifle_SAIGA_MK03_Wood",
    "CUP_10x_303_M", "CUP_5x_22_LR_17_HMR_M", "CUP_10Rnd_762x39_SaigaMk03_M",
    "CUP_hgun_Browning_HP", "CUP_hgun_Colt1911", "CUP_13Rnd_9x19_Browning_HP", "CUP_7Rnd_45ACP_1911",
    ["CUP_launch_RPG26", 10],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_M67", "SmokeShell",
    "CUP_V_OI_TKI_Jacket1_03", "CUP_V_OI_TKI_Jacket4_01", "CUP_V_OI_TKI_Jacket4_02", "CUP_V_OI_TKI_Jacket4_05", "CUP_V_OI_TKI_Jacket2_01", "CUP_V_I_Guerilla_Jacket",
    "CUP_V_O_SLA_M23_1_OD", "CUP_V_OI_TKI_Jacket3_01",
    "B_CarryAll_khk", "B_TacticalPack_blk",
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
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Bandit_3_F",
    "Flex_CUP_LUF_I_Soldier_Deserter",
    "CUP_U_I_GUE_Flecktarn4",
    "U_IG_Guerrilla_6_1",
    "Flex_CUP_LUF_I_Soldier_08",
    "Flex_CUP_LUF_I_Soldier_03",
    "U_I_C_Soldier_Para_5_F",
    "Flex_CUP_LUF_I_Soldier_07"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "H_Shemag_olive",
    "CUP_H_RUS_TSH_4_Brown",
    "H_Cap_blk",
    "H_Cap_grn",
    "H_Booniehat_khk",
    "CUP_H_TKI_Lungee_Open_06",
    "CUP_H_FR_BandanaGreen",
    "H_ShemagOpen_tan",
    "CUP_H_USA_Cap_M81",
    "CUP_H_FR_BandanaWdl",
    "CUP_H_PMC_Beanie_Khaki"
]] call _fnc_saveToTemplate; //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "Barklem",
    "TanoanHead_A3_06","TanoanHead_A3_01","TanoanHead_A3_09","TanoanHead_A3_07",
    "TanoanHead_A3_05","TanoanHead_A3_04","TanoanHead_A3_03","TanoanHead_A3_02",
    "AfricanHead_01","AfricanHead_03","AfricanHead_02"
]] call _fnc_saveToTemplate;
["voices", ["Male01FRE", "Male02FRE", "Male03FRE", "Male01ENGFRE", "Male02ENGFRE"]] call _fnc_saveToTemplate;
"AfroMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];
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