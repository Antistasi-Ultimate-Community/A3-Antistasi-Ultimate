#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_applyObjectSaveData_BuildBox

Description:
    Apply build boxes' remaining budget from object save data

Parameters:
    0: _object - The object to apply save data to <OBJECT>
    1: _saveData - Save data to apply <ANY> (expected: <ARRAY>)

Optional:

Example:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(applyObjectSaveData_BuildBox),_this);

if !assert(params[
    ["_object", nil, [objNull]],
    ["_saveData", nil, [[]]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

if !assert(_saveData params[
    ["_remainingBudget", nil, [0]]
]) exitWith {};

_object setVariable["A3A_build_money", _remainingBudget, true];

nil;
