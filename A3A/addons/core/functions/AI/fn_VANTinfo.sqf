params ["_veh", "_markerX", "_sideX"];


private _positionX = getMarkerPos _markerX;
private _enemiesS = [Invaders, Occupants] select (_sideX == Invaders);
private ["_groups","_knownX","_groupX"];

while {alive _veh} do {
	_knownX = [];
	_groups = [];
	_enemiesX = [distanceSPWN,0,_positionX,_sideX] call A3A_fnc_distanceUnits;
	sleep 60;
	_groups = allGroups select {(leader _x in _enemiesX) and ((vehicle leader _x) != (leader _x))};
	_knownX = allUnits select {((side _x == teamPlayer) or (side _x == _enemiesS)) and (alive _x) and (_x distance _positionX < 500)};
	{
		_groupX = _x;
		{
		_groupX reveal [_x,1.4];
		} forEach _knownX;
	} forEach _groups;
};
