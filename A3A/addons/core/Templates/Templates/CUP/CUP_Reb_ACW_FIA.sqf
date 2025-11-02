///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "FIA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

["vehiclesBasic", ["Flex_CUP_FIA_TT650", "Flex_CUP_FIA_Quad"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["Flex_CUP_FIA_Hilux_unarmed", "Flex_CUP_FIA_van_cargo", "Flex_CUP_FIA_armored_unarmed"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["Flex_CUP_FIA_Hilux_M2", "Flex_CUP_FIA_Hilux_armored_M2"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["Flex_CUP_FIA_truck_transport"]] call _fnc_saveToTemplate;
["vehiclesAT", ["Flex_CUP_FIA_Hilux_metis", "Flex_CUP_FIA_Hilux_UB32", "Flex_CUP_FIA_Hilux_SPG9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["Flex_CUP_FIA_Hilux_zu23", "Flex_CUP_FIA_Hilux_armored_zu23"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["Flex_CUP_FIA_Boat_2"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["Flex_CUP_FIA_ARMED", "CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["Flex_CUP_FIA_CESSNA", "CUP_C_AN2_CIV", "CUP_C_C47_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["C_Van_02_medevac_F"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_C_Volha_CR_Civ", "CUP_C_Golf4_black_Civ"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_Datsun_4seat", "CUP_C_Ural_Civ_03"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["Flex_CUP_FIA_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["Flex_CUP_FIA_HMG_high"]] call _fnc_saveToTemplate;
["staticAT", ["Flex_CUP_FIA_Metis", "Flex_CUP_FIA_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["Flex_CUP_FIA_ZU23"]] call _fnc_saveToTemplate;

["staticMortars", ["Flex_CUP_FIA_L16A2"]] call _fnc_saveToTemplate;
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
    "CUP_srifle_LeeEnfield", "CUP_10x_303_M", "CUP_sgun_CZ584", "CUP_1Rnd_12Gauge_Pellets_No00_Buck", "CUP_1Rnd_12Gauge_Slug", "CUP_1Rnd_762x51_CZ584",
    ["CUP_launch_M72A6", 10],
    "CUP_hgun_Glock17_blk", "CUP_hgun_M9", "CUP_17Rnd_9x19_glock17", "CUP_15Rnd_9x19_M9",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_M67", "SmokeShell",
    "CUP_V_IDF_Vest", "CUP_V_O_SLA_M23_1_OD",
    "B_Kitbag_cbr", "B_FieldPack_oli", "B_TacticalPack_blk",
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
	"CUP_I_B_PMC_Unit_3",
	"CUP_U_I_GUE_WorkU_02",
	"Flex_CUP_AAF_BDU_Digital_Rolled",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_3",
	"CUP_I_B_PMC_Unit_2",
	"CUP_U_I_BDUv2_dirty_DPM",
	"CUP_U_I_GUE_Woodland1",
	"U_IG_Guerrilla_6_1",
	"CUP_I_B_PMC_Unit_5",
	"CUP_U_I_USMC_MCCUU_roll_2"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
	"CUP_H_FR_Headband_Headset",
	"H_ShemagOpen_khk",
	"CUP_H_RUS_TSH_4_Brown",
	"CUP_H_USA_Cap_M81",
	"CUP_H_PMC_Cap_Back_Tan",
	"H_Shemag_olive",
	"H_Beret_blk",
	"H_Booniehat_khk",
	"H_Cap_blk",
	"H_ShemagOpen_tan",
	"CUP_H_PMC_Beanie_Khaki"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _faces = [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros",
    "GreekHead_A3_10_l",
    "GreekHead_A3_10_sa",
    "GreekHead_A3_10_a"
];
["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

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
	"CUP_G_Oakleys_Drk",
	"G_Sport_Blackred",
	"G_Aviator",
    "CUP_G_Scarf_Face_Grn",
	"CUP_G_Scarf_Face_Red",
	"G_Balaclava_oli",
	"CUP_G_Scarf_Face_Tan"
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