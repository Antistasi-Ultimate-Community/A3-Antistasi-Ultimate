private _positionOrigin = getMarkerPos supportMarkerOrigin;
private _positionDestination = getMarkerPos supportMarkerDestination;
private _angle = [_positionOrigin, _positionDestination] call BIS_fnc_dirTo;
private _angleOrigin = _angle - 180;

private _originPosition = [_positionOrigin, 2500, _angleOrigin] call BIS_fnc_relPos;
private _finPosition = [_positionDestination, 2500, _angle] call BIS_fnc_relPos;

private _planeData = [_originPosition, _angle, selectRandomWeighted (A3A_faction_reb get "vehiclesPlane"), teamPlayer] call A3A_fnc_spawnVehicle;
private _plane = _planeData select 0;
private _planeCrew = _planeData select 1;
private _groupPlane = _planeData select 2;

private _isHelicopter = _plane isKindOf "helicopter";

_plane setPosATL [getPosATL _plane select 0, getPosATL _plane select 1, if (_isHelicopter) then {100} else {1000}];
_plane disableAI "TARGET";
_plane disableAI "AUTOTARGET";
_plane flyInHeight 120;
private _minAltASL = ATLToASL [_positionDestination select 0, _positionDestination select 1, 0];
_plane flyInHeightASL [(_minAltASL select 2) +120, (_minAltASL select 2) +120, (_minAltASL select 2) +120];

driver _plane sideChat (localize "STR_chats_plane_run");
private _wp1 = group _plane addWaypoint [_positionOrigin, 0];
_wp1 setWaypointType "MOVE";
if (!_isHelicopter) then { _wp1 setWaypointSpeed "LIMITED" };
_wp1 setWaypointBehaviour "CARELESS";

private _text = nil;

switch (supportType) do {
	case ("SUPPLY"): {
		_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1', '%2'] spawn SCRT_fnc_common_supplyDrop", "IG_supplyCrate_F", supportType]];
		_text = localize "STR_comms_mp_supply";
	};
	case ("VEH_AIRDROP"): {
		_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1', '%2'] spawn SCRT_fnc_common_supplyDrop", selectRandomWeighted (A3A_faction_reb get "vehiclesBasic"), supportType]];
		_text = localize "STR_comms_mp_light_veh";
	};
	case ("NAPALM");
    case ("HE");
    case ("CLUSTER");
    case ("CHEMICAL"): {
		_text = format [localize "STR_comms_mp_airstrike", supportType];

		private _bombCount = switch (supportType) do {
			case "CHEMICAL": {
				1;
			};
			case "NAPALM";
			case "CLUSTER": {
				2;
			};
			default {
				4;
			};
		};

		private _distance = _positionOrigin distance2D _positionDestination;
		private _bombParams = [_plane, supportType, _bombCount, _distance];

		(driver _plane) setVariable ["bombParams", _bombParams, true];

		[_positionOrigin, driver _plane] spawn {
			params ["_pos", "_pilot"];
			waitUntil {sleep 0.1; ((_pos distance2D _pilot) < 250) || {isNull (objectParent _pilot)}};
			if(isNull (objectParent _pilot)) exitWith {};
			(_pilot getVariable 'bombParams') remoteExec ["A3A_fnc_airbomb", 2];
		};
	};
};

_wp2 = group _plane addWaypoint [_positionDestination, 1];
if (!_isHelicopter) then { _wp2 setWaypointSpeed "LIMITED" };
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "isSupportMarkerPlacingLocked=false;publicVariable 'isSupportMarkerPlacingLocked';"];

_wp3 = group _plane addWaypoint [_finPosition, 2];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

sleep 50;


if (canMove _plane && {alive _plane}) then {
	{
    	[petros, "support", _text] remoteExec ["A3A_fnc_commsMP", _x];
	} forEach ([1000, _positionDestination] call SCRT_fnc_common_getNearPlayers);
};


private _timeOut = time + 600;
waitUntil { sleep 2; (currentWaypoint group _plane == 4) or (time > _timeOut) or !(canMove _plane) };

if (isSupportMarkerPlacingLocked) then {
    isSupportMarkerPlacingLocked = false;
    publicVariable "isSupportMarkerPlacingLocked";
};

if !(canMove _plane) then { sleep cleantime };
deleteVehicle _plane;
{deleteVehicle _x} forEach _planeCrew;
deleteGroup _groupPlane;