//fn_getTrackByCategory.sqf
#include "..\..\script_component.hpp"
params [["_category", "unknown", [""]]];
if (isNil "A3U_cache_tracksByCategory") then { call A3U_fnc_musicCache; };
A3U_cache_tracksByCategory getOrDefault [_category, []]