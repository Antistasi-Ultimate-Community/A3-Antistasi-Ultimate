/*
    really dumb way to do it
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define OccAndInv(VAR) (FactionGet(occ, VAR) + FactionGet(inv, VAR))

params ["_veh", ["_defaultPrice", 1000]];

private _typeX = if (_veh isEqualType objNull) then {typeOf _veh} else {_veh};

private _price = ([_typeX, _defaultPrice] call A3A_fnc_vehiclePrice) / 2;

_price;