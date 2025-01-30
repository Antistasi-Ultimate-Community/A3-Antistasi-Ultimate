/*
    Author:
        Wersal, MaxxLite
    
    Description:
        Finds the closest enemy town to a selected refrance unit/object
    
    Params:
        _markers <Array> <Default: []>
        _unit <Unit/Object> <Default: ObjNull>
    
    Usage:
        [_markers, _unit] call A3A_fnc_findIfNearAndHostile;
    
    Return:
        The closest enemy controlled marker
*/

params [  
  ["_markers", []],  
  ["_unit", ObjNull]  
]; 

private _referencePos = getPosWorld _unit; 
private _nearestMarkers = [allMapMarkers, _referencePos] call BIS_fnc_nearestPosition; 
_markers = _markers select {(getMarkerPos _x distance2D getMarkerPos _nearestMarkers < (distanceMission * 2)) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)}; 
_markers = [_markers,[],{_referencePos distanceSqr getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy; 
_nearestMarker = _markers select 0; 
_nearestMarker