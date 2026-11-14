params ["_groups"];

if (player != theBoss) exitWith {[localize "STR_A3A_reinf_control_squad", localize "STR_A3A_reinf_control_squad_only_commander"] call A3A_fnc_customHint;};
if (captive player) exitWith {[localize "STR_A3A_reinf_control_squad", localize "STR_A3A_reinf_control_squad_no_undercover"] call A3A_fnc_customHint;};
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {[localize "STR_A3A_reinf_control_squad", localize "STR_A3A_reinf_control_squad_punishment"] call A3A_fnc_customHint;};

_groupX = _groups select 0;
_unit = leader _groupX;

if !([_unit] call A3A_fnc_canFight) exitWith {[localize "STR_A3A_reinf_control_squad", localize "STR_A3A_reinf_control_no_dead"] call A3A_fnc_customHint;};

while {(waypoints _groupX) isNotEqualTo []} do
 {
  deleteWaypoint ((waypoints _groupX) select 0);
 };

_wp = _groupX addWaypoint [getPos _unit,0];

{
if (!isNull objectParent _x) then
	{
	[_x] orderGetIn true;
	};
} forEach units group player;

hcShowBar false;
hcShowBar true;

_unit setVariable ["owner",player,true];
_eh1 = player addEventHandler ["HandleDamage", {
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	//removeAllActions _unit;
	selectPlayer _unit;
	(units group player) joinSilent group player;
	group player selectLeader player;
	[localize "STR_A3A_reinf_control_squad", localize "STR_A3A_reinf_control_return_damage_1"] call A3A_fnc_customHint;
	nil;
}];
_eh2 = _unit addEventHandler ["HandleDamage", {
	_unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	removeAllActions _unit;
	selectPlayer (_unit getVariable "owner");
	(units group player) joinSilent group player;
	group player selectLeader player;
	[localize "STR_A3A_reinf_control_squad", localize "STR_A3A_reinf_control_return_damage_2"] call A3A_fnc_customHint;
	nil;
}];
selectPlayer _unit;

_timeX = aiControlTime;

_unit addAction [localize "STR_antistasi_actions_return_control_to_ai",{selectPlayer (player getVariable ["owner",player])}];

waitUntil {sleep 1;
	[localize "STR_A3A_reinf_control_squad", format [localize "STR_control_unit_time_to_return_to_original_body", _timeX]] call A3A_fnc_customHint; 
	_timeX = _timeX - 1; 
	_timeX < 0 or {isPlayer theBoss}
};

removeAllActions _unit;
if (!isPlayer (_unit getVariable ["owner",_unit])) then {selectPlayer (_unit getVariable ["owner",_unit])};
_unit removeEventHandler ["HandleDamage",_eh2];
player removeEventHandler ["HandleDamage",_eh1];
(units group theBoss) joinSilent group theBoss;
group theBoss selectLeader theBoss;
[localize "STR_A3A_reinf_control_squad", ""] call A3A_fnc_customHint;
