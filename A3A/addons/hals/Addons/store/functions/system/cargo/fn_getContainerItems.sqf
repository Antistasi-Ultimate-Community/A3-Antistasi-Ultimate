/*
	Function: HALs_store_fnc_getContainerItems
	Author: Larrow, HallyG
	Returns all items (as a list) in a container.

	Argument(s):
	0: Container <OBJECT>

	Return Value:
	<ARRAY>

	Example:
	[_container] call HALs_store_fnc_getContainerItems;
__________________________________________________________________*/
params [
    ["_container", objNull, []]
];

private _containerItems = [];
if (isNull _container) exitWith {_containerItems};

private _backpack = backpackCargo _container;
if (_backpack isNotEqualTo []) then {_containerItems append _backpack};

private _magazines = magazineCargo _container;
if (_magazines isNotEqualTo []) then {_containerItems append _magazines};

private _weapons = weaponsItemsCargo _container;
if (_weapons isNotEqualTo []) then {
    {
        {
            if (_x isEqualType []) then {
                _containerItems pushBack (_x select 0)
            } else {
                _containerItems pushBack _x
            };
        } forEach (_x select {count _x > 0});
    } forEach _weapons;
};

private _items = getItemCargo _container;
if (count _items > 0) then {
    {
        private _amt  = (_items select 1) select _forEachIndex;

        for [{private _i = 0}, {_i < _amt}, {_i = _i + 1}] do {
            _containerItems pushBack _x;
        };
    } forEach (_items select 0);
};

_containerItems
