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
FactionGetTiered(_faction, "unitRifle");
*/

params [
    ["_tieredArray", [], [[]]],
	["_forceTier", -1, [0]]
];

if (count _tieredArray < 3) exitWith {};

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

private _militia = missionNamespace getVariable ["A3U_setting_tierWarMilitia", 3];
private _elite = missionNamespace getVariable ["A3U_setting_tierWarElite", 8];

switch (true) do 
{
    case (tierWar >= _elite): // if tier is equal to or higher than the elite setting, choose elite
    {
        _tieredArray select 2
    };
    case (tierWar >= (_militia + 1)): // if tier is equal to or higher than the militia setting + 1, choose military
    {
        _tieredArray select 1
    };
    case (tierWar <= _militia): // if tier is equal to or lower than the militia setting, choose militia
    {
        _tieredArray select 0
    };
    default
    {
        _tieredArray select 0
    };
};