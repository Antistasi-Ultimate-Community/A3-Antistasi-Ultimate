
params ["_varName", "_varValue", ["_final", false]];
A3A_saveTarget params ["_serverID", "_campaignID", "_map"];

if (isNil "_varValue") exitWith {};			// hmm...

// Game has already been initialized
// Store data in temporary hashmap until we're done adding all the data, then save the entire save data as one hashmap to the appropriate namespace
if (!_final && {!isNil {A3A_saveDataHM} && {A3A_saveDataHM isEqualType createHashMap}}) exitWith {
	A3A_saveDataHM set [_varName, _varValue];
};

// Game not started yet (we're still in the setup UI)
// Find the appropriate save data hashmap and store in that directly
private _namespace = [profileNamespace, missionProfileNamespace] select (_serverID isEqualTo false);
private _saveDataHM = _namespace getVariable [format ["A3A_saveData_%1", _campaignID], createHashMap];
_saveDataHM set [_varName, _varValue];
_namespace setVariable [format ["A3A_saveData_%1", _campaignID], _saveDataHM];
