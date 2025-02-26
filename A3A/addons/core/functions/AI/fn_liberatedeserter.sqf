params ["_unit", "_playerX"];
if (!alive _unit) exitWith {
    [_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
};
[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
if (captive _playerX) then { _playerX setCaptive false };
_playerX globalChat (localize "STR_chats_loot_flee_player");
sleep 3;
[_unit] join group _playerX;
private _timeout = 10;
waituntil {sleep 1; _timeout = _timeout-1; _timeout < 0 or (local _unit and group _unit == group _playerX)};
if (_timeout < 0) exitWith {};
_unit globalChat (localize "STR_chats_loot_flee_response");
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
_unit enableAI "TARGET";
_unit enableAI "ANIM";
if (captive _unit) then { _unit setCaptive false };
