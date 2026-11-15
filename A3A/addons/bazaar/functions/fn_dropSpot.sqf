// SERVER: where a trader sets a crate down - 5m out to his side, unless that
// lands in water or under a roof; then the stall spot itself.
// [entry] -> posATL
params [["_e", [], [[]]]];
private _drop = (_e select 2) getPos [5, (_e select 3) + 60];
private _dropAsl = AGLToASL [_drop select 0, _drop select 1, 0];
if (surfaceIsWater _drop || {(lineIntersectsSurfaces [_dropAsl vectorAdd [0, 0, 15], _dropAsl vectorAdd [0, 0, 0.3], objNull, objNull, true, 1, "GEOM", "NONE"]) isNotEqualTo []}) then {
	_drop = _e select 2;
};
_drop
