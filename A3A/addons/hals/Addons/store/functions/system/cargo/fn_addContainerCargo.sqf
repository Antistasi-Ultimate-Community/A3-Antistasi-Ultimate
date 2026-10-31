/*
	Function: HALs_store_fnc_addContainerCargo
	Author: HallyG
	Adds items to a container.

	Argument(s):
	0: Container object <OBJECT>
    1: Container item array <ARRAY>

	Return Value:
	None

	Example:
	[_container, _data] call HALs_store_fnc_addContainerCargo;
__________________________________________________________________*/
params [
    ["_container", objNull, [objNull]],
    ["_data", [[], [], [], []], [[]]]
];

if (isNull _container) exitWith {false};

_data params ["_magazines", "_items", "_weapons", "_containers"];

{
    _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
} forEach _magazines;

{
	_container addItemCargoGlobal [_x select 0, _x select 1];
} forEach _items;

_weapons = _weapons select {count _x > 0};
if (_weapons isNotEqualTo []) then {
    {
        _container addWeaponWithAttachmentsCargoGlobal [_x, 1];
    } forEach _weapons;
};

{
    _x params ["_subClassname", "_subData"];

    if (_subClassname isKindOf "bag_base") then {
		_container addBackpackCargoGlobal [_subClassname, 1];
	} else {
		_container addItemCargoGlobal [_subClassname, 1];
	};

    private _evContainer = everyContainer _container;
    private _cnt = count _evContainer - 1;
    private _subContainer = _evContainer select _cnt select 1;

    [_subContainer] call HALs_store_fnc_clearContainerCargo;
    [_subContainer, _subData] call HALs_store_fnc_addContainerCargo;
} forEach _containers;
