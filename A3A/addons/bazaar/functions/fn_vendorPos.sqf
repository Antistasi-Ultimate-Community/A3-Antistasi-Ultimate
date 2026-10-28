// SERVER: a stall spot inside a town: a few metres from a random house,
// off the road, flat and clear. Falls back to a safe position near the
// centre. Returns posATL with z = 0.
params [["_center", [0,0,0], [[]]]];

private _houses = (nearestObjects [_center, ["House"], 200]) select { alive _x && {count (_x buildingPos -1) > 0} };
private _pos = [];
for "_i" from 1 to 30 do {
	private _base = if (_houses isEqualTo []) then { _center } else { getPosATL (selectRandom _houses) };
	private _try = _base getPos [4 + random 6, random 360];
	if (surfaceIsWater _try) then { continue };
	if (isOnRoad _try) then { continue };
	if ((_try isFlatEmpty [2, -1, 0.4, 3, 0, false, objNull]) isEqualTo []) then { continue };
	// nothing overhead: a spot under a roof is inside (or half inside) a building
	private _asl = AGLToASL [_try select 0, _try select 1, 0];
	if ((lineIntersectsSurfaces [_asl vectorAdd [0, 0, 15], _asl vectorAdd [0, 0, 0.5], objNull, objNull, true, 1, "GEOM", "NONE"]) isNotEqualTo []) then { continue };
	_pos = _try;
	break;
};
if (_pos isEqualTo []) then {
	_pos = [_center, 5, 150, 3, 0, 0.3, 0] call BIS_fnc_findSafePos;
};
[_pos select 0, _pos select 1, 0]
