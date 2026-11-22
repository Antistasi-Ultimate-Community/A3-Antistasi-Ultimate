/*
    Author: 
        Socrates
    [Description]
        Creates object and saves it in persistent constructions list. That list will be stored in save file.
        Also, it maintains LIFO principle.

    Arguments:
    0. <STRING> Structure type
    1. <ARRAY> Position 

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: Yes
    Dependencies:
        <ARRAY> constructionsToSave
     
    Example: [_type, _position] remoteExecCall ["SCRT_fnc_build_addConstruction", 2];
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_type", "_position", "_direction"];

if (!isServer) exitWith {
    Error("Function miscalled locally, rerouting execution on server...");
    _this remoteExecCall ["SCRT_fnc_build_addConstruction", 2];
};

if (isNil "constructionsToSave") exitWith {
    Error("For some reason constructionsToSave doesn't exist.");
};

private _construction = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
_construction setDir _direction;

constructionsToSave pushBackUnique _construction;
publicVariable "constructionsToSave";

//removing oldest constructions over the limit
call SCRT_fnc_build_trimConstructions;

Info_2("Created and saved %1 object on %2 position.", _type, str _position);