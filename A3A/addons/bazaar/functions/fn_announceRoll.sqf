// SERVER: tells every client what just appeared at a trader - a new stall,
// a restock, or something a player sold onto his table - so each player's
// Wanted List can call out its pins (fn_wantedCheck). Class names only;
// the client matches against its own pins.
// [entry, rows (stock layout), job, why: "new" | "stock" | "sold"]
params [["_e", [], [[]]], ["_rows", [], [[]]], ["_job", [], [[]]], ["_why", "stock", [""]]];
if (_e isEqualTo []) exitWith {};
private _items = [];
{
	if (_x isEqualType [] && {count _x >= 6} && {(_x select 0) isEqualType ""} && {(_x param [3, 0]) > 0}) then {
		_items pushBack [_x select 0, ["single", "crate"] select (_x select 4), (_x select 5) isEqualTo "vehicle"];
	};
} forEach _rows;
private _jc = "";
if (_job isEqualType [] && {count _job >= 4} && {(_job select 2) < (_job select 1)}) then { _jc = _job select 0 };
if (_items isEqualTo [] && {_jc == ""}) exitWith {};
["ABZ_rolled", [_e select 5, _e select 1, _items, _jc, _why]] call CBA_fnc_globalEvent;
