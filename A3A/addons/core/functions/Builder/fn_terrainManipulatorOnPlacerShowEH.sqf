#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_terrainManipulatorBuilderEH

Description:
    Post complete/load handler for terrain manipulator base builder objects.

Parameters:
    0: _player - Player invoking the base builder <OBJECT>
    1: _placerShow - Whether the builder placer is currently shown <BOOL>

Optional:
    2: _execOnServer - Whether to execute this event on the server (default: true) <BOOL>

Example:

Returns:
    Nothing

Scope:
    Server or Client

Author:
    UnseenKill
---------------------------------------------------------------------------- */
Verbose_1("_this=%1",_this);

params[
    ["_player", objNull, [objNull]],
    ["_placerShow", nil, [true]],
    ["_execOnServer", true, [true]]
];

if !assert(!isNull _player) exitWith {};
if !canSuspend exitWith { _this spawn A3A_fnc_terrainManipulatorBuilderEH };

// Validate/change object ownership, re-raise this event for player
if (_execOnServer) exitWith {
    if !assert(isServer) exitWith {};

    private _ownerID = owner _player;

    GVAR(terrainManipulators) = GVAR(terrainManipulators) - [objNull];
    publicVariable QGVAR(terrainManipulators);

    GVAR(terrainManipulators) apply {
        private _object = _x;

        if (owner _object != _ownerID && { assert(_object setOwner _ownerID) }) then {
            waitUntil { owner _object == _ownerID };
            Debug_2("changed ownership of %1 to %2",_object,_ownerID);
        };
    };

    [QGVAR(BuildingPlacerShow), [_player, _placerShow, false], _ownerID] call CBA_fnc_ownerEvent;
};

// Client side only from here
GVAR(terrainManipulators) apply {
    private _object = _x;
    if !assert(local _object) then { continue };

    private _properties = configOf _object >> QGVAR(Properties);
    private _actions = getArray(_properties >> "actions");

    if ("hideObject" in _actions) then {
        if (_placerShow) then {
            _object hideObject false;
            _object enableSimulationGlobal true;
        } else {
            _object hideObject true;
            _object enableSimulationGlobal false;
        };
    };
};

nil;
