/*
	Function: HALs_store_fnc_getCargoMass
	Author: L-H, edited by commy2, rewritten by joko // Jonas
	Calculates the mass of an item or of all the items in a container.
	(Recursive)

	Argument(s):
	0: Container <OBJECT>

	Return Value:
	<NUMBER>

	Example:
	(vestContainer player) call HALs_store_fnc_getCargoMass;
__________________________________________________________________*/
params [
	["_container", objNull, [objNull]]
];

private _totalMass = 0;
{
	_x params ["_items", "_configCode"];
	_items params ["_item", "_count"];

	{
		_totalMass = _totalMass + (getNumber ((call _configCode) >> "mass") * (_count select _forEachIndex));
	} forEach _item;

	true
} count [
	[getMagazineCargo _container,	{configFile >> "CfgMagazines" >> _x}],
	[getBackpackCargo _container, 	{configFile >> "CfgVehicles" >> _x}],
	[getItemCargo _container, 	{configFile >> "CfgWeapons" >> _x >> "ItemInfo"}],
	[getItemCargo _container, 	{configFile >> "CfgGlasses" >> _x}],
	[getWeaponCargo _container, 	{configFile >> "CfgWeapons" >> _x >> "WeaponSlotsInfo"}]
];

_containers = (everyContainer _container);
if (_containers isNotEqualTo []) then {
	{
		_totalMass = _totalMass + (_x call HALs_store_fnc_getCargoMass);
	} forEach (_containers apply {_x select 1})
};

_totalMass
