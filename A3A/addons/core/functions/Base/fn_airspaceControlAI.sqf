/* #define MIL_HELI        0
#define JET             1

params ["_vehicle","_side"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (_vehicle getVariable ["airspaceControl", false]) exitWith {};
_vehicle setVariable ["airspaceControl", true, true];

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

// Example delays at different war tiers:
// --------------------------------------
// tierWar = 0:
//   Airport: 30s (60 * 0.5 * 1.0)
//   Milbase: 42s (60 * 0.7 * 1.0)
//   Outpost: 60s (60 * 1.0 * 1.0)

// tierWar = 5:
//   Airport: 7.5s (60 * 0.5 * 0.25)
//   Milbase: 10.5s (60 * 0.7 * 0.25)
//   Outpost: 15s (60 * 1.0 * 0.25)

private _fn_sendSupport = {
    params ["_vehicle", "_marker", "_threat", "_baseType"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    
    // Calculate response delay based on base type and current war tier
    private _timeDelay = [_baseType, tierWar] call _fn_calculateDelay;
    
    // Determine support type based on threat level
    private _supportType = if (_threat <= 50) then { "ASF" } else { "SAM" };
	
	///Max spend
	private _MaxSpend = _threat * 2;

    // Calculate revelation value for intelligence system
    private _revealValue = [getMarkerPos _marker, _markerSide] call A3A_fnc_calculateSupportCallReveal;

    // Execute support request on server
    [
        _supportType,
        _markerSide,
        "defence",          // Defense-type response
        _MaxSpend,          // Threat level (affects resource allocation)
        _vehicle,           // Target vehicle
        getPosATL _vehicle, // Target position
        _revealValue,       // Intelligence revelation value
        _timeDelay          // Calculated response delay
    ] remoteExec ["A3A_fnc_createSupport", 2];
    
    // Debug logging
    ServerDebug_5("Called %1 support | Delay: %2 | War Level: %3 | Base: %4 | Threat: %5", 
        _supportType, _timeDelay, tierWar, _baseType, _threat
    );
};

private _fn_getEnemySides = {
    params ["_side"];
    switch (_side) do {
        case Invaders: { [Occupants] };
        case Occupants: { [Invaders, Rivals] };
        default { [] };
    };
};

private _fn_checkMarkerSide = {
    params ["_marker", "_enemySides"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    _markerSide in _enemySides
};

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

while {alive _vehicle} do {
    private _vehPos = getPosASL _vehicle;
    private _enemySides = [_side] call _fn_getEnemySides;
    
    private _allAirports = airportsX;
    private _allOutposts = outposts + seaports;
    private _allMilbases = milbases;
    
    private _enemyAirports = _allAirports select { [_x, _enemySides] call _fn_checkMarkerSide };
    private _enemyOutposts = _allOutposts select { [_x, _enemySides] call _fn_checkMarkerSide };
    private _enemyMilbases = _allMilbases select { [_x, _enemySides] call _fn_checkMarkerSide };
    
    // Проверка аэропортов
    private _airportsInRange = [_enemyAirports, _vehPos, _airportDetectionRange, _airportDetectionHeight, _enemySides] call _fn_getMarkersInRange;
	if (count _airportsInRange > 0) exitWith {
        [_vehicle, _airportsInRange select 0, 50, "airport"] call _fn_sendSupport;
    };

    // Проверка военных баз
    private _milbasesInRange = [_enemyMilbases, _vehPos, _milbaseDetectionRange, _milbaseDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _milbasesInRange > 0) exitWith {
        [_vehicle, _milbasesInRange select 0, 40, "milbase"] call _fn_sendSupport;
    };
    
    // Проверка аванпостов
    private _outpostsInRange = [_enemyOutposts, _vehPos, _outpostDetectionRange, _outpostDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _outpostsInRange > 0) exitWith {
        [_vehicle, _outpostsInRange select 0, 20, "outpost"] call _fn_sendSupport;
    };
    
    sleep 1;
};

_vehicle setVariable ["airspaceControl", nil, true]; */


#define MIL_HELI        0
#define JET             1

params ["_vehicle","_side"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (_vehicle getVariable ["airspaceControl", false]) exitWith {};
_vehicle setVariable ["airspaceControl", true, true];

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

// Example delays at different war tiers:
// --------------------------------------
// tierWar = 0:
//   Airport: 30s (60 * 0.5 * 1.0)
//   Milbase: 42s (60 * 0.7 * 1.0)
//   Outpost: 60s (60 * 1.0 * 1.0)

// tierWar = 5:
//   Airport: 7.5s (60 * 0.5 * 0.25)
//   Milbase: 10.5s (60 * 0.7 * 0.25)
//   Outpost: 15s (60 * 1.0 * 0.25)

#define COOLDOWN_AIRPORT 30
#define COOLDOWN_MILBASE 60
#define COOLDOWN_OUTPOST 120 

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

// Модифицируем функцию отправки поддержки
private _fn_sendSupport = {
    params ["_vehicle", "_marker", "_threat", "_baseType"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    
    // Проверяем таймаут
    if !([_marker, _baseType] call _fn_checkCooldown) exitWith {
        ServerDebug_3("Support call skipped for %1 | Cooldown active | Last call: %2 | Current time: %3", 
            _marker, 
            missionNamespace getVariable [_marker + "_lastSupportCall", -1], 
            time
        );
    };
    
    // Обновляем время последнего вызова
    missionNamespace setVariable [_marker + "_lastSupportCall", time, true];
    
    // Остальная логика
    private _timeDelay = [_baseType, tierWar] call _fn_calculateDelay;
    private _supportType = if (_threat <= 50) then { "ASF" } else { "SAM" };
    private _MaxSpend = _threat * 2;
    private _revealValue = [getMarkerPos _marker, _markerSide] call A3A_fnc_calculateSupportCallReveal;

    [
        _supportType,
        _markerSide,
        "defence",
        _MaxSpend,
        _vehicle,
        getPosATL _vehicle,
        1,//_revealValue,
        _timeDelay
    ] call A3A_fnc_createSupport;
    
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

private _fn_getEnemySides = {
    params ["_side"];
    switch (_side) do {
        case Invaders: { [Occupants] };
        case Occupants: { [Invaders, Rivals] };
        default { [] };
    };
};

private _fn_checkMarkerSide = {
    params ["_marker", "_enemySides"];
    private _markerSide = sidesX getVariable [_marker, sideUnknown];
    _markerSide in _enemySides
};

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

while {alive _vehicle} do {
    private _vehPos = getPosASL _vehicle;
    private _enemySides = [_side] call _fn_getEnemySides;
    
    private _allAirports = airportsX;
    private _allOutposts = outposts + seaports;
    private _allMilbases = milbases;
    
    private _enemyAirports = _allAirports select { [_x, _enemySides] call _fn_checkMarkerSide };
    private _enemyOutposts = _allOutposts select { [_x, _enemySides] call _fn_checkMarkerSide };
    private _enemyMilbases = _allMilbases select { [_x, _enemySides] call _fn_checkMarkerSide };
    
    // Проверка аэропортов
    private _airportsInRange = [_enemyAirports, _vehPos, _airportDetectionRange, _airportDetectionHeight, _enemySides] call _fn_getMarkersInRange;
	if (count _airportsInRange > 0) exitWith {
        [_vehicle, _airportsInRange select 0, 50, "airport"] call _fn_sendSupport;
    };

    // Проверка военных баз
    private _milbasesInRange = [_enemyMilbases, _vehPos, _milbaseDetectionRange, _milbaseDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _milbasesInRange > 0) exitWith {
        [_vehicle, _milbasesInRange select 0, 40, "milbase"] call _fn_sendSupport;
    };
    
    // Проверка аванпостов
    private _outpostsInRange = [_enemyOutposts, _vehPos, _outpostDetectionRange, _outpostDetectionHeight, _enemySides] call _fn_getMarkersInRange;
    if (count _outpostsInRange > 0) exitWith {
        [_vehicle, _outpostsInRange select 0, 20, "outpost"] call _fn_sendSupport;
    };
    
    sleep 1;
};

_vehicle setVariable ["airspaceControl", nil, true];