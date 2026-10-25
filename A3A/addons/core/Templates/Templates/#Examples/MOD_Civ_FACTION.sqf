/////////////////////////////////
//   Side Information - Civ   //
///////////////////////////////

["vehiclesCivCar", [
    "", 0.5,
    "", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "", 0.5,
    "", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "", 0.5,
    "", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "", 1
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "", 1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "", 1
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", [
    ""
]] call _fnc_saveToTemplate;

["vehiclesCivPlanes", [
    ""
]] call _fnc_saveToTemplate;

//////////////////////
///  Identities   ///
////////////////////

["faces", []] call _fnc_saveToTemplate;

///////////////////////////
//       Loadouts       //
/////////////////////////

private _uniformsCiv = [];
private _uniformsPress = [];
private _uniformsWorker = [];
private _uniformsVIP = [];

private _uniforms = _uniformsCiv;
["uniforms", _uniforms] call _fnc_saveToTemplate; // This is needed, it is NOT redundant

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["uniformsPress", _uniformsPress];
_loadoutData set ["uniformsWorker", _uniformsWorker];
_loadoutData set ["uniformsVIP", _uniformsVIP];

_loadoutData set ["vests", []];
_loadoutData set ["vestsPress", []];
_loadoutData set ["vestsWorker", []];

_loadoutData set ["headgear", []];
_loadoutData set ["headgearPress", []];
_loadoutData set ["headgearWorker", []];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["sidearms", []];

#include "definitions\Civ\Civ_Definitions.sqf"