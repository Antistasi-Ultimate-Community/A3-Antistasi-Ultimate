params ["_origin"];

private _originPos = getMarkerPos _origin;

private _areas = (outposts + seaports + milbases + airportsX + factories + resourcesX); // + citiesX?
private _friendlyAreasAI = (watchpostsFIA + roadblocksFIA + hmgPostsFIA + aaPostsFIA + atPostsFIA);
private _friendlyAreasOwned = (_areas select {sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer});
private _friendlyAreas = (_friendlyAreasAI + _friendlyAreasOwned);

if (!isNil "traderMarker") then {_friendlyAreas pushBack traderMarker};

_friendlyAreas deleteAt (_friendlyAreas find _origin); // Just incase to prevent stupidity

private _destinationAreas = _friendlyAreas select {((getMarkerPos _x) distance2D _originPos) <= distanceMission};
if (_destinationAreas isEqualTo []) then {_destinationAreas = _friendlyAreas};

if (_destinationAreas isEqualTo []) exitWith {}; // Text in chat explaining you're an idiot if there is SOMEHOW still no options
private _destination = selectRandom _destinationAreas;

[[_origin, _destination], "A3A_fnc_LOG_Delivery"] remoteExec ["A3A_fnc_scheduler", 2];

// private _markerSide = sidesX getVariable [_marker, sideUnknown];