// SERVER: picks a town for a new trader -> [townName, centerPos] or [].
// Antistasi: from the mission's own town list, weighted toward towns with
// rebel support (and rebel-held towns), never within 500m of an enemy base,
// never one that already has a trader. Outside Antistasi: any named
// town/village on the map.
params [["_exclude", [], [[]]]];

private _cands = [];
if (call ABZ_fnc_isAntistasi) then {
	private _bases = [];
	{
		if (!isNil _x) then { _bases append (missionNamespace getVariable [_x, []]) };
	} forEach ["airportsX", "milbases", "outposts", "seaports"];
	_bases = _bases select { (sidesX getVariable [_x, sideUnknown]) != teamPlayer };
	private _town = missionNamespace getVariable ["A3A_townData", createHashMap];
	if !(_town isEqualType createHashMap) then { _town = createHashMap };
	{
		private _mrk = _x;
		private _pos = getMarkerPos _mrk;
		if (_pos isEqualTo [0,0,0]) then { continue };
		if ((_bases findIf { _pos distance2D (getMarkerPos _x) < 500 }) > -1) then { continue };
		private _w = 1;
		private _d = _town getOrDefault [_mrk, []];
		if (_d isEqualType [] && {count _d >= 4}) then { _w = 1 + ((_d select 3) / 25) };	// [civs, vehs, supportGov, supportReb]
		if ((sidesX getVariable [_mrk, sideUnknown]) == teamPlayer) then { _w = _w + 1 };
		_cands pushBack [[_pos] call ABZ_fnc_townName, _pos, _w];
	} forEach citiesX;
} else {
	{
		_cands pushBack [text _x, getPos _x, 1];
	} forEach (nearestLocations [[worldSize / 2, worldSize / 2, 0], ["NameCityCapital", "NameCity", "NameVillage"], worldSize]);
};

// one trader per town, and never straight back to the town they just left
_cands = _cands select {
	private _p = _x select 1;
	((ABZ_vendors findIf { (_x select 11) distance2D _p < 600 }) == -1)
	&& {_exclude isEqualTo [] || {_exclude distance2D _p > 600}}
};
if (_cands isEqualTo []) exitWith { [] };

private _pick = _cands selectRandomWeighted (_cands apply { _x select 2 });
[_pick select 0, _pick select 1]
