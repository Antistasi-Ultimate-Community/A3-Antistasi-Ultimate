params ["_origin"];

private _originPos = getMarkerPos _origin;

private _areas = (outposts + seaports + milbases + airportsX + factories + resourcesX); // + citiesX?
private _friendlyAreasAI = (watchpostsFIA + roadblocksFIA + hmgPostsFIA + aaPostsFIA + atPostsFIA);
private _friendlyAreasOwned = (_areas select {sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer});
private _friendlyAreas = (_friendlyAreasAI + _friendlyAreasOwned);

if (!isNil "traderMarker") then {_friendlyAreas pushBack traderMarker};

private _destinationAreas = _friendlyAreas select {(_x distance2D _originPos) <= distanceMission};
if (_destinationAreas isEqualTo []) then {_destinationAreas = _friendlyAreas};

private _destination = selectRandom _destinationAreas;

[[_origin, _destination], "A3A_fnc_LOG_Delivery"] remoteExec ["A3A_fnc_scheduler", 2];

// private _markerSide = sidesX getVariable [_marker, sideUnknown];