params ["_markersX", "_positionX"];

private _array = (_markersX - controlsX) select {getMarkerPos _x distance2D _positionX < distanceForLandAttack};
private _destinationsX = [];

//Spawn patrols if we've nearby fast travel points if we're in singleplayer, otherwise use nearby players.
private _isValidDestination = { playableUnits findIf {(side (group _x) == teamPlayer) and (_x distance2D _this < 2000)} != -1 };

{
	private _destinationX = _x;
	private _pos = getMarkerPos _destinationX;
	if (_pos call _isValidDestination) then {_destinationsX pushBack _destinationX};
} forEach _array;

_destinationsX
