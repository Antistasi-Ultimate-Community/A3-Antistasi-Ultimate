// SERVER: the most Antistasi pays back for this class - the larger of
//   - selling it at HQ (a mirror of A3A_fnc_sellVehicle's price table), and
//   - selling it from the HQ garage (A3A_fnc_getVehicleSellPrice =
//     vehiclePrice / 2; for an enemy class that is its black-market price
//     / 2, or 1000 / 2 when Antistasi has no price for it at all).
// The Bazaar never sells a vehicle for less than 1.5x this, so buying here
// and selling to Antistasi can never be a money machine.
params [["_class", "", [""]]];

// garage sale, computed without calling A3A_fnc_vehiclePrice (which logs
// errors for classes it has no price for)
private _garage = 500;
private _stock = missionNamespace getVariable ["A3U_blackMarketStock", nil];
if (!isNil "_stock" && {_stock isEqualType createHashMap} && {!isNil "A3U_fnc_blackMarketVehiclePrice"}) then {
	private _listed = false;
	{ if (_y isEqualType createHashMap && {_class in _y}) exitWith { _listed = true } } forEach _stock;
	if (_listed) then { _garage = _garage max (([_class] call A3U_fnc_blackMarketVehiclePrice) / 2) };
};
private _srv = missionNamespace getVariable ["server", objNull];
if (!isNull _srv) then {
	private _rc = _srv getVariable [_class, 0];
	if (_rc isEqualType 0 && {_rc > 0}) then { _garage = _garage max (_rc / 2) };
};

(call {
private _all = missionNamespace getVariable ["A3A_faction_all", createHashMap];
private _occ = missionNamespace getVariable ["A3A_faction_occ", createHashMap];
private _inv = missionNamespace getVariable ["A3A_faction_inv", createHashMap];
if !(_all isEqualType createHashMap) exitWith { 0 };

private _fnc_in = {
	params ["_maps", "_keys"];
	private _hit = false;
	{
		private _m = _x;
		if (_m isEqualType createHashMap) then {
			{
				private _v = _m getOrDefault [_x, []];
				if (_v isEqualType [] && {_class in _v}) exitWith { _hit = true };
			} forEach _keys;
		};
		if (_hit) exitWith {};
	} forEach _maps;
	_hit
};

private _reb = _all getOrDefault ["vehiclesReb", []];
if (_reb isEqualType [] && {_class in _reb} && {!isNil "A3A_fnc_vehiclePrice"}) exitWith {
	([_class] call A3A_fnc_vehiclePrice) / 2
};
switch (true) do {
	case ([[_all], ["vehiclesLight"]] call _fnc_in): { 750 };
	case ([[_occ, _inv], ["vehiclesTrucks", "vehiclesCargoTrucks", "vehiclesMilitiaTrucks"]] call _fnc_in): { 750 };
	case ([[_all], ["vehiclesBoats", "vehiclesLightAPCs"]] call _fnc_in): { 1500 };
	case ([[_occ, _inv], ["vehiclesMedical"]] call _fnc_in): { 1500 };
	case ([[_all], ["vehiclesHelisLight"]] call _fnc_in): { 3000 };
	case ([[_all], ["vehiclesAPCs", "vehiclesIFVs", "vehiclesHelisLightAttack", "vehiclesTransportAir"]] call _fnc_in): { 2500 };
	case ([[_all], ["vehiclesLightTanks"]] call _fnc_in): { 3500 };
	case ([[_all], ["vehiclesHelisAttack", "vehiclesTanks", "vehiclesAA", "vehiclesArtillery"]] call _fnc_in): { 6500 };
	default { 0 };
}
}) max _garage
