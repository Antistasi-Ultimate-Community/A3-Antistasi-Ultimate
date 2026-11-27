/*
    A3A_fnc_unlockStatic
    Permit static weapon for garrison AIs. Runs updateRebelStatics on server.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];     //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", nil, true];

if (A3U_enableVehiclesForAI) then { staticsToFlip = staticsToFlip - [_target] } else { staticsToFlip pushBackUnique _target };
publicVariable "staticsToFlip";

[_target] remoteExec ["A3A_fnc_updateRebelStatics", 2];
