#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

if (!isServer and hasInterface) exitWith {};

params ["_typeX", "_positionTel", "_quantity", "_mine"];

private _typeExp = FactionGet(reb,"unitExp");
private _typeTruck = FactionGetTieredFT(A3A_faction_reb, "vehiclesTruck", 0) # 0;

private _costs = 2*(server getVariable _typeExp) + ([_typeTruck] call A3A_fnc_vehiclePrice);
[-2,(-1*_costs)] remoteExec ["A3A_fnc_resourcesFIA",2];

_index = _mine call jn_fnc_arsenal_itemType;
[_index,_mine,_quantity] call jn_fnc_arsenal_removeItem;

private _mrk = createMarker [format ["Minefield%1", random 1000], _positionTel];
_mrk setMarkerShapeLocal "ELLIPSE";
_mrk setMarkerSizeLocal [100,100];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerText (localize "STR_marker_minefield");

private _taskId = "Mines" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_reinf_minefield_task_desc",_quantity],"Minefield Deploy",_mrk],_positionTel,false,0,true,"map",true] call BIS_fnc_taskCreate;
[_taskId, "Mines", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _groupX = createGroup teamPlayer;

[_groupX, _typeExp, (getMarkerPos respawnTeamPlayer), [], 0, "NONE"] call A3A_fnc_createUnit;
sleep 1;
[_groupX, _typeExp, (getMarkerPos respawnTeamPlayer), [], 0, "NONE"] call A3A_fnc_createUnit;
_groupX setGroupId ["MineF"];

private _road = [getMarkerPos respawnTeamPlayer] call A3A_fnc_findNearestGoodRoad;
private _pos = position _road findEmptyPosition [1,30,_typeTruck];

private _truckX = _typeTruck createVehicle _pos;

_groupX addVehicle _truckX;
{[_x] spawn A3A_fnc_FIAinit; [_x] orderGetIn true} forEach units _groupX;
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
[_truckX] spawn A3A_fnc_vehDespawner;
leader _groupX setBehaviour "SAFE";
theBoss hcSetGroup [_groupX];
_truckX allowCrewInImmobile true;

waitUntil {sleep 1; (!alive _truckX) or ((_truckX distance _positionTel < 50) and ({alive _x} count units _groupX > 0))};

if ((_truckX distance _positionTel < 50) and ({alive _x} count units _groupX > 0)) then
	{
	if (isPlayer leader _groupX) then
		{
		_owner = (leader _groupX) getVariable ["owner",leader _groupX];
		(leader _groupX) remoteExec ["removeAllActions",leader _groupX];
		_owner remoteExec ["selectPlayer",leader _groupX];
		// (leader _groupX) setVariable ["owner",_owner,true];
		// {[_x] joinsilent group _owner} forEach units group _owner;
		// [group _owner, _owner] remoteExec ["selectLeader", _owner];
		"" remoteExec ["hint",_owner];
		waitUntil {!(isPlayer leader _groupX)};
		sleep 5;
		};
	theBoss hcRemoveGroup _groupX;
	[petros,"hint",localize "STR_hints_build_minefield_engie_start"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

	[_groupX, "Patrol_Area", 25, 50, 100, true, _positionTel, true] call A3A_fnc_patrolLoop;
	
	sleep 30;
	if ((alive _truckX) and ({alive _x} count units _groupX > 0)) then
		{
		{deleteVehicle _x} forEach units _groupX;
		deleteGroup _groupX;
		deleteVehicle _truckX;
		for "_i" from 1 to _quantity do {
			private _mineX = createMine [_typeX,_positionTel,[],100];
			teamPlayer revealMine _mineX;
		};
		[_taskId, "Mines", "SUCCEEDED"] call A3A_fnc_taskSetState;
		sleep 15;
		[_taskId, "Mines", 0] spawn A3A_fnc_taskDelete;
		[2,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
		}
	else
		{
		[_taskId, "Mines", "FAILED"] call A3A_fnc_taskSetState;
		sleep 15;
		theBoss hcRemoveGroup _groupX;
		[_taskId, "Mines", 0] spawn A3A_fnc_taskDelete;
		{deleteVehicle _x} forEach units _groupX;
		deleteGroup _groupX;
		deleteVehicle _truckX;
		deleteMarker _mrk;
		};
	}
else
	{
	[_taskId, "Mines", "FAILED"] call A3A_fnc_taskSetState;
	sleep 15;
	theBoss hcRemoveGroup _groupX;
	[_taskId, "Mines", 0] spawn A3A_fnc_taskDelete;
	{deleteVehicle _x} forEach units _groupX;
	deleteGroup _groupX;
	deleteVehicle _truckX;
	deleteMarker _mrk;
	};
