/*  Persistent loop to check whether player is idle and pass that information to the server

Scope: Client
Environment: Spawned

Arguments:
    None
*/

A3A_lastActiveTime = time;
A3A_lastPlayerDir = getDir player;

// In case commander is just controlling HC squads on the map
addMissionEventHandler ["HCGroupSelectionChanged", {
    if (player getVariable ["isAFK", false]) then {
        player setVariable ["isAFK", nil, [2, clientOwner]];
        [] spawn A3A_fnc_statistics;
    };
    A3A_lastActiveTime = time;
}];

while {true} do {
    sleep 10;
    private _oldDir = A3A_lastPlayerDir;
    A3A_lastPlayerDir = getDir player;
    private _UAVControlStatus = UAVControl (getConnectedUAV player);
    private _controllingUAV = (_UAVControlStatus select 0 isEqualTo player && {_UAVControlStatus select 1 isNotEqualTo ""}) ||
        {count _UAVControlStatus > 2 && {_UAVControlStatus select 2 isEqualTo player && {_UAVControlStatus select 3 isNotEqualTo ""}}};

    if (
        A3A_lastPlayerDir != _oldDir ||
        {vectorMagnitude velocity player > 0.1} || // "speed player" return zero for sideways walking/crawling
        {!A3A_isUAVAFK && {_controllingUAV || {shownUAVFeed}}} // player controlling a UGV/UAV or viewing its feed
    ) then {
        A3A_lastActiveTime = time;
        if (player getVariable ["isAFK", false]) then {
            player setVariable ["isAFK", nil, [2, clientOwner]];
            [] spawn A3A_fnc_statistics;
        };
        continue;
    };

    if (time - A3A_lastActiveTime > A3A_idleTimeout and !(player getVariable ["isAFK", false])) then { 
        player setVariable ["isAFK", true, [2, clientOwner]];
        [] spawn A3A_fnc_statistics;
        if (player == theBoss) then {
            [localize "STR_A3A_clientIdleChecker_header", localize "STR_A3A_clientIdleChecker_desc"] call A3A_fnc_customHint;
        };
    };
};
