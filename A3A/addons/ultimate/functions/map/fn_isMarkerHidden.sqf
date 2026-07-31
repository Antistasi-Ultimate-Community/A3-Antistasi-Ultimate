/*
    Author:
        Silence
    
    Description:
        Checks if marker is hidden or not
    
    Params:
        _marker <STRING> <Default: "">
    
    Dependencies:
        citiesX, airportsX, milAdministrationsX, sidesX, revealedZones, hideEnemyMarkers
    
    Scope:
        Anywhere
    
    Environment:
        Unscheduled
    
    Usage:
        [_marker] call A3U_fnc_isMarkerHidden;
    
    Return:
        true/false <BOOL>
*/

params [["_marker", ""]];

if (_marker == "") exitWith {false};
if !(_marker isEqualType "") exitWith {false};
if (isNil "hideEnemyMarkers") exitWith {false};
if (isNil "revealedZones") exitWith {false};
if (isNil "markersImmune") exitWith {false};

private _markerSide = sidesX getVariable [_marker, sideUnknown];

if (_markerSide isEqualTo sideUnknown && {_marker in mrkAntennas}) then {
    private _mainMarkers = (resourcesX + airportsX + factories + outposts + seaports + milbases) - controlsX;
    private _nearestTerritory = [_mainMarkers, getMarkerPos _marker] call BIS_fnc_nearestPosition;
    _markerSide = sidesX getVariable [_nearestTerritory, sideUnknown];
};

if (!hideEnemyMarkers) exitWith {false};
if (_marker in revealedZones) exitWith {false};
if (_marker in markersImmune) exitWith {false};

// Replaced flatten[] operation
if (_marker in citiesX || {_marker in airportsX} || {_marker in milAdministrationsX}) exitWith {false};

if (!isNil "traderMarker" && {_marker == traderMarker}) exitWith {false};

// Hide it if it is strictly owned by the Occupants or Invaders
if (_markerSide isNotEqualTo sideUnknown && {_markerSide isNotEqualTo resistance} && {_markerSide isNotEqualTo teamPlayer}) exitWith {true};

false;