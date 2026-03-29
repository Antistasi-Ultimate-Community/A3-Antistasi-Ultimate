///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;

["name", localize "STR_A3AP_setupFactionsTab_OPTRE_Ins_name"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_insurrection"] call _fnc_saveToTemplate;

/* OVERWRITES */
// ["vehicleMedicalBox", [""]] call _fnc_saveToTemplate;
// ["vehicleLightSource", "Land_LampShabby_F"] call _fnc_saveToTemplate;
// ["vehicleFuelDrum", ["Land_OPTRE_barrel_hydrogen", 150]] call _fnc_saveToTemplate; // bugged
// ["vehicleFuelTank", ["B_Slingload_01_Fuel_F", 1000]] call _fnc_saveToTemplate;
// ["vehicleRepairStation", ["Land_RepairDepot_01_green_F", 5000]] call _fnc_saveToTemplate;
// ["vehicleAmmoStation", ["Box_IND_AmmoVeh_F", 5000]] call _fnc_saveToTemplate;
// ["vehicleHealthStation", ["Land_MedicalTent_01_MTP_closed_F", 75]] call _fnc_saveToTemplate;
/* OVERWRITES */

private _vehiclesBasic = ["OPTRE_M274_ATV_Ins"];
private _vehiclesLightUnarmed = ["OPTRE_M12_FAV_ins"];
private _vehiclesLightArmed = ["OPTRE_M12_LRV_ins","OPTRE_M12_VBIED_Big","OPTRE_M12_VBIED"]; //maybe AT ?
private _VehTruck = ["a3a_OPTRE_M411_APC_INS","OPTRE_m1015_mule_ins","OPTRE_m1015_mule_cover_ins","OPTRE_M12_ins_APC"];
private _vehiclesAt = ["OPTRE_M12_TD_ins","OPTRE_M12A1_LRV_ins","OPTRE_M12G1_LRV_CMA"];
private _vehicleAA = ["OPTRE_M12R_AA_ins"];
//OPTRE_M914_RV_ins ?
private _vehiclesBoat = ["optre_catfish_ins_mg_f","optre_catfish_ins_unarmed_f"]; 

private _vehiclePlane =  ["OPTRE_Pelican_unarmed_ins"]; //replace it with INS vtol pelican at some point

private _vehicleCivPlane = [];

private _vehiclesCivCar = [
    "OPTRE_M12_CIV2",
    "OPTRE_M12_CIV",
    "OPTRE_Genet",
    "C_Hatchback_01_sport_F",
    "C_Hatchback_01_F"
];

private _vehiclesMedical = ["OPTRE_M12_ins_MED"];
private _vehiclesSupply = [];
private _CivTruck = ["C_Van_01_transport_F", "C_Truck_02_transport_F", "C_Truck_02_covered_F"];
private _civHelicopters = ["OPTRE_UNSC_falcon_PD"]; ///probably need a config fix for that
private _CivBoat = ["optre_catfish_civ_f"]; ///probably need a config fix for that

private _staticMG = [
    "OPTRE_AIE_486H_Low_Static_HMG_Innie",
    "OPTRE_AIE_486H_Static_HMG_Innie",
    "OPTRE_M247a1_Low_Static_Innie_MMG",
    "OPTRE_M247a1_Static_Innie_MMG",
    "OPTRE_M37_Static_HMG_innie"
];
private _staticAT = [
    "OPTRE_Static_ATGM_Ins",
    "OPTRE_Static_FG75",
    "OPTRE_M460AGL_Low_Static_GMG_innie",
    "OPTRE_M460AGL_Static_GMG_innie",
    "OPTRE_Scythe_INS"
];
private _staticAA = [
    "OPTRE_Static_M41_Ins",
    "OPTRE_Scythe_AA_INS",
    "OPTRE_Static_AA_Ins",
    "OPTRE_Lance_INS"
];
["staticMortars", ["OPTRE_AU_44_INS_Mortar"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "OPTRE_10Rnd_122mm_SABOT_81mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "OPTRE_10Rnd_122mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "OPTRE_10Rnd_122mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "UNSCMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate; ///should probably use OPTRE one
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate; ///should probably use OPTRE one

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;

if (_hasApex) then {
  #include "..\DLC_content\vehicles\Apex\Vanilla_FIA.sqf"  
};

if (_hasLawsOfWar) then {
  #include "..\DLC_content\vehicles\LawsOfwar\Vanilla_FIA.sqf"  
};

["vehiclesCivPlane", _vehicleCivPlane] call _fnc_saveToTemplate;
["vehiclesCivSupply", _vehiclesSupply] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["vehiclesCivHeli", _civHelicopters] call _fnc_saveToTemplate;
["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesPlane", _vehiclePlane] call _fnc_saveToTemplate;
["vehiclesCivTruck", _CivTruck] call _fnc_saveToTemplate;
["vehiclesTruck", _VehTruck] call _fnc_saveToTemplate;
["vehiclesCivBoat", _CivBoat] call _fnc_saveToTemplate;
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAt] call _fnc_saveToTemplate;

#include "OPTRE_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"OPTRE_M45", "OPTRE_6Rnd_8Gauge_Pellets",
"OPTRE_M6G",
"OPTRE_M6C",
"OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","MiniGrenade","SmokeShell",
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"B_FieldPack_blk","B_AssaultPack_blk","B_Kitbag_rgr",
"V_SmershVest_01_F","V_BandollierB_rgr","V_Chestrig_oli",
"Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["OPTRE_ANPRC_521_URF","OPTRE_ANPRC_515"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["OPTRE_ANPRC_521_URF","OPTRE_ANPRC_515"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "OPTRE_Ins_URF_Combat_Uniform",
    "OPTRE_Ins_ER_jacket_od_surplus",
    "OPTRE_Ins_ER_jacket_surgeon1",
    "OPTRE_Ins_ER_jacket_surgeon2",
    "OPTRE_Ins_ER_jacket_surplus_OD",
    "OPTRE_Ins_ER_jacket_surplus_brown",
    "OPTRE_Ins_ER_jacket_surplus_redshirt",
    "OPTRE_Ins_ER_rolled_surplus_crimson",
    "OPTRE_Ins_ER_rolled_surplus_black"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_tan",
    "H_Cap_tan",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_headphones",
    "H_ShemagOpen_tan",
    "H_Shemag_olive_hs",
    "OPTRE_Cap_FinalDawn",
    "OPTRE_h_PatrolCap_Green",
    "OPTRE_UNSC_Watchcap"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG","Male01ENGFRE","Male02ENGFRE","Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;
["faces", [
    "GreekHead_A3_01","PersianHead_A3_01","GreekHead_A3_02","WhiteHead_01",
    "WhiteHead_02","WhiteHead_18","WhiteHead_05","GreekHead_A3_07",
    "WhiteHead_03","WhiteHead_04","GreekHead_A3_03","GreekHead_A3_04",
    "WhiteHead_06","WhiteHead_07","GreekHead_A3_05","GreekHead_A3_06",
    "WhiteHead_08","AfricanHead_02","PersianHead_A3_02","AsianHead_A3_02",
    "AfricanHead_03","WhiteHead_09","GreekHead_A3_08","WhiteHead_16",
    "WhiteHead_11","WhiteHead_10","WhiteHead_19","WhiteHead_17",
    "WhiteHead_21","WhiteHead_12","PersianHead_A3_03","WhiteHead_13",
    "GreekHead_A3_09","WhiteHead_14","WhiteHead_15","AsianHead_A3_03",
    "WhiteHead_20","AfricanHead_01","AsianHead_A3_01","TanoanHead_A3_02",
    "TanoanHead_A3_03","AsianHead_A3_05","TanoanHead_A3_04","AsianHead_A3_04",
    "TanoanHead_A3_05","TanoanHead_A3_07","TanoanHead_A3_09","TanoanHead_A3_01",
    "TanoanHead_A3_06","TanoanHead_A3_08","AsianHead_A3_07","AsianHead_A3_06",
    "WhiteHead_24","RussianHead_4","LivonianHead_5","WhiteHead_25",
    "LivonianHead_2","WhiteHead_26","RussianHead_1","LivonianHead_7",
    "LivonianHead_6","WhiteHead_27","WhiteHead_28","LivonianHead_3",
    "RussianHead_3","LivonianHead_1","RussianHead_2","LivonianHead_10",
    "WhiteHead_32","WhiteHead_29","WhiteHead_30","LivonianHead_8",
    "LivonianHead_4","WhiteHead_31","RussianHead_5","LivonianHead_9",
    "GreekHead_A3_13","GreekHead_A3_14","GreekHead_A3_11","GreekHead_A3_12",
    "WhiteHead_23","Barklem","Mavros","Sturrock",
    "Ioannou"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

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