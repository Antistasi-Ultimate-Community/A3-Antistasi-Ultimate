#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

// No point re-running this every tick
private _blackMarketConditions = call A3A_fnc_resourceCheck_initBM;
private _tickTime = 600; // 10 minutes

continueResourceCheck = true;

while {continueResourceCheck} do {
	private _nextTick = time + _tickTime;
	waitUntil [{time >= _nextTick}, -1,30];
	waitUntil [{A3A_activePlayerCount > 0}, -1, 30];

	// Runs in sequence: cities, resources, misc, missions, BM
	[_blackMarketConditions] call A3A_fnc_resourceCheck_main;

	[CBA_EVENT_SERVER_RESOURCE_CHECK_DONE, []] call FUNCMAIN(triggerLocalEvent);
};