// Client: takes N of a class off the player, wherever it is - held weapon,
// weapon attachment, spare magazine, item, assigned item, or worn gear.
// Containers (uniform, vest, backpack - worn, or a uniform/vest packed in
// another one) only go if they're EMPTY, so nothing inside is silently lost.
// Weapons: one stored in the uniform/vest/backpack is stripped by the trader
// (its extras go back into that container); one in the hands only goes bare,
// unloaded and complete (fn_handsCheck).
// Returns [how many were removed, rounds in each removed magazine,
// why a stored weapon couldn't be taken] (the rounds list is empty for
// anything that isn't a magazine).
params [["_c", "", [""]], ["_n", 1, [0]]];
if (!hasInterface || {_c == ""}) exitWith { [0, []] };

private _fnc_magRounds = { ((magazinesAmmo player) select { (_x select 0) == _c }) apply { _x select 1 } };
// a uniform or vest can also be PACKED (in the backpack or vest) with things
// in its pockets. removeItem picks a copy we can't choose, so a packed one
// only goes when every packed copy is empty; a worn empty one goes first.
private _isWear = (getNumber (configFile >> "CfgWeapons" >> _c >> "ItemInfo" >> "type")) in [701, 801];
private _fnc_packed = {
	private _all = [];
	{ if (!isNull _x) then { _all append ((everyContainer _x) select { (_x select 0) == _c }) } } forEach [uniformContainer player, vestContainer player, backpackContainer player];
	_all
};
private _fnc_isEmpty = {
	params ["_o"];
	(itemCargo _o + magazineCargo _o + weaponCargo _o + backpackCargo _o) isEqualTo []
};
private _done = 0;
private _rounds = [];
private _whyNot = "";
for "_i" from 1 to (_n max 1) do {
	private _ok = true;
	switch (true) do {
		// a weapon stored in the uniform/vest/backpack first (v1.1.1): the
		// trader strips it - fitted parts and the loaded magazine go back into
		// the same container (fn_weaponSplit / fn_cargoTakeWeapon)
		case ([_c] call ABZ_fnc_isWeaponType && {([_c] call ABZ_fnc_weaponStored) isNotEqualTo []}): {
			private _got = false;
			{
				_x params ["_box", "_entry", "_parts", "_mags"];
				_whyNot = [_box, _entry, _box, _parts, _mags] call ABZ_fnc_cargoTakeWeapon;
				if (_whyNot == "") exitWith { _got = true };
			} forEach ([_c] call ABZ_fnc_weaponStored);
			// none could be taken out - the one in the hands still can be
			if (!_got && {_c in [primaryWeapon player, secondaryWeapon player, handgunWeapon player, binocular player]} && {([_c] call ABZ_fnc_handsCheck) == ""}) then {
				player removeWeaponGlobal _c;
				_got = true;
				_whyNot = "";
			};
			if (!_got) then { _ok = false };
		};
		// one in the hands only as it comes - bare, unloaded, complete
		case (primaryWeapon player == _c);
		case (secondaryWeapon player == _c);
		case (handgunWeapon player == _c);
		case (binocular player == _c): {
			if (([_c] call ABZ_fnc_handsCheck) == "") then { player removeWeaponGlobal _c } else { _ok = false };
		};
		case (_c in primaryWeaponItems player): { player removePrimaryWeaponItem _c };
		case (_c in secondaryWeaponItems player): { player removeSecondaryWeaponItem _c };
		case (_c in handgunItems player): { player removeHandgunItem _c };
		case (_c in magazines player): {
			// which magazine went? compare the round counts before and after
			private _before = call _fnc_magRounds;
			player removeMagazine _c;
			{
				private _k = _before find _x;
				if (_k > -1) then { _before deleteAt _k };
			} forEach (call _fnc_magRounds);
			if (_before isEqualTo []) then { _ok = false } else { _rounds pushBack (_before select 0) };
		};
		case (_c in assignedItems player): {
			// unlinkItem moves it into the inventory - or deletes it when there's
			// no room. Only remove what actually arrived, never a spare copy.
			private _before = { _x == _c } count (items player);
			player unlinkItem _c;
			if (({ _x == _c } count (items player)) > _before) then { player removeItem _c };
		};
		case ([_c] call ABZ_fnc_isWeaponType): { _ok = false };	// weapons only from the hands or the kit's containers (above)
		case (_isWear): {
			switch (true) do {
				case (uniform player == _c && {(uniformItems player) isEqualTo []}): { removeUniform player };
				case (vest player == _c && {(vestItems player) isEqualTo []}): { removeVest player };
				default {
					private _packed = call _fnc_packed;
					if (_packed isNotEqualTo [] && {(_packed findIf { !([_x select 1] call _fnc_isEmpty) }) == -1}) then {
						private _before = { _x == _c } count (items player);
						player removeItem _c;
						if (({ _x == _c } count (items player)) >= _before) then { _ok = false };
					} else {
						_ok = false;	// worn and not empty, or packed with something in it
					};
				};
			};
		};
		case (_c in items player): {
			// count it only if one really left the inventory
			private _before = { _x == _c } count (items player);
			player removeItem _c;
			if (({ _x == _c } count (items player)) >= _before) then { _ok = false };
		};
		case (uniform player == _c): { if ((uniformItems player) isEqualTo []) then { removeUniform player } else { _ok = false } };
		case (vest player == _c): { if ((vestItems player) isEqualTo []) then { removeVest player } else { _ok = false } };
		case (backpack player == _c): { if ((backpackItems player) isEqualTo []) then { removeBackpackGlobal player } else { _ok = false } };
		case (headgear player == _c): { removeHeadgear player };
		case (goggles player == _c): { removeGoggles player };
		default { _ok = false };
	};
	if (!_ok) exitWith {};
	_done = _done + 1;
};
[_done, _rounds, _whyNot]
