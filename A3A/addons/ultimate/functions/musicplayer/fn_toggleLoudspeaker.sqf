#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _btn = _display displayCtrl 85118;

A3U_loudspeaker = !A3U_loudspeaker;

if (A3U_isPlaying && {A3U_playbackMode == "sound"}) then {
    [] call A3U_fnc_playTrack;
};

if (A3U_loudspeaker) then {
    _btn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
    _btn ctrlSetTooltip "Режим громкоговорителя (вкл)";
} else {
    _btn ctrlSetBackgroundColor [1,1,1,1];
    _btn ctrlSetTooltip "Режим громкоговорителя (выкл)";
};