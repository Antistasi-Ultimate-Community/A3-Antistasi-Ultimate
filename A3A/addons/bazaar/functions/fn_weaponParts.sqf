// Shared: the parts on one weapon (a weaponsItems entry) against the parts
// its class comes with (LinkedItems), in any of their modes (fn_switchFamily).
// Matched by SLOT - muzzle 101, optic 201, side rail 301, bipod 302:
//   - a fitted part by where weaponsItems reports it (muzzle, side, top, then
//     the bipod after the magazines - the engine files a part by its type)
//   - a built-in part by its own type (mods give slots custom names, and
//     NIArms links an MP5 grip through its optic rail); when the type says
//     nothing, by the slot's proxy, then the slot name
// [entry] -> [built-in parts missing [[slot kind, family, class], ...],
//             fitted parts that aren't built in [class, ...],
//             everything fitted [class, ...],
//             the slot kind of everything fitted [kind, ...]]
params [["_entry", [], [[]]]];
if (_entry isEqualTo [] || {!((_entry select 0) isEqualType "")}) exitWith { [[], [], [], []] };
private _cw = configFile >> "CfgWeapons" >> (_entry select 0);

private _left = (("true" configClasses (_cw >> "LinkedItems")) select { getText (_x >> "item") != "" }) apply {
	private _item = getText (_x >> "item");
	private _slot = getText (_x >> "slot");
	private _kind = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type");
	if !(_kind in [101, 201, 301, 302]) then {
		private _path = (toLower getText (_cw >> "WeaponSlotsInfo" >> _slot >> "linkProxy")) splitString "\/";
		_kind = switch (_path param [(count _path) - 1, ""]) do {
			case "muzzle": { 101 };
			case "top": { 201 };
			case "side": { 301 };
			case "underbarrel": { 302 };
			default { 0 };
		};
		if (_kind == 0) then {
			_kind = switch (toLower _slot) do {
				case "muzzleslot": { 101 };
				case "cowsslot": { 201 };
				case "pointerslot": { 301 };
				case "underbarrelslot": { 302 };
				default { 0 };
			};
		};
	};
	[_kind, [_item] call ABZ_fnc_switchFamily, _item]
};

private _fitted = [];
for "_k" from 1 to ((count _entry) - 1) do {
	private _p = _entry select _k;
	if (_p isEqualType "" && {_p != ""}) then {
		_fitted pushBack [_p, [101, 301, 201, 302] select (((_k - 1) max 0) min 3)];
	};
};

private _extras = [];
{
	_x params ["_p", "_k"];
	private _l = toLower _p;
	private _i = _left findIf { (_x select 0) == _k && {_l in (_x select 1)} };
	if (_i > -1) then { _left deleteAt _i } else { _extras pushBack _p };
} forEach _fitted;
[_left, _extras, _fitted apply { _x select 0 }, _fitted apply { _x select 1 }]
