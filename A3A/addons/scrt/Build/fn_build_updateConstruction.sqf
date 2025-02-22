/*
    Author: 
        Socrates
    [Description]
        Updates object in persistent constructions list. That list will be stored in save file.

    Arguments:
    0. <object>

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: Yes
    Dependencies:
        <ARRAY> constructionsToSave
     

    Example: [_building] remoteExecCall ["SCRT_fnc_build_updateConstruction", 2];
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_building"];

if (!isServer) exitWith {
    Error("Function miscalled locally, rerouting execution on server...");
    [_building] remoteExecCall ["SCRT_fnc_build_updateConstruction", 2];
};

if (isNil "constructionsToSave") exitWith {
    Error("For some reason constructionsToSave doesn't exist.");
};

private _buildingIndex = constructionsToSave find _building;

if (_buildingIndex == -1) exitWith {
    Error("Can't find building, aborting.");
};

constructionsToSave set [_buildingIndex, _building];
publicVariable "constructionsToSave";

Info_2("Updated already created %1 object on %2 position.", (typeOf _construction), str (position _construction));