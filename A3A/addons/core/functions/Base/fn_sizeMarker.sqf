params ["_markerX"];

private _size = markerSize _markerX;

if (markerShape _markerX == "RECTANGLE") then {
	private _base = _size select 0;
	private _height = _size select 1;
	_size = (_base^2 + _height^2)^0.5
} else {
	_size = selectMax _size
};

_size