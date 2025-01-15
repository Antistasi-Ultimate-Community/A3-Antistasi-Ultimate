/*
    Author:
        Wersal
    
    Description:
        Does X
    
    Params:
        single array of markers, do 'array + array' for multiple.
    
    Usage:
        [_Markers] call A3A_fnc_findIfNearAndHostile;
    
    Return:
        array of markers within max mission distance and is not rebel.
*/
params ["_Markers"];
_Markers = _Markers select {(getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer < distanceMission) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
_Markers
