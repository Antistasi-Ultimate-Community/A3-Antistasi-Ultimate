params ["_pos"];

private _badSurfaces = ["#GdtForest", "#GdtRock", "#GdtGrassTall"];
private _radiusX = 10;
private _road = objNull;

while {isNull _road} do
{
	private _nearRoads = _pos nearRoads _radiusX;
	{
		private _surfType = surfaceType (position _x);
		if (!(_surfType in _badSurfaces) && { roadsConnectedTo _x isNotEqualTo [] }) exitWith {_road = _x};
	} forEach _nearRoads;
	_radiusX = _radiusX + 10;
};
_road;
