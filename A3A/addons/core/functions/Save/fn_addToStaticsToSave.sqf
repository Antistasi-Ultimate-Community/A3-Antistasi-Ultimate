#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_addToStaticsToSave

Description:
    Add an object/vehicle to the server staticsToSave array

Parameters:
    0: _object - Object/vehicle to add <OBJECT>

Optional:

Example:
    (begin example)
    [cursorTarget] call A3A_fnc_addToStaticsToSave;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(addStaticsToSave),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

if !(isServer) exitWith { _this remoteExec["A3A_fnc_addToStaticsToSave", 2] };

if (_object in staticsToSave) exitWith {
    Verbose_1("Object %1 already in staticsToSave array, skipping",_object);
};

staticsToSave pushBack _object;
publicVariable "staticsToSave";

nil;
