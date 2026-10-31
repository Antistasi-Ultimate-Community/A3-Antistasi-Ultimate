if (hcSelected player isEqualTo []) exitWith {
	[localize "STR_A3A_reinf_vehStat_header", localize "STR_A3A_reinf_vehStat_one_group"] call A3A_fnc_customHint;};

private ["_groupX","_veh","_textX","_unitsX"];

if (_this select 0 == "mount") exitWith {
	_textX = "";
	{
		_groupX = _x;
		_veh = objNull;
		{
			_owner = _x getVariable "owner";
			if (!isNil "_owner") then {if (_owner == _groupX) exitWith {_veh = _x}};
		} forEach vehicles;

		if !(isNull _veh) then {
			_transporte = true;
			if (count allTurrets [_veh, false] > 0) then {_transporte = false};
			if (_transporte) then {
				if (leader _groupX in _veh) then {
						_textX = format [localize "STR_A3A_reinf_vehStat_dismounting_1",groupId _groupX,_textX];
						{[_x] orderGetIn false; [_x] allowGetIn false} forEach units _groupX;
				        _groupX setVariable ["A3A_forceDismount", true];
				} else {
						_textX = format [localize "STR_A3A_reinf_vehStat_boarding_1",groupId _groupX,_textX];
						{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
					    _groupX setVariable ["A3A_forceDismount", nil];
					};
			} else {
				if (leader _groupX in _veh) then {
					_textX = format [localize "STR_A3A_reinf_vehStat_dismounting_1",groupId _groupX,_textX];
					_groupX setVariable ["A3A_forceDismount", true];
					if (canMove _veh) then {
						{[_x] orderGetIn false; [_x] allowGetIn false} forEach assignedCargo _veh;
					} else {
						_veh allowCrewInImmobile false;
						{[_x] orderGetIn false; [_x] allowGetIn false} forEach units _groupX;
					}
				} else {
					_textX = format [localize "STR_A3A_reinf_vehStat_boarding_1",groupId _groupX,_textX];
					{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
				_groupX setVariable ["A3A_forceDismount", nil];
				};
			};
		};
	} forEach hcSelected player;
	if (_textX != "") then {[localize "STR_A3A_reinf_vehStat_header", format ["%1",_textX]] call A3A_fnc_customHint;};
};
_textX = "";
_groupX = (hcSelected player select 0);
player sideChat format [localize "STR_A3A_reinf_vehStat_sitrep",groupId _groupX];
_unitsX = units _groupX;
_textX = format [localize "STR_A3A_reinf_vehStat_sitrep_status",groupId _groupX,{alive _x} count _unitsX,{[_x] call A3A_fnc_canFight} count _unitsX,_groupX getVariable ["taskX","Patrol"],behaviour (leader _groupX)];
if ({[_x] call A3A_fnc_isMedic} count _unitsX > 0) then {_textX = format [localize "STR_A3A_reinf_vehStat_opmedic",_textX]} else {_textX = format [localize "STR_A3A_reinf_vehStat_no_opmedic",_textX]};
if ({_x call A3A_fnc_typeOfSoldier == "ATMan"} count _unitsX > 0) then {_textX = format [localize "STR_A3A_reinf_vehStat_aa",_textX]};
if ({_x call A3A_fnc_typeOfSoldier == "AAMan"} count _unitsX > 0) then {_textX = format [localize "STR_A3A_reinf_vehStat_at",_textX]};
if (!(isNull(_groupX getVariable ["mortarsX",objNull])) or ({_x call A3A_fnc_typeOfSoldier == "StaticMortar"} count _unitsX > 0)) then
	{
	if ({vehicle _x isKindOf "StaticWeapon"} count _unitsX > 0) then {_textX = format [localize "STR_A3A_reinf_vehStat_mortar",_textX]} else {_textX = format [localize "STR_A3A_reinf_vehStat_no_mortar",_textX]};
	}
else
	{
	if ({_x call A3A_fnc_typeOfSoldier == "StaticGunner"} count _unitsX > 0) then
		{
		if ({vehicle _x isKindOf "StaticWeapon"} count _unitsX > 0) then {_textX = format [localize "STR_A3A_reinf_vehStat_static",_textX]} else {_textX = format [localize "STR_A3A_reinf_vehStat_no_static",_textX]};
		};
	};

_veh = objNull;
{
_owner = _x getVariable "owner";
if (!isNil "_owner") then {if (_owner == _groupX) exitWith {_veh = _x}};
} forEach vehicles;
if (isNull _veh) then
	{
	{
	if ((!isNull objectParent _x) and (_x == driver _x) and !(vehicle _x isKindOf "StaticWeapon")) exitWith {_veh = vehicle _x};
	} forEach _unitsX;
	};
if !(isNull _veh) then
	{
	_textX = format [localize "STR_A3A_reinf_vehStat_current_veh",_textX,getText ((configOf _veh) >> "displayName")];
	if (!alive _veh) then
		{
		_textX = format [localize "STR_A3A_reinf_vehStat_current_veh_disabled",_textX];
		}
	else
		{
		if (!canMove _veh) then {_textX = format ["%1DISABLED<br/>",_textX]};
		if (count allTurrets [_veh, false] > 0) then
			{
			if (!canFire _veh) then {_textX = format [localize "STR_A3A_reinf_vehStat_current_gun_disabled",_textX]};
			if (someAmmo _veh) then {_textX = format [localize "STR_A3A_reinf_vehStat_ammo",_textX]};
			};
		_textX = format [localize "STR_A3A_reinf_vehStat_crew",_textX,{vehicle _x == _veh} count _unitsX,{alive _x} count _unitsX];
		};
	};
[localize "STR_A3A_reinf_vehStat_header", format ["%1",_textX]] call A3A_fnc_customHint;
