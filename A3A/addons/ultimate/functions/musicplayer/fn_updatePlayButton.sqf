// fn_updatePlayButton.sqf
/*  
    Author: wersal

    Description:
        Updates the tooltip of the play/pause button based on current playback state.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _ctrl = _display displayCtrl 85103;

// Use the same tooltip for music and sound
private _tooltip = if (A3U_isPlaying) then { localize "STR_A3U_pause_tooltip" } else { localize "STR_A3U_play_tooltip" };
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;