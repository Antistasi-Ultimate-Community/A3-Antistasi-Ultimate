#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// If we are the boss, trigger a global save where all players, including
// theBoss are saved.
if (player isEqualTo theBoss) exitWith { 
	Debug("Calling save loop on server.");
	[] remoteExecCall ["A3A_fnc_saveLoop", 2];
};

// If we're not the boss, fetch plugins data, tell the server to store it.
// The call came from the rebel menu, so close it.

private _pluginsData = createHashMap;

// Subscribers to the event can add data to this hashmap to be saved along with
// the player data.
[CBA_EVENT_CLIENT_PLAYER_SAVE, [_pluginsData]] call FUNCMAIN(triggerLocalEvent);

Trace_1(QFUNC(onPlayerSaveData),_pluginsData);
Info_1("Sending save player request for UID %1",getPlayerUID player);

[getPlayerUID player, player, nil, _pluginsData] remoteExecCall ["A3A_fnc_savePlayer", 2];

closeDialog 0;
hintC (localize "STR_hints_personal_save_success");

nil;
