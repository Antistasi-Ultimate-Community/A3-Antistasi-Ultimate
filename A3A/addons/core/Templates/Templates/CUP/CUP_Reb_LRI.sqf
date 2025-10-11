///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "LRI"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CUP\flag_LRI_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_LRI"] call _fnc_saveToTemplate;

["vehiclesBasic", ["C_Quadbike_01_F", "CUP_C_Golf4_black_Civ"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_O_Hilux_unarmed_TK_CIV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_I_Hilux_M2_IND_G_F"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["CUP_C_V3S_Open_TKC"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_I_Hilux_SPG9_NAPA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Ural_ZU23_NAPA", "CUP_I_Hilux_zu23_NAPA"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["I_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["CUP_C_AN2_CIV", "CUP_C_C47_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_C_S1203_Ambulance_CIV"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["C_Quadbike_01_F", "CUP_C_Golf4_black_Civ"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_Ural_Civ_03"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

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
    "CUP_sgun_slamfire", "CUP_srifle_CZ550_rail", "CUP_smg_M3A1_blk",
    "CUP_1Rnd_12Gauge_Pellets_No00_Buck", "CUP_1Rnd_12Gauge_Pellets_No3_Buck", "CUP_30Rnd_45ACP_M3A1_BLK_M","CUP_5x_22_LR_17_HMR_M",
    "CUP_hgun_TEC9", "CUP_32Rnd_9x19_TEC9",
    ["CUP_launch_RPG18", 50],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_I_Carrier_Belt", "CUP_V_I_Guerilla_Jacket", "CUP_V_I_RACS_Carrier_Rig_2", "CUP_V_I_RACS_Carrier_Rig_wdl_2",
    "CUP_V_RUS_Smersh_New_Light", "CUP_V_OI_TKI_Jacket1_06", "CUP_V_OI_TKI_Jacket5_05", "CUP_V_OI_TKI_Jacket5_06", "CUP_V_OI_TKI_Jacket3_04",
    "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oli","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk",
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
    "CUP_U_B_CZ_WDL_Kneepads",
    "CUP_U_B_CZ_Pilot_WDL",
    "CUP_I_B_PMC_Unit_20",
    "CUP_I_B_PMC_Unit_22",
    "CUP_I_B_PMC_Unit_21",
    "CUP_I_B_PMC_Unit_19",
    "CUP_I_B_PMC_Unit_17",
    "CUP_I_B_PMC_Unit_13",
    "CUP_I_B_PMC_Unit_14",
    "CUP_I_B_PMC_Unit_16",
    "CUP_I_B_PMC_Unit_15",
    "CUP_I_B_PMC_Unit_12",
    "CUP_I_B_PMC_Unit_3",
    "CUP_I_B_PMC_Unit_2",
    "CUP_I_B_PMC_Unit_1",
    "CUP_I_B_PMC_Unit_4",
    "CUP_I_B_PMC_Unit_7",
    "CUP_I_B_PMC_Unit_6",
    "CUP_I_B_PMC_Unit_5",
    "CUP_I_B_PMC_Unit_8",
    "CUP_I_B_PMC_Unit_11",
    "CUP_I_B_PMC_Unit_10",
    "CUP_I_B_PMC_Unit_36",
    "CUP_I_B_PMC_Unit_37",
    "CUP_I_B_PMC_Unit_38",
    "CUP_I_B_PMC_Unit_39",
    "CUP_I_B_PMC_Unit_40",
    "CUP_I_B_PMC_Unit_41",
    "CUP_I_B_PMC_Unit_42",
    "CUP_I_B_PMC_Unit_43",
    "CUP_I_B_PMC_Unit_28",
    "CUP_I_B_PMC_Unit_24",
    "CUP_I_B_PMC_Unit_23",
    "CUP_I_B_PMC_Unit_31",
    "CUP_I_B_PMC_Unit_32",
    "CUP_I_B_PMC_Unit_29",
    "CUP_I_B_PMC_Unit_30",
    "CUP_I_B_PMC_Unit_33",
    "CUP_I_B_PMC_Unit_34",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];          //Uniforms given to Normal Rebels

private _rebUniformsAI = [
    "CUP_I_B_PMC_Unit_20",
    "CUP_I_B_PMC_Unit_22",
    "CUP_I_B_PMC_Unit_21",
    "CUP_I_B_PMC_Unit_19",
    "CUP_I_B_PMC_Unit_17",
    "CUP_I_B_PMC_Unit_13",
    "CUP_I_B_PMC_Unit_14",
    "CUP_I_B_PMC_Unit_16",
    "CUP_I_B_PMC_Unit_15",
    "CUP_I_B_PMC_Unit_12",
    "CUP_I_B_PMC_Unit_3",
    "CUP_I_B_PMC_Unit_2",
    "CUP_I_B_PMC_Unit_1",
    "CUP_I_B_PMC_Unit_4",
    "CUP_I_B_PMC_Unit_7",
    "CUP_I_B_PMC_Unit_6",
    "CUP_I_B_PMC_Unit_5",
    "CUP_I_B_PMC_Unit_8",
    "CUP_I_B_PMC_Unit_11",
    "CUP_I_B_PMC_Unit_10",
    "CUP_I_B_PMC_Unit_36",
    "CUP_I_B_PMC_Unit_37",
    "CUP_I_B_PMC_Unit_38",
    "CUP_I_B_PMC_Unit_39",
    "CUP_I_B_PMC_Unit_40",
    "CUP_I_B_PMC_Unit_41",
    "CUP_I_B_PMC_Unit_42",
    "CUP_I_B_PMC_Unit_43",
    "CUP_I_B_PMC_Unit_28",
    "CUP_I_B_PMC_Unit_24",
    "CUP_I_B_PMC_Unit_23",
    "CUP_I_B_PMC_Unit_31",
    "CUP_I_B_PMC_Unit_32",
    "CUP_I_B_PMC_Unit_29",
    "CUP_I_B_PMC_Unit_30",
    "CUP_I_B_PMC_Unit_33",
    "CUP_I_B_PMC_Unit_34"
];

["uniforms", _rebUniforms + _rebUniformsAI] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "CUP_H_Booniehat_CCE",
    "CUP_H_USArmy_Boonie_hs_OCP",
    "CUP_H_USArmy_Boonie_hs_OEFCP",
    "CUP_H_USArmy_Boonie_hs_UCP",
    "CUP_H_USArmy_Boonie_OCP",
    "CUP_H_USArmy_Boonie_OEFCP",
    "CUP_H_SLA_Boonie_DES",
    "CUP_H_TKI_SkullCap_01",
    "CUP_H_TKI_SkullCap_02",
    "CUP_H_TKI_SkullCap_03",
    "CUP_H_TKI_SkullCap_04",
    "CUP_H_TKI_SkullCap_05",
    "CUP_H_TKI_SkullCap_06",
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TKI_Lungee_Open_02",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_06",
    "CUP_H_TKI_Lungee_01",
    "CUP_H_TKI_Lungee_02",
    "CUP_H_TKI_Lungee_03",
    "CUP_H_TKI_Lungee_04"
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