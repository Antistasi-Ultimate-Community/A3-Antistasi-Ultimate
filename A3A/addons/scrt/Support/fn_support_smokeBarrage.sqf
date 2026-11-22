private _positionOrigin = getMarkerPos [supportMarkerOrigin, true];
private _smokeCount = round random [3,4,5];
private _soundPool = ["A3\Sounds_f\weapons\smokeshell\smoke_1.wss", "A3\Sounds_f\weapons\smokeshell\smoke_2.wss", "A3\Sounds_f\weapons\smokeshell\smoke_3.wss"];

if(!isNil "petros" && {alive petros}) then {
    petros sideChat (localize "STR_chats_barrage_smoke");
};

private _timeOut = time + 30;
waitUntil {sleep 1; time > _timeOut };

{
    [petros, "support", localize "STR_comms_mp_smokes"] remoteExec ["A3A_fnc_commsMP", _x];
} forEach ([500, _positionOrigin] call SCRT_fnc_common_getNearPlayers);

for "_i" from 1 to _smokeCount do {
    private _randomizedPosition = [(_positionOrigin select 0) + random 15, (_positionOrigin select 1) + random 15, (_positionOrigin select 2) + random [90,110,125]];

    private _smokeRound = "Smoke_82mm_AMOS_White" createVehicle _randomizedPosition;
    _smokeRound setVelocity [-10 + random 20, -10 + random 20, -5];

    sleep 2;
    
    playSound3D [(selectRandom _soundPool), _smokeRound, false,  getPosASL _smokeRound, 1.5, 1, 450, 0];

    sleep 5;
};

isSupportMarkerPlacingLocked = false;
publicVariable "isSupportMarkerPlacingLocked";
