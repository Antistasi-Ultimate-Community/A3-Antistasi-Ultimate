#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_varname"];
A3A_saveTarget params ["_serverID", "_campaignID", "_worldName"];

// JSON save (regardless of which namespace it's stored in)
// ! A3A_saveDataHM will only be created during game load, so we can't use this to populate the saved games in the setup dialog, hence the additional checks for json data below
if (!isNil {A3A_saveDataHM} && {A3A_saveDataHM isEqualType createHashMap}) exitWith {
	A3A_saveDataHM get _varname;
};

// missionProfileNamespace saves
if (_serverID isEqualType false) exitWith {
	private _jsonData = fromJson (missionProfileNamespace getVariable format ["savedata%1", _campaignID]);
	if (!isNil "_jsonData") then { _jsonData get _varname } else { missionProfileNamespace getVariable format ["%1%2", _varName, _campaignID] };
};

// profileNamespace saves (very old or linux host saves)
private _jsonData = fromJSON (profileNamespace getVariable format["savedata%1%2%3%4",_serverID,_campaignID,"Antistasi",worldName]);
if (!isNil "_jsonData") exitWith {
	_jsonData get _varname;
};

private _saveExt = format["%1%2Antistasi%3",_serverID,_campaignID,_worldName];

private _varValue = profileNamespace getVariable (_varname + _saveExt);
if (isNil "_varValue") exitWith {};


_varValue;
