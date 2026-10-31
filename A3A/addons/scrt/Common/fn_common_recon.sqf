params ["_position", "_radius", "_revealTime", ["_isInterrogation", false]];

private _affectedEntities = ["Car","Truck","CAManBase", "StaticWeapon"];
private _timeOut = time + _revealTime;

private _enemyUnits = (nearestObjects [_position, _affectedEntities, _radius, true]) select { alive _x && {side _x == Occupants || {side _x == Invaders}}};
private _markers = [];

private _revealText = nil;

if (!isNil "_enemyUnits" && {_enemyUnits isNotEqualTo []}) then {
    {
        private _entityPosition = position _x;
        _entityPosition = [(_entityPosition select 0) + random 10, (_entityPosition select 1) + random 10, _entityPosition select 2];
        private _revealMarker = createMarker [format ["%1revealedEntity%2", random 10000, random 10000], _entityPosition];
        _revealMarker setMarkerShapeLocal "ELLIPSE";
        _revealMarker setMarkerAlphaLocal 0.9;
        _revealMarker setMarkerSizeLocal [10, 10];
        _revealMarker setMarkerColor "ColorRed";

        _markers pushBack _revealMarker;
    } forEach _enemyUnits;

    private _friendlyUnits = allUnits select {
        side (group _x) == teamPlayer && {_x distance2D _position < 500 && {[_x] call A3A_fnc_canFight}} 
    };

    {
        private _friendlyUnit = _x;
        {
            private _enemyUnit = _x;
            _friendlyUnit reveal [_enemyUnit, 2.5];
        } forEach _enemyUnits;
    } forEach _friendlyUnits;

    if (_isInterrogation) then {
        _revealText = localize "STR_comms_mp_recon_prisoner_success";
    } else {
        _revealText = localize "STR_comms_mp_recon_plane_success";
    };
} else {
    if (_isInterrogation) then {
        _revealText = localize "STR_comms_mp_recon_prisoner_fail";
    } else {
        _revealText = localize "STR_comms_mp_recon_plane_fail";
    };
};

{
    [petros, "support", _revealText] remoteExec ["A3A_fnc_commsMP", _x];
} forEach ([500, _position] call SCRT_fnc_common_getNearPlayers);

waitUntil {sleep 1; time > _timeOut};

{
    deleteMarker _x;
} forEach _markers;
