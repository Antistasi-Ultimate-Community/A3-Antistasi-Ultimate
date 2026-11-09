// SERVER: hands items back into a vehicle or crate (a refused or partly
// refused sale from "SELL from vehicle / crate", v1.1.1) - exactly what was
// taken: magazines with their rounds. If the container is gone, they go to
// the player's kit instead (fn_receiveItems).
// [container, class, qty, rounds per magazine, player]
params [["_box", objNull, [objNull]], ["_c", "", [""]], ["_n", 0, [0]], ["_rounds", [], [[]]], ["_player", objNull, [objNull]]];
if (_c == "" || {_n <= 0}) exitWith {};
if (isNull _box || {!alive _box}) exitWith {
	if (!isNull _player) then { ["ABZ_give", [_c, _n, _rounds], _player] call CBA_fnc_targetEvent };
};
switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _c)): {
		for "_i" from 1 to _n do {
			private _r = _rounds param [_i - 1, -1];
			if (_r isEqualType 0 && {_r >= 0}) then { _box addMagazineAmmoCargo [_c, 1, _r] } else { _box addMagazineCargoGlobal [_c, 1] };
		};
	};
	case ([_c] call ABZ_fnc_isWeaponType): { _box addWeaponCargoGlobal [_c, _n] };
	case (isClass (configFile >> "CfgVehicles" >> _c)): { _box addBackpackCargoGlobal [_c, _n] };
	default { _box addItemCargoGlobal [_c, _n] };
};
