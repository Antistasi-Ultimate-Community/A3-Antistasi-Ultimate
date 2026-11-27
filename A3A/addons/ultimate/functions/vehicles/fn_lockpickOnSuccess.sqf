params ["_target"];

[_target, true] call A3U_fnc_lockpickCleanup;

[localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_success", getText(configOf _target >> "displayName")]] call A3A_fnc_customHint;
