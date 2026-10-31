params ["_markerX"];

private ["_positionX","_mrkENY"];

private _isFrontier = false;
private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _mrkENY = (airportsX + outposts + seaports + milbases) select {sidesX getVariable [_x,sideUnknown] != _sideX};

if (_mrkENY isNotEqualTo []) then {
	private _positionX = getMarkerPos _markerX;
	_isFrontier = _mrkENY findIf {_positionX distance (getMarkerPos _x) < distanceSPWN} != -1;
};

_isFrontier
