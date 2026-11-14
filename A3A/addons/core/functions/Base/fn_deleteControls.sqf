params ["_markerX", "_control"];

private _pos = getMarkerPos _control;
private _nearX = [(markersX - controlsX),_pos] call BIS_fnc_nearestPosition;

if (_nearX isEqualTo _markerX) then {
	waitUntil {sleep 1;(spawner getVariable _control == 2)};
	_sideX = sidesX getVariable [_markerX,sideUnknown];
	sidesX setVariable [_control,_sideX,true];
};
