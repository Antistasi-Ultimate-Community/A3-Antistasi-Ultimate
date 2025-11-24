///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Raven PMC"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_rus_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Russia"] call _fnc_saveToTemplate;

["vehiclesBasic", ["Flex_CUP_RAV_Quad", "Flex_CUP_RAV_TT650"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_I_Pickup_Unarmed_PMC", "CUP_I_SUV_ION"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["Flex_CUP_RAV_Tigr_M_KORD", "Flex_CUP_RAV_Tigr_M_PK"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["Flex_CUP_RAV_Tigr_M"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_I_Hilux_metis_TK"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Hilux_zu23_TK"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["Flex_CUP_RAV_Boat_2"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["CUP_C_AN2_CIV", "CUP_C_C47_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["a3a_Van_02_black_medevac_F"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_C_Skoda_CR_CIV", "CUP_C_Golf4_black_Civ"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Truck_02_transport_F", "C_Truck_02_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["Flex_CUP_RAV_Ka60_unarmed"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["Flex_CUP_RAV_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["Flex_CUP_RAV_DSHKM", "Flex_CUP_RAV_KORD_high"]] call _fnc_saveToTemplate;
["staticAT", ["Flex_CUP_RAV_Kornet", "Flex_CUP_RAV_Metis", "Flex_CUP_RAV_SPG9"]] call _fnc_saveToTemplate;
["staticAA", []] call _fnc_saveToTemplate;

["staticMortars", ["Flex_CUP_RAV_2b14_82mm"]] call _fnc_saveToTemplate;
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
    "CUP_arifle_SAIGA_MK03_top_rail", "CUP_smg_saiga9", "CUP_sgun_Saiga12K", "CUP_10Rnd_762x39_SaigaMk03_M", "CUP_10Rnd_9x19_Saiga9", "CUP_5Rnd_B_Saiga12_Slug",
    "hgun_Rook40_F", "CUP_hgun_SA61", "16Rnd_9x21_Mag", "CUP_20Rnd_B_765x17_Ball_M",
    ["CUP_launch_RPG26", 10],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_O_RUS_RPS_Smersh_SVD_ModernOlive", "CUP_V_B_LBT_LBV_Black", "CUP_V_O_RUS_RPS_Smersh_AK_ModernOlive",
    "CUP_B_RUS_Backpack", "B_Carryall_blk",
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
    "CUP_O_B_PMC_Unit_40",
	"CUP_O_B_PMC_Unit_32",
	"CUP_O_B_PARA_Unit_1",
	"CUP_O_B_PMC_Unit_42",
	"CUP_O_B_PMC_Unit_43",
	"CUP_O_B_PMC_Unit_42",
	"CUP_O_B_PMC_Unit_43",
	"CUP_O_B_PARA_Unit_1",
	"CUP_O_B_PMC_Unit_39",
	"CUP_O_B_PMC_Unit_36",
	"CUP_O_B_PARA_Unit_1",
	"CUP_O_B_PMC_Unit_40"
]; //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "CUP_O_B_PMC_Unit_40",
	"CUP_O_B_PMC_Unit_32",
	"CUP_O_B_PARA_Unit_1",
	"CUP_O_B_PMC_Unit_42",
	"CUP_O_B_PMC_Unit_43",
	"CUP_O_B_PMC_Unit_42",
	"CUP_O_B_PMC_Unit_43",
	"CUP_O_B_PARA_Unit_1",
	"CUP_O_B_PMC_Unit_39",
	"CUP_O_B_PMC_Unit_36",
	"CUP_O_B_PARA_Unit_1",
	"CUP_O_B_PMC_Unit_40"
]; //Uniforms given to AI Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "CUP_H_PMC_Beanie_Headphones_Black",
	"CUP_H_USA_Cap_MCAM",
	"CUP_H_RUS_Ratnik_6M21_Summer",
	"CUP_H_RUS_Cap_EMR",
	"CUP_H_RUS_Ratnik_Balaclava_6M21_Olive_2",
	"CUP_H_RUS_Bandana_HS"
]] call _fnc_saveToTemplate; //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5",
"LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9",
"RussianHead_1","RussianHead_2","RussianHead_3","Sturrock",
"WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_12",
"WhiteHead_13","WhiteHead_14","WhiteHead_17","WhiteHead_18",
"WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
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