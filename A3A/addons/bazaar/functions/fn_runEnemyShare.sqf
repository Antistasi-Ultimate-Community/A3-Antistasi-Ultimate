// SERVER: how much enemy ground the straight line between two points
// crosses, 0..1. Samples the line every 250m (at most 40 samples); a sample counts as enemy when
// the nearest Antistasi zone (markersX: towns, outposts, bases, roadblocks)
// is held by the Occupants or Invaders. Outside Antistasi: 0.5.
params [["_a", [0, 0, 0], [[]]], ["_b", [0, 0, 0], [[]]]];
if !(call ABZ_fnc_isAntistasi) exitWith { 0.5 };
private _marks = missionNamespace getVariable ["markersX", []];
if (!(_marks isEqualType []) || {_marks isEqualTo []} || {isNil "sidesX"}) exitWith { 0.5 };
private _enemy = call ABZ_fnc_enemySides;
private _pts = _marks apply { getMarkerPos _x };
private _n = (1 max ceil ((_a distance2D _b) / 250)) min 40;	// every 250m, at most 40 samples
private _hits = 0;
for "_i" from 0 to _n do {
	private _p = _a vectorAdd ((_b vectorDiff _a) vectorMultiply (_i / _n));
	private _best = -1;
	private _bestD = 1e9;
	{
		private _d = _x distance2D _p;
		if (_d < _bestD) then { _bestD = _d; _best = _forEachIndex };
	} forEach _pts;
	if (_best > -1 && {(sidesX getVariable [_marks select _best, sideUnknown]) in _enemy}) then { _hits = _hits + 1 };
};
_hits / (_n + 1)
