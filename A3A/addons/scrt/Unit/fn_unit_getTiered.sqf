/*
Maintainer: Socrates
    Extracts unit/group from tiered faction variable with war level checks.


Return Value:
    <STRING> Unit class
    <ARRAY> Group of unit classnames

Scope: Client, Server
Environment: Any
Public: Yes

Example:
[_faction get "unitRifle"] call SCRT_fnc_unit_getTiered;
*/

#include "..\script_component.hpp"

params [
    ["_tieredArray", [], [[]]],
	["_forceTier", -1, [0]]
];

if (_forceTier != -1) exitWith {
    _tieredArray select _forceTier
};

if (plusGarrison) exitWith
{
    switch (true) do 
    {
        case (tierWar < 5):
        {
            _tieredArray select 0
        };
        case (tierWar < 8 && {tierWar > 4}):
        {
            _tieredArray select 1
        };
        case (tierWar > 7):
        {
            _tieredArray select 2
        };
        default
        {
            _tieredArray select 0
        };
    };
};

private _militiaTier = missionNamespace getVariable ["A3U_setting_tierWarMilitia", 3];
private _eliteTier = missionNamespace getVariable ["A3U_setting_tierWarElite", 8];

private _weightMilitia = linearConversion [0, _militiaTier+2, tierWar, 1.0, 0.0, true];
private _weightElite = linearConversion [_eliteTier-2, _eliteTier, tierWar, 0.0, 1.0, true];
private _weightMilitary = linearConversion [0, _eliteTier-2, tierWar, 0.0, 1.0, true] * (1 - _weightElite);

private _categories = [ 
    (_tieredArray select 0), _weightMilitia, 
    (_tieredArray select 1), _weightMilitary, 
    (_tieredArray select 2), _weightElite
];

private _tier = selectRandomWeighted _categories;

Debug_2("Chosen %1 as tier category. tierWar is %2", _tier, tierWar);

_tier;