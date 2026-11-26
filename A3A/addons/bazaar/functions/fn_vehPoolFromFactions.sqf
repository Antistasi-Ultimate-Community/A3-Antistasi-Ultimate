// SERVER: the military vehicles traders can get hold of - the ENEMY
// factions' own vehicle lists (occupants, invaders, rivals), so whatever
// you are fighting is what turns up "stolen" at the Bazaar.
// Entries: [class, category, source side variable name]
// Categories match Antistasi Ultimate's own black market so the facility
// requirements line up with it (see fn_vehReq).

// category -> template keys. Order inside a category does not matter; a
// class found under several categories keeps the heaviest one (rank).
private _map = [
	["UNARMEDCAR", 0, ["vehiclesLightUnarmed", "vehiclesTrucks", "vehiclesCargoTrucks", "vehiclesMilitiaCars", "vehiclesMilitiaTrucks", "vehiclesMedical", "vehiclesRivalsCars", "vehiclesRivalsTrucks"]],
	["ARMEDCAR", 1, ["vehiclesLightArmed", "vehiclesMilitiaLightArmed", "vehiclesRivalsLightArmed"]],
	["BOAT", 1, ["vehiclesTransportBoats", "vehiclesGunBoats"]],
	["HELI", 2, ["vehiclesHelisLight", "vehiclesHelisTransport", "vehiclesHelisLightAttack", "vehiclesHelisAttack", "vehiclesAirPatrol", "vehiclesRivalsHelis"]],
	["APC", 2, ["vehiclesLightAPCs", "vehiclesAPCs", "vehiclesAirborne", "vehiclesIFVs", "vehiclesMilitiaAPCs", "vehiclesRivalsAPCs"]],
	["AA", 3, ["vehiclesAA"]],
	["TANK", 3, ["vehiclesLightTanks", "vehiclesTanks", "vehiclesRivalsTanks"]]
];

private _found = createHashMap;	// class -> [category, rank, side var]
private _skipped = 0;
{
	_x params ["_fkey", "_sideVar"];
	// only factions actually in this campaign: Antistasi always LOADS rivals
	// and invaders, even with rivals switched off or in the government-only
	// game mode (3)
	if (_fkey == "riv" && {!(missionNamespace getVariable ["areRivalsEnabled", true]) || {missionNamespace getVariable ["areRivalsDefeated", false]}}) then { continue };
	if (_fkey == "inv" && {(missionNamespace getVariable ["gameMode", 1]) == 3}) then { continue };
	private _fac = missionNamespace getVariable ["A3A_faction_" + _fkey, nil];
	if (isNil "_fac" || {!(_fac isEqualType createHashMap)}) then { continue };
	{
		_x params ["_cat", "_rank", "_keys"];
		{
			private _list = _fac getOrDefault [_x, []];
			if (_list isEqualType "") then { _list = [_list] };
			if !(_list isEqualType []) then { continue };
			{
				private _c = _x;
				if !(_c isEqualType "") then { continue };
				if !([_c] call ABZ_fnc_vehValid) then { _skipped = _skipped + 1; continue };
				private _prev = _found getOrDefault [_c, []];
				if (_prev isEqualTo [] || {(_prev select 1) < _rank}) then {
					_found set [_c, [_cat, _rank, _sideVar]];
				};
			} forEach _list;
		} forEach _keys;
	} forEach _map;
} forEach [["occ", "Occupants"], ["inv", "Invaders"], ["riv", "Invaders"]];

private _rows = [];
{ _rows pushBack [_x, _y select 0, _y select 2] } forEach _found;
[_rows, _skipped]
