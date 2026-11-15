/////////////////////////////////
//   Side Information - Civ   //
///////////////////////////////

["vehiclesCivCar", [
    "A3U_UCN_BL_Nomad_Rollcage", 1.0
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "A3U_CIV_Nomad_Industrial", 1
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_F", 0.5,
    "C_Scooter_Transport_01_F", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["A3U_CIV_Nomad_Repair", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", ["A3U_UCN_BL_Nomad_Rollcage", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "A3U_CIV_Nomad_Fuel", 1
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", ["A3U_TKE_Ext_Dragonfly_T_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivPlanes", ["TKE_Ext_GUSC_Civ"]] call _fnc_saveToTemplate;

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

private _uniformsCiv = [
    "TKE_VoidSuitMerc_U_B"
];

private _uniformsPress = [
    "TKE_VoidSuitMerc_U_B"
];

private _uniformsWorker = [
    "TKE_VoidSuitCiv_U_B"
];

private _uniformsVIP = [
    "TKE_VoidSuitMerc_U_B"
];

private _uniforms = _uniformsCiv + _uniformsPress + _uniformsWorker + _uniformsVIP;
["uniforms", _uniforms] call _fnc_saveToTemplate; // This is needed, it is NOT redundant

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["uniformsPress", _uniformsPress];
_loadoutData set ["uniformsWorker", _uniformsWorker];
_loadoutData set ["uniformsVIP", _uniformsVIP];

_loadoutData set ["vests", ["TKE_R35VestNN"]];
_loadoutData set ["vestsPress", ["TKE_R35Vest"]];
_loadoutData set ["vestsWorker", ["TKE_PilotVestMerc"]];

_loadoutData set ["headgear", ["TKE_FCrewHelm_BASE"]];
_loadoutData set ["headgearPress", ["TKE_MercHelmClosed_BASE"]];
_loadoutData set ["headgearWorker", ["TKE_FCrewHelmCiv"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["sidearms", ["WBK_SciFi_Pistol_Black", "TKE_UCNPistol"]];

private _templateMan = {
    ["headgear"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _templateWorker = {
    ["headgearWorker"] call _fnc_setHelmet;
    ["vestsWorker"] call _fnc_setVest;
    ["uniformsWorker"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _templatePress = {
    ["headgearPress"] call _fnc_setHelmet;
    ["vestsPress"] call _fnc_setVest;
    ["uniformsPress"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _templateVIP = {
    ["uniformsVIP"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

private _prefix = "militia";
private _unitTypes = [
    ["VIP", _templateVIP],
    ["Press", _templatePress],
    ["Worker", _templateWorker],
    ["Man", _templateMan]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
