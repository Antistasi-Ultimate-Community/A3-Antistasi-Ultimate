params ["_target", "_playerX"];

[_target,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_target];

_target setVariable ["A3A_cargo_acknowledged", true, true];

[_target] call A3A_Logistics_fnc_addLoadAction;

// [_cargo] remoteExec ["SCRT_fnc_common_addActionMove", [teamPlayer, civilian], _cargo]; // Doesn't work, we need a new fnc