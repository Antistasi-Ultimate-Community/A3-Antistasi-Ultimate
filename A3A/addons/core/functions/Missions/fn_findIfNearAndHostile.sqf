/*
    Author:
        Wersal, MaxxLite
    
    Description:
        makes a distance sorted array from all near enemy held terretory from a provided array of markers
    
    Params:
        single array of markers, do 'array + array' for multiple.
    
    Usage:
        [_Markers, _unit] call A3A_fnc_findIfNearAndHostile;
    
    Return:
        array of markers within max mission distance and is not rebel.
        from closest to furthest.
*/
params [ 
  ["_Markers", ""], 
  ["_unit", petros] 
];

private _referencePos = getPosWorld _unit;
private _nearestMarker = [allMapMarkers, _referencePos] call BIS_fnc_nearestPosition;
_Markers = _Markers select {(getMarkerPos _x distance2D getMarkerPos _nearestMarker < distanceMission) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
_Markers = [_Markers,[],{_referencePos distanceSqr getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy;
_Markers