#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

params [["_blackMarketConditions", []]];

if (_blackMarketConditions isEqualTo []) then {
    _blackMarketConditions = call A3A_fnc_resourceCheck_initBM;
};

// We need _resAdd/_hrAdd in both _cities and _resources, however _resources finalises the data
// INFO: We look at win/loss conditions in here too, makes sense to run directly *after* cities
(call A3A_fnc_resourceCheck_cities) params ["_resAdd", "_hrAdd"];

// Process FIA resources, salary, HR and bomb points
[_resAdd, _hrAdd] spawn A3A_fnc_resourceCheck_resources;

// Regular income of starting weapons, re-defining rebel gear hashmap, convoy markers, promotions, building timeouts, HQ Knowledge
[] call A3A_fnc_resourceCheck_misc;

// Mission roll, antenna repair task roll, rival task roll/reveal progress, trader task roll
[] call A3A_fnc_resourceCheck_missions;

// Black Market unlock checks
[_blackMarketConditions] call A3A_fnc_resourceCheck_BM;