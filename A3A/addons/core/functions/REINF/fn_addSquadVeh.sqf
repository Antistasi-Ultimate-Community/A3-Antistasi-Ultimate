private ["_veh","_esStatic","_groupX","_maxCargo"];

if (count hcSelected player != 1) exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_select_1hc"] call A3A_fnc_customHint;};

_groupX = (hcSelected player select 0);

if ((groupId _groupX == "Watch") or (groupId _groupX == "MineF")) exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_already_Veh"] call A3A_fnc_customHint;};

_veh = cursorTarget;

_typeX = typeOf _veh;

if ((!alive _veh) or (!canMove _veh)) exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_destroyed_veh"] call A3A_fnc_customHint;};
if ({(alive _x) and (_x in _veh)} count allUnits > 0) exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_no_empty_veh"] call A3A_fnc_customHint;};
if (_veh isKindOf "StaticWeapon") exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_no_static"] call A3A_fnc_customHint;};

_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") then {_esStatic = true}} forEach units _groupX;
if (_esStatic) exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_no_static_2"] call A3A_fnc_customHint;};

//_maxCargo = (_veh emptyPositions "Cargo") + (_veh emptyPositions "Commander") + (_veh emptyPositions "Gunner") + (_veh emptyPositions "Driver");
_maxCargo = (getNumber (configFile >> "CfgVehicles" >> (_typeX) >> "transportSoldier")) + (count allTurrets [_veh, true]) + 1;
if ({alive _x} count units _groupX > _maxCargo) exitWith {[localize "STR_A3A_reinf_addSquadVeh_header", localize "STR_A3A_reinf_addSquadVeh_no_room"] call A3A_fnc_customHint;};

[localize "STR_A3A_reinf_addSquadVeh_header", format [localize "STR_A3A_reinf_addSquadVeh_success", groupId _groupX]] call A3A_fnc_customHint;
playSound "A3AP_UiSuccess";

_owner = _veh getVariable "owner";
if (!isNil "_owner") then
	{
	{unassignVehicle _x; _x leaveVehicle _veh} forEach units _owner;
	};

if (count allTurrets [_veh, false] > 0) then
			{
			_veh allowCrewInImmobile true;
			};

_groupX addVehicle _veh;
_veh setVariable ["owner",_groupX,true];

leader _groupX assignAsDriver _veh;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
