/*
    Author: [wersal]
    Description:
        Press Event Handler Actions.

    Arguments:
        <Object> Unit this action is called on.
        <Magic Variables> The Event Handler type of the addEventHandler.
        <Magic Variables> The Event Handler position of the index

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _unit addEventHandler["FiredNear", {
            params ["_unit", "_firer"];
            _unit removeEventHandler [_thisEvent, _thisEventHandler];
            [_unit, _firer] call A3A_fnc_pressFiredNearEH;
        }];

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_firer"];

[_unit, _firer] spawn {
    params ["_unit", "_firer"];
    private _targetPos = getPosATL _firer;
    if (secondaryWeapon _unit == "") then {
        _unit addWeapon "Binocular";
        _unit selectWeapon "Binocular";
    };

    _unit disableAI "COVER";
    _unit disableAI "SUPPRESSION";

    _unit doWatch _firer;
    _unit lookAt _firer;
    _unit doMove _targetPos;
    _unit setSpeedMode "FULL";

    private _timeout = time + 10;
    waitUntil {
        sleep 2; 
        !alive _unit || 
        _unit distance2D _targetPos <= 15 ||
        _unit distance2D _firer <= 15 ||
        time > _timeout
    };
    _unit doWatch objNull;
    _unit lookAt objNull;

    if (alive _unit) then {
        for "_i" from 0 to 3 do {
            _unit doWatch _firer;
            _unit lookAt _firer;
            private _newPos = [getPosATL _firer, 5, 8, 1, 0] call BIS_fnc_findSafePos;
            // Reposition if poor visibility/distance
            if ([_unit, "VIEW"] checkVisibility [eyePos _unit, eyePos _firer] < 0.5 || _unit distance2D _firer > 5) then {
                _unit doMove _newPos;
                private _observeTime = 3 + random 4;
                sleep _observeTime;
            };

            if ([_unit, "VIEW"] checkVisibility [eyePos _unit, eyePos _firer] < 0.5 || _unit distance2D _firer > 5) then {
                // Поиск новой позиции для съемки (5-25 метров от цели)
                _newPos = [getPosATL _firer, 5, 8, 1, 0] call BIS_fnc_findSafePos;
                _unit doMove _newPos;
            };

            if !(alive _firer) exitwith {};

            private _timeout = time + 6;
            waitUntil {
                sleep 1;
                !alive _unit || 
                _unit distance2D _newPos < 4 ||
                time > _timeout
            };
            _unit doWatch objNull;
            _unit lookAt objNull;
            if (!alive _unit) exitWith {};
        };

        // Reset unit state
        [_unit, ""] remoteExec ["switchMove", 0]; // Сброс анимации
        _unit setSpeedMode "LIMITED";
        //_unit forceWalk true;
        _unit action ["SWITCHWEAPON", _unit, _unit, -1];
    };
    if (alive _unit) then {
        // Re-register event handler if alive
        _unit addEventHandler ["FiredNear", {
            params ["_unit", "_firer"];
            _unit removeEventHandler [_thisEvent, _thisEventHandler];
            [_unit, _firer] call A3A_fnc_pressFiredNearEH;
        }];
    };
};
