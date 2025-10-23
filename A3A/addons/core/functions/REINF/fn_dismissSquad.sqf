#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_groups"];

private ["_wp","_groupX","_veh"];

private _hr = 0;
private _resourcesFIA = 0;
private _leave = false;

{
	if ((groupID _x) in ["MineF", "Watch", "Post", "Road"]
		|| { isPlayer (leader _x)
		|| { (units _x) findIf { _x == petros } != -1 }})
	exitWith { _leave = true; };
} forEach _groups;

if (_leave) exitWith {[localize "STR_generic_dismiss_squads", localize "STR_A3A_reinf_dismiss_squad_no_special_squads"] call A3A_fnc_customHint;};

_pos = getMarkerPos respawnTeamPlayer;

{
	theBoss sideChat format [localize "STR_chats_send_back_to_base", _x,name petros];
	theBoss hcRemoveGroup _x;
	_wp = _x addWaypoint [_pos, 0];
	_wp setWaypointType "MOVE";
	sleep 3
} forEach _groups;

sleep 100;

private _assignedVehicles =	[];

{
	_groupX = _x;
	{
		if (alive _x) then
		{
			_hr = _hr + 1;
			_resourcesFIA = _resourcesFIA + (server getVariable [_x getVariable "unitType",0]) / 2;
			if (!isNull (assignedVehicle _x) and {isNull attachedTo (assignedVehicle _x)}) then
			{
				_assignedVehicles pushBackUnique (assignedVehicle _x);
			};
			_backpck = backpack _x;
			if (_backpck != "") then
			{
                private _assemblesTo = getText (configFile/"CfgVehicles"/_backpck/"assembleInfo"/"assembleTo");
				switch (true) do
				{
					case (_assemblesTo in (FactionGetRebel(A3A_faction_reb, "staticMortars"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
					case (_assemblesTo in (FactionGetRebel(A3A_faction_reb, "staticAA"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
					case (_assemblesTo in (FactionGetRebel(A3A_faction_reb, "staticMGs"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
					case (_assemblesTo in (FactionGetRebel(A3A_faction_reb, "staticAT"))): {_resourcesFIA = _resourcesFIA + ([_assemblesTo] call A3A_fnc_vehiclePrice)/2};
				};
			};
		};
		deleteVehicle _x;
	} forEach units _groupX;
	deleteGroup _groupX;
} forEach _groups;

{
	private _veh = _x;
	if !(typeOf _veh in FactionGet(all,"vehiclesReb")) then { continue };
	_resourcesFIA = _resourcesFIA + ([typeOf _veh] call A3A_fnc_vehiclePrice);
	{
		if !(typeOf _x in FactionGet(all,"vehiclesReb")) then { continue };
		_resourcesFIA = _resourcesFIA + ([typeOf _x] call A3A_fnc_vehiclePrice);
		deleteVehicle _x;
	} forEach attachedObjects _veh;
	deleteVehicle _veh;
} forEach _assignedVehicles;

_nul = [_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
