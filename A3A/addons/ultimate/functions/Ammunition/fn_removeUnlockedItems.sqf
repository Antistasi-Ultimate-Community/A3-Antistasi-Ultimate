/*
    Author:
    Silence

    Description:
    Handles "removing" unlocked items from provided arrays;
    Adds each element in an array that is unlocked to the _indexed variable

    Params:
	_data  <ARRAY of ARRAYS>

    Usage:
    [_array1, _array2] call A3U_fnc_removeForbiddenItems;

    Return:
    _indexed  <ARRAY>
*/

#include "..\..\script_component.hpp"

params ["_data"];

private _start = diag_tickTime;

private _indexed = []; // should probably be converted to a hashmap so load times are somewhat consistent even with tons of mods
private _originalItem = [];

private _unlocks = (unlockedHeadgear + unlockedVests + unlockedNVGs + unlockedOptics + unlockedItems + unlockedBackpacks + unlockedMagazines);
    
{
    private _array = _x;

    {
        private _itemAttachments = [];
        private _item = _x;
        if (_item isEqualType []) then {
            _originalItem = _item;
            _item = _item select 0;
            if (count _originalItem > 1) then {
                _itemAttachments = [_originalItem#1, _originalItem#2, _originalItem#3, _originalItem#6];
            };
        };

        {
            if (_item in _indexed) exitWith {}; // element is already indexed, ignore
            if (_item in _x) then {
                Verbose_1("%1 is already unlocked", _item);
                _indexed pushBack _item;
            };
        } forEach _unlocks;

        // Weapons are weird due to how they are stored, and would conflict with the standard items
        {
            if (_originalItem in _indexed) exitWith {}; // element is already indexed, ignore
            if (_item in _x) then {
                private _hasAttachments = if (_itemAttachments findIf {_x != ""} != -1) then {true} else {false};

                if (!_hasAttachments) then {
                    Verbose_1("%1 is already unlocked as a weapon", _item);
                    _indexed pushBack _originalItem;
                };
            };
        } forEach [unlockedWeapons];
    } forEach _array;
} forEach _data;

private _stop = diag_tickTime;

Verbose_1("Loot Search Took Approximately: %1 seconds.",round(_stop - _start));

_indexed