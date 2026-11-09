// Client: everything the player is carrying, as [[class, count], ...] -
// weapons in the hands and their attachments, weapons stored in the
// uniform/vest/backpack (v1.1.1: listed as the class a trader buys them as -
// fn_weaponSplit), spare magazines, items, assigned items, and what they're
// wearing. Loaded magazines are not counted (they're in the gun).
private _counts = createHashMap;
private _order = [];
private _fnc_add = {
	params [["_c", ""], ["_n", 1]];
	if (!(_c isEqualType "") || {_c == ""}) exitWith {};
	if !(_c in _counts) then { _order pushBack _c };
	_counts set [_c, (_counts getOrDefault [_c, 0]) + _n];
};

private _weps = weapons player;
{ [_x] call _fnc_add } forEach _weps;
{ [_x] call _fnc_add } forEach (primaryWeaponItems player + secondaryWeaponItems player + handgunItems player);
// stored weapons: what the trader would buy each one as (stripped by him)
{
	private _box = _x;
	if (!isNull _box) then {
		{
			private _sold = ([_x] call ABZ_fnc_weaponSplit) select 0;
			if (_sold != "") then { [_sold] call _fnc_add };
		} forEach (weaponsItemsCargo _box);
	};
} forEach [uniformContainer player, vestContainer player, backpackContainer player];
{ [_x] call _fnc_add } forEach (magazines player);
// (items player also lists stored weapons - those were counted above)
{ if !([_x] call ABZ_fnc_isWeaponType) then { [_x] call _fnc_add } } forEach (items player);
{ if !(_x in _weps) then { [_x] call _fnc_add } } forEach (assignedItems player);
{ [_x] call _fnc_add } forEach [uniform player, vest player, headgear player, goggles player, backpack player];

_order apply { [_x, _counts get _x] }
