// SERVER: a trader died. The stall closes; half an hour later a new trader
// sets up in a different town (fn_vendorLoop handles the relocation).
params [["_id", -1, [0]], ["_unit", objNull, [objNull]], ["_by", objNull, [objNull]]];
// shot by the rebels themselves (a player, or one of their AI)?
private _ownSide = !isNull _by && {isPlayer _by || {(side group _by) isEqualTo (missionNamespace getVariable ["teamPlayer", sideUnknown])}};
private _e = [_id] call ABZ_fnc_vendorEntry;
if (_e isEqualTo [] || {(_e select 9) == "dead"}) exitWith {};

_e set [9, "dead"];
_e set [10, time + 1800];
// other traders' untaken contracts pointing here: re-rolled on the next tick
{ [_x] call ABZ_fnc_entryPad; if (((_x select 13) param [0, -1]) isEqualTo _id) then { _x set [13, []]; _x set [14, -1] } } forEach ABZ_vendors;
deleteMarker format ["ABZ_vendor_%1", _id];

// a dead stall stops offering trade at once - props and body alike (the
// 120s cleanup below compares the unit object, not the tag)
{ if (!isNull _x) then { _x setVariable ["ABZ_vendorId", -1, true] } } forEach ((ABZ_vendorObjs getOrDefault [_id, [objNull, []]]) select 1);
if (!isNull _unit) then { _unit setVariable ["ABZ_vendorId", -1, true] };
call ABZ_fnc_publishStalls;

// smuggling runs headed here: the crate waits until the contact sets up
// again elsewhere (fn_vendorRelocate moves the run along). The wait doesn't
// eat the deadline - unless the rebels shot their own contact: then the
// deadline stands and no move ever extends it (no buying time, or a closer
// stall, with a bullet)
{
	if ((_x select 4) == _id) then {
		while { count _x < 12 } do { _x pushBack ([[0, 0, 0], false] select ((count _x) - 10)) };
		if (_ownSide) then {
			_x set [11, true];
		} else {
			_x set [6, (_x select 6) max ((_e select 10) + 900)];
		};
		private _uid = _x select 1;
		private _p = allPlayers findIf { getPlayerUID _x == _uid };
		if (_p > -1) then {
			["ABZ_notify", [[
				format [localize "STR_A3U_Bazaar_Runs_ContactKilled", _e select 5, _e select 1],
				format [localize "STR_A3U_Bazaar_Runs_ContactShot", _e select 5, _e select 1]
			] select _ownSide], allPlayers select _p] call CBA_fnc_targetEvent;
		};
	};
} forEach ABZ_runs;

if (missionNamespace getVariable ["ABZ_announce", true]) then {
	["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_ContactKilled", _e select 5, _e select 1]]] call CBA_fnc_globalEvent;
};
diag_log format ["[ABZ] Trader %1 (#%2) killed at %3", _e select 5, _id, _e select 1];

// the body lies there a while, then the stall is cleared - but only if it is
// still THIS trader's stall (a reset or relocation may have reused the slot)
[_id, _unit] spawn {
	params ["_id", "_u"];
	sleep 120;
	if (([_id] call ABZ_fnc_vendorUnit) isEqualTo _u) then { [_id] call ABZ_fnc_vendorDespawn };
};
call ABZ_fnc_queueSave;
