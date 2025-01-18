/*
    Author:
        Wersal, MaxxLite
    
    Description:
        Finds the closest enemy town to a selected refrance unit/object
    
    Params:
        _Markers <Array> <Default: "">
        _unit <unit/object> <Default: petros>
    
    Usage:
        [_Markers, _unit] call A3A_fnc_findIfNearAndHostile;
    
    Return:
        The closest enemy controlled marker
*/

params [  
  ["_Markers", ""],  
  ["_unit", petros]  
]; 

private _referencePos = getPosWorld _unit; 
private _nearestMarkers = [allMapMarkers, _referencePos] call BIS_fnc_nearestPosition; 
_Markers = _Markers select {(getMarkerPos _x distance2D getMarkerPos _nearestMarkers < (distanceMission * 2)) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)}; 
_Markers = [_Markers,[],{_referencePos distanceSqr getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy; 
_nearestMarker = _Markers select 0; 
_nearestMarker