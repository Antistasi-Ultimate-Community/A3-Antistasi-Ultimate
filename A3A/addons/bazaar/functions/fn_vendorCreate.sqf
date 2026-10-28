// SERVER: builds a new trader entry (town, stall spot, name, first stock).
// Returns the entry, or [] when no town is available.
//
// Entry layout (plain array, so it saves as-is):
//   0 id   1 town name   2 stall posATL   3 facing   4 civilian class
//   5 trader name   6 stock (see fn_rollStock)   7 restock time
//   8 restocks done   9 state "ok"/"dead"   10 dead-until time   11 town centre
//   12 job [class, wanted, delivered, rewardEach] or [] (see fn_rollJob)
//   13 smuggling-run offer [destId, payout, secs allowed, km, enemy share] or []
//      (fn_runOffer, rolled by fn_vendorTick once other stalls exist)
//   14 restock count (field 8) the offer was rolled for, -1 = not yet
//   15 the offer was taken this rotation
// _oldRows: the table this trader had until a moment ago (a relocation) -
// the new job never asks for any of it (fn_rollJob)
params [["_id", -1, [0]], ["_exclude", [], [[]]], ["_oldRows", [], [[]]]];

private _town = [_exclude] call ABZ_fnc_vendorPick;
if (_town isEqualTo []) exitWith { [] };
_town params ["_tname", "_center"];

private _pos = [_center] call ABZ_fnc_vendorPos;
private _dir = _pos getDir _center;
private _rot = 60 * (missionNamespace getVariable ["ABZ_rotationMinutes", 90]);

private _e = [_id, _tname, _pos, _dir, call ABZ_fnc_civClass, selectRandom (call ABZ_fnc_vendorNames), [], time + _rot, 0, "ok", 0, _center, [], [], -1, false];
_e set [6, [_e] call ABZ_fnc_rollStock];
_e set [12, [_e, _oldRows] call ABZ_fnc_rollJob];
[_e, _e select 6, _e select 12, "new"] call ABZ_fnc_announceRoll;	// Wanted List alerts
_e
