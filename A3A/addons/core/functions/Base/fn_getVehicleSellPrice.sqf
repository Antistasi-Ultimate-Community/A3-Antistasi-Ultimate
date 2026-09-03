#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_getVehicleSellPrice

Description:
    Wrapper for A3A_fnc_getVehiclePrice to get the selling price of a vehicle.

    Needed, cause it's used in garage code. Blech.

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

private _price = [_vehicle, true, true] call A3A_fnc_getVehiclePrice;

if (isNil "_price") then {
    Warning_1("Failed to retrieve selling price for %1",_vehicle);
};

RETDEF(_price,GVAR(vehicleSellingDefaultPrice));
