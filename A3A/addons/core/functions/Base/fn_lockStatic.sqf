/*
    A3A_fnc_lockStatic
    Prevent static weapon being used by garrison AIs. Ejects them if already occupied.

    Arguments:
    0. <Object> Target static weapon.

    Scope: Anywhere. Usually called from addAction.
*/

params ["_target"];      //, "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", true, true]; 

// Update staticsToSave entry
private _index = staticsToSave findIf {_x select 0 == _target};
if (_index != -1) then {
    private _entry = staticsToSave select _index;
    staticsToSave set [_index, [_target, true]]; // Update parameter to true
    publicVariable "staticsToSave";
};

// kick any AIs out of the vehicle
{
    if (isPlayer _x) then { continue };
    [_x] remoteExec ["unassignVehicle", _x];
    moveOut _x;
} forEach (crew _target);
