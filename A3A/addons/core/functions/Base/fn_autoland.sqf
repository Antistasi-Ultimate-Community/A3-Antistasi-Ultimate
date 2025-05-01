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
if (_vehicle isKindOf "Helicopter") then {
    if (getNumber (configOf _vehicle >> "vtol") <= 0 ) exitWith {};
}; // Exit if helicopter

_vehicle setVariable ["autolandAction", true, true];

// Action parameters
private _actionSpeedLimit = 350; // Max speed for action (km/h)
private _actionHeightLimit = 150; // Max height for action (meters)

// Detection parameters
private _detectionRange = 500;
private _detectionHeight = 500;

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
    private _vehPos = getPosASL _vehicle;
    private _inFriendlyAirport = _friendlyAirports findIf {
        (getMarkerPos _x distance2D _vehPos < _detectionRange) &&
        ((_vehPos select 2) - (getMarkerPos _x select 2) < _actionHeightLimit) &&
        ((_vehPos select 2) - (getMarkerPos _x select 2) >= 10) ///tried to disable the action if plane is below 10 meters... doesn't work
    } != -1;

    private _isSlowEnough = speed _vehicle < _actionSpeedLimit;
    
    _inFriendlyAirport && _isSlowEnough
};

// Main loop
while {alive _vehicle && {count crew _vehicle > 0}} do {
    // Update action
    private _shouldAddAction = [_vehicle] call _fn_checkActionConditions;
    
    if (_shouldAddAction && !_actionAdded) then {
        _actionID = _vehicle addAction [
            localize "STR_antistasi_actions_autoland",
            { 
                params ["_vehicle"];
                private _vehiclePos = getPos _vehicle;
                private _locations = airportsX select {sidesX getVariable [_x, sideUnknown] == teamPlayer};
                private _selectedMarker = [_locations, _vehiclePos] call BIS_fnc_nearestPosition;
                _selectedMarkerPos = getMarkerPos _selectedMarker;
                player setPos _selectedMarkerPos;
                [_vehicle, clientOwner, call HR_GRG_dLock, player, true] remoteExecCall ['HR_GRG_fnc_addVehicle',2];
            },
            [_vehicle], 1.5, true, true, "", "driver vehicle player == player", 40
        ];
        _actionAdded = true;
    };
    
    if (!_shouldAddAction && _actionAdded) then {
        _vehicle removeAction _actionID;
        _actionAdded = false;
    };
    
    sleep 1;
};

// Cleanup
_vehicle setVariable ["autolandAction", nil, true];
if (_actionAdded) then {
    _vehicle removeAction _actionID;
};