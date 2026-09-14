/*
Author: Håkon
Description:
    Removes all event listeners subscribed to a particular event

Arguments:
0. <String> Event to remove listeners from

Return Value: <Nil|Array> Nil if failed, the removed listeners otherwise

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example: ["AIVehInit"] call A3A_Events_fnc_removeAllEventListeners;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(params [ ["_event", "", [""]] ]) exitWith { Error_1("Invalid params passed: %1", _this)};

private _cbaEvent = configFile >> "A3A" >> "Events" >> _event;

if !assert(isClass _cbaEvent) exitWith {};
if !assert(isText(_cbaEvent >> "CBA_Event")) exitWith {};

_cbaEvent = getText(_cbaEvent >> "CBA_Event");

Warning_1("backwards compatibility to remove all ""%1"" events invoked (will remove all ""%2"" events).",_event,_cbaEvent);
Warning("please update your event system implementation. The old event system WILL be removed.");

if (isNil QGVAR(cbaEventIdMapper)) exitWith {};

GVAR(cbaEventIdMapper) apply {
    private _id = _x;
    _y params["_localEvent"];

    if (_localEvent isEqualTo _cbaEvent) then {
        [_event, _id] call FUNC(removeEventListener);
    };
};

nil;
