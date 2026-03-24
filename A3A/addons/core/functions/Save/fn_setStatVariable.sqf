
params ["_varName", "_varValue", ["_final", false]];
A3A_saveTarget params ["_serverID", "_campaignID", "_map"];

if (isNil "_varValue") exitWith {};			// hmm...

// Store data in temporary hashmap until we're done adding all the data, then the serialized data string will be stored in the appropriate namespace via following code sections
if (!_final && {!isNil {A3A_saveDataHM} && {A3A_saveDataHM isEqualType createHashMap}}) exitWith {
	A3A_saveDataHM set [_varName, _varValue];
};

// Simple version for new missionProfileNamespace saves
if (_serverID isEqualType false) exitWith {
	missionProfileNamespace setVariable [format ["%1%2", _varName, _campaignID], _varValue];
};

private _saveExt = format["%1%2%3%4",_serverID,_campaignID,"Antistasi",_map];
profileNamespace setVariable [_varName + _saveExt, _varValue];
