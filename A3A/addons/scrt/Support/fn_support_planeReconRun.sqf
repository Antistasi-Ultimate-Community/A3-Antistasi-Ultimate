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

if (hideEnemyMarkers) then {
    private _distance = hideEnemyMarkersReconPlaneDistance;
    [_positionDestination, _distance, _plane] spawn A3U_fnc_revealZonesDistance;
};

_plane setPosATL [getPosATL _plane select 0, getPosATL _plane select 1, 1000];
_plane disableAI "TARGET";
_plane disableAI "AUTOTARGET";
_plane flyInHeight 250;
private _minAltASL = ATLToASL [_positionX select 0, _positionX select 1, 0];
_plane flyInHeightASL [(_minAltASL select 2) +100, (_minAltASL select 2) +100, (_minAltASL select 2) +100];

driver _plane sideChat (localize "STR_chats_plane_run");
private _wp1 = group _plane addWaypoint [_positionOrigin, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";

private _relativePositions = [];

{
    private _relativePosition = [_positionDestination, 300, _x] call BIS_fnc_relPos;
    _relativePositions pushBack _relativePosition;
} forEach [0, 180];

{
    private _index = _forEachIndex + 1;
    private _wp = group _plane addWaypoint [_x, _index];
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointType "MOVE";

    if(_index == 1) then {
        _wp setWaypointStatements ["true", format ["if !(local this) exitWith {}; [%1, %2, %3] spawn SCRT_fnc_common_recon;isSupportMarkerPlacingLocked=false;publicVariable 'isSupportMarkerPlacingLocked';", _positionDestination, 350, 180]];
    };
} forEach _relativePositions;

_wp3 = group _plane addWaypoint [_finPosition, 3];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

private _timeOut = time + 600;
waitUntil { sleep 2; (currentWaypoint group _plane == 5) or (time > _timeOut) or !(canMove _plane) };

if (isSupportMarkerPlacingLocked) then {
    isSupportMarkerPlacingLocked = false;
    publicVariable "isSupportMarkerPlacingLocked";
};

if !(canMove _plane) then { sleep cleantime };
deleteVehicle _plane;
{deleteVehicle _x} forEach _planeCrew;
deleteGroup _groupPlane;