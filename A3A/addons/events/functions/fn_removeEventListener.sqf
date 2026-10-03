/*
Author: Håkon
Description:
    Removes a event listener

Arguments:
0. <String> Event the listener is subscribed to
1. <String> The event listeners unique identifier

Return Value:
<Nil|Array> Nil if failed, deleted event listener otherwise

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example: ["AIVehInit", "A3A_Events_example"] call A3A_Events_fnc_removeEventListener;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(params [
      ["_event", "", [""]]
    , ["_id", "", [""]]
]) exitWith { Error_1("Invalid params passed: %1", _this)};

Warning_1("backwards compatibility to remove event with ID ""%1"" invoked.",_id);
Warning("please update your event system implementation. The old event system WILL be removed.");

if (isNil QGVAR(cbaEventIdMapper)) exitWith {};

private _cbaId = GVAR(cbaEventIdMapper) get _id;

if !(isNil "_cbaId") then {
    _cbaId call FUNCMAIN(removeEventHandler);
    GVAR(cbaEventIdMapper) deleteAt _id;
};

nil;
