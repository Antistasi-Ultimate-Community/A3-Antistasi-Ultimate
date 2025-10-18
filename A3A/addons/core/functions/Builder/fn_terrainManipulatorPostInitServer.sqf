#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_terrainManipulatorPostInitServer

Description:
    CBA extended post-init handler for terrain object hider base buildable objects (server side).

Parameters:
    0: _object - Terrain objects hider <OBJECT>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill
---------------------------------------------------------------------------- */
Verbose_1("_this=%1",_this);

params[
    ["_object", objNull, [objNull]]
];

if !assert(!isNull _object) exitWith {};

GVAR(terrainManipulators) pushBack _object;
Debug_1("registered terrain manipulator %1",_object);

// Only propagate if object created during gameplay, not during game loading
if !isNil("serverInitDone") then {
    publicVariable QGVAR(terrainManipulators);
};

nil;
