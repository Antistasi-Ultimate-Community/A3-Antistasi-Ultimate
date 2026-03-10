//fn_getCategories.sqf
#include "..\..\script_component.hpp"
if (isNil "A3U_cache_allMusicCategories") then { call A3U_fnc_musicCache; };
A3U_cache_allMusicCategories
