// Shared: everything you can get your hands on through Antistasi's Arms
// Dealer (the HALs store): every class he sells (fn_dealerMap) and
// everything you can end up holding from it (fn_yields: arsenal folds,
// attachment modes, a preset's built-in parts), as lowercase names.
// -> [reach (name -> true), cheapest (name -> cheapest list price of a
//    dealer item that yields it)]
// Both empty when he doesn't trade (no store, or disableTrader).
// A job must never ask for anything in reach (buy it from him, hand it in at
// the bounty plus a bonus), and the Bazaar must never pay more for a class
// than the cheapest dealer item that yields it costs (fn_dealerPrice).
// Built from config once per dealer store set, then cached (several kept).
private _none = [createHashMap, createHashMap];
private _off = missionNamespace getVariable ["disableTrader", false];
if (_off isEqualTo true || {_off isEqualTo 1}) exitWith { _none };
(call ABZ_fnc_dealerMap) params ["_map", "_exact", "_key"];
if (count _map == 0) exitWith { _none };
if (isNil "ABZ_dealerReachCaches") then { ABZ_dealerReachCaches = createHashMap };
private _ck = str [_exact, _key];
private _hit = ABZ_dealerReachCaches getOrDefault [_ck, []];
if (_hit isNotEqualTo []) exitWith { _hit };

private _reach = createHashMap;
private _cheap = createHashMap;
{
	private _lMin = _y select 0;
	// only weapons/items fold, switch or carry parts; magazines, packs and
	// unloaded mods' entries are just themselves
	private _names = if (isClass (configFile >> "CfgWeapons" >> _x)) then { [_x] call ABZ_fnc_yields } else { [_x] };
	{
		_reach set [_x, true];
		_cheap set [_x, (_cheap getOrDefault [_x, _lMin]) min _lMin];
	} forEach _names;
} forEach _map;
private _res = [_reach, _cheap];
ABZ_dealerReachCaches set [_ck, _res];
_res
