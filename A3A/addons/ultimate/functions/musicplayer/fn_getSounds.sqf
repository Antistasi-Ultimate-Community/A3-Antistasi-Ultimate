//fn_getSounds.sqf
#include "..\..\script_component.hpp"
if (isNil "A3U_cache_allSounds") then { call A3U_fnc_musicCache; };
A3U_cache_allSounds apply { [_x#0, _x#1, _x#2] } // возвращаем [name, class, duration]