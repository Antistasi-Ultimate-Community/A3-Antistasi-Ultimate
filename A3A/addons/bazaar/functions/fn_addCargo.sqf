// Puts N of a classname into a container's cargo, by whatever the class is.
// [_container, _class, _qty]
params [["_box", objNull, [objNull]], ["_class", "", [""]], ["_qty", 1, [0]]];
if (isNull _box || {_class == ""} || {_qty <= 0}) exitWith {};

private _cw = configFile >> "CfgWeapons" >> _class;
switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _class)): { _box addMagazineCargoGlobal [_class, _qty] };
	case (isClass _cw && {(getNumber (_cw >> "type")) in [1, 2, 4, 4096]}): { _box addWeaponCargoGlobal [_class, _qty] };
	case (isClass (configFile >> "CfgVehicles" >> _class)): { _box addBackpackCargoGlobal [_class, _qty] };
	default { _box addItemCargoGlobal [_class, _qty] };
};
