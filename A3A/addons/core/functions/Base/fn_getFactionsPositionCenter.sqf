/*
    Author:
        Creep'nCrunch / jwoodruff40
    
    Description:
        Calculates the average position (center-ish) of each faction's controlled markers / territory
        Most accurate when factions control a contiguous area of markers / territory
    
    Params:
        None
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [] call A3A_fnc_getFactionsPositionCenter;
    
    Return:
        Array containing the count and average position of each faction's markers
        [ _occupantsCount, _occupantsAvgPosition, _invadersCount, _invadersAvgPosition, _rebelsCount, _rebelsAvgPosition ] <TYPE> Array
*/

private _occupantMarkers = [];
private _invaderMarkers = [];
private _rebelMarkers = [];

markersX apply { switch (sidesX getVariable _x) do {
    case Occupants: { _occupantMarkers pushBack markerPos _x };
    case Invaders: { _invaderMarkers pushBack markerPos _x };
    case teamPlayer: { _rebelMarkers pushBack markerPos _x };
}};

private _fnc_getAvgPosition = {
    params ["_positionsArray"];
    
    private _avgPosition = [0,0,0];
    { _avgPosition = _avgPosition vectorAdd _x } forEach _positionsArray;
    _avgPosition vectorMultiply (1 / (count _positionsArray));
};

private _occupantsAvgPosition = if (!areOccupantsDefeated && {_occupantMarkers isNotEqualTo []}) then { [_occupantMarkers] call _fnc_getAvgPosition } else { [0,0,0] };
private _invadersAvgPosition = if (!areInvadersDefeated && {_invaderMarkers isNotEqualTo []}) then { [_invaderMarkers] call _fnc_getAvgPosition } else { [0,0,0] };
private _rebelsAvgPosition = [_rebelMarkers] call _fnc_getAvgPosition;

[count _occupantMarkers, _occupantsAvgPosition, count _invaderMarkers, _invadersAvgPosition, count _rebelMarkers, _rebelsAvgPosition];
