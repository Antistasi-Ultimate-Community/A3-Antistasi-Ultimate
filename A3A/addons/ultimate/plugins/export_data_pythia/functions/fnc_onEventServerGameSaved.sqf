#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_export_data_pythia_fnc_onEventServerGameSaved

Description:
    CBA_EVENT_SERVER_GAME_SAVED event handler.

    Exports current game save data to JSON-formatted file on the server.

Parameters:
    0: useMPNamespace - whether to use the missionProfileNamespace (as opposed to legacy ProfileNamespace) <BOOL>
    1: serverID - the ID of the server that performed the save <BOOL> (false = profileNamespace save) OR <SCALAR> (missionProfileNamespace save)
    2: campaignID - the ID of the campaign that was active during the save <SCALAR>
    3: worldName - the name of the world where the save occurred <STRING>

Optional:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    jwoodruff40/Creep'nCrunch
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onEventServerGameSaved),_this);

if !assert(params[
    ["_useMPNamespace", nil, [false]],
    ["_serverID", nil, [false, ""]],
    ["_campaignID", nil, [""]],
    ["_worldName", nil, [""]]
]) exitWith {};

private _namespace = [profileNamespace, missionProfileNamespace] select (_useMPNamespace);
private _saveDataKey = format ([["savedata%1%2%3%4", _serverID, _campaignID, "Antistasi", _worldName], ["savedata%1", _campaignID]] select (_useMPNamespace));
private _saveData = _namespace getVariable _saveDataKey;

if (isNil "_saveData") exitWith {
    Info_1("Server attempted to export save data but it was not found: %1", _saveDataKey);
};

private _exportSuccess = [_saveDataKey, _saveData, "json"] call A3A_ultimate_export_data_pythia_fnc_exportData;

if (_exportSuccess) then {
    Info_2("Server exported save data to file: %1.%2",_saveDataKey,"json");
} else {
    Error_2("Server failed to export save data for %1.%2. Check logs for more information.",_saveDataKey,"json");
};

nil;
