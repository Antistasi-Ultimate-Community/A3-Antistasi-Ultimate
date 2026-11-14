params ["_pos"];

_pos = _pos findEmptyPosition [1,30,"I_G_Mortar_01_F"];
if (count _pos == 0) then {_pos = _this select 0};

private _countX = 300;
while {_countX > 0} do {
	if !([_pos] call A3A_fnc_isBuildingPosition) then {_exit = true};
	_pos = _pos getPos [31,random 360];
	_countX = _countX - 1;
};
if (_countX == 0) then {_pos = (_this select 0) findEmptyPosition [1,30,"I_G_Mortar_01_F"]};
if (count _pos == 0) then {_pos = _this select 0};

_pos
