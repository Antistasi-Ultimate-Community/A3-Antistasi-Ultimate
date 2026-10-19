// SERVER: a trader packs up and reappears in a different town with fresh
// stock (scheduled moves, and replacements for killed traders).
params [["_id", -1, [0]]];
private _i = ABZ_vendors findIf { (_x select 0) == _id };
if (_i < 0) exitWith {};
private _old = ABZ_vendors select _i;

[_id] call ABZ_fnc_vendorDespawn;
deleteMarker format ["ABZ_vendor_%1", _id];
ABZ_vendors deleteAt _i;

private _new = [_id, _old select 11, _old select 6] call ABZ_fnc_vendorCreate;
if (_new isEqualTo []) exitWith {
	diag_log format ["[ABZ] Trader #%1 found no free town to move to - dropped (the loop will re-create one)", _id];
	call ABZ_fnc_queueSave;
};
ABZ_vendors pushBack _new;
[_new] call ABZ_fnc_vendorMarker;

// other traders' contracts pointing here were priced for the old stall, and
// the ones not taken yet may now have a better partner: re-roll them all on
// the next tick, from the real positions
{
	[_x] call ABZ_fnc_entryPad;
	if (((_x select 13) param [0, -1]) isEqualTo _id || {!(_x select 15)}) then {
		_x set [13, []];
		_x set [14, -1];
	};
} forEach ABZ_vendors;

// smuggling runs headed for this trader follow them to the new stall, with
// time to get there
{
	if ((_x select 4) == _id) then {
		private _crate = _x select 7;
		if (!isNull _crate) then { _crate setVariable ["ABZ_runInfo", [_x select 2, _new select 5, _new select 1], true] };
		private _from = if (isNull _crate) then { _old select 2 } else { getPosATL ([_crate, attachedTo _crate] select (!isNull attachedTo _crate)) };
		// the pay never goes up, and drops to what the new route is worth
		// (a contact who reopens next door doesn't pay for the long haul)
		private _src = _x param [10, [0, 0, 0]];
		// ...but the haul already done counts: the floor is what the leg still
		// ahead is worth plus the share of the contract already driven (a crate
		// still at the source: the new route's price; one that reached the old
		// stall: the full pay)
		if (_src isNotEqualTo [0, 0, 0]) then {
			private _done = 0 max (1 - ((_from distance2D (_old select 2)) / (1 max (_src distance2D (_old select 2)))));
			private _floor = (([_from, _new select 2] call ABZ_fnc_runPay) select 0) + _done * (_x select 5);
			_x set [5, (_x select 5) min ((([_src, _new select 2] call ABZ_fnc_runPay) select 0) max _floor)];
		};
		// time to get there - unless the rebels shot this contact themselves
		if !(_x param [11, false]) then {
			_x set [6, (_x select 6) max (time + ([_from distance2D (_new select 2)] call ABZ_fnc_runAllowance))];
		};
		private _p = allPlayers findIf { getPlayerUID _x == ((ABZ_runs select _forEachIndex) select 1) };
		if (_p > -1) then {
			private _pl = allPlayers select _p;
			["ABZ_notify", [format ["Your contact moved: hand the crate to %1 near %2 now - %3 min left, pays $%4.", _new select 5, _new select 1, ceil (((_x select 6) - time) / 60), _x select 5]], _pl] call CBA_fnc_targetEvent;
			["ABZ_runMark", [_new select 2, format ["Run: %1 (%2)", _new select 5, _new select 1]], _pl] call CBA_fnc_targetEvent;
		};
	};
} forEach ABZ_runs;

if (missionNamespace getVariable ["ABZ_announce", true]) then {
	["ABZ_chat", [format ["[Bazaar] The trader from %1 has moved on. Word is a new stall opened near %2.", _old select 1, _new select 1]]] call CBA_fnc_globalEvent;
};
diag_log format ["[ABZ] Trader #%1 relocated: %2 -> %3 (now %4)", _id, _old select 1, _new select 1, _new select 5];
call ABZ_fnc_queueSave;
