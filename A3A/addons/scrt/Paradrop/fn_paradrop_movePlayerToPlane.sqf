#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
#define KEY_ESCAPE 1
#define TIME_WINDOW 5

closeDialog 0;
closeDialog 0;
2 fadeSound 0;
isMoveToPlaneCancelled = false;
moveMenu = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    _handled = false;
    if (_this select 1 == KEY_ESCAPE) then {
        isMoveToPlaneCancelled = true;
        (findDisplay 46) displayRemoveEventHandler ["KeyDown", moveMenu];
    };

    _handled;
}];

private _inputTimeout = time + TIME_WINDOW;
while {true} do {
    if (time > _inputTimeout) exitWith {};
    if (isMoveToPlaneCancelled) exitWith {};

    cutText [
        format [localize "STR_cut_text_paradrop_notification_1", (round(_inputTimeout - time))],
        "BLACK",
        0.0001,
        true, 
        true
    ];
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", moveMenu];

if (isMoveToPlaneCancelled) exitWith {
    cutText [localize "STR_cut_text_paradrop_notification_2","BLACK IN",1, true, true];
    isMoveToPlaneCancelled = nil;
    moveMenu = nil;
    2 fadeSound 1;
};

private _waitTimeout = time + 30;
waitUntil {sleep 0.01; !(isNil "paradropPlane") || time > _waitTimeout};

if (isNil "paradropPlane") exitWith {
    cutText ["","BLACK IN", 2];
    2 fadeSound 1;
    [localize "STR_A3AP_paradrop_header", localize "STR_A3AP_paradrop_abort_plane"] call SCRT_fnc_misc_deniedHint;
};

if (!canMove paradropPlane || {!alive paradropPlane || {!alive (driver paradropPlane)}}) exitWith {
    cutText ["","BLACK IN", 2];
    2 fadeSound 1;
    [localize "STR_A3AP_paradrop_header", localize "STR_A3AP_paradrop_abort_plane_noncapable"] call SCRT_fnc_misc_deniedHint;
};

private _totalSeats = [(FactionGetRebel(A3A_faction_reb, "vehiclesPlane")) # 0, true] call BIS_fnc_crewCount;
private _occupiedSeats = count (crew paradropPlane);

if ((_totalSeats - _occupiedSeats) < 0) exitWith {
    cutText ["","BLACK IN", 2];
    2 fadeSound 1;
    [localize "STR_A3AP_paradrop_header", localize "STR_A3AP_paradrop_abort_plane_no_free_seats"] call SCRT_fnc_misc_deniedHint;
};

player moveInCargo paradropPlane;

private _earlyEscape = false;
private _iterations = 0;

while {true} do {
    if (vehicle player == paradropPlane) exitWith {};
    if (_iterations > 30) exitWith {_earlyEscape = true;};
    if (isNil "paradropPlane" || {!alive paradropPlane || {!([player] call A3A_fnc_canFight)}}) exitWith {
        _earlyEscape = true;
    };

    player moveInCargo paradropPlane;
    _iterations = _iterations + 1;
    sleep 0.05;
};

if (_earlyEscape) exitWith {
    cutText ["", "BLACK IN", 3, true, true];
    5 fadeSound 1;
    [localize "STR_A3AP_paradrop_header", localize "STR_A3AP_paradrop_abort_plane_something_wrong"] call SCRT_fnc_misc_deniedHint;
};

sleep 1;

cutText [localize "STR_cut_text_paradrop_notification_3","BLACK IN", 3, true, true];
5 fadeSound 1;

waitUntil {sleep 0.001; isNil "paradropPlane" || {vehicle player != paradropPlane}};

if (!([player] call A3A_fnc_canFight) || {isNil "paradropPlane"}) exitWith {};

player call SCRT_fnc_paradrop_jump;