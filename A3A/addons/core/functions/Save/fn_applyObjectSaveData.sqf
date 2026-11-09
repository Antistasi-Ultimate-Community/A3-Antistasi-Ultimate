#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_applyObjectSaveData

Description:
    Restore/apply additional save data for an object that's part of the save

Parameters:
    0: _object - Object to apply save data to <OBJECT>
    1: _saveData - Save data to apply <ANY>

Optional:

Example:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(applyObjectSaveData),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

private _saveData = param[1, nil];

if (isNil "_saveData") exitWith {};

if !(isText(configOf _object >> QGVAR(saveDataSetter))) exitWith {
    Warning_1("applyObjectSaveData: object class %1 has additional save data, but no setter defined",typeOf _object);
    nil;
};

call compile getText(configOf _object >> QGVAR(saveDataSetter));

nil;
