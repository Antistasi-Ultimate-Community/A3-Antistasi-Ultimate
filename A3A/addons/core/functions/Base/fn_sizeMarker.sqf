params ["_markerX"];

private _size = markerSize _markerX;

if (markerShape _markerX == "RECTANGLE") then {
	private _base = _size select 0;
	private _height = _size select 1;
	_size = sqrt(_base*_base + _height*_height);
} else {
	_size = selectMax _size;
};

_size