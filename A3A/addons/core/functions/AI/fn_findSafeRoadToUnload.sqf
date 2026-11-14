params ["_destinationX", "_originX", "_safe", "_blacklist"];

if (count _blackList == 0) then {_blackList = [[0,0,0]]};
private _radiusX = [400, 50] select (_safe);
private _dif = (_destinationX select 2) - (_originX select 2);

if (_dif > 0) then {
	_radiusX = _radiusX + (_dif * 2);
};

private _roads = [];
private _roadsTmp = nil;
private _road = nil;
private _ok = nil;
while {_roads isEqualTo []} do {
	_roadsTmp = (_destinationX nearRoads _radiusX) select {surfaceType (position _x) != "#GdtForest" && {surfaceType (position _x)!= "#GdtRock" && {surfaceType (position _x)!= "#GdtGrassTall"}}};
	{
		_road = _x;
		_ok = true;
		{
			if (position _road distance2D _x < 150) exitWith {_ok = false};
		} forEach _blacklist;
		if (_ok) then {_roads pushBack _road};
	} forEach _roadsTmp;
	_radiusX = _radiusX + 50;
};

if (!_safe) then {
	_roads = [_roads,[],{_originX distance _x},"ASCEND"] call BIS_fnc_sortBy;
} else {
	_roads = [_roads,[],{_destinationX distance _x},"DESCEND"] call BIS_fnc_sortBy;
};

private _result = position (_roads select 0);

_result
