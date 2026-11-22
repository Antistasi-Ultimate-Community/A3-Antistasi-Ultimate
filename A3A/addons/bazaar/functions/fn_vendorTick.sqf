// SERVER: one heartbeat for one trader - restock/relocate timers, the unit
// watchdog, and spawning/despawning the unit as players come and go.
// fn_vendorLoop runs this UNSCHEDULED (isNil) so an admin reset - an
// unscheduled CBA event - can never land half-way through it and leave an
// orphaned trader behind.
// [_id, _humans]
#include "..\script_component.hpp"
params [["_id", -1, [0]], ["_humans", [], [[]]]];
private _e = [_id] call ABZ_fnc_vendorEntry;
if (_e isEqualTo []) exitWith {};	// removed (reset/relocation) since the loop took its copy
_e params ["", "", "_pos", "_dir", "", "", "", "_restockAt", "", "_state", "_deadUntil"];

if (_state == "dead") exitWith {
	if (time > _deadUntil) then { [_id] call ABZ_fnc_vendorRelocate };
};
if (time > _restockAt) exitWith { [_id] call ABZ_fnc_vendorRestock };

// this rotation's smuggling contract (needs other stalls to exist, so it is
// rolled here rather than with the stock; once per restock)
[_e] call ABZ_fnc_entryPad;
if ((_e select 14) != (_e select 8) && {!(_e select 15)} && {missionNamespace getVariable ["ABZ_runsEnabled", true]}) then {	// one contract per rotation: never after one was taken
	_e set [13, [_e] call ABZ_fnc_runOffer];
	// while the stalls are still being set up, keep looking (cheap when there's
	// no partner yet) - fixing it early would pin every contract on whoever
	// happened to open second
	if ((_e select 13) isNotEqualTo [] || {count ABZ_vendors >= round (missionNamespace getVariable ["ABZ_vendorCount", 3])}) then {
		_e set [14, _e select 8];
	};
};

private _u = [_id] call ABZ_fnc_vendorUnit;

// watchdog. Repair in place what can be repaired; only respawn a trader who
// is gone, untagged, or far off his stall.
if (!isNull _u) then {
	if (!alive _u) exitWith {
		// died without the killed handler reaching us
		[_id, _u] call ABZ_fnc_vendorKilled;
		_u = objNull;
	};
	private _off = _u distance2D _pos;
	if ((_u getVariable ["ABZ_vendorId", -1]) != _id || {_off > 15}) exitWith {
		Warning_4("[ABZ] Watchdog: trader #%1 untagged or %2m off his stall (local %3, owner %4) - respawning",_id,round _off,local _u,owner _u);
		[_id] call ABZ_fnc_vendorDespawn;
		_u = objNull;
	};
	if (!local _u) exitWith {
		Warning_2("[ABZ] Watchdog: trader #%1 not server-local (owner %2) - taking him back",_id,owner _u);
		(group _u) setGroupOwner 2;
	};
	if (!captive _u) then {
		Warning_1("[ABZ] Watchdog: trader #%1 lost captive - restored",_id);
		[_u] call ABZ_fnc_vendorPrep;
	};
	if (_off > 1.5) then {
		_u setPosATL _pos;
		_u setDir _dir;
		_u setVelocity [0, 0, 0];
	};
};
if ((_e select 9) != "ok") exitWith {};

private _near = (_humans findIf { alive _x && {_x distance2D _pos < 900} }) > -1;
if (_near && {isNull _u}) exitWith { [_e] call ABZ_fnc_vendorSpawn };
if (!_near && {!isNull _u} && {(_humans findIf { _x distance2D _pos < 1300 }) == -1}) then {
	[_id] call ABZ_fnc_vendorDespawn;
};
