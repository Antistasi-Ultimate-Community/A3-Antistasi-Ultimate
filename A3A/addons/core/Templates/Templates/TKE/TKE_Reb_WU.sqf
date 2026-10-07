/////////////////////////////////
//   Side Information - Reb   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

["name", "Workers Union"] call _fnc_saveToTemplate;

["flag", DEFAULT_FLAG] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\TKE\images\flag_wu_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", "a3u_flag_tke_wu"] call _fnc_saveToTemplate; // Marker from CfgMarkers.

// ["petrosIdentity", createHashMapFromArray [
//   ["face", "X"],
//   ["speaker", "Male01ENGB"],
//   ["pitch", 1.1],
//   ["firstName", "X"],
//   ["lastName", ":)"]
// ]] call _fnc_saveToTemplate;

["petrosPrimary", ["TKE_ARX12KMC", 3]] call _fnc_saveToTemplate;
["petrosHandgun", ["WRS_Weapon_Revolver_Black", 2]] call _fnc_saveToTemplate;
["petrosHeadgear", "KMC_KMCHelm_wu"] call _fnc_saveToTemplate;
["petrosGoggles", "TKE_MDWebbingV2Snow"] call _fnc_saveToTemplate;
["petrosUniform", "KMC_CombatUni_U_B_WUW"] call _fnc_saveToTemplate;

private _vehiclesBasic = ["a3a_LSV_02_unarmed_black_F"];
private _vehiclesLightUnarmed = ["a3a_LSV_02_unarmed_black_F"]; 
private _vehiclesLightArmed = ["a3a_LSV_02_armed_black_F", "A3U_UCN_BL_Nomad_Armed", "A3U_UCN_BL_Nomad_Cabin_Armed", "A3U_UCN_BL_Nomad_Rollcage_Armed"];
private _vehiclesAT = ["a3a_LSV_02_AT_black_F"];
private _vehiclesAA = ["A3U_KMC_APC_AA"];

private _vehiclesTruck = ["A3U_KMC_APC_U"];
private _vehiclesMedical = [];

private _vehiclesBoat = ["I_C_Boat_Transport_02_F"];

private _vehiclesPlane = ["A3U_TKE_Ext_GUSM_KMC"];

private _vehiclesCivCar = ["CIV_Nomad"];
private _vehiclesCivTruck = ["A3U_UCN_BL_Nomad_Rollcage"];
private _vehiclesCivSupply = ["A3U_UCN_BL_Nomad_Rollcage"];
private _vehiclesCivHelicopter = ["A3U_TKE_Ext_Dragonfly_T_CIV"];
private _vehiclesCivBoat = ["C_Boat_Civil_01_F", "C_Rubberboat"];
private _vehiclesCivPlane = ["TKE_Ext_GUSC_Civ"];

["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["I_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAT] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["vehiclesTruck", _vehiclesTruck] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;
["vehiclesPlane", _vehiclesPlane] call _fnc_saveToTemplate;
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesCivTruck", _vehiclesCivTruck] call _fnc_saveToTemplate;
["vehiclesCivSupply", _vehiclesCivSupply] call _fnc_saveToTemplate;
["vehiclesCivHeli", _vehiclesCivHelicopter] call _fnc_saveToTemplate;
["vehiclesCivBoat", _vehiclesCivBoat] call _fnc_saveToTemplate;
["vehiclesCivPlane", _vehiclesCivPlane] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;
["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

////////////////////////////
//  Rebel Starting Gear  //
//////////////////////////

private _initialRebelEquipment = [
  "WRS_Weapon_Revolver_Black",
  "TKE_ARX12KMC",
  "TKE_ARX12_62x35_magTY",
  "TKE_MRCOSight",
  "WRS_Revolver_Magazine",
  "TKE_ATRecoilless1KMC",
  ["MRAWS_HEAT55_F", 10],
  "TKE_FRAG_mag","TKE_SMOKE_mag",
  ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
  "KMC_Alicepack","KMC_Camelbak","KMC_FieldCamelbak","KMC_Lightpack",
  "Binocular",
  "KMC_Webbing_1_1_wu","KMC_Webbing_2_1_wu","KMC_Webbing_3_wu",
  "KMC_FCF_armor_2_wu"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _uniformsPlayer = [
  "KMC_CombatShirt_U_B_WUGR",
  "KMC_CombatShirt_U_B_WUG",
  "KMC_CombatShirt_U_B_WUT",
  "KMC_CombatShirt_U_B_WU",
  "KMC_CombatUni_U_B_WUGR",
  "KMC_CombatUni_U_B_WUG",
  "KMC_CombatUni_U_B_WUT",
  "KMC_CombatUni_U_B_WU",
  "KMC_FCFSweater_U_B_WUGR",
  "KMC_FCFSweater_U_B_WUG",
  "KMC_FCFSweater_U_B_WUT",
  "KMC_FCFSweater_U_B_WU",
  "KMC_VoidSuit_U_B_WU"
];

private _uniformsReb = _uniformsPlayer;

private _headgear = [
  "KMC_trooper_helmet_wu",
  "KMC_mask_helmet_clear_wu"
];

["headgear", _headgear] call _fnc_saveToTemplate;
["uniforms", _uniformsPlayer] call _fnc_saveToTemplate;

//////////////////////
///  Identities   ///
////////////////////

#include "identities.hpp"
private _faces = TKE_FACES;
private _voices = TKE_VOICES;

["faces", _faces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;

TKE_NAMES call _fnc_saveNames;

///////////////////////////
//       Loadouts       //
/////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["uniforms", _uniformsPlayer];
_loadoutData set ["uniformsReb", _uniformsReb];

_loadoutData set ["facewear", ["G_Bandanna_blk", "G_Balaclava_TI_blk_F", "TKE_FaceCover", "TKE_HeadsetFC"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

/////////////////////////
//  Rebel Unit Types  //
///////////////////////

private _templateSquadLeader = {
  ["uniformsReb"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1, "facewear", 0.7]] call _fnc_setFacewear;

  ["items_medical_standard"] call _fnc_addItemSet;
  ["items_miscEssentials"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
  ["binoculars"] call _fnc_addBinoculars;
};

private _templateRifleman = {
  ["uniformsReb"] call _fnc_setUniform;
  [selectRandomWeighted [[], 1, "facewear", 0.5]] call _fnc_setFacewear;

  ["items_medical_standard"] call _fnc_addItemSet;
  ["items_miscEssentials"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
  ["Petros", _templateSquadLeader],
  ["SquadLeader", _templateSquadLeader],
  ["Rifleman", _templateRifleman],
  ["staticCrew", _templateRifleman],
  ["Medic", _templateRifleman, [["medic", true]]],
  ["Engineer", _templateRifleman, [["engineer", true]]],
  ["ExplosivesExpert", _templateRifleman, [["explosiveSpecialist", true]]],
  ["Grenadier", _templateRifleman],
  ["LAT", _templateRifleman],
  ["AT", _templateRifleman],
  ["AA", _templateRifleman],
  ["MachineGunner", _templateRifleman],
  ["Marksman", _templateRifleman],
  ["Sniper", _templateRifleman],
  ["Unarmed", _templateRifleman]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;