/*
    Author:
        Zsombi
    [Description]
        Enforces maxConstructions on the persistent constructions list.
        Removes and deletes the oldest constructions (front of the list) until the limit is met.

    Arguments:
    <nil>

    Return Value:
    <NUMBER> Amount of constructions removed

    Scope: Server
    Environment: Any
    Public: No
    Dependencies:
        <ARRAY> constructionsToSave
        <NUMBER> maxConstructions

    Example: [] call SCRT_fnc_build_trimConstructions;
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

if (!isServer) exitWith { 0 };
if (isNil "constructionsToSave") exitWith { 0 };

private _excess = (count constructionsToSave) - maxConstructions;
if (_excess <= 0) exitWith { 0 };

for "_i" from 1 to _excess do {
    deleteVehicle (constructionsToSave deleteAt 0);
};
publicVariable "constructionsToSave";

Info_1("Removed %1 oldest constructions to stay within the construction limit.",_excess);
_excess;
