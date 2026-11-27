private _unit = _this select 0;

if (isPlayer _unit) exitWith {};
if (!isNull objectParent _unit) exitWith {};
if (behaviour _unit isEqualTo "COMBAT" or {behaviour _unit isEqualTo "STEALTH"}) exitWith {};
if !([_unit] call A3A_fnc_canFight) exitWith {};

private _enemy = if (count _this > 1) then {_this select 1} else {_unit findNearestEnemy _unit};

if (isNull _enemy) exitWith {};
if (_unit distance _enemy < 300) exitWith {};
if (random 100 < 35) then {[_unit,_unit,_enemy] call A3A_fnc_chargeWithSmoke};
_coverX = [_unit,_enemy] call A3A_fnc_coverage;

if (_coverX isEqualTo []) exitWith {};

_unit stop false;
_unit forceSpeed -1;
{_unit disableAI _x} forEach ["AUTOTARGET","FSM","TARGET","SUPPRESSION","AUTOCOMBAT","WEAPONAIM","COVER","CHECKVISIBLE"];
_unit setUnitPos "MIDDLE";
_unit setCombatMode "BLUE";
_unit doMove _coverX;

[_unit,_coverX] spawn {
	params ["_unit", "_coverX"];
	private _timeOut = time + 15;
	waitUntil {sleep 0.5; (_unit distance _coverX < 1) or (time > _timeOut)};
	if (_unit distance _coverX < 1) then {
		sleep 1;
		_unit stop true;
		_unit forceSpeed 0;
		_unit setCombatMode "YELLOW";
		_unit setUnitPos "AUTO";
		_unit doWatch (_unit findNearestEnemy _unit);
		sleep 30;
	};
	{_unit enableAI _x} forEach ["AUTOTARGET","FSM","TARGET","SUPPRESSION","AUTOCOMBAT","WEAPONAIM","COVER","CHECKVISIBLE"];
	_unit setCombatMode "YELLOW";
	_unit forceSpeed -1;
	_unit stop false;
	_unit setUnitPos "AUTO";
};
