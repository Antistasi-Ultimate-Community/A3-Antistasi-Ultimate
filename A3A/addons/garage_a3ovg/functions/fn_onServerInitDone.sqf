#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_garage_a3ovg_fnc_onServerInitDone

Description:
    CBA event handler function called when server initialization is complete.

    Called when the event CBA_EVENT_SERVER_INIT_DONE is fired.

Parameters:
    0: _serverID - Savegame server ID <STRING>
    1: _campaignID - Savegame campaign ID <STRING>
    2: _mapName - Savegame map name <STRING>

Optional:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Debug_2("%1: %2",QFUNC(onServerInitDone),_this);

if !assert(params[
    ["_serverID", nil, ["", false]],
    ["_campaignID", nil, [""]], 
    ["_mapName", nil, [""]]
]) exitWith {};
if !assert(_serverID isEqualType false) exitWith { Error_1("%1: old-style save system unsupported by A3OVG.",QFUNC(onServerInitDone)) };

Info_3("Server init done. serverID: %1, campaignID: %2, mapName: %3", _serverID, _campaignID, _mapName);

[_campaignID] call A3OVG_fnc_setStoragePrefix;
[] spawn A3OVG_fnc_loadGarage;

[CBA_EVENT_SERVER_GAME_DELETED, FUNC(onGameDeleted)] call FUNCMAIN(addEventHandler);
[CBA_EVENT_SERVER_GAME_SAVED, FUNC(onGameSaved)] call FUNCMAIN(addEventHandler);

nil;
