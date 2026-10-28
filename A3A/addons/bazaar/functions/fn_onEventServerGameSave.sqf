/*
    Author:
        Adapted from ABZ_fnc_save by FirewalkDev,
        modified to use AU save data plugin system and save game serve event by Creep'nCrunch / jwoodruff40        

    Description:
        Saves the state of vendors, crates, and smuggling runs to AU campaign save data hashmap.
    
    Params:
        _saveData <HASHMAP> <Default: createHashMap> - save data for plugins
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [] call ABZ_fnc_onEventServerGameSave;
    
    Return:
        None
*/

if !assert(params[
    ["_saveData", nil, [createHashMap]]
]) exitWith {};

if (!isServer) exitWith {};
if !(missionNamespace getVariable ["ABZ_loaded", false]) exitWith {};	// never over a save not yet read
// Saved whatever "Persistent traders & crates" says - the setting only
// decides whether a boot RESTORES it (fn_load). So the snapshot always
// matches the latest Antistasi save, and switching the setting back on can
// never restore a crate that was unpacked while it was off.

// timers are stored as "seconds left" - mission time restarts at 0 every boot
private _v = [];
{
	private _e = +_x;
	_e set [7, ((_e select 7) - time) max 0];
	_e set [10, ((_e select 10) - time) max 0];
	_v pushBack _e;
} forEach ABZ_vendors;
_saveData set ["ABZ_vendors", _v];

// crates: a crate riding in a vehicle is saved at the vehicle's spot
private _c = [];
{
	if (isNull _x) then { continue };
	private _d = _x getVariable ["ABZ_crate", []];
	if (_d isEqualTo []) then { continue };
	private _carrier = attachedTo _x;
	private _pos = getPosATL ([_x, _carrier] select (!isNull _carrier));
	_c pushBack [_d select 0, _d select 1, [_pos select 0, _pos select 1, 0]];
} forEach ABZ_crates;
_saveData set ["ABZ_crates", _c];
_saveData set ["ABZ_nextId", ABZ_nextId];

// smuggling runs: deadline as seconds left, the crate by position (its
// vehicle's when loaded) - restored on the ground there, like bulk crates
private _r = [];
{
	_x params ["_runId", "_uid", "_owner", "_srcId", "_destId", "_pay", "_deadline", "_crate", "_srcTown", "_srcName", ["_srcPos", [0, 0, 0]], ["_shot", false]];
	if (isNull _crate) then { continue };
	private _carrier = attachedTo _crate;
	private _pos = getPosATL ([_crate, _carrier] select (!isNull _carrier));
	_r pushBack [_runId, _uid, _owner, _srcId, _destId, _pay, (_deadline - time) max 0, [_pos select 0, _pos select 1, 0], _srcTown, _srcName, _srcPos, _shot];
} forEach ABZ_runs;
_saveData set ["ABZ_runs", _r];
_saveData set ["ABZ_nextRunId", ABZ_nextRunId];

nil;
