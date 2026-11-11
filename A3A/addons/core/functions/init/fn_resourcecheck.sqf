#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

// I want to expose these here for both readability and to allow for ingame tweaking
A3A_tick_time = 600; // 10 minutes
A3A_tick_continue = true;

// No point re-running this every tick
private _blackMarketConditions = call A3A_fnc_resourceCheck_initBM;

while {A3A_tick_continue} do {
	private _nextTick = time + A3A_tick_time;
	waitUntil [{time >= _nextTick}, -1,30];
	waitUntil [{A3A_activePlayerCount > 0}, -1, 30];

	// Runs in sequence: cities, resources, misc, missions, BM
	[_blackMarketConditions] call A3A_fnc_resourceCheck_main;

	[CBA_EVENT_SERVER_RESOURCE_CHECK_DONE, []] call FUNCMAIN(triggerLocalEvent);
};