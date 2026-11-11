// SERVER: writes traders (with their stock and timers) and sealed crates to
// the server/host profile, keyed per campaign.
if (!isServer) exitWith {};
if !(missionNamespace getVariable ["ABZ_loaded", false]) exitWith {};	// never over a save not yet read
// Saved whatever "Persistent traders & crates" says - the setting only
// decides whether a boot RESTORES it (fn_load). So the snapshot always
// matches the latest Antistasi save, and switching the setting back on can
// never restore a crate that was unpacked while it was off.

private _key = call ABZ_fnc_saveKey;

// timers are stored as "seconds left" - mission time restarts at 0 every boot
private _v = [];
{
	private _e = +_x;
	_e set [7, ((_e select 7) - time) max 0];
	_e set [10, ((_e select 10) - time) max 0];
	_v pushBack _e;
} forEach ABZ_vendors;
profileNamespace setVariable [format ["ABZ_vendors_%1", _key], _v];

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
profileNamespace setVariable [format ["ABZ_crates_%1", _key], _c];
profileNamespace setVariable [format ["ABZ_nextId_%1", _key], ABZ_nextId];

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
profileNamespace setVariable [format ["ABZ_runs_%1", _key], _r];
profileNamespace setVariable [format ["ABZ_nextRunId_%1", _key], ABZ_nextRunId];

saveProfileNamespace;
