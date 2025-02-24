private _hasLawsOfWar = "orange" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "ION"] call _fnc_saveToTemplate;

["flag", "Flag_ION"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_ION"] call _fnc_saveToTemplate;


["vehiclesBasic", ["UK3CB_ION_B_Winter_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_ION_B_Winter_Offroad", "UK3CB_ION_B_Winter_Pickup", "UK3CB_ION_B_Winter_SUV", "UK3CB_ION_B_Winter_M998_2DR"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_ION_B_Winter_Offroad_M2", "UK3CB_ION_B_Winter_Hilux_M2", "UK3CB_ION_B_Winter_LR_M2", "UK3CB_ION_B_Winter_Pickup_M2", "UK3CB_ION_B_Winter_M1025_M2", "UK3CB_ION_B_Winter_SUV_Armed"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["UK3CB_ION_B_Winter_T810_Open", "UK3CB_NAP_I_Van_Transport"]] call _fnc_saveToTemplate;
["vehiclesAT", ["UK3CB_B_G_LandRover_SPG9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_KDF_B_Ural_Zu23", "UK3CB_FIA_B_Hilux_Zu23", "UK3CB_FIA_B_Hilux_Zu23_Front"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F", "UK3CB_I_G_Fishing_Boat_SPG9", "UK3CB_CHD_I_Fishing_Boat_Zu23_front"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["UK3CB_FIA_I_Cessna_T41", "RHS_AN2"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["UK3CB_C_AC500", "UK3CB_C_DC3"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["UK3CB_C_Golf", "UK3CB_C_Landcruiser", "C_Offroad_01_F", "UK3CB_C_Hilux_Open", "UK3CB_C_Pickup", "UK3CB_C_SUV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["UK3CB_CHC_C_V3S_Open", "UK3CB_C_Ural_Open", "UK3CB_TKC_C_Kamaz_Open", "UK3CB_C_V3S_Recovery", "UK3CB_C_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["UK3CB_C_Bell412_Civ", "UK3CB_C_Bell412_Medic"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat", "UK3CB_CHC_C_Fishing_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_NAP_I_DSHKM", "UK3CB_FIA_I_M240_Low", "UK3CB_FIA_I_M240_High", "UK3CB_MEI_I_KORD_high", "UK3CB_MEI_I_KORD", "UK3CB_MEI_I_PKM_Low", "UK3CB_MEI_I_DSHkM_Mini_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_UN_I_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_UN_I_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_FIA_I_M252", "rhsgref_ins_g_2b14"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", ["rhs_mine_smine35_press_mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["rhs_mine_pmn2_mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

#include "3CBF_Reb_Vehicle_Attributes.sqf"

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["variants", [
    ["RHSGREF_A29B_HIDF", ["Brazil",1]],
    ["RHSGREF_A29B_HIDF", ["MIG",1]]
]] call _fnc_saveToTemplate;

#include "3CBF_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "UK3CB_MP5K_PDW", "UK3CB_MP5_30Rnd_9x19_Magazine", "uk3cb_auga1_para_blk", "UK3CB_AUG_25Rnd_9x19mm_Magazine",
    "UK3CB_BHP", "UK3CB_BHP_9_13Rnd",
    ["uk3cb_m72a1_law_loaded", 25],
    "rhs_grenade_mki_mag", "rhs_mag_rdg2_black", "rhs_grenade_m15_mag",
    "UK3CB_TKP_O_B_ASS_BLK", "UK3CB_UN_B_B_ASS", "UK3CB_ION_B_B_RIF_BLK_02", "UK3CB_ION_B_B_RIF_OLI_02",
    "UK3CB_TKP_I_V_6Sh92_Radio_Blk", "UK3CB_TKP_I_V_6Sh92_Blk", "UK3CB_TKP_I_V_6Sh92_Khk", "UK3CB_TKP_I_V_6Sh92_Radio_Khk", "UK3CB_TKA_I_V_6Sh92_Oli", "UK3CB_TKA_I_V_6Sh92_Radio_Oli", "UK3CB_V_Invisible", "UK3CB_ION_B_V_LegStrapBag_win",
    "rhs_acc_2dpZenit", "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [];
private _rebHeadgear = [];

switch (true) do 
{
    case (A3A_climate == "arid"): 
    {
        _rebUniforms = [
            "UK3CB_ION_B_U_Uniform_01_DES",
            "UK3CB_ION_B_U_Uniform_02_DES",
            "UK3CB_ION_B_U_Uniform_03_DES",
            "UK3CB_ION_B_U_Uniform_04_DES",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_01_DES",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_02_DES",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_03_DES",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_04_DES"
        ];

        _rebHeadgear = [
            "UK3CB_H_Cap_ION_DES",
            "UK3CB_H_Cap_Headset_ION_DES",
            "UK3CB_H_Radio_Cap_ION_DES_ALT",
            "UK3CB_H_Radio_Cap_ION_DES"
        ];
    };
    case (A3A_climate == "arctic"): 
    {
        _rebUniforms = [
            "UK3CB_ION_B_U_Uniform_01_WDL",
            "UK3CB_ION_B_U_Uniform_02_WDL",
            "UK3CB_ION_B_U_Uniform_03_WDL",
            "UK3CB_ION_B_U_Uniform_04_WDL",
            "UK3CB_ION_B_U_CombatSmock_01_WIN",
            "UK3CB_ION_B_Uniform_Jumper_U_01_WIN",
            "UK3CB_ION_B_Uniform_Jumper_U_02_WIN"
        ];

        _rebHeadgear = [
            "UK3CB_H_Cap_ION_WHI",
            "UK3CB_H_Cap_Headset_ION_WHI",
            "UK3CB_H_Radio_Cap_ION_WHI_ALT",
            "UK3CB_H_Radio_Cap_ION_WHI"
        ];
    };
    default 
    {
        _rebUniforms = [
            "UK3CB_ION_B_U_Uniform_01_WDL",
            "UK3CB_ION_B_U_Uniform_02_WDL",
            "UK3CB_ION_B_U_Uniform_03_WDL",
            "UK3CB_ION_B_U_Uniform_04_WDL",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_01_WDL",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_02_WDL",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_03_WDL",
            "UK3CB_ION_B_U_SF_Uniform_SHIRT_04_WDL"
        ];

        _rebHeadgear = [
            "UK3CB_H_Cap_ION_OLI",
            "UK3CB_H_Cap_Headset_ION_OLI",
            "UK3CB_H_Radio_Cap_ION_OLI_ALT",
            "UK3CB_H_Radio_Cap_ION_OLI"
        ];
    };
};
["uniforms", _rebUniforms] call _fnc_saveToTemplate;
["headgear", _rebHeadgear] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "Barklem", "GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_05",
"GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Mavros", "Sturrock", "WhiteHead_01", "WhiteHead_02",
"WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_13",
"WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG", "Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE", "Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB", "Male01ENGFRE", "Male02ENGFRE"]] call _fnc_saveToTemplate;
"EnglishMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

// _loadoutData set ["ceoUniforms", [
//     "UK3CB_ION_B_U_CEO_SUIT_03", 
//     "UK3CB_ION_B_U_CEO_SUIT_01", 
//     "UK3CB_ION_B_U_CEO_SUIT_02", 
//     "UK3CB_ION_B_U_CEO_SUIT_05", 
//     "UK3CB_ION_B_U_CEO_SUIT_04"
// ]];

_loadoutData set ["glasses", [
    "UK3CB_G_Ballistic_Shemagh_Green_Tactical_Gloves_Tan",
    "UK3CB_G_Ballistic_Shemagh_White_Tactical_Gloves_Black",
    "UK3CB_G_Ballistic_Black_Tactical_Gloves_Black",
    "UK3CB_G_Ballistic_Black_Tactical_Gloves_Green_Headset",
    "UK3CB_G_Ballistic_Black_Tactical_Gloves_Tan_Headset",
    "UK3CB_G_Gloves_Green",
    "UK3CB_G_Gloves_Black"
]]; // _CAMO_ marker
_loadoutData set ["goggles", ["rhs_ess_black"]];
_loadoutData set ["facemask", ["rhssaf_veil_Green", "G_Bandanna_blk", "G_Bandanna_beast"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

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
// private _petrosTemplate = {
//     call _squadLeaderTemplate;
//     ["ceoUniforms"] call _fnc_setUniform;
// };

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
