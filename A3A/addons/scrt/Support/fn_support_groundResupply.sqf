#include "..\defines.inc"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {};

private _position = markerPos supportMarkerOrigin;

private _crewType = A3A_faction_reb get "unitCrew";
private _squadType = [_crewType];
private _truckType = selectRandom (A3A_faction_reb get "vehiclesTruck");

_groupX = [getMarkerPos respawnTeamPlayer, teamPlayer, _squadType] call A3A_fnc_spawnGroup;
_road = [getMarkerPos respawnTeamPlayer] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30,_truckType];
_truckX = _truckType createVehicle _pos;
_truckX setDir (getDir _truckX + (_truckX getRelDir _road));
_groupX addVehicle _truckX;
{
    [_x] call A3A_fnc_FIAinit
} forEach units _groupX;
leader _groupX setBehaviour "SAFE";
(units _groupX) orderGetIn true;

private _units = units _groupX;

_boxX = "IG_supplyCrate_F" createVehicle position _truckX;
_boxX remoteExecCall ["SCRT_fnc_common_fillSupplyDrop", 2];
[_boxX] call A3A_Logistics_fnc_addLoadAction;
private _canLoad = [_truckX, _boxX] call A3A_Logistics_fnc_canLoad;
if (_canLoad isEqualType []) then { _canLoad remoteExec ["A3A_Logistics_fnc_load", 2] };

waitUntil { sleep 1; vehicle leader _groupX isEqualTo _truckX };
// ? why in the actual f*** does the driver refuse to move and then delete the waypoint unless I move the vehicle first?!
// ? not needed unless loading cargo for some reason
// ? I don't think it's a race condition thing, adding sleep before waypoint has no effect
_truckX setPos (_pos vectorAdd [1,0,0]);
private _wp = _groupX addWaypoint [_position, 0];
_wp setWaypointSpeed "NORMAL";
_wp setWaypointType "MOVE";

waitUntil {
	sleep 1;
	(_units findIf {[_x] call A3A_fnc_canFight} == -1 || 
	{{alive _x && {_x distance _position < 35}} count units _groupX > 0})
};

if !(_units findIf {[_x] call A3A_fnc_canFight && {_x distance _position < 35}} != -1) exitWith {};

if (isPlayer leader _groupX) then {
	_owner = (leader _groupX) getVariable ["owner",leader _groupX];
	(leader _groupX) remoteExec ["removeAllActions",leader _groupX];
	_owner remoteExec ["selectPlayer",leader _groupX];
	"" remoteExec ["hint",_owner];
	waitUntil {!(isPlayer leader _groupX)};
	sleep 5;
};

waitUntil {sleep 0.1; speed _truckX <1 };
if (!isNull attachedTo _boxX) then {
	// keep unloading cargo until the supply box is unloaded, in case somehow more cargo is loaded into the vehicle before setting waypoint
	while {!isNull attachedTo _boxX} do {
		[_truckX] call A3A_Logistics_fnc_unload;
		sleep 5;
	};
};

private _leader = leader _groupX;
if(!isNil "_leader" && {alive _leader}) then { _leader sideChat localize "STR_chats_airdrop_pilot_drop_cargo_end" };

[[_groupX]] remoteExec ["A3A_fnc_dismissSquad", 2];

if (isSupportMarkerPlacingLocked) then {
    isSupportMarkerPlacingLocked = false;
    publicVariable "isSupportMarkerPlacingLocked";
};
