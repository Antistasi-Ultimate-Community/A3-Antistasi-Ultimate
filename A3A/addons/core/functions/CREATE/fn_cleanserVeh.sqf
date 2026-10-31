#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_veh"];

sleep 5;

if (isNull _veh) exitWith {
    Debug_1("%1 is null on spawn",typeOf _veh);
};

if (!alive _veh) then
{
    private _nearestMarker  = [markersX, getPosATL _veh] call BIS_fnc_nearestPosition;
    Debug_3("%1 destroyed on spawn at %2, near %3",typeOf _veh,getPosATL _veh,_nearestMarker);
	deleteVehicle _veh;
};
