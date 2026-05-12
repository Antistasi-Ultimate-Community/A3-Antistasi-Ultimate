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

private _autoMarked = flatten [citiesX, airportsX, milAdministrationsX];
private _markerSide = sidesX getVariable [_marker, sideUnknown];

diag_log _marker;

if (!hideEnemyMarkers) exitWith {false};
if (_marker in revealedZones) exitWith {false};
if (_marker in markersImmune) exitWith {false};
if (_marker in _autoMarked) exitWith {false};
if (!isNil "traderMarker" && {_marker == traderMarker}) exitWith {false};

if (_markerSide isNotEqualTo sideUnknown && {_markerSide isNotEqualTo resistance}) exitWith {true};

// if ("cont" in _marker) exitWith {false};

true;