#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_unit", "_type", "_isRival"];

if (isNil "_unit" || {isNull _unit}) exitWith {};

private _side = side (group _unit);

switch (true) do {
	case ("Traitor" in _type);
	case ("Official" in _type): {
		_unit setVariable ["hasIntel", true, true];
		_unit setVariable ["side", _side, true];

		if ((random 100) < 35) then {
			_unit setVariable ["canBeInterrogated", true, true];
		} else {
			[_unit, "Intel_Small"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian], _unit];
		};
	};
	case (_isRival && {_type in FactionGet(all,"SquadLeaders")}): {
		private _hasIntel = ((random 100) < 40);
		_unit setVariable ["hasIntel", _hasIntel, true];

		if ((random 100) < 35) then {
			_unit setVariable ["hasLaptop", true, true];
			_unit addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];

				if (_unit getVariable ["hasLaptopSpawned", false]) exitWith {
					_unit removeEventHandler ["Killed",_thisEventHandler];
				};

				[_unit] call SCRT_fnc_rivals_createLaptop;
				_unit setVariable ["hasLaptopSpawned", true, true]; //not sure if it should be broadcasted
				_unit removeEventHandler ["Killed",_thisEventHandler];
			}];
		} else {
			_unit setVariable ["canBeInterrogated", true, true];
		};
	};

	case (_type in FactionGet(all,"SquadLeaders")): {
		private _hasIntel = ((random 100) < 80);
		_unit setVariable ["hasIntel", _hasIntel, true];
		_unit setVariable ["side", _side, true];

		if ((random 100) < 35) then {
			_unit setVariable ["canBeInterrogated", true, true];
		} else {
			[_unit, "Intel_Small"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian], _unit];
		};
	};

	default {
		//do nothing
	};
};
