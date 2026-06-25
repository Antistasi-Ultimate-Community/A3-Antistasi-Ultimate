#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_vehicleHasCargo

Description:
    Determine if a vehicle has cargo

Parameters:
    0: _vehicle - The vehicle in question <OBJECT>

Optional:

Example:
    (begin example)
    [vehicle player] call A3A_fnc_vehicleHasCargo;
    (end example)

Returns:
    <BOOL>

Author:
    goreSplatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_vehicle", objNull, [objNull]]
]) exitWith { false };

if !assert(!isNull _vehicle) exitWith { false };

0 != count(flatten((getBackpackCargo _vehicle) + (getWeaponCargo _vehicle) + (getMagazineCargo _vehicle) + (getItemCargo _vehicle)));
