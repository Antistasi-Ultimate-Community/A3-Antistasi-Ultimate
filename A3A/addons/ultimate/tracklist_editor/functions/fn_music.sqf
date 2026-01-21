#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_music

Description:
    Customizable music script

Parameters:

Optional:

Example:
    (begin example)
    [] call A3A_ultimate_tracklist_editor_fnc_music;
    (end example)

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(music),_this);

if musicON then {
    [] call FUNC(playNextTrack);
} else {
	1.25 fadeMusic 0;
    playMusic "";
};

nil;
