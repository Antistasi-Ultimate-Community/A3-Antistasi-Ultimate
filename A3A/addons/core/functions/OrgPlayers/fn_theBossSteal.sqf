#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#define MONEY_AMOUNT 500

private _resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < MONEY_AMOUNT) exitWith {
    [
        localize "STR_notifiers_fail_type",
        format [localize "STR_notifiers_boss_steal_header", A3A_faction_reb get "name"],
        parseText format [localize "STR_notifiers_boss_steal_fail", A3A_faction_reb get "name"],
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

private _ratingLoss = round (MONEY_AMOUNT / 100);

server setVariable ["resourcesFIA", _resourcesFIA - MONEY_AMOUNT, true];
[-_ratingLoss,theBoss] call A3A_fnc_addScorePlayer;
[MONEY_AMOUNT] call A3A_fnc_resourcesPlayer;

[
    localize "STR_notifiers_success_type",
    format [localize "STR_notifiers_boss_steal_header", A3A_faction_reb get "name"],
    parseText format [localize "STR_notifiers_boss_steal_success", str MONEY_AMOUNT, A3A_faction_reb get "name", A3A_faction_civ get "currencySymbol"],
    15
] spawn SCRT_fnc_ui_showMessage;
