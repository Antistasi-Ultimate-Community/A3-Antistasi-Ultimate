/*
    Author: 
        Socrates
    [Description]
        Saves object in persistent constructions list. That list will be stored in save file.
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
     
    Example: [_construction] remoteExecCall ["SCRT_fnc_build_saveConstruction", 2];
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_construction"];


if (!isServer) exitWith {
    Error("Function miscalled locally, rerouting execution on server...");
    [_construction] remoteExecCall ["SCRT_fnc_build_saveConstruction", 2];
};

if (isNil "constructionsToSave") exitWith {
    Error("For some reason constructionsToSave doesn't exist.");
};

constructionsToSave pushBackUnique _construction;
publicVariable "constructionsToSave";

//removing previous
private _excessiveConstructions = maxConstructions - (count constructionsToSave);
if(_excessiveConstructions < 0) then {
	private _top = abs _excessiveConstructions;
	for "_i" from 0 to _top do {
		deleteVehicle (constructionsToSave select _i);
		constructionsToSave deleteAt _i;
	};
};

Info_2("Saved already created %1 object on %2 position.", (typeOf _construction), str (position _construction));
