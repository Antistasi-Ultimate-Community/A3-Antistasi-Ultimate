#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_getObjectSaveData_BuildBox

Description:
    Return build boxes' remaining budget to include in object save data

Parameters:
    0: _object - The object to save <OBJECT>

Optional:

Example:

Returns:
    Additional save data for object <ARRAY>

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(getObjectSaveData_BuildBox),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

[_object getVariable["A3A_build_money", 0]];
