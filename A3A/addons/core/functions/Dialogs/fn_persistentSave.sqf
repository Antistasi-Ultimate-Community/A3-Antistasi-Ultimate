#include "..\..\script_component.hpp"

/* Before rework, this function was essentially:
 *
 * if (player isEqualTo theBoss):
 *     doTheGlobalSaveAndSaveAllPlayerData;
 * else:
 *     doPlayerDataSave;
 *
 * Now, we always do the player data save first to include plugin save data, and
 * if we're not the boss, we just exit after that.
 */

private _pluginsData = createHashMap;
private _uuid = [] call CBA_fnc_createUUID;

// Subscribers to the event can add data to this hashmap to be saved along with
// the player data.
[CBA_EVENT_CLIENT_PLAYER_SAVE, [_pluginsData]] call FUNCMAIN(triggerLocalEvent);

Trace_1(QFUNC(onPlayerSaveData),_pluginsData);
Info_1("Sending save player request for UID %1",getPlayerUID player);

[getPlayerUID player, player, nil, _pluginsData, _uuid] remoteExecCall ["A3A_fnc_savePlayer", 2];

// If we're not the boss, we're done here. The call came from the rebel menu, so close it.
if (player isNotEqualTo theBoss) exitWith { 
	closeDialog 0;
	hintC (localize "STR_hints_personal_save_success");
};

// If we are the boss, wait for the player data save to complete before doing
// the global save. `A3A_fnc_savePlayer` will set the UUID passed to it in the
// local player variable when done.
[_uuid] spawn {
	params["_uuid"];
	private _timeout = diag_tickTime + 10;

	Debug_1("Waiting for UUID acknowledgement: %1", _uuid);

	waitUntil {
		(diag_tickTime > _timeout) ||
		{ player getVariable[QGVAR(saveUUID), ""] isEqualTo _uuid }
	};

	if (diag_tickTime > _timeout) then {
		Error("Timeout waiting for boss player data save to complete. Continuing with main save.");
	};

	Debug_1("Calling save loop after UUID acknowledgement: %1", _uuid);
	[] remoteExecCall ["A3A_fnc_saveLoop", 2];
};
