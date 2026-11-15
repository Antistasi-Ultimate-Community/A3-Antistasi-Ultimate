#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_cleanup_oldsaves_fnc_onEventServerGameSaved

Description:
    Event handler for server game saved event.
    Cleans up (removes) old save data stored as separate variables in the given namespace.
    Runs _after_ the server has indicated it is finished saving the game in the new format, 
        so we don't end up in a broken state if some of this data is removed before it's all saved in the new hashmap.

Parameters:
    0: _saveToNewNamespace - boolean indicating if the save was to missionProfileNamespace <BOOL>
    1: _serverID - ID of the server where the save occurred <STRING> (profileNamespace save) or <BOOL> (missionProfileNamespace save)
    2: _campaignID - ID of the campaign being saved <STRING>
    3: _worldName - name of the world being saved <STRING>

Optional:
    4: _oldCampaignID - ID of the old campaign being removed <STRING>

Example:
    [true, false, "69420", "Altis"] call A3A_ultimate_cleanup_oldsaves_fnc_onEventServerGameSaved;

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    jwoodruff40 / Creep'nCrunch
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onServerEventGameSaved),_this);

if !assert(params[
    ["_saveToNewNamespace", nil, [false]],
    ["_serverID", nil, ["",false]],
    ["_campaignID", nil, [""]],
    ["_worldName", nil, [""]],
    ["_oldCampaignID", nil, [""]]
]) exitWith {};

if (!isNil "_oldCampaignID") exitWith { [_serverID, _oldCampaignID, _worldName] call A3A_fnc_deleteSave };

nil;
