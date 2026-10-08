#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_varname"];
A3A_saveTarget params ["_serverID", "_campaignID", "_worldName"];
// Retrieve the old campaign ID if available, otherwise use the current campaign ID.
// This is for compat with fn_collectSaveData, which uses this function to check if we have data for a save, but before we've had the chance to generate a new campaign ID and store the old campaign ID.
private _oldCampaignID = A3A_saveTarget param [3, _campaignID, [""]];

// New single-hashmap save (regardless of which namespace it's stored in)
if (!isNil {A3A_saveDataHM} && {A3A_saveDataHM isEqualType createHashMap}) exitWith {
	A3A_saveDataHM get _varname;
};

if (_serverID isEqualTo false) exitWith {
	// Imported single-hashmap save in missionProfileNamespace
	private _tryMPNHashmap = missionProfileNamespace getVariable format ["A3A_saveData_%1", _campaignID];
	if (!isNil "_tryMPNHashmap" && {_tryMPNHashmap isEqualType createHashMap}) exitWith { _tryMPNHashmap get _varname };

	// Old multi-variable save in missionProfileNamespace, used when loading an old save in new version
	private _tryMPVar = missionProfileNamespace getVariable format ["%1%2", _varname, _oldCampaignID];
	if (!isNil "_tryMPVar") exitWith { _tryMPVar };

	nil;
};

// Imported single-hashmap save in profileNamespace
private _tryPNHashmap = profileNamespace getVariable format ["A3A_saveData_%1", _campaignID];
if (!isNil "_tryPNHashmap" && {_tryPNHashmap isEqualType createHashMap}) exitWith { _tryPNHashmap get _varname };

// Old multi-variable save in profileNamespace, used when loading an old save in new version
private _tryPNVar = profileNamespace getVariable format ["%1%2%3Antistasi%4", _varname, _serverID, _oldCampaignID, _worldName];
if (!isNil "_tryPNVar") exitWith { _tryPNVar };

nil;
