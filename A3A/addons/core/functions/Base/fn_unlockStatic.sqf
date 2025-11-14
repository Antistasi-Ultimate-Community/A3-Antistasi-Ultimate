/*
    A3A_fnc_unlockStatic
    Permit static weapon for garrison AIs. Runs updateRebelStatics on server.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];     //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", nil, true];

// Update staticsToSave entry
private _index = staticsToSave findIf {_x select 0 == _target};
if (_index != -1) then {
    private _entry = staticsToSave select _index;
    staticsToSave set [_index, [_target, false]]; // Update parameter to false
    publicVariable "staticsToSave";
};

[_target] remoteExec ["A3A_fnc_updateRebelStatics", 2];
