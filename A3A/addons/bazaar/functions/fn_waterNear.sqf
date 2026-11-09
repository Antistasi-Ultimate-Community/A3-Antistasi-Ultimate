// Nearest boat-deep water to a position, searched in 50m rings, or [].
// Used to decide whether a trader can offer boats at all (rolled only for
// stalls within ABZ_boatRange of water) and where a bought boat is moored.
params [["_pos", [0, 0, 0], [[]]], ["_max", 450, [0]]];
private _found = [];
for "_r" from 50 to _max step 50 do {
	for "_a" from 0 to 330 step 30 do {
		private _p = _pos getPos [_r, _a];
		if (surfaceIsWater _p && {(getTerrainHeightASL _p) < -2.5}) exitWith { _found = [_p select 0, _p select 1, 0] };
	};
	if (_found isNotEqualTo []) exitWith {};
};
_found
