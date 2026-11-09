#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_getObjectSaveData

Description:
    Return additional save data for an object that's to become part of the save

Parameters:
    0: _object - The object to save <OBJECT>

Optional:

Example:

Returns:
    Additional save data for object <ANY>

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(getObjectSaveData),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

if !(isText(configOf _object >> QGVAR(saveDataGetter))) exitWith {};

[_object] call compile getText(configOf _object >> QGVAR(saveDataGetter));
