// Shared: what a trader could buy out of a vehicle or crate (v1.1.1), as
// [[class, count], ...]:
//   - weapons, as the class he buys each one as (fn_weaponSplit - he strips
//     them; parts and magazines go back into the same cargo)
//   - magazines (part-used ones are paid by the round)
//   - items - but not uniforms or vests (whatever is in their pockets would
//     be lost) and not backpacks; take those out to sell them
// [container] -> rows
params [["_box", objNull, [objNull]]];
if (isNull _box) exitWith { [] };
private _counts = createHashMap;
private _order = [];
private _fnc_add = {
	params ["_c", ["_n", 1]];
	if (!(_c isEqualType "") || {_c == ""}) exitWith {};
	if !(_c in _counts) then { _order pushBack _c };
	_counts set [_c, (_counts getOrDefault [_c, 0]) + _n];
};
{
	private _sold = ([_x] call ABZ_fnc_weaponSplit) select 0;
	if (_sold != "") then { [_sold] call _fnc_add };
} forEach (weaponsItemsCargo _box);
{ [_x select 0] call _fnc_add } forEach (magazinesAmmoCargo _box);
(getItemCargo _box) params [["_types", []], ["_ns", []]];
{
	if !((getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type")) in [701, 801]) then {
		[_x, _ns param [_forEachIndex, 0]] call _fnc_add;
	};
} forEach _types;
_order apply { [_x, _counts get _x] }
