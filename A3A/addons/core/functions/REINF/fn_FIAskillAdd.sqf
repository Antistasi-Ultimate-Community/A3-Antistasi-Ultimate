#define SKILL_CAP 40

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (player != theBoss) exitWith {
    [
        localize "STR_notifiers_fail_type",
        format [localize "STR_notifiers_skill_header", FactionGet(reb, "name")],
        parseText (localize "STR_notifiers_skill_add_error_no_commander"),
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

if (skillFIA >= SKILL_CAP) exitWith {
    [
        localize "STR_notifiers_fail_type",
        format [localize "STR_notifiers_skill_header", FactionGet(reb, "name")],
        parseText (localize "STR_notifiers_skill_add_error_max"),
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

private _resourcesFIA = server getVariable "resourcesFIA";
private _costs = 1000 + (1.5*(skillFIA *750));

private _result = [(format["Are you sure? Price will be %2%1", _costs, A3A_faction_civ get "currencySymbol"]), "Confirm", true, true] call BIS_fnc_guiMessage;

if (_result isEqualTo false) exitWith {
    [
        localize "STR_notifiers_fail_type",
        format [localize "STR_notifiers_skill_header", FactionGet(reb, "name")],
        parseText localize "STR_notifiers_skill_cancelled",
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

if (_resourcesFIA < _costs) exitWith {
    [
        localize "STR_notifiers_fail_type",
        format [localize "STR_notifiers_skill_header", FactionGet(reb, "name")],
        parseText format [localize "STR_notifiers_skill_add_no_money", FactionGet(reb, "name"), _costs, A3A_faction_civ get "currencySymbol"],
        30
    ] spawn SCRT_fnc_ui_showMessage;
};

_resourcesFIA = _resourcesFIA - _costs;
skillFIA = skillFIA + 1;

[
    localize "STR_notifiers_success_type",
    format [localize "STR_notifiers_skill_header", FactionGet(reb, "name")],
    parseText format [(localize "STR_notifiers_skill_success"),skillFIA, FactionGet(reb, "name")],
    15
] spawn SCRT_fnc_ui_showMessage;

publicVariable "skillFIA";
server setVariable ["resourcesFIA",_resourcesFIA,true];

//update tooltip
_display = findDisplay 100;
if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 109;
    _ChildControl  ctrlSetTooltip format [localize "STR_A3A_fn_dialogs_dialogHQ_upgrade",1000 + (1.5*((skillFIA) *750)),skillFIA];
};

[] spawn A3A_fnc_statistics;
{
    _costs = server getVariable _x;
    _costs = round (_costs + (_costs * (skillFIA/840)));
    server setVariable [_x,_costs,true];
} forEach FactionGet(reb,"unitsSoldiers");


private _display = findDisplay 60000;
if !(str (_display) == "no display") then {
    private _title = _display displayCtrl 3102;
    _title ctrlSetText format [localize "STR_commander_menu_skill_level_title", FactionGet(reb, "name"), skillFIA, SKILL_CAP];
};