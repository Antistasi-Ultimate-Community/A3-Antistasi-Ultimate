#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_canAIMountVehicle

Description:
    Determine whether a vehicle can be mounted by AI.
    
    Checks for locked status (physical & AI-flag), actual availability of
    turrets, etc.

Parameters:
    0: _vehicle - the vehicle to check <OBJECT>

Optional:
    1: _requireAIFlagSet - override vehicle's AI flag should to match this (default: false) <BOOL>

Example:
    (begin example)
    // Basic check
    [objectParent player] call A3A_fnc_canAIMountVehicle;
    // Override AI flag requirement; vehicle must be locked for AI
    [objectParent player, true] call A3A_fnc_canAIMountVehicle;
    (end example)

Returns:
    Whether or not AI may mount this vehicle <BOOL>

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_vehicle", nil, [objNull]]
]) exitWith { false };

private _requireAIFlagSet = param[1, false, [true]];

if (
    (locked _vehicle >= 2) || 
    { !isNull attachedTo _vehicle } ||
    { _vehicle getVariable["ownerSide", teamPlayer] isNotEqualTo teamPlayer } ||
    { _vehicle getVariable["lockedForAI", false] isNotEqualTo _requireAIFlagSet }
) exitWith { false };

// Only evaluate this once since the condition is used in user actions and runs
// every frame.
if (isNil { _vehicle getVariable QGVAR(aiMountHasTurrets) }) then {
    // Check if there's a gunner or turret role available for AI to mount
    private _hasTurrets = fullCrew[_vehicle, "", true] findIf {
        _x params["", "_role"];
        _role in["gunner", "turret"];
    } isNotEqualTo -1;

    _vehicle setVariable[QGVAR(aiMountHasTurrets), _hasTurrets];
};

_vehicle getVariable QGVAR(aiMountHasTurrets);
