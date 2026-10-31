params ["_unit", "_playerX"];

if (!alive _unit) exitWith {
    [_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
};

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

if (captive _playerX) then { _playerX setCaptive false };

_playerX globalChat (localize "STR_chats_loot_flee_player");
_unit setDir (getDir _playerX);
_playerX playMove "MountSide";
sleep 5;
_playerX playMove "";

_unit globalChat (localize "STR_chats_loot_flee_response");
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
[_unit, true] spawn A3A_fnc_FIAInit;
if (captive _unit) then { _unit setCaptive false };

[_unit] spawn {
    params ["_prisoner"];
    waitUntil { sleep 0.5; !captive _prisoner || {!alive _prisoner}};

    if (alive _prisoner && {!captive _prisoner}) then {
        sleep 2;
        private _text = selectRandom [
            (localize "STR_chats_prisoner_free_1"),
            (localize "STR_chats_prisoner_free_2"),
            (localize "STR_chats_prisoner_free_3")
        ];

        [_prisoner, "sideChat", _text] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
        [_prisoner, teamPlayer, false] remoteExec ["A3A_fnc_fleeToSide", _prisoner];
        sleep 30;
        [1,0] remoteExec ["A3A_fnc_resourcesFIA",2];
        deleteVehicle _prisoner;
    };
};
