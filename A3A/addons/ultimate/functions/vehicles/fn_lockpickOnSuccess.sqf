params ["_target", "_caller", "_actionId"];

[_target, _actionId] call BIS_fnc_holdActionRemove;
[_target, false] remoteExecCall ["A3U_fnc_setLock", (owner _target)];

[localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_success", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;