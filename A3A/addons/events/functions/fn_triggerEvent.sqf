/*
Author: Håkon
Description:
    Triggers an event

Arguments:
0. <String> Event identifier

Return Value:
<Nil|Bool> Nil if failed, otherwise true

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example: ["AIVehInit", [_veh, _side]] call A3A_Events_fnc_triggerEvent;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
      ["_event", "", [""]]
    , ["_arguments", [], [[]]]
];

private _cbaEvent = configFile >> "A3A" >> "Events" >> _event;

if !assert(isClass _cbaEvent) exitWith {};
if !assert(isText(_cbaEvent >> "CBA_Event")) exitWith {};

_cbaEvent = getText(_cbaEvent >> "CBA_Event");

Warning_2("backwards compatibility for old event ""%1"" invoked; sending CBA event ""%2"" instead",_event,_cbaEvent);
Warning("please update your event system implementation. The old event system WILL be removed.");

// Despite the old event config allowing for an `isLocal` flag, that was never
// actually used and broadcast events were always local.
[_cbaEvent, _arguments] call FUNCMAIN(triggerLocalEvent);

true;
