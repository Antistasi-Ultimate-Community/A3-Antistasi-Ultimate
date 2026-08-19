/*
    Author:
        Silence
    
    Description:
        Creates a mission for deliveries. It does not check how, or the why, only IF it is delivered
        The beauty of this is that you can do it literally any way you want. 
        You can transport the cargo there, LITERALLY drive the cargo there (e.g if the car is cargo), fly it, who cares
    
    Params:
        _origin <STRING> <Default: "">
        _destination <STRING> <Default: "">
        _cargo <ARRAY<STRING>> <Default: []>
    
    Dependencies:
        traderMarker
    
    Scope:
        Server
    
    Environment:
        Scheduled
    
    Usage:
        [traderMarker, selectRandom citiesX] spawn A3A_fnc_LOG_Delivery;
    
    Return:
        N/A
*/

// IDEA: You talk to a guy. He lets you choose how many items from the categories and gives you an estimated payout.
// IDEA: Only spawns in whitelisted "warehouse" buildings

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_cleanup = {
    params ["_taskId", "_cargoObjects", ["_state", "SUCCEEDED"]];

    Info("Delivery mission cleanup.");
    [_taskId, "LOG", _state] call A3A_fnc_taskSetState;

    sleep 60;
    [_taskId, "LOG", 0] spawn A3A_fnc_taskDelete;
    {deleteVehicle _x} forEach _cargoObjects;
};

//Mission: Deliver item(s)
if (!isServer and hasInterface) exitWith{};

params [["_origin", ""], ["_destination", ""], ["_cargo", []]];

if (_origin isEqualTo "") exitWith {Error("Delivery mission failed: Invalid origin.")};
if (_destination isEqualTo "") exitWith {Error("Delivery mission failed: Invalid destination.")};

private _size = [_origin] call A3A_fnc_sizeMarker;
private _sizeMin = 25 max _size; // Minimum size of 50m
private _sizeComplete = 50 max _size; // Minimum size of 50m

private _originPos = getMarkerPos _origin;
private _destinationPos = getMarkerPos _destination;
private _originName = if (!isNil "traderMarker" && {_origin isEqualTo traderMarker}) then {"the Black Market"} else {[_origin] call A3A_fnc_localizar};
private _destinationName = if (!isNil "traderMarker" && {_destination isEqualTo traderMarker}) then {"the Black Market"} else {[_destination] call A3A_fnc_localizar};

private _taskId = "LOG" + str A3A_taskCount;

Info("Delivery mission init.");

private _missionExpireTime = time + 1800; // 30 minutes to accept the mission

private _posMission = [_originPos, 0, _sizeMin, 0, 0, 20, 0, [], [_originPos, _originPos]] call BIS_fnc_findSafePos;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_A3A_Missions_LOG_Delivery_task_desc", _destinationName, _originName],
        localize "STR_A3A_Missions_LOG_Delivery_task_header",
        _origin
    ],
    _posMission,
    false,
    0,
    true,
    "delivery",
    true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

// Create objects to deliver
private _cargoTypes = if (_cargo isEqualTo []) then {call A3U_fnc_LOG_delivery_getCargo} else {["DEFAULT", _cargo]};
private _cargoType = _cargoTypes#0;
private _cargo = _cargoTypes#1;

private _cargoObjects = [];

{
    private _pos = [_posMission, 0, 5, 0, 0, 20, 0, [], [_posMission, _posMission]] call BIS_fnc_findSafePos;
    private _cargoObject = [_x, _pos] call A3U_fnc_LOG_delivery_createCargo;
    _cargoObjects pushBack _cargoObject;
} forEach _cargo;

// Cargo check functions
private _fnc_isCargoAcknowledged = {
    params ["_cargoObjects"];
    ({_x getVariable ["A3A_cargo_acknowledged", false] isEqualTo true || {!alive _x}} count _cargoObjects) isEqualTo (count _cargoObjects);
};

private _fnc_isCargoDead = {
    params ["_cargoObjects"];
    ({!alive _x} count _cargoObjects) isEqualTo (count _cargoObjects);
};

private _fnc_isCargoDelivered = {
    params ["_cargoObjects", "_destinationPos", "_range"];
    ({(_x distance2D _destinationPos) < _range || {!alive _x}} count _cargoObjects) isEqualTo (count _cargoObjects) &&
    ({_x getVariable ["A3A_cargo_isLoaded", false] isEqualTo false} count _cargoObjects) isEqualTo (count _cargoObjects) && 
    ({isNull ropeAttachedTo _x} count _cargoObjects) isEqualTo (count _cargoObjects);
};

private _functions = [_fnc_cleanup, _fnc_isCargoDead];
private _fnc_failureCheck = {
    params ["_taskId", "_cargoObjects", "_expireTime", "_functions"];
    _functions params ["_fnc_cleanup", "_fnc_isCargoDead"];
    if ((time > _expireTime) || {([_cargoObjects] call _fnc_isCargoDead)}) exitWith {
        [_taskId, _cargoObjects, "FAILED"] call _fnc_cleanup;
    };
};

// Check to start the next phase
waitUntil {
    sleep 5;
    time > _missionExpireTime ||
    {[_cargoObjects] call _fnc_isCargoAcknowledged} || 
    {([_cargoObjects] call _fnc_isCargoDead)}
};

// Expiry/failure sanity check
[_taskId, _cargoObjects, _missionExpireTime, _functions] call _fnc_failureCheck;

// Update task description
// private _betterDestination = [_destinationPos#0, ((_destinationPos#1) + 5), _destinationPos#2]; // Clears it off the actual zone marker, pure visual change
[_taskId, _destination] call BIS_fnc_taskSetDestination;
[_taskId, [
    format [localize "STR_A3A_Missions_LOG_Delivery_task_desc", _destinationName, _originName],
    localize "STR_A3A_Missions_LOG_Delivery_task_stage_header", 
    _destination
]] call BIS_fnc_taskSetDescription;

private _missionCompletionTime = time + 3600; // 1 hour to complete the delivery

waitUntil {
    sleep 5;
    time > _missionCompletionTime ||
    {[_cargoObjects, _destinationPos, 15] call _fnc_isCargoDelivered} ||
    {([_cargoObjects] call _fnc_isCargoDead)}
}; // We could in theory also run a new thread on each cargo object to check if it's delivered, that way you can deliver one at a time

// Expiry/failure sanity check
[_taskId, _cargoObjects, _missionCompletionTime, _functions] call _fnc_failureCheck;

// Add variable for _destination to confirm delivery, not used internally but for external checks (e.g framework)
private _destinationData = [true, _cargo]; // <bool>, <array<string>>
[_destination, _destinationData] call A3U_fnc_LOG_delivery_setData;

// Calculate payment | We ideally want to give bonuses for both distance travelled and cargo type
private _payment = 0;
private _distanceTravelled = (_originPos distance2D _destinationPos) / 500;

{
    if !(alive _x) then {continue};

    private _cargoValue = [(typeOf _x)] call A3U_fnc_LOG_delivery_getCargoValue;
    
    _payment = _payment + _cargoValue;
    if ([_x] call A3U_fnc_LOG_delivery_getCargoExplosive isEqualTo 1) then {_payment = _payment + 1000};
} forEach _cargoObjects;

private _bonus = round (_distanceTravelled * 250); // +250 per 500m?
_payment = _payment + _bonus;

// Get players "involved" (ish) and pay them
private _playersInvolved = (call SCRT_fnc_misc_getRebelPlayers) inAreaArray ([_destination, _sizeComplete, _sizeComplete]);
private _playersDivider = count _playersInvolved;

Info_2("Delivery mission succeeded. Payment: %1 | Players Involved: %2", _payment, _playersInvolved);

{
    [round (7*tierWar), _x] call A3A_fnc_addScorePlayer;
    [(_payment / _playersDivider), _x] call A3A_fnc_addMoneyPlayer;
} forEach _playersInvolved;

// Clean up
{deleteVehicle _x} forEach _cargoObjects;

[_taskId, _cargoObjects] call _fnc_cleanup;