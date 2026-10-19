// SERVER: brings every row on every trader's table up to today's price rules
// (fn_unitPrice for single items, fn_cratePrice for bulk crates) - never
// down, except a crate row, which is always exactly today's crate price (a
// crate is filled with today's crate size when it's bought). Run after a
// restart (fn_load) and whenever an admin changes a setting prices depend
// on mid-mission, so a row priced under the old rules can't be bought cheap
// and sold or unpacked at the new ones.
// Vehicles keep their price (never below 1.5x what Antistasi pays back for
// them - fn_vehPrice - whatever the settings).
// -> how many rows changed
if (!isServer || {isNil "ABZ_vendors"}) exitWith { 0 };
private _n = 0;
{
	{
		if (_x isEqualType [] && {count _x >= 6} && {(_x select 5) isNotEqualTo "vehicle"} && {(_x select 0) isEqualType ""} && {(_x select 1) isEqualType 0}) then {
			private _now = if (_x select 4) then { [_x select 0] call ABZ_fnc_cratePrice } else { [_x select 0] call ABZ_fnc_unitPrice };
			// a crate always holds today's crate size (it's filled when bought), so
			// its row is today's crate price exactly - down as well as up
			if (_now > (_x select 1) || {(_x select 4) && {_now != (_x select 1)}}) then { _x set [1, _now]; _n = _n + 1 };
		};
	} forEach (_x param [6, []]);
} forEach ABZ_vendors;
_n
