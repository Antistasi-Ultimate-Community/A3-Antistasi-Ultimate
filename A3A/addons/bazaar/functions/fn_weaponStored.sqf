// Client: weapons the player carries in their uniform, vest or backpack that
// a trader would buy as this class (fn_weaponSplit - stripped by him, so
// they never have to be drawn and break undercover).
// [class] -> [[container, entry, parts handed back, magazines handed back], ...]
params [["_c", "", [""]]];
if (_c == "") exitWith { [] };
private _out = [];
{
	private _box = _x;
	if (!isNull _box) then {
		{
			([_x] call ABZ_fnc_weaponSplit) params ["_sold", "_parts", "_mags"];
			if (_sold != "" && {_sold == _c}) then { _out pushBack [_box, _x, _parts, _mags] };
		} forEach (weaponsItemsCargo _box);
	};
} forEach [backpackContainer player, vestContainer player, uniformContainer player];
_out
