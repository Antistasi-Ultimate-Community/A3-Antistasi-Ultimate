#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_overridePosition", []]];

Info("Helicopter raid random event init.");

if ((A3A_faction_riv get "vehiclesRivalsHelis") isEqualTo []) exitWith {
	Info("No helicopters defined, rerolling another event.");
    [HELIRAID] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _originPosition = nil;

if (_overridePosition isEqualTo []) then {
    _originPosition = [] call SCRT_fnc_rivals_findSuitableEncounterPosition;
} else {
    _originPosition = _overridePosition;
};

if (_originPosition isEqualTo []) exitWith {
	Error("No suitable position for event, cooldowning...");
    isRivalEventInProgress = false;
    publicVariableServer "isRivalEventInProgress";
    rivalEventCooldown = 300;
    publicVariableServer "rivalEventCooldown";
};

private _vehicles = [];
private _groups = [];
private _timeOut = time + 600;

private _fnc_notifyPlayers = {
	params ["_originPosition", "_vehicles", "_timeOut"];

	while {true} do {
		sleep 0.5;
		if (_vehicles findIf {_x getVariable ["isNotified", false]} != -1) exitWith {};
		if ((time > _timeOut) || 
			(_vehicles findIf { canMove _x } == -1) || 
			(_vehicles findIf { alive (driver _x) } == -1)
		) exitWith {};


		if (_vehicles findIf {canMove _x && {alive _x && {(position _x) distance2D _originPosition < 600}}} != -1) then {
			{ 
				[
					"RivalsActivityDetected", 
					[
						format [localize "STR_rivals_activity_header",  A3A_faction_riv get "name"], 
						format [localize "STR_rivals_activity_heli_raid_description",  A3A_faction_riv get "name"]
					]
				] remoteExec ["BIS_fnc_showNotification", _x];
			} forEach ((call BIS_fnc_listPlayers) select {side _x in [teamPlayer, civilian] && {(position _x) distance2D _originPosition < 125}});
			(selectRandom _vehicles) setVariable ["isNotified", true];
		};
	};
};

	private _finPosition = [_originPosition, 2500, (random 360)] call BIS_fnc_relPos;
	private _spawnPosition = [_originPosition, 1200, 1400, 0, 0, 1] call BIS_fnc_findSafePos;
	private _height = 150 + (random 75);

	_spawnPosition pushBack ((_spawnPosition select 2) + _height);

	private _heli = createVehicle [selectRandom (A3A_faction_riv get "vehiclesRivalsHelis"), _spawnPosition, [], 0, "FLY"];
	private _angle =  [_spawnPosition,_originPosition] call BIS_fnc_dirTo;
	_heli setDir _angle;

#if __A3_DEBUG__
	_heli spawn {
		while {alive _this} do {
			sleep 1;
			private _localMarker = createMarkerLocal [format ["%1test%2", random 10000, random 10000], (position _this)];
			_localMarker setMarkerSizeLocal [1,1];
			_localMarker setMarkerAlpha 1; 
			_localMarker setMarkerTypeLocal "hd_dot";
			_localMarker setMarkerColorLocal "ColorRed";
		};

		if (!alive _this) then {
			private _localMarker = createMarkerLocal [format ["%1test%2", random 10000, random 10000], (position _this)];
			_localMarker setMarkerSizeLocal [1,1];
			_localMarker setMarkerAlpha 1; 
			_localMarker setMarkerTypeLocal "KIA";
			_localMarker setMarkerColorLocal "ColorRed";	
		};
	};
#endif

private _velocity = velocity _heli;
private _direction = direction _heli;
private _speed = 50;
_heli setVelocity [
	(_velocity select 0) + (sin _direction * _speed),
	(_velocity select 1) + (cos _direction * _speed),
	(_velocity select 2)
];

private _groupHeli = [Rivals, _heli, A3A_faction_riv get "unitRifle"] call A3A_fnc_RivalsCreateVehicleCrew;
{
	[_x] call A3A_fnc_NATOinit;	
} forEach (units _groupHeli);
[_heli, Rivals] call A3A_fnc_AIVEHinit;

_vehicles pushBack _heli;
_groups pushBack _groupHeli;

_heli flyInHeight _height;

private _players = [3000, _originPosition] call SCRT_fnc_common_getNearPlayers;
private _lastPos = [];

if (_players isEqualTo []) then {
	private _wp = _groupHeli addWaypoint [_originPosition, 0];
	_wp setWaypointSpeed "FULL";
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointTimeout [4, 5, 6];

	_wp setWaypointStatements [
		"true", 
		"private _heli = vehicle this; private _heliPos = position _heli; private _bombType = selectRandomWeighted ['HE', 1.5, 'CLUSTER', 1.25, 'CHEMICAL', 1]; private _bombParams = [_heli, _bombType, 1, 200, true]; _bombParams spawn A3A_fnc_airbomb;"
	];

	[_originPosition, _vehicles, _timeOut] spawn _fnc_notifyPlayers;
} else {
	private _player = selectRandom _players;
	private _leave = false;

	private _wp = _groupHeli addWaypoint [(position _player), 0];
	_wp setWaypointSpeed "FULL";
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";

	while {true} do {
		sleep 4;

		deleteWaypoint [_groupHeli, 0];
		wp = _groupHeli addWaypoint [(position _player), 0];
		_wp setWaypointSpeed "FULL";
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";

		if (isNil "_heli") exitWith {};
		if (!alive _heli) exitWith {};

		if (_heli distance2D _player < 600) then {
			[(position _player), _vehicles, _timeOut, true] spawn _fnc_notifyPlayers;
		};

		if (_heli distance2D _player < 500) exitWith {
			_lastPos = position _player;
			private _bombType = selectRandomWeighted ["HE", 1.5, "CLUSTER", 1.25, "CHEMICAL", 1];
			private _bombParams = [_heli, _bombType, 1, 200];
			_bombParams spawn A3A_fnc_airbomb;
		};
	};
};

if (_lastPos isNotEqualTo [] && {getPylonMagazines _heli isNotEqualTo [] && {canMove _heli && {alive _heli && {([driver _heli] call A3A_fnc_canFight)}}}}) then {
	[_heli, _groupHeli, _lastPos] spawn A3A_fnc_attackHeli;

	waitUntil { 
		sleep 5; 
		(time > _timeOut) || 
		!(canMove _heli) ||
		!(alive _heli) ||
		!([driver _heli] call A3A_fnc_canFight)
	};
};

private _wp2 = _groupHeli addWaypoint [_finPosition, 1];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointTimeout [4, 5, 6];
_wp2 setWaypointStatements [
	"true", 
	"private _heli = vehicle this; private _groupHeli = group (crew _heli select 1); [_heli] spawn A3A_fnc_vehDespawner; [_groupHeli] spawn A3A_fnc_groupDespawner;"
];

waitUntil { sleep 5; 
	(time > _timeOut) || 
	(_vehicles findIf { !(canMove _x) } != -1) || 
	(_vehicles findIf { !alive (driver _x) } != -1)
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isRivalEventInProgress = false;
publicVariableServer "isRivalEventInProgress";

rivalEventCooldown = [] call SCRT_fnc_rivals_getEventCooldown;
publicVariableServer "rivalEventCooldown";

Info("Helicopter raid random event cleanup.");