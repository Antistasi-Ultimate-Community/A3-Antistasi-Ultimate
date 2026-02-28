/*
	Function: HALs_store_fnc_equipItem
	Author: Exile Mod, HallyG
	Equips an item on a unit.

	Argument(s):
	0: Unit <OBJECT>
	1: Item Classname <STRING>

	Return Value:
	<BOOL>

	Example:
	[player, "acc_flashlight"] call HALs_store_fnc_equipItem;
	// todo fix grenades being added
__________________________________________________________________*/
#include "..\..\..\..\script_component.hpp"

params [
	["_unit", objNull, [objNull]],
	["_classname", "", [""]]
];

Error("Equip function call.");

if (isNull _unit) exitWith {
	Error("Unit is null.");
	false
	};
if (_classname isEqualTo '') exitWith {
	Error("Classname is empty.");
	false
};

private _added = false;
_classname = toLower _classname;
([_classname] call BIS_fnc_itemType) params ["_itemCategory", "_itemType"];

if (_itemCategory isEqualTo "Magazine") then {
	{
		if !(_x isEqualTo "") then {
			switch (_forEachIndex) do {
				case 0: {
					if ((primaryWeaponMagazine _unit) isEqualTo []) then {
						_compatibleWeaponItems = (_x call HALs_store_fnc_getCompatibleItems) apply {toLower _x};
						if (_classname in _compatibleWeaponItems) then {
							_unit addPrimaryWeaponItem _classname;
							_added = true;
						};
					};
				};
				case 1: {
					if ((secondaryWeaponMagazine _unit) isEqualTo []) then {
						_compatibleWeaponItems = (_x call HALs_store_fnc_getCompatibleItems) apply {toLower _x};
						if (_classname in _compatibleWeaponItems) then {
							_unit addSecondaryWeaponItem _classname;
							_added = true;
						};
					};
				};
				case 2: {
					if ((handgunMagazine _unit) isEqualTo []) then {
						_compatibleWeaponItems = (_x call HALs_store_fnc_getCompatibleItems) apply {toLower _x};
						if (_classname in _compatibleWeaponItems) then {
							_unit addHandgunItem _classname;
							_added = true;
						};
					};
				};
			};
		};
		if (_added) exitWith {};
	}  forEach [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit];
} else {
	_added = call {
		if (_itemType in ["AssaultRifle", "Rifle", "SubmachineGun", "MachineGun", "RocketLauncher", "MissileLauncher", "Shotgun", "SniperRifle", "Handgun", "LaserDesignator", "Throw", "Binocular"]) exitWith {
			_unit addWeaponGlobal _classname;
			true
		};
		if (_itemType in ["GPS", "Map", "Radio", "UAVTerminal", "Watch", "Compass", "NVGoggles", "Glasses"]) exitWith {
			_unit linkItem _classname;
			true;
		};
		if (_itemType isEqualTo "Headgear") exitWith {
			_unit addHeadgear _classname;
			true
		};
		if (_itemType isEqualTo "Backpack") exitWith {
			_unit addBackpackGlobal _classname;
			true
		};
		if (_itemType isEqualTo "Uniform") exitWith {
			_unit forceAddUniform _classname;
			true
		};
		if (_itemType isEqualTo "Vest") exitWith {
			_unit addVest _classname;
			true
		};
		if (_itemType in ["AccessorySights", "AccessoryPointer", "AccessoryMuzzle", "AccessoryBipod"]) exitWith {
			{
				if !(_x isEqualTo "") then {
					_compatibleWeaponItems = (_x call HALs_store_fnc_getCompatibleItems) apply {toLower _x};
					if (_classname in _compatibleWeaponItems) exitWith {
						switch (_forEachIndex) do {
							case 0: {_unit addPrimaryWeaponItem _classname; _added = true;};
							case 1: {_unit addSecondaryWeaponItem _classname; _added = true;};
							case 2: {_unit addHandgunItem _classname; _added = true;};
						};
					};
				};
				if (_added) exitWith {};
			} forEach [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit];
			true
		};
		false
	};
};
_added
