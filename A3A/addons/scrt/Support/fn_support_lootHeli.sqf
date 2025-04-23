#include "..\defines.inc"
FIX_LINE_NUMBERS()

private _isGatherSuccessful = false;

private _positionOrigin = getMarkerPos supportMarkerOrigin;
private _positionDestination = getMarkerPos supportMarkerDestination;

private _angle = [_positionOrigin, _positionDestination] call BIS_fnc_dirTo;
private _angleOrigin = _angle - 180;

private _intermediatePosition = [_positionDestination, 200, _angle] call BIS_fnc_relPos;

private _originPosition = [_positionOrigin, 1500, _angleOrigin] call BIS_fnc_relPos;
private _finPosition = [_positionDestination, 1500, _angle] call BIS_fnc_relPos;

private _heliType = selectRandom (A3A_faction_reb getOrDefault ["vehiclesCivHeli", []]);
private _heliData = [_originPosition, _angle, _heliType, teamPlayer] call A3A_fnc_spawnVehicle;
private _heli = _heliData select 0;
private _heliCrew = _heliData select 1;
private _groupHeli = _heliData select 2;

if (_heliType isEqualTo []) exitWith {
	["Support", "A helicopter is not available due to template issues. Apologies! You have been refunded."] call A3A_fnc_customHint;
	[0,2000] remoteExec ["A3A_fnc_resourcesFIA",2];
};

_heli setPosATL [getPosATL _heli select 0, getPosATL _heli select 1, 300];
_heli disableAI "TARGET";
_heli disableAI "AUTOTARGET";
_heli flyInHeight 120;

sleep 2;
private _lootCratePosition = (getPos _heli) vectorAdd [0, 0, -4];
private _lootCrate = createVehicle [A3A_faction_occ get "ammobox", _lootCratePosition, [], 0, "NONE"];
_lootCrate allowDamage false;
clearBackpackCargoGlobal _lootCrate;
clearItemCargoGlobal _lootCrate;
clearWeaponCargoGlobal _lootCrate;
clearMagazineCargoGlobal _lootCrate;
[_lootCrate] call A3A_Logistics_fnc_addLoadAction;
_heli setSlingLoad _lootCrate;

private _areaMarker = createMarkerLocal ["LootHeliAreaGlobalMarker", _positionDestination];
_areaMarker setMarkerShape "ELLIPSE";
_areaMarker setMarkerSize [250,250];
_areaMarker setMarkerType "hd_warning";
_areaMarker setMarkerColor "colorCivilian";
_areaMarker setMarkerBrush "Grid";

driver _heli sideChat (localize "STR_chats_loot_run");
private _wp1 = group _heli addWaypoint [_positionOrigin, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "NORMAL";
_wp1 setWaypointBehaviour "CARELESS";

_wp2 = group _heli addWaypoint [_intermediatePosition, 1];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "(vehicle this) flyInHeight 40;"];

waitUntil {_heli distance2D _positionDestination < 250 || {!alive _heli || !(canMove _heli) || {!([(driver _heli)] call A3A_fnc_canFight)}}};

if (!alive _heli || !(canMove _heli) || {!([(driver _heli)] call A3A_fnc_canFight)}) exitWith {
    deleteMarker _areaMarker;
    deleteMarker "LootHeliAreaGlobalMarker";
	Info_2("Helicopter is unable to loot area. Positions: %1, %2", str _positionOrigin, str _positionDestination);

	if (isSupportMarkerPlacingLocked) then {
		isSupportMarkerPlacingLocked = false;
		publicVariable "isSupportMarkerPlacingLocked";
	};
};

_wp3 = group _heli addWaypoint [_positionDestination, 2];
_wp3 setWaypointSpeed "NORMAL";
_wp3 setWaypointType "MOVE";
_wp3 setWaypointStatements ["true", "isSupportMarkerPlacingLocked=false;publicVariable 'isSupportMarkerPlacingLocked'"];

private _timeOut = time + 45;
waitUntil {time > _timeOut};

if (!alive _heli || !(canMove _heli) || {!([(driver _heli)] call A3A_fnc_canFight)}) exitWith {
    deleteMarker _areaMarker;
    deleteMarker "LootHeliAreaGlobalMarker";
	Info_2("Helicopter is unable to loot area. Positions: %1, %2", str _positionOrigin, str _positionDestination);

	if (isSupportMarkerPlacingLocked) then {
		isSupportMarkerPlacingLocked = false;
		publicVariable "isSupportMarkerPlacingLocked";
	};
};

[_lootCrate, 300, _positionDestination] remoteExec ["SCRT_fnc_loot_gatherLoot", 2];
_heli setSlingLoad objNull;

_isGatherSuccessful = true;

_timeOut = time + 3.5;
waitUntil {time > _timeOut};

deleteMarker _areaMarker;
deleteMarker "LootHeliAreaGlobalMarker";

{
    [petros, "support", format [localize "STR_comms_mp_loot_heli", A3A_faction_reb get "name"]] remoteExec ["A3A_fnc_commsMP", _x];
} forEach ([250, _positionDestination] call SCRT_fnc_common_getNearPlayers);

private _para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "NONE"];
_para setDir getDir _lootCrate;
_para setPos getPos _lootCrate;
_lootCrate attachTo [_para, [0, 0, -1.2]];

[_lootCrate, _para] spawn {
	params ["_obj","_para"];

	private _smokeShellVariants = ["SmokeShellRed", "SmokeShellGreen", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"];
		
	waitUntil {
		sleep 0.01;
		((position _obj) select 2) < 2 
		|| 
		isNull _para 
		|| 
		(count (lineIntersectsWith [getPosASL _obj, (getPosASL _obj) vectorAdd [0, 0, -0.5], _obj, _para])) > 0
	};
		
	_para disableCollisionWith _obj;
	_obj setVectorUp [0,0,1];
	_obj setVelocity [0,0,0];
	detach _obj;
	
	//mark landing with smoke
	_smokeShell = (selectRandom _smokeShellVariants) createVehicle (position _obj);

	if(sunOrMoon < 1) then {
		private _chemlightVariants = ["Chemlight_green", "Chemlight_red", "Chemlight_yellow", "Chemlight_blue"];
		_chemLight = (selectRandom _chemlightVariants) createVehicle (position _obj);
	};
	
	if (!isNull _para) then {deleteVehicle _para};
};

_wp4 = group _heli addWaypoint [_finPosition, 4];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointSpeed "FULL";
_wp4 setWaypointStatements ["true", "(vehicle this) flyInHeight 100;"];

private _timeOut = time + 600;
waitUntil { sleep 2; (currentWaypoint group _heli == 5) or (time > _timeOut) or !(canMove _heli)};

if (isSupportMarkerPlacingLocked) then {
    isSupportMarkerPlacingLocked = false;
    publicVariable "isSupportMarkerPlacingLocked";
};

if (!_isGatherSuccessful) then {
    deleteVehicle _lootCrate;
};

if !(canMove _heli) then { sleep cleantime };
deleteVehicle _heli;
{deleteVehicle _x} forEach _heliCrew;
deleteGroup _groupHeli;