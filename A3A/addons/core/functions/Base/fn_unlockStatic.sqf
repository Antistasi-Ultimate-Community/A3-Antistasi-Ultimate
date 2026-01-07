/*
    A3A_fnc_unlockStatic
    Permit static weapon for garrison AIs. Runs updateRebelStatics on server.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];     //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", nil, true];

private _index = staticsToFlip find _target;
if (_index isEqualTo -1) then {
    staticsToFlip pushBack _target;
    publicVariable "staticsToFlip";
};

[_target] remoteExec ["A3A_fnc_updateRebelStatics", 2];
