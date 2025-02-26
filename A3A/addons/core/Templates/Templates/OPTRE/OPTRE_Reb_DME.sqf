///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "DME"] call _fnc_saveToTemplate;

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

["vehiclesBasic", ["OPTRE_M274_ATV"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["OPTRE_DME_M12_FAV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["OPTRE_M12_LRV_DME"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["OPTRE_m1015_mule_cma"]] call _fnc_saveToTemplate;
["vehiclesAT", ["OPTRE_M12_TD_CMA", "OPTRE_M12A1_LRV_CMA"]] call _fnc_saveToTemplate;
private _vehicleAA = [];

["vehiclesBoat", ["optre_catfish_cma_unarmed_f"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;

private _vehiclesCivCar = ["OPTRE_M12_CIV", "OPTRE_Genet"];
["vehiclesCivTruck", ["C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["OPTRE_UNSC_falcon_PD"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["optre_catfish_cma_unarmed_f"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_Static_M247H_Tripod"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_Gauss"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["OPTRE_AU_44_DME_Mortar"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "OPTRE_10Rnd_122mm_SABOT_81mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "OPTRE_10Rnd_122mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "OPTRE_10Rnd_122mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "OPTRE_M45ATAC", "OPTRE_M392_DMR", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_15Rnd_762x51_Mag",
    "OPTRE_M6D_Black",
    "OPTRE_8Rnd_127x40_AP_Mag","OPTRE_M9_Frag","SmokeShell",
    ["OPTRE_M41_SSR", 5], ["OPTRE_M41_Twin_HEAT", 10],
    "OPTRE_UNSC_Rucksack","OPTRE_UNSC_Rucksack_Heavy",
    "OPTRE_UNSC_M52A_Armor_Rifleman_URB","OPTRE_UNSC_M52A_Armor1_URB","OPTRE_UNSC_M52A_Armor_Breacher_URB",
    "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["OPTRE_ANPRC_521_URF","OPTRE_ANPRC_515"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["OPTRE_ANPRC_521_URF","OPTRE_ANPRC_515"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [];
private _rebHeadgear = [];

_rebUniforms = [
    "OPTRE_DME_Uniform",
    "OPTRE_DME_Temperate_Uniform"
];

_rebHeadgear = [
    "OPTRE_CPD_CH251_DME",
    "OPTRE_UNSC_CH252_Helmet2_URB",
    "OPTRE_UNSC_CH252_Helmet_OLI",
    "OPTRE_FC_VX19_Helmet_Urban",
    "OPTRE_FC_VX19_Helmet"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;
["headgear", _rebHeadgear] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];
_loadoutData set ["facemask", []];

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