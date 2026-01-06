/*
    A3A_fnc_lockStatic
    Prevent static weapon being used by garrison AIs. Ejects them if already occupied.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];      //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", true, true]; 

if (_target in staticsToMan) then {
    staticsToMan deleteAt (staticsToMan find _target);
    publicVariable "staticsToMan";
};

// kick any AIs out of the vehicle
{
    if (isPlayer _x) then { continue };
    [_x] remoteExec ["unassignVehicle", _x];
    moveOut _x;
} forEach (crew _target);
