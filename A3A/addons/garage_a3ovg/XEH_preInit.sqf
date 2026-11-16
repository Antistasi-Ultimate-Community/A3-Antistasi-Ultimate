#include "script_component.hpp"

ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

EFUNC(core,addGarageUserAction) = A3OVG_fnc_userActionOpenGarageAdd;
EFUNC(core,garageVehicle) = {
    params [["_vehicle", objNull, [objNull, [""]]]];
    if (_vehicle isEqualType objNull) exitWith { [_vehicle] call A3OVG_fnc_garageVehicle };
    {
        private _vehicle = _x createVehicle [0,0,1000];
        _vehicle call EFUNC(core,garageVehicle)
    } forEach _vehicle
};

nil;
