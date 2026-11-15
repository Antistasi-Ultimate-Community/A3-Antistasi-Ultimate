///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "NAPA"] call _fnc_saveToTemplate; 

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_CUP_NAPA"] call _fnc_saveToTemplate;
["flyGear", ["CUP_U_I_Pilot_01"]] call _fnc_saveToTemplate;

["vehiclesBasic", ["CUP_I_TT650_NAPA"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_I_Hilux_unarmed_NAPA", "CUP_I_Hilux_armored_unarmed_NAPA"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_I_Datsun_PK", "CUP_I_Hilux_DSHKM_NAPA"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["CUP_V3S_Open_NAPA"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_I_Hilux_SPG9_NAPA", "CUP_I_Hilux_armored_SPG9_NAPA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Ural_ZU23_NAPA", "CUP_I_Hilux_zu23_NAPA"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_O_AN2_TK"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["CUP_C_AN2_CIV", "CUP_C_DC3_ChernAvia_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_B_S1203_Ambulance_CR"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_O_Hilux_unarmed_CR_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_Ural_Civ_03"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412", "CUP_C_Mi17_Civilian_RU", "CUP_C_Mi17_VIV_RU", "CUP_C_SA330_Puma_HC1_ChernAvia"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["CUP_C_Zodiac_CIV"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_I_DSHKM_NAPA", "CUP_B_DSHkM_MiniTriPod_NAPA"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_I_SPG9_NAPA"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_I_ZU23_NAPA"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_2b14_82mm_NAPA"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

#include "CUP_Reb_Vehicle_Attributes.sqf"

["variants", [
	["CUP_I_TT650_NAPA", ["Red", 1, "WhiteRed", 1]],
	["CUP_C_Ural_Civ_03", ["CIV1", 1, "CIV2", 1, "CIV3", 1]],
	["CUP_C_412", ["BlackWhite", 1, "Blue", 1, "Bluelines", 1, "Flamingo", 1, "Frostfire", 1, "Wave", 1, "Luxury", 1, "Parrot", 1, "Red", 1, "Redlines", 1, "Shark", 1, "Sun", 1, "Twilight", 1, "Vrana", 1, "Wasp", 1]]
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_sgun_slamfire", "CUP_1Rnd_12Gauge_Pellets_No00_Buck", "CUP_1Rnd_12Gauge_Slug",
	"CUP_srifle_CZ550", "CUP_srifle_CZ550_rail", "CUP_5Rnd_93x64_CZ550",
	"CUP_sgun_CZ584", "CUP_sgun_CZ584_RIS", "CUP_1Rnd_762x51_CZ584",
    "CUP_hgun_TaurusTracker455", "CUP_6Rnd_45ACP_M",
    ["CUP_launch_RPG18", 5],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_I_Carrier_Belt", "CUP_V_I_Guerilla_Jacket", "CUP_V_I_RACS_Carrier_Rig_2", "CUP_V_I_RACS_Carrier_Rig_wdl_2", "CUP_V_B_GER_Carrier_Rig_2_Brown", "CUP_V_B_GER_Carrier_Rig_2",
    "CUP_B_CivPack_WDL", "CUP_B_SLA_Medicbag",
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
    "CUP_U_I_GUE_Anorak_01",
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_WorkU_01",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_GUE_Flecktarn3",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_Woodland1",
	"CUP_U_B_BDUv2_DPM_OD",
	"CUP_U_B_BDUv2_roll_DPM_OD",
    "CUP_U_B_BDUv2_roll2_DPM_OD"
];          //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_WorkU_01",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_Woodland1"
];          //Uniforms given to AI Rebels

["uniforms", _rebUniforms + _rebUniformsAI] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
	"CUP_H_FR_BandanaGreen",
	"CUP_H_FR_BandanaWdl",
    "CUP_H_C_Beanie_02",
    "CUP_H_C_Beret_01",
    "CUP_H_C_Beret_04",
	"H_Cap_blk",
    "CUP_H_NAPA_Fedora",
    "CUP_H_Ger_Boonie2_Flecktarn",
	"CUP_H_C_Ushanka_01",
    "CUP_H_C_Ushanka_02",
    "CUP_H_C_Ushanka_03",
	"CUP_H_C_Ushanka_04"
]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
	"LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4", "LivonianHead_5",
	"LivonianHead_6", "LivonianHead_7", "LivonianHead_8", "LivonianHead_9", "LivonianHead_10",
	"RussianHead_1", "RussianHead_2", "RussianHead_3", "RussianHead_4", "RussianHead_5",
	"WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
	"WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08",
	"WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12",
	"WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16",
	"WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20",
	"WhiteHead_21", "WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
	"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29",
	"WhiteHead_30", "WhiteHead_31", "WhiteHead_32",
	"Sturrock"
]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;
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
_loadoutData set ["facewear", [
	"G_Aviator",
	"G_Bandanna_aviator",
	"G_Bandanna_blk",
	"G_Bandanna_oli",
	"G_Bandanna_khk",
	"G_Bandanna_shades",
	"G_Shades_Black",
	"G_Squares", 
	"CUP_RUS_Balaclava_blk"
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
    [selectRandomWeighted [[], 1, "facewear", 2]] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1, "facewear", 5]] call _fnc_setFacewear;

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
