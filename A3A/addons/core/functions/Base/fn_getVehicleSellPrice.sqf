/*
    really dumb way to do it
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define OccAndInv(VAR) (FactionGet(occ, VAR) + FactionGet(inv, VAR))

params ["_veh"];

private _typeX = if (_veh isEqualType objNull) then {typeOf _veh} else {_veh};

private _price = [_typeX] call A3A_fnc_vehiclePrice;

_price;