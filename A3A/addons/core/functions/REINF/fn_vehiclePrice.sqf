#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_vehiclePrice

Description:
    Get buying price for a vehicle; wrapper function around `A3A_fnc_getVehiclePrice`.

Parameters:
    0: _vehicle - the vehicle object or class name <OBJECT/STRING>

Optional:

Example:

Returns:
    <NUMBER>

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_vehicle", nil, ["", objNull]]
]) exitWith { 0 };

private _price = [_vehicle, false, true] call A3A_fnc_getVehiclePrice;

if (isNil "_price") then {
    Warning_1("Failed to retrieve buying price for %1",_vehicle);
};

RETDEF(_price,0);
