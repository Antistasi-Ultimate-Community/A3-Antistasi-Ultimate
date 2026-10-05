/////////////////////////////////
//   Side Information - Civ   //
///////////////////////////////

["vehiclesCivCar", [
    "A3U_UCN_BL_Nomad", 1.0
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

["faces", [
    "GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", 
    "GreekHead_A3_06","GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", 
    "Ioannou", "Barklem", "AfricanHead_02","AsianHead_A3_02", 
    "AsianHead_A3_03", "WhiteHead_05"
]] call _fnc_saveToTemplate;

///////////////////////////
//       Loadouts       //
/////////////////////////

private _uniformsCiv = [
    "TKE_CIVOutfit2_U_B",
    "TKE_CIVOutfit3_U_B",
    "TKE_CIVOutfit3Black_U_B",
    "TKE_CIVOutfit3Grey_U_B",
    "TKE_CIVOutfit3TanBlack_U_B",
    "TKE_FCFSweaterChristmas_U_B",
    "TKE_SweaterMTFWht_U_B",
    "TKE_SweaterMTFYlw_U_B",
    "TKE_SweaterMTFBrn_U_B",
    "TKEJAM_U_B_ECWCSRanger_F",
    "TKEJAM_U_B_ECWCS_Black_F"
];

private _uniformsPress = [
    "TKEJAM_U_B_ECWCS_CIVBlue_F"
];

private _uniformsWorker = [
    "TKEJAM_U_B_ECWCS_CIVOrange_F",
    "TKE_VoidSuitCiv_U_B"
];

private _uniformsVIP = [
    "TKE_CIVOutfit3Orange_U_B"
];

private _uniforms = _uniformsCiv + _uniformsPress + _uniformsWorker + _uniformsVIP;
["uniforms", _uniforms] call _fnc_saveToTemplate; // This is needed, it is NOT redundant

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["uniformsPress", _uniformsPress];
_loadoutData set ["uniformsWorker", _uniformsWorker];
_loadoutData set ["uniformsVIP", _uniformsVIP];

_loadoutData set ["vests", ["TKE_CIVPonchoBlack", "TKE_CIVVest1Black"]];
_loadoutData set ["vestsPress", ["TKE_FlakJacket"]];
_loadoutData set ["vestsWorker", ["TKE_PilotVestMerc", ""]];

_loadoutData set ["headgear", ["H_Watchcap_blk","TKE_CIVHatNRBlack","TKE_CIVHatNRGrey","TKE_BoonieHatHSFCFGrey"]];
_loadoutData set ["headgearPress", ["TKE_CIVHatNRBlack"]];
_loadoutData set ["headgearWorker", ["TKE_FCrewHelmCiv", "TKE_CIVHatNROrange"]];

_loadoutData set ["facewear", ["TKE_R35GogglesDownFW"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["sidearms", ["WBK_SciFi_Pistol_Black", "TKE_UCNPistol"]];

private _templateMan = {
    ["headgear"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
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
    ["facewear"] call _fnc_setFacewear;
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
