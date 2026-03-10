//fn_getActualMusicSounds.sqf
#include "..\..\script_component.hpp"
if (isNil "A3U_cache_actualMusicSounds") then { call A3U_fnc_musicCache; };
A3U_cache_actualMusicSounds