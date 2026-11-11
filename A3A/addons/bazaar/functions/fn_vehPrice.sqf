// SERVER: price of a military vehicle at the Bazaar.
// Base, in order of preference:
//   1. Antistasi Ultimate's own black-market price for that class (with the
//      mission's black-market discount and seaport/resource reductions)
//   2. Antistasi's resource cost for the class x 220 - lands in the same
//      range as black-market prices for comparable vehicles
//   3. a per-category default
// Then x "Vehicle price" x "Price multiplier", rounded to $50, and never
// below 1.5x what Antistasi pays back for it at HQ (fn_vehResale).
params [["_class", "", [""]], ["_cat", "", [""]]];

private _base = 0;
private _stock = missionNamespace getVariable ["A3U_blackMarketStock", nil];
if (!isNil "_stock" && {_stock isEqualType createHashMap} && {!isNil "A3U_fnc_blackMarketVehiclePrice"}) then {
	private _listed = false;
	{ if (_y isEqualType createHashMap && {_class in _y}) exitWith { _listed = true } } forEach _stock;
	if (_listed) then { _base = [_class] call A3U_fnc_blackMarketVehiclePrice };
};
if (!(_base isEqualType 0) || {_base <= 0}) then {
	_base = 0;
	private _rc = missionNamespace getVariable ["A3A_vehicleResourceCosts", createHashMap];
	if (_rc isEqualType createHashMap) then {
		private _v = _rc getOrDefault [_class, 0];
		if (_v isEqualType 0 && {_v > 0}) then { _base = _v * 220 };
	};
};
if (_base <= 0) then {
	_base = switch (_cat) do {
		case "UNARMEDCAR": { 3000 };
		case "ARMEDCAR": { 9000 };
		case "BOAT": { 6000 };
		case "APC": { 25000 };
		case "HELI": { 20000 };
		case "AA": { 40000 };
		case "TANK": { 60000 };
		default { 10000 };
	};
};

private _p = _base * (missionNamespace getVariable ["ABZ_vehMarkup", 1]) * (missionNamespace getVariable ["ABZ_priceMultiplier", 1]);
_p = _p max (1.5 * ([_class] call ABZ_fnc_vehResale));
50 * (ceil (_p / 50))
