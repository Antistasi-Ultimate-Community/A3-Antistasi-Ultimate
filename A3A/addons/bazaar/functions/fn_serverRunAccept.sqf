// SERVER: a player takes a trader's smuggling contract.
// Run layout (ABZ_runs):
//   0 runId   1 holder UID   2 holder name   3 source trader id
//   4 destination trader id   5 payout   6 deadline (server time)
//   7 crate   8 source town   9 source trader name   10 source stall pos
//   11 the contact was shot by the rebels' own side (no more extensions)
// [player, source trader id, destination id + payout the menu showed]
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state first
params [["_player", objNull, [objNull]], ["_id", -1, [0]], ["_wantDest", -1, [0]], ["_wantPay", -1, [0]]];
if (isNull _player) exitWith {};
private _fnc_say = { params ["_m"]; ["ABZ_notify", [_m], _player] call CBA_fnc_targetEvent };

if !(missionNamespace getVariable ["ABZ_runsEnabled", true]) exitWith { ["Smuggling runs are switched off on this server."] call _fnc_say };
private _e = [_id] call ABZ_fnc_vendorEntry;
private _why = [_player, _e] call ABZ_fnc_serverCanTrade;
if (_why != "") exitWith { [_why] call _fnc_say };
[_e] call ABZ_fnc_entryPad;
private _fnc_refresh = { ["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent };

private _uid = getPlayerUID _player;
if (_uid == "") exitWith {};
if (([_uid] call ABZ_fnc_runFind) > -1) exitWith {
	["You already have a run going - one at a time. Shift+K (away from a stall) shows where it's headed."] call _fnc_say;
	call _fnc_refresh;
};
private _o = _e select 13;
if (_o isEqualTo [] || {(_o select 0) != _wantDest} || {(_o select 1) != _wantPay}) exitWith {
	["The contract changed while you were looking - here's the new table."] call _fnc_say;
	call _fnc_refresh;
};
private _d = [_wantDest] call ABZ_fnc_vendorEntry;
if (_d isEqualTo [] || {(_d select 9) != "ok"}) exitWith {
	_e set [13, []];
	_e set [14, -1];	// roll a fresh one against the stalls open now
	["The contact on the other end has gone quiet - no run today."] call _fnc_say;
	call _fnc_refresh;
};

_o params ["_destId", "_pay", "_secs", "_km"];
private _runId = ABZ_nextRunId;
ABZ_nextRunId = ABZ_nextRunId + 1;
private _crate = [[_e] call ABZ_fnc_dropSpot, _runId, name _player, _d select 5, _d select 1] call ABZ_fnc_runSpawnCrate;
ABZ_runs pushBack [_runId, _uid, name _player, _id, _destId, _pay, time + _secs, _crate, _e select 1, _e select 5, _e select 2, false];
_e set [13, []];	// one contract per trader per rotation
_e set [15, true];
_e set [14, _e select 8];
call ABZ_fnc_runPublish;

["ABZ_runMark", [_d select 2, format ["Run: %1 (%2)", _d select 5, _d select 1]], _player] call CBA_fnc_targetEvent;
[format ["CONTRACT TAKEN. The sealed crate is beside the stall, tagged as yours.\nGet it to %1 near %2 (%3 km, marked on your map) within %4 min and hand it over there: $%5.\nSpotted with it long enough and it's seized; lose the vehicle carrying it and it's gone.",
	_d select 5, _d select 1, _km, ceil (_secs / 60), _pay]] call _fnc_say;
call _fnc_refresh;
diag_log format ["[ABZ] %1 took smuggling run #%2: trader #%3 (%4) -> #%5 (%6), %7 km, $%8, %9 s", name _player, _runId, _id, _e select 1, _destId, _d select 1, _km, _pay, _secs];
call ABZ_fnc_queueSave;
