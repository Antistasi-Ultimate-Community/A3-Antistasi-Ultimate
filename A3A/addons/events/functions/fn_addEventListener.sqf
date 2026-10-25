/*
Author: Håkon
Description:
    Add a listener to an event, allowing you to trigger functions when that event occurs

Arguments:
0. <String> Event identifier, as registered in configFile >> A3A >> Events
1. <String> Unique identifier of listener
2. <String|Code> Code block or name of function to excecute on event occurance

Return Value:
<Array<Event, ID>> data needed to remove listener

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example:
["AIVehInit", "A3A_Events_example", "someFuncName"] call A3A_Events_fnc_addEventListener;
["AIVehInit", "A3A_Events_example", {systemChat "Example event listener triggered!"}] call A3A_Events_fnc_addEventListener;
["AIVehInit", "A3A_Events_example", someFunc] call A3A_Events_fnc_addEventListener;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(params [
      ["_event", "", [""]]
    , ["_id", "", [""]]
    , ["_callback", {}, ["", {}]]
]) exitWith {
    Error_1("Invalid params passed: %1", _this);
};

private _cbaEvent = configFile >> "A3A" >> "Events" >> _event;

if !assert(isClass _cbaEvent) exitWith {};
if !assert(isText(_cbaEvent >> "CBA_Event")) exitWith {};

_cbaEvent = getText(_cbaEvent >> "CBA_Event");

Warning_2("backwards compatibility for old event ""%1"" invoked; subscribing CBA event ""%2"" instead",_event,_cbaEvent);
Warning("please update your event system implementation. The old event system WILL be removed.");

if (!isNil QGVAR(cbaEventIdMapper) && { _id in GVAR(cbaEventIdMapper) }) then {
    [_event, _id] call FUNC(removeEventListener);
};

if (_callback isEqualType "") then {
    private _function = missionNamespace getVariable[_callback, uiNamespace getVariable[_callback, {}]];
    if !assert(_function isEqualType {}) then {
        _function = {};
        Error_1("Failed to resolve callback function: %1", _callback);
    };
    _callback = _function;
};

private _cbaId = [_cbaEvent, _callback] call FUNCMAIN(addEventHandler);

if (isNil QGVAR(cbaEventIdMapper)) then {
    GVAR(cbaEventIdMapper) = createHashMap;
};

GVAR(cbaEventIdMapper) set[_id, [_cbaEvent, _cbaId]];

[_event, _id];
