#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_units"];

if (player != leader group player) exitWith {[localize "STR_A3A_reinf_dismiss_group_header", localize "STR_A3A_reinf_dismiss_group_no_leader"] call A3A_fnc_customHint;};

_units deleteAt (_units find player);
_units = _units select { !(isPlayer _x) && { !(_x == petros) } };
if (_units isEqualTo []) exitWith {};
if (_units findIf {!([_x] call A3A_fnc_canFight)} != -1) exitWith {[localize "STR_A3A_reinf_dismiss_group_header", localize "STR_A3A_reinf_dismiss_no_special_states"] call A3A_fnc_customHint;};

private _newGroup = createGroup teamPlayer;

{
	if ((_x getVariable "unitType") != FactionGet(reb,"unitUnarmed")) then {
		[_x] join _newGroup;
	};
} forEach _units;

if (recruitCooldown < time) then {recruitCooldown = time + 60} else {recruitCooldown = recruitCooldown + 60};

{_x domove getMarkerPos respawnTeamPlayer} forEach units _newGroup;

private _timeX = time + 120;

waitUntil {sleep 1; time > _timeX or {{(_x distance getMarkerPos respawnTeamPlayer < 50) and (alive _x)} count units _newGroup == {alive _x} count units _newGroup}};

private _hr = 0;
private _resourcesFIA = 0;
private _items = [];
private ["_hr","_unit"];

{
	_unit = _x;
	if ([_unit] call A3A_fnc_canFight) then {
		_resourcesFIA = _resourcesFIA + (server getVariable (_unit getVariable "unitType"));
		_hr = _hr +1;
		private _orgLoadout = flatten (_unit getVariable ["orgLoadout", []]);
		private _curLoadout = flatten (getUnitLoadout _unit);
		_items append (_curLoadout - _orgLoadout);
	};
	deleteVehicle _x;
} forEach units _newGroup;

[_hr,0] remoteExec ["A3A_fnc_resourcesFIA",2]; 
[_resourcesFIA] call A3A_fnc_resourcesPlayer;

{ boxX addItemCargoGlobal [_x, 1] } forEach (_items);
deleteGroup _newGroup;
