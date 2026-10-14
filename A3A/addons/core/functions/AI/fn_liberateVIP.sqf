params ["_unit", "_playerX"];

if ((side _playerX) isEqualTo civilian) exitWith {
    _failMessage = selectRandom [
        "STR_antistasi_actions_talk_with_civ_fail_notundercover1",
        "STR_antistasi_actions_talk_with_civ_fail_notundercover2"
    ];

    [_unit, (localize _failMessage)] remoteExec ["globalChat", _playerX];
};

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

_unit call BIS_fnc_ambientAnim__terminate; // The __ is intended... ty bohemia!

[_unit] join _playerX;

_unit globalChat (localize "STR_chats_town_vip_join");

_unit enableAI "PATH";