params ["_markerX"];

private _size = markerSize _markerX;

if (markerShape _markerX == "RECTANGLE") then {
	_size = vectorMagnitude _size;
} else {
	_size = selectMax _size;
};

_size
