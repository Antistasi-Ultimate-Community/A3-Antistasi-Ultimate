// Shared: takes ONE exact weapon (a weaponsItems entry, attachments and all)
// out of a container's cargo - a uniform/vest/backpack container or a
// vehicle/crate - and puts the parts and magazines that are handed back
// (fn_weaponSplit) into a container. Arma can't remove a single weapon from
// cargo, so the weapon cargo is rebuilt, and every other weapon must come
// back EXACTLY as it was. The engine fits a class's built-in parts into the
// slots left EMPTY, so:
//   - a weapon whose built-in slots all hold something (the built-in part or
//     a swapped one) goes back as itself
//   - one with a built-in slot emptied goes back as its plain gun
//     (fn_wantedBase) when that has no built-in part for an empty slot.
//     Never CBA's getNonPresetClass: in mods it can name a different gun.
//   - anything else: nothing is touched, and the reason is returned
// Global commands: run where the caller is (the owner for its own kit, the
// server for a vehicle or crate), in one unscheduled step.
// [container, entry, put-back container, parts, magazines [[class, rounds]]]
//   -> "" when taken, otherwise why not
params [["_box", objNull, [objNull]], ["_entry", [], [[]]], ["_back", objNull, [objNull]], ["_parts", [], [[]]], ["_mags", [], [[]]]];
if (isNull _box || {_entry isEqualTo []}) exitWith { "it isn't there any more" };
private _all = weaponsItemsCargo _box;
private _i = _all findIf { _x isEqualTo _entry };
if (_i < 0) exitWith { "it isn't there any more" };
_all deleteAt _i;

// how each other weapon goes back - all worked out before anything is touched
// (would class _cls, given this entry's parts, get a built-in part fitted?)
private _fnc_exact = {
	params ["_cls", "_e"];
	private _t = +_e;
	_t set [0, _cls];
	([_t] call ABZ_fnc_weaponParts) params ["_miss", "", "", "_kinds"];
	(_miss findIf { !((_x select 0) in _kinds) }) == -1
};
private _plan = [];
private _stuck = "";
{
	private _w = _x select 0;
	private _as = _w;
	if !([_w, _x] call _fnc_exact) then {
		_as = [_w] call ABZ_fnc_wantedBase;
		if (_as == _w || {!([_as, _x] call _fnc_exact)}) then { _as = "" };
	};
	if (_as == "") exitWith { _stuck = _w };
	_plan pushBack [_as, _x];
} forEach _all;
if (_stuck != "") exitWith {
	format [localize "STR_A3U_Bazaar_Cargo_Stuck", [_stuck] call ABZ_fnc_displayNameOf]
};

clearWeaponCargoGlobal _box;
{
	_x params ["_as", "_e"];
	_e params ["", ["_mz", ""], ["_pt", ""], ["_op", ""], ["_m1", []], ["_m2", []], ["_bp", ""]];
	// weaponsItems leaves the second magazine out when there is none
	if (count _e < 7) then { _bp = _m2; _m2 = [] };
	if !(_bp isEqualType "") then { _bp = "" };
	if !(_m2 isEqualType []) then { _m2 = [] };
	_box addWeaponWithAttachmentsCargoGlobal [[_as, _mz, _pt, _op, _m1, _m2, _bp], 1];
} forEach _plan;
if (!isNull _back) then {
	{ if (_x isEqualType "" && {_x != ""}) then { _back addItemCargoGlobal [_x, 1] } } forEach _parts;
	{ _x params ["_mc", "_ma"]; _back addMagazineAmmoCargo [_mc, 1, _ma] } forEach _mags;
};
""
