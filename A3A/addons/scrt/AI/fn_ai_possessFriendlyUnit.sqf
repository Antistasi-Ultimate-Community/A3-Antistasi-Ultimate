/*
Maintainer: Socrates
   Posesses nearest AI unit with the ability to help player by his own hands (helps when AI got stuck somewhere). 
   Local only.

Return Value:
    <ARRAY> Units

Scope: Client
Environment: Any
Public: Yes

Example:
[(units player) select 0] call SCRT_fnc_ai_possessFriendlyUnit;
*/

#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_unit"];

if (_unit == Petros) exitWith {
	[localize "STR_control_unit_hint_header", localize "STR_control_unit_error_petros"] call A3A_fnc_customHint;
};
if (isPlayer _unit) exitWith {
	[localize "STR_control_unit_hint_header", localize "STR_control_unit_error_no_player"] call A3A_fnc_customHint;
};
if (!(alive _unit) or (_unit getVariable ["incapacitated",false]))  exitWith {
	[localize "STR_control_unit_hint_header", localize "STR_control_unit_error_alive_only"] call A3A_fnc_customHint;
};
if (side _unit != teamPlayer) exitWith {
	[localize "STR_control_unit_hint_header", format [localize "STR_control_unit_error_rebel_only",A3A_faction_reb get "name"]] call A3A_fnc_customHint;
};

private _owner = player getVariable ["owner",player];
if (_owner!=player) exitWith {
	[localize "STR_control_unit_hint_header", localize "STR_control_unit_error_ai_recursion"] call A3A_fnc_customHint;
};

private _face = face _unit;
private _speaker = speaker _unit;

player setVariable ["originalBody", player];
player setVariable ["A3A_blockRevive", true, true];

_unit setVariable ["owner",player,true];
_unit setVariable ["A3A_player", player]; // seems to be that owner might be somewhat affected by a lot of gameplay systems
private _originalBody = player;

private _playerEh = player addEventHandler ["HandleDamage", {
	private _player = _this select 0;
	_player removeEventHandler ["HandleDamage",_thisEventHandler];
	selectPlayer _player;
	(units group player) joinsilent group player;
	group player selectLeader player;
	_player setVariable ["controlReturned", true];

	[localize "STR_control_unit_hint_header", localize "STR_control_unit_damage_control_return_player"] call A3A_fnc_customHint;

	nil;
}];
private _unitEh = _unit addEventHandler ["HandleDamage", {
	private _unit = _this select 0;
	_unit removeEventHandler ["HandleDamage",_thisEventHandler];
	selectPlayer (_unit getVariable "A3A_player");
	(units group player) joinsilent group player;
	group player selectLeader player;
	_unit setVariable ["controlReturned", true];

	[localize "STR_control_unit_hint_header",localize "STR_control_unit_damage_control_return_ai"] call A3A_fnc_customHint;

	nil;
}];

selectPlayer _unit;
// group player selectLeader _unit; ///control should remain in player hands
//otherwise unit will lose his identity
[_unit, createHashMapFromArray [["face", _face], ["speaker", _speaker]]] call A3A_fnc_setIdentity;

private _timeX = aiControlTime;

private _returnActionId = _unit addAction [(localize "STR_antistasi_actions_return_control_to_ai"),{
	params ["_unit"];
	private _player = _unit getVariable "A3A_player";
	_unit setVariable ["controlReturned", true];
	selectPlayer _player;
}];
private _healActionId = [_originalBody, "heal2"] call A3A_fnc_flagaction; 

private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
[localize "STR_antistasi_actions_unconscious_action_possessed",0,0,3,0,0,_layer] spawn bis_fnc_dynamicText;

waitUntil {
	sleep 1; 
	[localize "STR_control_unit_hint_header", format [localize "STR_control_unit_time_to_return_to_original_body", _timeX]] call A3A_fnc_customHint; 
	_timeX = _timeX - 1; 

	_timeX == -1 || 
	{!([_unit] call A3A_fnc_canFight) || 
	{!(_originalBody getVariable ["incapacitated",false]) || 
	{_unit getVariable ["controlReturned", false] ||
	{_originalBody getVariable ["controlReturned", false]
}}}}};

_unit removeAction _returnActionId;
if (_healActionId != -1) then {
	_originalBody removeAction _healActionId;
};

selectPlayer _originalBody;
(units group player) joinsilent group player;
group player selectLeader player;
player setVariable ["A3A_blockRevive", nil, true];
player setVariable ["originalBody", nil];
player removeEventHandler ["HandleDamage",_playerEh];
player setVariable ["controlReturned", nil];

_unit setVariable ["controlReturned", nil];
_unit setVariable ["A3A_player", nil];
_unit removeEventHandler ["HandleDamage",_unitEh];

[localize "STR_control_unit_hint_header", localize "STR_control_unit_return_to_original_body"] call A3A_fnc_customHint;

sleep 1;

if (player getVariable ["incapacitated",false]) exitWith {
	player setVariable ["A3A_possessTime", time + 10];
	if (!isNil "respawnMenu") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu]};
	respawnMenu = (findDisplay 46) displayAddEventHandler ["KeyDown", SCRT_fnc_common_unconsciousEventHandler];
};