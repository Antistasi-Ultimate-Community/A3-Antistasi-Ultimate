private _positionOrigin = getMarkerPos [supportMarkerOrigin, true];
private _flareCount = round random [2,3,5];

if(!isNil "petros" && {alive petros}) then {
    petros sideChat (localize "STR_chats_barrage_flare");
};

private _timeOut = time + 30;
waitUntil {sleep 1; time > _timeOut };

{
    [petros, "support", localize "STR_comms_mp_flares"] remoteExec ["A3A_fnc_commsMP", _x];
} forEach ([500, _positionOrigin] call SCRT_fnc_common_getNearPlayers);

private _flareModel = selectRandom (A3A_faction_reb get "flares");

for "_i" from 1 to _flareCount do {
    private _randomizedPosition = [(_positionOrigin select 0) + random 50, (_positionOrigin select 1) + random 50, (_positionOrigin select 2) + random [150,175,200]];

    private _flare = _flareModel createVehicle _randomizedPosition;
    _flare setVelocity [-10 + random 20, -10 + random 20, -5];

    sleep 2;
    
    playSound3D [(selectRandom flareSounds), _flare, false,  getPosASL _flare, 1.5, 1, 450, 0];

    sleep 5;
};

isSupportMarkerPlacingLocked = false;
publicVariable "isSupportMarkerPlacingLocked";
