/*
Author: Wurzel0701
    Checks if the player is able to go undercover

Arguments:
    <NIL>

Return Value:
    ARRAY<BOOL, STRING> The result of the check and a small reason

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <OBJECT> A3A_faction_civ
    <ARRAY> controlsX
    <ARRAY> airportsX
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> undercoverVehicles
    <ARRAY> allArmoredHeadgear
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <SIDE> Invaders
    <SIDE> Occupants

Example:
    [] call A3A_fnc_canGoUndercover;
*/

#include "..\..\script_component.hpp"

private _reasons = [];

if (player != player getVariable["owner", player]) exitWith
{
    ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_ai"] call A3A_fnc_customHint;
    [false, "No Undercover while controlling AI"];
};

if (captive player) exitWith
{
    ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_already"] call A3A_fnc_customHint;
    [false, "Already undercover"];
};

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

private _roadblocks = controlsX select {isOnRoad(getMarkerPos _x)};

if (_lowCiv || {_civNonHuman}) exitWith {
    [localize "STR_A3A_goUndercover_title", localize "STR_A3A_fn_undercover_canGoUn_no_lowciv"] call A3A_fnc_customHint;
    [false, "Undercover not allowed in current civ template."];
};

private _secureBases = airportsX + milbases + outposts + seaports + (controlsX select {isOnRoad(getMarkerPos _x)});
private _result = [];

if !(isNull (objectParent player)) then
{
    if (!(typeOf(objectParent player) in undercoverVehicles)) exitWith
    {
        ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_nociv"] call A3A_fnc_customHint;
        _result = [false, "In non civilian vehicle"];
    };
    if ((objectParent player) getVariable ["A3A_reported", false]) exitWith
    {
        ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_reported1"] call A3A_fnc_customHint;
        _result = [false, "In reported vehicle"];
    };
    if ((objectParent player) getVariable ["SA_Tow_Ropes", []] isNotEqualTo []) exitWith
    {
        ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_towrope"] call A3A_fnc_customHint;
        _result = [false, "In vehicle with tow ropes attached"];
    };
}
else
{
    if (dateToNumber date < (player getVariable ["compromised", 0])) exitWith
    {
        ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_reported2"] call A3A_fnc_customHint;
        _result = [false, "Recently reported"];
    };

    private _text = localize "STR_A3A_fn_undercover_canGoUn_no_while";
    _result = [true];
    if (primaryWeapon player != "" || secondaryWeapon player != "" || handgunWeapon player != "") then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_weapon", _text];
        _result set [0, false];
        _result pushBack "Weapon visible";
    };
    if (vest player != "") then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_vest", _text];
        _result set [0, false];
        _result pushBack "Vest visible";
    };
    if (headgear player in allArmoredHeadgear) then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_helmet", _text];
        _result set [0, false];
        _result pushBack "Helmet visible";
    };
    if (hmd player != "") then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_ngv", _text];
        _result set [0, false];
        _result pushBack "NVG visible";
    };
    if ((uniform player != "") && !(uniform player in (A3A_faction_civ get "uniforms"))) then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_uniform", _text];
        _result set [0, false];
        _result pushBack "Suspicious uniform";
    };
    if (uniform player == "") then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_naked", _text];
        _result set [0, false];
        _result pushBack "No clothes";
    };
    if (!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull])) then
    {
        _text = format [localize "STR_A3A_fn_undercover_canGoUn_no_reason_rope", _text];
        _result set [0, false];
        _result pushBack "Holding tow ropes";
    };
    if !(_result select 0) then
    {
        ["Undercover", _text] call A3A_fnc_customHint;
    };
};

if (_result isNotEqualTo [] && !(_result select 0)) exitWith
{
    _result;
};

private _base = [_secureBases, player] call BIS_fnc_nearestPosition;
private _size = [_base] call A3A_fnc_sizeMarker;
if ((player distance2D getMarkerPos _base < _size * 2) && (sidesX getVariable [_base, sideUnknown] != teamPlayer)) exitWith
{
    ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_close"] call A3A_fnc_customHint;
    [false, "Near enemy territory"];
};

if
(
    {
        ((side _x == Invaders) || (side _x == Occupants)) &&
        {(_x knowsAbout player > 1.4) &&
        {_x distance player < 500}}
    } count allUnits > 0
) exitWith
{
    ["Undercover", localize "STR_A3A_fn_undercover_canGoUn_no_spotted"] call A3A_fnc_customHint;
    [false, "Spotted by enemies"];
};

[true, ""];
