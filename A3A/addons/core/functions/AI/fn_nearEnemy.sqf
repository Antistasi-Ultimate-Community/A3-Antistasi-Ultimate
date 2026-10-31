private _groupX = _this;
private _result = objNull;

_enemiesX = _groupX getVariable ["objectivesX",[]];
if (_enemiesX isNotEqualTo []) then
	{
	for "_i" from 0 to (count _enemiesX) - 1 do
		{
		_eny = (_enemiesX select _i) select 4;
		if (isNull objectParent _eny) exitWith {_result = _eny};
		};
	};
_result
