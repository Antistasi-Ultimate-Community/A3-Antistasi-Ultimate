#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_donateMoney

Description:
    Handles transferring funds from the player to either the faction or a 
    specific player. Now supports variable amounts and remote targeting.

Parameters:
    0: _target - The player to receive the funds (Default: objNull) <OBJECT>
    1: _amount - The amount of money to transfer (Default: 250) <NUMBER>
---------------------------------------------------------------------------- */

params [
    ["_target", objNull, [objNull]],
    ["_amount", 250, [0]]
];

private _resourcesPlayer = player getVariable ["moneyX", 0];
private _currency = A3A_faction_civ getOrDefault ["currencySymbol", "$"];

// Error: Trying to send 0 or negative money
if (_amount <= 0) exitWith {
    [localize "STR_A3A_OrgPlayers_donateMoney_header", "Amount must be greater than zero."] call SCRT_fnc_misc_deniedHint;
};

// Error: Player doesn't have enough money for the requested amount
if (_resourcesPlayer < _amount) exitWith {
    [
        localize "STR_A3A_OrgPlayers_donateMoney_header", 
        format ["Insufficient funds. You only have %1%2.", _resourcesPlayer, _currency]
    ] call SCRT_fnc_misc_deniedHint;
};

// Donate to Faction (Legacy Antistasi logic triggers when called with no arguments)
if (count _this == 0) exitWith {
    [0, _amount] remoteExec ["A3A_fnc_resourcesFIA", 2];
    private _pointsXJ = (player getVariable ["score", 0]) + 1;
    player setVariable ["score", _pointsXJ, true];
    [-_amount] call A3A_fnc_resourcesPlayer;
    
    [localize "STR_A3A_OrgPlayers_donateMoney_header", format [localize "STR_A3A_OrgPlayers_donateMoney_success", _currency]] call A3A_fnc_customHint;
};

// Fallback to cursorTarget if no explicit target was passed (Legacy Action Menu)
if (isNull _target) then {
    _target = cursorTarget;
};

// Error: Target is invalid, not a player, or is the sender
if (!isPlayer _target || _target == player) exitWith {
    [localize "STR_A3A_OrgPlayers_donateMoney_header", localize "STR_A3A_OrgPlayers_donateMoney_no_player"] call SCRT_fnc_misc_deniedHint;
};

// Process Player-to-Player Transfer
[-_amount] call A3A_fnc_resourcesPlayer;
[_amount] remoteExec ["A3A_fnc_resourcesPlayer", _target];

[
    localize "STR_A3A_OrgPlayers_donateMoney_header", 
    format [localize "STR_A3A_OrgPlayers_donateMoney_player", name _target, _currency, _amount]
] call A3A_fnc_customHint;