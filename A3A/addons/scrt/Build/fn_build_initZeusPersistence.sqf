/*
    Author:
        Zsombi
    [Description]
        Adds the persistent save event handlers to curator modules.
        Safe to call multiple times; each module only gets the handlers once.
        Curator object events fire on the curator's machine, so this must run everywhere.

    Arguments:
    0. <ARRAY> Curator modules

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: Yes

    Example: [allCurators] remoteExecCall ["SCRT_fnc_build_initZeusPersistence", 0];
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_curatorModules", [], [[]]]];

if (!saveZeusBuildings) exitWith {};

{
    if (isNull _x || {_x getVariable ["A3A_zeusPersistenceInit", false]}) then { continue };
    _x setVariable ["A3A_zeusPersistenceInit", true];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["_curator", "_entity"];
        if !(_entity isKindOf "Building") exitWith {};
        [_entity] remoteExecCall ["SCRT_fnc_build_saveConstruction", 2];
    }];
    _x addEventHandler ["CuratorObjectEdited", {
        params ["_curator", "_entity"];
        if !(_entity isKindOf "Building") exitWith {};
        [_entity] remoteExecCall ["SCRT_fnc_build_updateConstruction", 2];
    }];
    _x addEventHandler ["CuratorObjectDeleted", {
        params ["_curator", "_entity"];
        if !(_entity isKindOf "Building") exitWith {};
        [_entity] remoteExecCall ["SCRT_fnc_build_removeConstruction", 2];
    }];
    Info_1("Curator persistent save initialized for %1.", _x);
} forEach _curatorModules;
