/*
    Author:
        Maxx
    
    Description:
        Adds the ability to lockpick locked vehicles
    
    Params:
        _vehicle <Object> <Default: nil>
    
    Usage:
        [_vehicle] call A3U_fnc_lockpick;
*/

params ["_vehicle"];
[ 
    _vehicle,
    localize "STR_A3AU_action_lockpick_title",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "(_this distance _target < 5) && (_this call A3A_fnc_isEngineer) && ([_this, 'ToolKit'] call BIS_fnc_hasItem)",
    "(_caller distance _target < 5)",
    {[localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_start", (getText (configFile >> "cfgVehicles" >> typeOf (_this select 0) >> "displayName"))]] call A3A_fnc_customHint;},
    {
        params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"]; 
		if (sidesX getVariable [([airportsX + milbases + seaports + outposts, player] call BIS_fnc_nearestPosition),sideUnknown] == teamPlayer) then {
            if (_frame >= 3) then {
                _target lock false;
                [_target, _actionId] call BIS_fnc_holdActionRemove;
                [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_zone_control", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
            };
		};
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target lock false;
        [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_success", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
    },
    {		
        if (sidesX getVariable [([airportsX + milbases + seaports + outposts, player] call BIS_fnc_nearestPosition),sideUnknown] != teamPlayer) then {
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target, "alarmCar"] remoteExec ["say3D", [0, _target], true];
			private _closeUnits = nearestObjects [_caller, ["CAManBase"], 50];
			_closeUnits deleteAt (_closeUnits find _caller);

			{
				_x knowsAbout _caller;
				_x setBehaviour "COMBAT";
			} forEach _closeUnits;

			[localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_aborted"] call A3A_fnc_customHint;
		};
    },
    [],
    30,
    2026,
    true,
    false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _vehicle];
