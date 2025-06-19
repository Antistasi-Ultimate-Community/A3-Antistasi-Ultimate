//fn_updateTrackinfo.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

// Название трека
private _trackInfo = _display displayCtrl 85110;
private _text = if (count A3U_currentTrack > 0) then { // Замена GVAR(currentTrack) на A3U_currentTrack
    format ["<t align='center' size='1.1'>%1</t>", A3U_currentTrack#0]
} else {
    "<t align='center' size='1.1'>Выберите трек</t>"
};

_trackInfo ctrlSetStructuredText parseText _text;
_trackInfo ctrlCommit 0;