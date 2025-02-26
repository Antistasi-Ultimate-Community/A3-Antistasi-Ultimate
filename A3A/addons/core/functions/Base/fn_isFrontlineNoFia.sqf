params ["_markerX"];
private ["_positionX","_mrkENY"];
private _isFrontier = false;
private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _sideOpposite = objNull;
if (_sideX == Occupants) then {
	_sideOpposite = Invaders;
} else {
	_sideOpposite = Occupants;
};
private _mrkENY = (airportsX + milbases + outposts + seaports + factories + resourcesX) select {sidesX getVariable [_x,sideUnknown] == _sideOpposite}; /// != teamPlayer debetable
if (count _mrkENY > 0) then {
	private _positionX = getMarkerPos _markerX;
	_isFrontier = _mrkENY findIf {_positionX distance (getMarkerPos _x) < distanceSPWN*2} != -1;
};
_isFrontier
