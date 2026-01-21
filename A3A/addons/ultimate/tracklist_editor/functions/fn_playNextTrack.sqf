#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_music_fnc_playNextTrack

Description:
    Play the next track depending on environment (combat, time of day, etc.)

Parameters:

Optional:

Example:
    (begin example)
    [] call A3USPCM_music_fnc_playNextTrack;
    (end example)

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(playNextTrack),_this);

if !isNil QGVAR(waitScript) then {
    terminate GVAR(waitScript);
    GVAR(waitScript) = nil;
};

private _key = switch true do {
    case (behaviour player isEqualTo "COMBAT"): { "combat" };
    case (behaviour player isEqualTo "STEALTH"): { "stealth" };
    case !([] call FUNCMAIN(utilIsDaytime)): { "night" };
    default { "default" };
};

private _tracks = GVAR(tracks) getOrDefault[_key, []];
_tracks = _tracks - GVAR(lastTracks);

if !assert(_tracks isNotEqualTo []) exitWith {};

private _track = selectRandom _tracks;
INFO_3("%1() playing %2 track: %3",QFUNC(playNextTrack),_key,_track);

[_track] call FUNC(playTrack);

if GVAR(showNowPlaying) then {
    private _config = configFile >> "CfgMusic" >> _track;

    if !isClass(_config) exitWith { WARNING_1("track '%1' not found in config",_track) };

    private _title = [_config >> "name", "STRING", _track] call CBA_fnc_getConfigEntry;

    [
        localize LSTRING(NowPlaying),
        parseText format[
            "%1:<br /><br /><t color='#00fccc'>%2</t> (%3)",
            localize LSTRING(NowPlaying), _title,
            [getNumber(_config >> "duration"), "MM:SS"] call BIS_fnc_secondsToString
        ],
        true
    ] call A3A_fnc_customHint;
};

nil;
