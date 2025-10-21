#define MIL_HELI        0  // Military Helicopter
#define JET             1  // Fixed-Wing Aircraft

params ["_vehicle","_side"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Prevent duplicate airspace control scripts
if (_vehicle getVariable ["airspaceControl", false]) exitWith {};
_vehicle setVariable ["airspaceControl", true, true];

// Classify aircraft type
private _airType = if (_vehicle isKindOf "Helicopter") then {MIL_HELI} else {JET};

//  						[MIL_HELI, JET]
private _outpostDetectionRange = [500, 750] select _airType;
private _outpostDetectionHeight = [250, 500] select _airType;
private _milbaseDetectionRange = [600, 1000] select _airType;
private _milbaseDetectionHeight = [350, 1500] select _airType;
private _airportDetectionRange = [750, 1500] select _airType;
private _airportDetectionHeight = [500, 2500] select _airType;

private _fn_calculateDelay = {
    params ["_baseType", "_warLevel"];
    _baseMultiplier = switch (_baseType) do {
        case "airport": {0.5}; // Highest priority
        case "milbase": {0.7}; // Medium priority
        case "outpost": {1.0}; // Lowest priority
    };
    
    private _maxDelay = 60;    // Maximum delay in seconds (1 minute)
    private _minDelay = 0;     // Minimum delay (instant response)
    
    // Delay formula: maxDelay * basePriority * (1 - 15% per war level)
    private _calculatedDelay = _maxDelay * _baseMultiplier * (1 - (_warLevel * 0.15));
    
    // Clamp values between min and max
    (_calculatedDelay max _minDelay) min _maxDelay
};

// Example delays at war tier 0:
// Airport: 30s | Military Base: 42s | Outpost: 60s

// At war tier 5:
// Airport: 7.5s | Military Base: 10.5s | Outpost: 15s

// Base cooldowns between support calls (seconds)
#define COOLDOWN_AIRPORT 30  // Airports
#define COOLDOWN_MILBASE 60  // Military bases
#define COOLDOWN_OUTPOST 120 // Outposts

// Добавляем новую функцию для проверки таймаута
private _fn_checkCooldown = {
    params ["_marker", "_baseType"];
    
    private _lastCall = missionNamespace getVariable [_marker + "_lastSupportCall", -1];
    private _cooldown = switch (_baseType) do {
        case "airport": {COOLDOWN_AIRPORT};
        case "milbase": {COOLDOWN_MILBASE};
        case "outpost": {COOLDOWN_OUTPOST};
        default {120};
    };
    
    // Если с последнего вызова прошло больше времени чем кд
    (time - _lastCall) > _cooldown
};

private _fn_sendSupport = {
    params ["_vehicle", "_marker", "_threat", "_baseType"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    
    // Check cooldown status
    if !([_marker, _baseType] call _fn_checkCooldown) exitWith {
        ServerDebug_3("Support call skipped for %1 | Cooldown active | Last call: %2 | Current time: %3", 
            _marker, 
            missionNamespace getVariable [_marker + "_lastSupportCall", -1], 
            time
        );
    };
    
    // Update last call time
    missionNamespace setVariable [_marker + "_lastSupportCall", time, true];
    
    // Prepare support call parameters
    private _timeDelay = [_baseType, tierWar] call _fn_calculateDelay;
    private _supportType = if (_threat <= 50) then { "ASF" } else { "SAM" }; // Air/SAM selection
    private _MaxSpend = _threat * 2;  // Double threat for resource allocation
    private _revealValue = [getMarkerPos _marker, _markerSide] call A3A_fnc_calculateSupportCallReveal;

    // Execute support request
    [
        _supportType,           // "ASF" or "SAM"
        _markerSide,            // Owner faction
        "defence",              // Mission type
        _MaxSpend,              // Resource budget
        _vehicle,               // Target vehicle
        getPosATL _vehicle,     // Target position
        _revealValue,           // Intel revelation level
        _timeDelay              // Calculated response delay
    ] call A3A_fnc_createSupport;
    
    // Debug output
    ServerDebug_5("Called %1 support | Delay: %2 | Cooldown: %3 | Base: %4 | Threat: %5", 
        _supportType, 
        _timeDelay, 
        switch (_baseType) do {
            case "airport": {COOLDOWN_AIRPORT};
            case "milbase": {COOLDOWN_MILBASE};
            case "outpost": {COOLDOWN_OUTPOST};
        }, 
        _baseType, 
        _threat
    );
};

/* private _fn_sendSupport = {
    params ["_vehicle", "_marker", "_threat"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    
    [_markerSide, false, _threat, _vehicle] remoteExec ["A3A_fnc_addRecentDamage", 2];
    private _revealValue = [getMarkerPos _marker, _markerSide] call A3A_fnc_calculateSupportCallReveal;
    [_markerSide, _vehicle, markerPos _marker, 4, 1] remoteExec ["A3A_fnc_requestSupport", 2];
}; */

// Determine enemy factions per side
private _fn_getEnemySides = {
    params ["_side"];
    switch (_side) do {
        case Invaders: { [Occupants] };         // Invaders vs Occupants
        case Occupants: { [Invaders, Rivals] }; // Occupants vs Invaders+Rivals
        default { [] };
    };
};

// Check if marker belongs to enemy faction
private _fn_checkMarkerSide = {
    params ["_marker", "_enemySides"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    _markerSide in _enemySides
};

// Find markers in detection range/height
private _fn_getMarkersInRange = {
    params ["_markers", "_vehPos", "_range", "_height", "_enemySides"];
    _markers select {
        private _markerPos = AGLToASL (getMarkerPos _x);
        (
            (((_vehPos select 2) - (_markerPos select 2)) < _height && 
            (_markerPos distance2D _vehPos < _range) &&
            ([_x, _enemySides] call _fn_checkMarkerSide)
        ))
    };
};

// Main detection loop
while {alive _vehicle} do {
    private _vehPos = getPosASL _vehicle;
    private _enemySides = [_side] call _fn_getEnemySides;
    
    // Get all potential targets
    private _allAirports = airportsX;
    private _allOutposts = outposts + seaports;
    private _allMilbases = milbases;
    
    // Filter enemy-controlled locations
    private _enemyAirports = _allAirports select { [_x, _enemySides] call _fn_checkMarkerSide };
    private _enemyOutposts = _allOutposts select { [_x, _enemySides] call _fn_checkMarkerSide };
    private _enemyMilbases = _allMilbases select { [_x, _enemySides] call _fn_checkMarkerSide };
    
    // Check airports
    private _airportsInRange = [_enemyAirports, _vehPos, _airportDetectionRange, _airportDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _airportsInRange > 0) exitWith {
        [_vehicle, _airportsInRange select 0, 50, "airport"] call _fn_sendSupport;
    };

    // Check military bases
    private _milbasesInRange = [_enemyMilbases, _vehPos, _milbaseDetectionRange, _milbaseDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _milbasesInRange > 0) exitWith {
        [_vehicle, _milbasesInRange select 0, 40, "milbase"] call _fn_sendSupport;
    };
    
    // Check outposts
    private _outpostsInRange = [_enemyOutposts, _vehPos, _outpostDetectionRange, _outpostDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _outpostsInRange > 0) exitWith {
        [_vehicle, _outpostsInRange select 0, 20, "outpost"] call _fn_sendSupport;
    };
    
    sleep 1;
};

_vehicle setVariable ["airspaceControl", nil, true];