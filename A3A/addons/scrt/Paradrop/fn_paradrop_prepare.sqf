
private _players = [] call SCRT_fnc_paradrop_getPlayersToParadrop;

if (_players isEqualTo []) exitWith {};

private _plane = (A3A_faction_reb get "vehiclesPlane") # 0;

private _totalSeats = [_plane, true] call BIS_fnc_crewCount;
private _crewSeats = [_plane, false] call BIS_fnc_crewCount;
private _cargoSeats = _totalSeats - _crewSeats;

if (_cargoSeats < count _players) then {
    _players = [_players] call BIS_fnc_arrayShuffle;
};

{
   [] remoteExec ["SCRT_fnc_paradrop_movePlayerToPlane", _x];
} forEach _players;
