/*
    A3A_fnc_lockStatic
    Prevent static weapon being used by garrison AIs. Ejects them if already occupied.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];      //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", true, true]; 

if (A3U_enableVehiclesForAI) then { staticsToFlip pushBackUnique _target } else { staticsToFlip = staticsToFlip - [_target] };
publicVariable "staticsToFlip";

private _crewGroup = crew _target;

if (unitIsUAV _target) exitWith {
    {
        deleteVehicle _x;  
    } forEach (_crewGroup);
};

// kick any AIs out of the vehicle
{
    if (isPlayer _x) then { continue };
    [_x] remoteExec ["unassignVehicle", _x];
    moveOut _x;
} forEach (_crewGroup);
