#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX", "_sideX"];

private _threat = 0;
private _positionX = if (_markerX isEqualType []) then {_markerX} else {getMarkerPos _markerX};
_threat = _threat + 2 * ({
	(isOnRoad getMarkerPos _x) and (getMarkerPos _x distance _positionX < distanceSPWN)
} count roadblocksFIA + watchpostsFIA + aapostsFIA + atpostsFIA + hmgpostsFIA);

private _analyzed = nil;
{
if (getMarkerPos _x distance _positionX < distanceSPWN) then
	{
	_analyzed = _x;
	_garrison = garrison getVariable [_analyzed,[]];
	_threat = _threat + (floor((count _garrison)/8));
	_staticsX = staticsToSave select {_x inArea _analyzed};
	if (count _staticsX > 0) then
		{
		_threat = _threat + ({typeOf _x in FactionGet(reb,"staticMortars")} count _staticsX) + (2*({typeOf _x in FactionGet(reb,"staticAT")} count _staticsX))
		};
	};
} forEach ((markersX - citiesX - controlsX - watchpostsFIA - roadblocksFIA - aapostsFIA - atpostsFIA - hmgpostsFIA) select {sidesX getVariable [_x,sideUnknown] != _sideX});

_threat
