#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_overridePosition", []]];

Info("UAV Flyby random event init.");

if ((A3A_faction_riv get "vehiclesRivalsUavs") isEqualTo []) exitWith {
	Info("No supported UAVs, rerolling another event.");
    [UAVGRENADE] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
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


		if (_vehicles findIf {canMove _x && {alive _x && {(position _x) distance2D _originPosition < 75}}} != -1) then {
			{ 
				[
					"RivalsActivityDetected", 
					[
						format [localize "STR_rivals_activity_header",  A3A_faction_riv get "name"], 
						localize "STR_rivals_activity_drone_strike_description"
					]
				] remoteExec ["BIS_fnc_showNotification", _x];
			} forEach ((call BIS_fnc_listPlayers) select {side _x in [teamPlayer, civilian] && {(position _x) distance2D _originPosition < 125}});
			(selectRandom _vehicles) setVariable ["isNotified", true];
		};
	};
};

private _uavQuantity = switch (inactivityLevelRivals) do {
	case 5: {
		1
	};
	case 4: {
		round (random [1,2,2])
	};
	case 3: {
		round (random [1,2,3])
	};
	case 2: {
		round (random [2,2,4])
	};
	case 1: {
		round (random [2,3,4])
	};
};

Info_1("UAV quantity: %1", str _uavQuantity);

for "_i" from 0 to _uavQuantity - 1 do {
	private _finPosition = [_originPosition, 2500, (random 360)] call BIS_fnc_relPos;
	private _spawnPosition = [_originPosition, 1200, 1400, 0, 0, 1] call BIS_fnc_findSafePos;
	private _isHeavyShell = [] call SCRT_fnc_rivals_rollProbability;
	private _height = 50 + (random 75);

	if (!_isHeavyShell) then {
		_height = 50 + (random 25);
	};

	_spawnPosition pushBack ((_spawnPosition select 2) + _height);

	private _uav = createVehicle [selectRandom (A3A_faction_riv get "vehiclesRivalsUavs"), _spawnPosition, [], 0, "FLY"];
	private _angle =  [_spawnPosition,_originPosition] call BIS_fnc_dirTo;
	_uav setDir _angle;

#if __A3_DEBUG__
		_uav spawn {
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

	private _velocity = velocity _uav;
	private _direction = direction _uav;
	private _speed = 50;
	_uav setVelocity [
		(_velocity select 0) + (sin _direction * _speed),
		(_velocity select 1) + (cos _direction * _speed),
		(_velocity select 2)
	];

	[Rivals, _uav] call A3A_fnc_RivalsCreateVehicleCrew;
	[_uav, Rivals] call A3A_fnc_AIVEHinit;

	_vehicles pushBack _uav;

	private _hitEhId = _uav addEventHandler ["Hit", {
		params ["_unit", "_source", "_damage", "_instigator"];
		private _chargePos = getPosWorld _unit; 

		private _charge = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,0]; 
		_charge attachTo [_unit, [0,0,0]];
		_charge setPosWorld _chargePos; 
		_charge setDamage 1; 

		_unit removeEventHandler [_thisEvent, _thisEventHandler]; 
	}];
	_uav setVariable ["ehId", _hitEhId];


	private _groupUav = group (crew _uav select 0);
	_groups pushBack _groupUav;

	_uav flyInHeight _height;


	private _players = [1000, _originPosition] call SCRT_fnc_common_getNearPlayers;

	if (_players isEqualTo []) then {
		private _wp = _groupUav addWaypoint [_originPosition, 0];
		_wp setWaypointSpeed "FULL";
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointTimeout [4, 5, 6];

		if (_isHeavyShell) then {
			_wp setWaypointStatements [
				"true", 
				"private _uav = vehicle this; private _uavPos = position _uav; private _shell = (selectRandom (A3A_faction_riv get 'mortarAmmo')) createVehicle [_uavPos select 0, _uavPos select 1, (_uavPos select 2) - 4]; _shell setDir (getDir _uav); _shell setVectorDirAndUp [[0,0,-1],[0.1,0.1,1]]; _shell setVelocity [0,0,-50]; [_uav, _shell] remoteExecCall ['disableCollisionWith', 0, _shell]; _uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];"
			];
		} else {
			_wp setWaypointStatements [
				"true", 
				"private _uav = vehicle this; private _uavPos = position _uav; private _grenade = (selectRandom (A3A_faction_riv get 'handGrenadeAmmo')) createVehicle [_uavPos select 0, _uavPos select 1, (_uavPos select 2) - 4]; [_uav, _grenade] remoteExecCall ['disableCollisionWith', 0, _grenade]; _uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];"
			];
		};

		[_originPosition, _vehicles, _timeOut] spawn _fnc_notifyPlayers;
	} else {
		private _player = selectRandom _players;

		[_uav, _player, _isHeavyShell, _timeOut, _vehicles, _fnc_notifyPlayers] spawn {
			params ["_uav", "_player", "_isHeavyShell", "_timeOut", "_vehicles", "_fnc_notifyPlayers"];
			while {true} do {
				sleep 3;

				//UAVs should chase player
				_uav doMove (position _player);

				if (isNil "_uav") exitWith {};
				if (!alive _uav) exitWith {};

				if (_uav distance2D _player < 45) then {
					[(position _player), _vehicles, _timeOut] spawn _fnc_notifyPlayers;
				};

				if (_uav distance2D _player < 25) exitWith {
					if (_isHeavyShell) then {
						private _uavPos = position _uav; 
						private _shell = (selectRandom (A3A_faction_riv get "mortarAmmo")) createVehicle [_uavPos select 0, _uavPos select 1, (_uavPos select 2) - 4]; 
						_shell setDir (getDir _uav); 
						_shell setVectorDirAndUp [[0,0,-1],[0.1,0.1,1]]; 
						_shell setVelocity [0,0,-50]; [_uav, _shell] remoteExecCall ['disableCollisionWith', 0, _shell];
						_uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];
					} else {
						if ("BombDemine_01_F" in (weapons _uav)) then{
							[_uav, "BombDemine_01_F"] call BIS_fnc_fire;
							Info_1("Grenade Ammo Class: %1", "BombDemine_01_F");
							_uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];
						} else {
							if ("Bomb_40mm_HE_lxWS" in (weapons _uav)) then {
								[_uav, "Bomb_40mm_HE_lxWS"] call BIS_fnc_fire;
								Info_1("Grenade Ammo Class: %1", "Bomb_40mm_HE_lxWS");
								_uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];
							} else {
								private _uavPos = position _uav; 
								private _grenadeAmmoClass = selectRandom (A3A_faction_riv get "handGrenadeAmmo");
								Info_1("Grenade Ammo Class: %1", _grenadeAmmoClass);
								private _grenade = _grenadeAmmoClass createVehicle [_uavPos select 0, _uavPos select 1, (_uavPos select 2) - 4]; 
								[_uav, _grenade] remoteExecCall ['disableCollisionWith', 0, _grenade]; 
								_uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];
							};
						};
						
					};
				};
			};
		};
	};

	private _wp2 = _groupUav addWaypoint [_finPosition, 1];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointSpeed "FULL";
	_wp2 setWaypointTimeout [4, 5, 6];
	_wp2 setWaypointStatements [
		"true", 
		"private _uav = vehicle this; private _groupUav = group (crew _uav select 1); [_uav] spawn A3A_fnc_vehDespawner; [_groupUav] spawn A3A_fnc_groupDespawner; _uav removeEventHandler ['Hit', (_uav getVariable ['ehId', 0])];"
	];
};

waitUntil { sleep 5; 
	(time > _timeOut) || 
	(_vehicles findIf { !(canMove _x) } != -1) || 
	(_vehicles findIf { !alive (driver _x) } != -1)
};

{
	_x removeEventHandler ['Hit', (_x getVariable ['ehId', 0])];
	[_x] spawn A3A_fnc_vehDespawner;
} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isRivalEventInProgress = false;
publicVariableServer "isRivalEventInProgress";

rivalEventCooldown = [] call SCRT_fnc_rivals_getEventCooldown;
publicVariableServer "rivalEventCooldown";

Info("UAV Flyby random event cleanup.");