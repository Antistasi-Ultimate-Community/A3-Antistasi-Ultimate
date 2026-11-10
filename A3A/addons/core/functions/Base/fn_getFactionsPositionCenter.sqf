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
private _occupantStrongpoints = [];
private _invaderMarkers = [];
private _invaderStrongpoints = [];
private _rebelMarkers = [];
private _rebelStrongpoints = [];

markersX apply { switch (sidesX getVariable _x) do {
    case Occupants: { _occupantMarkers pushBack markerPos _x; if (_x in (airportsX + milbases)) then {_occupantStrongpoints pushBack markerPos _x} };
    case Invaders: { _invaderMarkers pushBack markerPos _x; if (_x in (airportsX + milbases)) then {_invaderStrongpoints pushBack markerPos _x} };
    case teamPlayer: { _rebelMarkers pushBack markerPos _x; if (_x in (airportsX + milbases)) then {_rebelStrongpoints pushBack markerPos _x} };
}};

private _fnc_getAvgPosition = {
    params ["_positionsArray"];
    
    private _avgPosition = [0,0,0];
    { _avgPosition = _avgPosition vectorAdd _x } forEach _positionsArray;
    _avgPosition vectorMultiply (1 / (count _positionsArray));
};

// Calculate center position on map for each faction based on the markers / zones they control
// The center is slightly skewed towards strongpoints (milbases / airports), if the faction controls any,
//   by averaging the center position of all faction-controlled markers with the center position of all faction-controlled strongpoints
private _occupantsAvgPosition = if (areOccupantsDefeated || {_occupantMarkers isEqualTo []}) then { [0,0,0] } else {
    private _allMarkersAvgPosition = [_occupantMarkers] call _fnc_getAvgPosition;
    if (_occupantStrongpoints isEqualTo []) then { _allMarkersAvgPosition } else {
        (_allMarkersAvgPosition vectorAdd ([_occupantStrongpoints] call _fnc_getAvgPosition)) vectorMultiply 0.5;
    };
};
private _invadersAvgPosition = if (areInvadersDefeated || {_invaderMarkers isEqualTo []}) then { [0,0,0] } else {
    private _allMarkersAvgPosition = [_invaderMarkers] call _fnc_getAvgPosition;
    if (_invaderStrongpoints isEqualTo []) then { _allMarkersAvgPosition } else {
        (_allMarkersAvgPosition vectorAdd ([_invaderStrongpoints] call _fnc_getAvgPosition)) vectorMultiply 0.5;
    };
};
private _rebelsAvgPosition = if (_rebelMarkers isEqualTo []) then { [0,0,0] } else {
    private _allMarkersAvgPosition = [_rebelMarkers] call _fnc_getAvgPosition;
    if (_rebelStrongpoints isEqualTo []) then { _allMarkersAvgPosition } else {
        (_allMarkersAvgPosition vectorAdd ([_rebelStrongpoints] call _fnc_getAvgPosition)) vectorMultiply 0.5;
    };
};

[count _occupantMarkers, _occupantsAvgPosition, count _invaderMarkers, _invadersAvgPosition, count _rebelMarkers, _rebelsAvgPosition];
