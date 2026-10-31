#include "..\defines.inc"
FIX_LINE_NUMBERS()

if (count paradropAttendants == 0) exitWith {
    [
        localize "STR_A3AP_paradrop_header", 
        localize "STR_A3AP_paradrop_no_players"
    ] remoteExec ["SCRT_fnc_misc_deniedHint", theBoss];

    []
};

private _readyPlayers = paradropAttendants apply {_x call BIS_fnc_getUnitByUID};
_readyPlayers = _readyPlayers select {_x distance2D (getMarkerPos "Synd_HQ") < 50 && {isNull objectParent _x && {[_x] call A3A_fnc_canFight}} };

if (isNil "_readyPlayers" || {_readyPlayers isEqualTo []}) then {
    [
        localize "STR_A3AP_paradrop_header", 
        localize "STR_A3AP_paradrop_players_condition"
    ] remoteExec ["SCRT_fnc_misc_deniedHint", theBoss];

    []
};

Info_1("Paradrop players: %1",str _readyPlayers);

_readyPlayers
