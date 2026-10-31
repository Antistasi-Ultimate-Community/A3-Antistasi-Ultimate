params ["_unit", "_markerX"];

if !([_unit] call A3A_fnc_canFight) exitWith {false};
if (vehicle _unit isKindOf "Air") exitWith {false};

private _size = [_markerX] call A3A_fnc_sizeMarker;
private _positionX = getMarkerPos _markerX;

if (_unit distance2D _positionX > (_size * 1.5)) exitWith {false};

true
