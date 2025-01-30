/*
    Author:
        Wersal, MaxxLite
    
    Description:
        Finds the closest enemy controled zone/s to a selected refrance unit/object.
        if "_createList" is set to "true" func will return a list of the closest enemy markers from closest.
        if "_createList" is set to "false" func will return the nearst enemy marker.
    
    Params:
        _markers <Array> <Default: []>
        _unit <Unit/Object> <Default: ObjNull>
        _createList <Bool> <Default: true>
    
    Usage:
        [_markers, _unit, true] call A3A_fnc_findIfNearAndHostile;
    
    Return:
        The closest enemy controlled marker/s depends if true or false
*/

params [  
    ["_markers", []],
    ["_unit", ObjNull],
    ["_createList", true]
]; 

private _referencePos = getPosWorld _unit; 
private _nearestMarkers = [allMapMarkers, _referencePos] call BIS_fnc_nearestPosition; 
_markers = _markers select {(getMarkerPos _x distance2D getMarkerPos _nearestMarkers < (distanceMission * 2)) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)}; 
_markers = [_markers,[],{_referencePos distanceSqr getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy;

if (_createList) do {
    _nearestMarker = _markers select 0;
};

_nearestMarker