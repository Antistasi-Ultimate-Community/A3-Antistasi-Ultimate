private _className = param [0];
private _config = configFile >> "cfgVehicles" >> _className;
private _ii = 0;

private _found = getArray(_config >> "weapons");
private _turrets = "true" configClasses (_config >> "Turrets");
{
	private _turret = _x;
	private _weapons = getArray(_turret >> "weapons");

	{
		_found pushBack _x;
	} foreach _weapons;

} foreach _turrets;

private _hasPylons = isClass(_config >> "Components") && {
	isClass(_config >> "Components" >> "TransportPylonsComponent")
} && {
	isClass(_config >> "Components" >> "TransportPylonsComponent" >> "pylons")
};

if (_hasPylons) then {
	private _pylons = "true" configClasses (_config >> "Components" >> "TransportPylonsComponent" >> "pylons");
	{
		private _pylon = _x;

		if (isText(_pylon >> "attachment")) then {
			private _attachment = getText(_pylon >> "attachment");
			private _mag = configFile >> "cfgMagazines" >> _attachment;

			if (isClass(_mag) && { isText(_mag >> "pylonWeapon") }) then {
				_found pushBack getText(_mag >> "pylonWeapon");
			};
		};
	} foreach _pylons;
};

/* _found = _found select {
	([configFile >> "cfgWeapons" >> _x, true] call A3A_fnc_isUsableWeapon)
		&& { _x != "FakeWeapon" && _x != "rhs_weap_CMDispenser_ASO2" }
	}; */

_found;