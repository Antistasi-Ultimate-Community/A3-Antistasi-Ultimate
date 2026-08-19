params ["_target", "_playerX"];

[_target,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_target];

_target setVariable ["A3A_cargo_acknowledged", true, true];

uiSleep 1;

[_target] call A3A_Logistics_fnc_addLoadAction;

[_target, "carry"] remoteExec ["A3A_fnc_flagaction", [teamPlayer,civilian], _target];