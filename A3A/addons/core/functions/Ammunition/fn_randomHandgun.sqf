/*
    Equip unit with random handgun of preferred type using A3A_rebelGear
    Adds magazines random. Uses default magazine of selected handgun
Parameters:
    0. <OBJECT> Rebel unit to equip with handgun.
    1. <STRING>  weapon type ("Handguns").
    2. <NUMBER> Optional, total mass of carried magazines to add.
Returns:
    Nothing
Environment:
    Scheduled, any machine
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_weaponType"];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

private _pool = A3A_rebelGear get _weaponType;

private _weapon = selectRandomWeighted _pool;

// Probably shouldn't ever be executed
if !(handgunWeapon _unit isEqualTo "") then {
    if (_weapon == handgunWeapon _unit) exitWith {};
    private _magazines = getArray (configFile / "CfgWeapons" / (handgunWeapon _unit) / "magazines");
    {_unit removeMagazines _x} forEach _magazines;			// Broken, doesn't remove mags globally. Pain to fix.
    _unit removeWeapon (handgunWeapon _unit);
};

private _categories = _weapon call A3A_fnc_equipmentClassToCategories;

private _magazine = compatibleMagazines _weapon select 0;

_unit addWeapon _weapon;
_unit addHandgunItem _magazine;
_unit addMagazines [_magazine, round (random 2)];

private _compatOptics = A3A_rebelOpticsCache get _weapon;
if (isNil "_compatOptics") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get "OpticsAll");
    A3A_rebelOpticsCache set [_weapon, _compatOptics];
};
if (_compatOptics isNotEqualTo []) then { _unit addHandgunItem (selectRandom _compatOptics) };

private _compatSilencers = A3A_rebelSilencersCache get _weapon;
if (isNil "_compatSilencers") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatSilencers = _compatItems arrayIntersect call {
        A3A_rebelGear get "MuzzleAttachments";
    };
    if (_compatSilencers isEqualTo []) then {
        _compatSilencers = _compatItems arrayIntersect call {
            A3A_rebelGear get "MuzzleAttachments";
        };
    };
    A3A_rebelSilencersCache set [_weapon, _compatSilencers];
};
if (_compatSilencers isNotEqualTo []) then { _unit addHandgunItem (selectRandom _compatSilencers) };