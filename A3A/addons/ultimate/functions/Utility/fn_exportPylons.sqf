/*
    Author:
    Silence

    Description:
    Grabs the current pylon loadout of an air vehicle and exports it for config (You'll have to remove the extra [])
    Logs the pylon export as well as vehicle classname to rpt log, and copies pylons to your clipboard (if in SP)

    Params:
	_vehicle   <OBJECT> <DEFAULT: cursorObject>

    Usage:
    call A3U_fnc_exportPylons;

    Return:
    N/A
*/

params [["_vehicle", cursorObject]];

private _pylons = getAllPylonsInfo _vehicle;

private _export = [];

{
	_export pushBack (_x select 3);
} forEach _pylons;

[format["Plane Loadout (%1) Exported.", (typeOf _vehicle)], _fnc_scriptName] call A3U_fnc_log;
diag_log _export;

copyToClipboard str _export;
