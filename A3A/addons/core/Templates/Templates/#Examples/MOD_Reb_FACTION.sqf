/////////////////////////////////
//   Side Information - Reb   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

["name", ""] call _fnc_saveToTemplate;

["flag", DEFAULT_FLAG] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\MOD\images\flag_FACTION_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", ""] call _fnc_saveToTemplate; // Marker from CfgMarkers.

// ["petrosIdentity", createHashMapFromArray [
//   ["face", "X"],
//   ["speaker", "Male01ENGB"],
//   ["pitch", 1.1],
//   ["firstName", "X"],
//   ["lastName", ":)"]
// ]] call _fnc_saveToTemplate;

["petrosPrimary", ["", 3]] call _fnc_saveToTemplate;
["petrosHandgun", ["", 2]] call _fnc_saveToTemplate;
["petrosHeadgear", ""] call _fnc_saveToTemplate;
["petrosGoggles", ""] call _fnc_saveToTemplate;
["petrosUniform", ""] call _fnc_saveToTemplate;

private _vehiclesBasic = [];
private _vehiclesLightUnarmed = []; 
private _vehiclesLightArmed = [];
private _vehiclesAT = [];
private _vehiclesAA = [];

private _vehiclesTruck = [];
private _vehiclesMedical = [];

private _vehiclesBoat = [];

private _vehiclesPlane = [];

private _vehiclesCivCar = [];
private _vehiclesCivTruck = [];
private _vehiclesCivSupply = [];
private _vehiclesCivHelicopter = [];
private _vehiclesCivBoat = [];
private _vehiclesCivPlane = [];

["staticMGs", []] call _fnc_saveToTemplate;
["staticAT", []] call _fnc_saveToTemplate;
["staticAA", []] call _fnc_saveToTemplate;
["staticMortars", []] call _fnc_saveToTemplate;
["staticMortarMagHE", ""] call _fnc_saveToTemplate;
["staticMortarMagSmoke", ""] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;
["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

////////////////////////////
//  Rebel Starting Gear  //
//////////////////////////

private _initialRebelEquipment = [
  "secondary", "secondaryAmmo",
  "primary","primaryAmmo",
  "launchers", ["launcherAmmo", 10],
  "grenadeFrag", "grenadeSmoke",
  ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
  "backpacks",
  "vests",
  "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _uniforms = [];
private _uniformsReb = [];
private _headgear = [];

["headgear", _headgear] call _fnc_saveToTemplate;
["uniforms", _uniforms] call _fnc_saveToTemplate;
// The above gives the uniform/headgear to players

//////////////////////
///  Identities   ///
////////////////////

["voices", []] call _fnc_saveToTemplate;
["faces", []] call _fnc_saveToTemplate;
"" call _fnc_saveNames;

///////////////////////////
//       Loadouts       //
/////////////////////////

// The below gives gear to the AI
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["uniformsReb", _uniformsReb];

_loadoutData set ["facewear", []];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

#include "definitions\Reb\Reb_Definitions.sqf"