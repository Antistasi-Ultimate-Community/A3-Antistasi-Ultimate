#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/*  Maintainer: wersal
    Adds action to "land" vehicle if certain conditions are met
    teleports player to the nearest aifield marker and moves aircraft into garage

    Params:
        _vehicle: OBJECT : The vehicles that should get autoland action

    Returns:
        Nothing
*/
params ["_vehicle"];
if (_vehicle getVariable ["autolandAction", false]) exitWith {};
// Exit if helicopter
if (_vehicle isKindOf "Helicopter" && {getNumber(configOf _vehicle >> "vtol") == 0}) exitWith {};


_vehicle setVariable ["autolandAction", true, true];

// Variables for addAction
private _actionAdded = false;
private _actionID = -1;

// Function to check action conditions
private _fn_checkActionConditions = {
    params ["_vehicle"];
    
    // Get friendly airports
    private _friendlyAirports = airportsX select {
        sidesX getVariable [_x, sideUnknown] == teamPlayer
    };

    // Check conditions
    private _inFriendlyAirport = _friendlyAirports findIf {
        private _airportPosAGL = markerPos [_x, true];
        private _airportPosASL = AGLToASL _airportPosAGL;
        private _vehiclePosASL = getPosASL _vehicle;

        private _heightAbove = (_vehiclePosASL select 2) - (_airportPosASL select 2);
        private _horizontalDist = _airportPosASL distance2D _vehiclePosASL;

        diag_log format ["[DEBUG] %1: horiz=%2, heightAbove=%3", _x, _horizontalDist, _heightAbove];

        (_horizontalDist < GVAR(detectionRange)) &&
        (_heightAbove >= 10) &&
        (_heightAbove < GVAR(actionHeightLimit))
    } != -1;

    private _isSlowEnough = speed _vehicle < GVAR(actionSpeedLimit);
    
    _inFriendlyAirport && _isSlowEnough
};

// Main loop
private _actionAdded = false;
private _actionID = -1;
private _firstPassDone = false;

while {alive _vehicle && {count crew _vehicle > 0}} do {
    // Update action
    private _condition = [_vehicle] call _fn_checkActionConditions;
    if (_condition) then {
        if (!_actionAdded) then {
            private _autoShow = _firstPassDone;

            _actionID = _vehicle addAction [
                localize "STR_antistasi_actions_autoland",
                {
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    private _vehicle = _arguments select 0;
                    private _locations = airportsX select {sidesX getVariable [_x, sideUnknown] == teamPlayer};
                    private _selectedMarker = [_locations, getPos _vehicle] call BIS_fnc_nearestPosition;
                    private _selectedMarkerPos = getMarkerPos _selectedMarker;
                    { _x setPos _selectedMarkerPos; } forEach (crew _vehicle);
                    [_vehicle, clientOwner, call HR_GRG_dLock, driver _vehicle, true] remoteExecCall ['HR_GRG_fnc_addVehicle',2];
                },
                [_vehicle],
                1.5,
                _autoShow,
                true,
                "",
                "_this isEqualTo driver _originalTarget",
                40
            ];
            _actionAdded = true;
            _firstPassDone = true;
        };
    } else {
        if (_actionAdded) then {
            _vehicle removeAction _actionID;
            _actionAdded = false;
        };
    };
    sleep 1;
};

// Cleanup
_vehicle setVariable ["autolandAction", nil, true];
if (_actionAdded) then {
    _vehicle removeAction _actionID;
};