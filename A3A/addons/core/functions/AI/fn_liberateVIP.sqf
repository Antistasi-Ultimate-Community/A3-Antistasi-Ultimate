params ["_unit", "_playerX"];

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

[_unit] join _playerX;