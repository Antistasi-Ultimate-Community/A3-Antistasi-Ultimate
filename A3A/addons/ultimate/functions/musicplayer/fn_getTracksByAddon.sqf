//fn_getTracksByAddon.sqf
#include "..\..\script_component.hpp"
params ["_addonName"];
if (isNil "A3U_cache_tracksByAddon") then { call A3U_fnc_musicCache; };
A3U_cache_tracksByAddon getOrDefault [_addonName, []]