// SERVER: a full scan of everything loaded - infantry weapons, the magazines
// those weapons actually take, throwables/explosives, items, clothing and
// backpacks. Used outside Antistasi, or when "Stock source" says so.
private _out = [];
private _mags = createHashMap;	// magazines some listed weapon can take

private _fnc_wellMags = {
	params ["_well"];
	private _cfg = configFile >> "CfgMagazineWells" >> _well;
	if (!isClass _cfg) exitWith { [] };
	private _m = [];
	{ _m append (getArray _x) } forEach (configProperties [_cfg, "isArray _x", true]);
	_m
};
private _fnc_weaponMags = {
	params ["_cfg"];
	private _m = +(getArray (_cfg >> "magazines"));
	{ _m append ([_x] call _fnc_wellMags) } forEach (getArray (_cfg >> "magazineWell"));
	{
		if (_x != "this") then {
			private _mz = _cfg >> _x;
			if (isClass _mz) then {
				_m append (getArray (_mz >> "magazines"));
				{ _m append ([_x] call _fnc_wellMags) } forEach (getArray (_mz >> "magazineWell"));
			};
		};
	} forEach (getArray (_cfg >> "muzzles"));
	_m
};

{
	private _cfg = _x;
	private _class = configName _cfg;
	private _type = getNumber (_cfg >> "type");
	if (_type in [1, 2, 4]) then {
		// infantry weapon: the base entry only (fn_buildPool folds stacks anyway)
		private _base = getText (_cfg >> "baseWeapon");
		if (_base != "" && {_base != _class}) then { continue };
		_out pushBack _class;
		{ _mags set [_x, true] } forEach ([_cfg] call _fnc_weaponMags);
	} else {
		if (_type in [131072, 4096]) then { _out pushBack _class };	// items, binoculars, NVGs
	};
} forEach ("getNumber (_x >> 'scope') == 2 && {getText (_x >> 'displayName') != ''}" configClasses (configFile >> "CfgWeapons"));

// magazines a listed infantry weapon takes, plus throwables and charges
{
	private _class = configName _x;
	private _type = getNumber (_x >> "type");
	if ((_class in _mags) || {_type in [256, 512] && {getNumber (_x >> "count") == 1}}) then {	// never a count-0 dummy magazine
		_out pushBack _class;
	};
} forEach ("getNumber (_x >> 'scope') == 2 && {getText (_x >> 'displayName') != ''}" configClasses (configFile >> "CfgMagazines"));

{
	_out pushBack configName _x;
} forEach ("getNumber (_x >> 'scope') == 2 && {(configName _x) isKindOf 'Bag_Base'}" configClasses (configFile >> "CfgVehicles"));

{
	_out pushBack configName _x;
} forEach ("getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgGlasses"));

_out
