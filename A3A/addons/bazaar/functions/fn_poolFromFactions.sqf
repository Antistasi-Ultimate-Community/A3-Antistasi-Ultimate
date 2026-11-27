// SERVER: every classname mentioned anywhere in the campaign's faction
// hashmaps (occupants, invaders, rebels, rivals). Walks nested arrays and
// hashmaps, so it doesn't care how a template - or Faction Forger - lays
// its loadouts out; fn_buildPool then keeps only what is actually sellable.
private _out = [];
private _fnc_walk = {
	params ["_v", "_depth"];
	if (_depth > 8) exitWith {};
	switch (typeName _v) do {
		case "STRING": { if (_v != "") then { _out pushBack _v } };
		case "ARRAY": { { [_x, _depth + 1] call _fnc_walk } forEach _v };
		case "HASHMAP": { { [_y, _depth + 1] call _fnc_walk } forEach _v };
	};
};

{
	private _fac = missionNamespace getVariable ["A3A_faction_" + _x, nil];
	if (!isNil "_fac" && {_fac isEqualType createHashMap}) then {
		{
			// vehicle lists are big and never sellable; cosmetics aren't either
			private _k = toLower _x;
			if ((_k find "vehicle") == 0 || {(_k find "animations") == 0} || {(_k find "faces") == 0} || {(_k find "voices") == 0}) then { continue };
			[_y, 0] call _fnc_walk;
		} forEach _fac;
	};
} forEach ["occ", "inv", "reb", "riv"];

_out
