#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

if ("rf" in A3A_enabledDLC && {isNil {_group getVariable "A3U_RC40_EH_EnemyDetected"}}) then {
    private _handlerRC40 = _group addEventHandler ["EnemyDetected", {
        params ["_group", "_newTarget"];
        {
            if ("1Rnd_HE_RC40_shell_RF" in (magazines _x + [currentMagazine _x]) && {_newTarget isKindOf "CAManBase" && {count units _newTarget > 2}}) then { [_x, _newTarget] spawn lxRF_fnc_RC40_attack };
        } forEach (units _group);
        _group setVariable ["A3U_RC40_EH_EnemyDetected", _handlerRC40, true];
    }];
};