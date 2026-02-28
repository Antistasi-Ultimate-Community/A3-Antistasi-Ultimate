#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Logistics for Salvage
if (!isServer and hasInterface) exitWith {};

Info("Creating Salvage mission");

private _positionX = getMarkerPos _markerX;

//Sunken ship that was carrying the box to spawn in
private _shipType = "Land_UWreck_FishingBoat_F";

//Select possible locations for sunken treasure
private _firstPos = round (random 1000) + 150;
private _mrk1Pos = (selectRandom (selectBestPlaces [_positionX, _firstPos,"waterDepth", 20, 20]) select 0) + [0];
private _mrk2Pos = (selectRandom (selectBestPlaces [_mrk1Pos, 300,"waterDepth", 20, 20]) select 0) + [0];
private _mrk3Pos = (selectRandom (selectBestPlaces [_mrk2Pos, 300,"waterDepth", 20, 20]) select 0) + [0];

//Create markers for treasure locations!
private _mrk1 = createMarker ["salvageLocation1", _mrk1Pos];
_mrk1 setMarkerShape "ELLIPSE";
_mrk1 setMarkerSize [25, 25];
private _mrk2 = createMarker ["salvageLocation2", _mrk2Pos];
_mrk2 setMarkerShape "ELLIPSE";
_mrk2 setMarkerSize [25, 25];
private _mrk3 = createMarker ["salvageLocation3", _mrk3Pos];
_mrk3 setMarkerShape "ELLIPSE";
_mrk3 setMarkerSize [25, 25];

Debug_3("Salvage Mission Positions: %1, %2, %3", _mrk1Pos, _mrk2Pos, _mrk3Pos);

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);

//Type of salvage crate to spawn
private _boxType = _faction get "equipmentBox";

private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

//Name of seaport marker
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _title = localize "STR_A3A_Missions_LOG_Salvage_task_header";
private _text = format [localize "STR_A3A_Missions_LOG_Salvage_task_desc", _nameDest, _displayTime];
private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer, civilian], _taskId, [ _text, _title, [_mrk1, _mrk2, _mrk3]], _positionX, false, 0, true, "rearm", true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

//salvageRope action
[] remoteExec ["A3A_fnc_SalvageRope", 0, true];

Debug("Mission created, waiting for players to get near");
waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))};
Debug("players in spawning range, starting spawning");

private _boxPos = selectRandom [_mrk1Pos, _mrk2Pos, _mrk3Pos];
private _markers = [_mrk1Pos, _mrk2Pos, _mrk3Pos];
private _shipPos = _boxPos vectorAdd [4, -5, 2];

private _ship = _shipType createVehicle _shipPos;
private _box = _boxType createVehicle _boxPos;

//Used in salvage rope
_box setVariable ["SalvageCrate", true, true];
private _crateContents = selectRandom [
	[_box, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 10, 5, 10, 0, 0],
	[_box, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0],
	[_box, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];
_crateContents call A3A_fnc_fillLootCrate;
[_box] remoteExec ["SCRT_fnc_common_addActionMove", [teamPlayer, civilian], _box];
Debug("Box spawned");

//Create boat and initialise crew members
Debug("Spawning patrol boat and crew");
private _typeVeh = if (_difficultX) then { selectRandom (_faction get "vehiclesGunBoats") } else { selectRandom (_faction get "vehiclesTransportBoats") };
private _typeGroup = if _difficultX then {selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)} else {selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier)};
private _boatSpawnLocation = selectRandom [_mrk1Pos, _mrk2Pos, _mrk3Pos];

private _typeSDV = _faction getOrDefault ["vehiclesSDV", ""];
if (_typeSDV != "") then {
	private _diverType = "";
	private _diversGroup = createGroup _sideX;
	private _diversGroup2 = createGroup _sideX;
   _typeSDV = selectRandom (_faction get "vehiclesSDV");
   if (_typeSDV == "I_SDV_01_F") then {
		_diverType = "I_diver_F";
   };
   if (_typeSDV == "O_SDV_01_F") then {
		_diverType = "O_diver_F";
   };
   if (_typeSDV == "B_SDV_01_F") then {
		_diverType = "B_diver_F";
   };
   if (_typeSDV == "EF_B_SDV_01_MJTF_Des") then {
		_diverType = "EF_B_Marine_Diver_Des";
   };
   for "_i" from 1 to 2 do {
		private _SDVmarker = selectRandom [_mrk1Pos, _mrk2Pos, _mrk3Pos];
		private _vehSDV = createVehicle [_typeSDV, _SDVmarker, [], 30, "NONE"];
		_vehSDV setPos [getPos _vehSDV select 0, getPos _vehSDV select 1, (getPos _vehSDV select 2) - 7];
		[_vehSDV, _sideX] call A3A_fnc_AIVEHinit;
		for "_i" from 1 to 2 do {
			private _diver = _diversGroup createUnit [_diverType, getPos _vehSDV, [], 10, "NONE"];
			_diver setPos [getPos _diver select 0, getPos _diver select 1, (getPos _diver select 2) - 8];
			[_diver] call A3A_fnc_NATOinit;
   		};
		for "_i" from 1 to 2 do {
			private _diver = _diversGroup2 createUnit [_diverType, getPos _vehSDV, [], 10, "NONE"];
			_diver setPos [getPos _diver select 0, getPos _diver select 1, (getPos _diver select 2) - 8];
			[_diver] call A3A_fnc_NATOinit;
   		};
   };
	private _diversWaypoint = _diversGroup addWaypoint [selectRandom _markers, 30];
	_diversWaypoint setWaypointType "SAD";
	_diversGroup setCurrentWaypoint _diversWaypoint;
	private _divers2Waypoint = _diversGroup2 addWaypoint [selectRandom _markers, 30];
	_divers2Waypoint setWaypointType "SAD";
	_diversGroup2 setCurrentWaypoint _divers2Waypoint;
};

private _veh = createVehicle [_typeVeh, _boatSpawnLocation, [], 0, "NONE"];
[_veh, _sideX] call A3A_fnc_AIVEHinit;
private _vehCrewGroup = [_positionX,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
private _vehCrew = units _vehCrewGroup;
{_x moveInAny _veh} forEach (_vehCrew);
_vehCrewGroup addVehicle _veh;
{[_x,""] call A3A_fnc_NATOinit} forEach _vehCrew;

//While the boat is alive, we remove undercover from nearby players
[_veh, [_mrk1Pos, _mrk2Pos, _mrk3Pos]] spawn {
	params ["_veh", "_positions"];
	while {alive _veh} do {
		sleep 2;
		private _nearbyPlayers = allPlayers inAreaArray [getPos _veh, 150, 150];
		{ [_x, false] remoteExec ["setCaptive", _x] } forEach _nearbyPlayers;

		private _vehGroup = group _veh;
		if (_vehGroup != grpNull && {currentWaypoint _vehGroup == count waypoints _vehGroup}) then {
			private _newWaypoint = _vehGroup addWaypoint [selectRandom _positions, 30];
			_newWaypoint setWaypointType "MOVE";
			_vehGroup setCurrentWaypoint _newWaypoint;
		};
	};
};

//Disable simulation if we *really* want to
Debug("Waiting for salvage mission end");
waitUntil {sleep 1; dateToNumber date > _dateLimitNum or {(_box distance2D posHQ) < 100}};

private _timeout = false;
if (dateToNumber date > _dateLimitNum) then {
	_timeout = true;
	waitUntil {sleep 1; (_box distance2D posHQ) < 100 || {allPlayers inAreaArray [getPos _box, 50, 50] isEqualTo [] || {isNull _box}}};
};

private _bonus = if (_difficultX) then {2} else {1};

if (_timeout && alive _box) then {
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
	[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    Info("Mission Failed");
	deleteVehicle _box;
} else {
	[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
	[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	{ 
		[30,_x] call A3A_fnc_addScorePlayer;
    	[300 * _bonus,_x] call A3A_fnc_addMoneyPlayer;
	} forEach (call SCRT_fnc_misc_getRebelPlayers);
	[10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    [100*_bonus,theBoss, true] call A3A_fnc_addMoneyPlayer;
    Info("Mission Succeeded");
};

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
Debug("set delete task timer");

deleteMarker _mrk1;
deleteMarker _mrk2;
deleteVehicle _ship;

[_vehCrewGroup] spawn A3A_fnc_groupDespawner;
[_veh] spawn A3A_fnc_vehDespawner;
if (_typeSDV != "") then {
	[_SDVcrewGroup] spawn A3A_fnc_groupDespawner;
	[_diversGroup] spawn A3A_fnc_groupDespawner;
	[_vehSDV] spawn A3A_fnc_vehDespawner;
};
