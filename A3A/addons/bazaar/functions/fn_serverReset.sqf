// SERVER: host/admin reset - every trader and sealed crate is removed, the
// catalog is rebuilt (in case the stock source setting changed), and the
// loop opens fresh stalls in new towns.
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;
params [["_player", objNull, [objNull]]];
if (isNull _player) exitWith {};

private _allowed = ((admin (owner _player)) > 0) || {isServer && hasInterface && {_player isEqualTo player}};
if (!_allowed) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_ResetNotAllowed"], _player] call CBA_fnc_targetEvent;
};

{ deleteMarker format ["ABZ_vendor_%1", _x select 0] } forEach ABZ_vendors;
// every spawned trader the server knows of, not only those with an entry -
// nothing can be left standing at an old stall
{ [_x] call ABZ_fnc_vendorDespawn } forEach (keys ABZ_vendorObjs);
{ [_x select 0, "the Bazaar was reset", true] call ABZ_fnc_runFail } forEach +ABZ_runs;
ABZ_vendors = [];
{ [_x] call ABZ_fnc_crateRemove } forEach +ABZ_crates;	// out of their vehicles properly
ABZ_crates = [];
// ABZ_nextId is NOT reset: ids are never reused, so a timer or loop pass
// still holding an old trader's id can never touch a new trader
call ABZ_fnc_buildPool;
call ABZ_fnc_buildVehPool;
call ABZ_fnc_publishStalls;

["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_Reset", name _player]]] call CBA_fnc_globalEvent;
diag_log format ["[ABZ] Reset by %1", name _player];
call ABZ_fnc_queueSave;
