#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

if ("rf" in A3A_enabledDLC) then {
    _group addEventHandler ["EnemyDetected", {
        params ["_group", "_newTarget"];
        {
           [_x, _newTarget] spawn lxRF_fnc_RC40_attack;
        } forEach units _group;
    }];
};