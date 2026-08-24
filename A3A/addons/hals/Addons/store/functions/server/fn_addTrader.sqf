/*
	Function: HALs_store_fnc_addTrader
	Author: HallyG
	Initialises a trader.

	Argument(s):
	0: Trader object <OBJECT>
	1: Trader type <STRING>
	2: Trader target (Default: 0) <ARRAY, GROUP, NUMBER, OBJECT, SIDE, STRING>
		The trader is avaliable to all of these targets.

	Return Value:
	<BOOLEAN>

	Example:
	[obj2, "Navigation"] call HALs_store_fnc_addTrader;
__________________________________________________________________*/
#include "..\..\..\..\script_component.hpp"

params [
	["_trader", objNull, [objNull]],
	["_traderType", [], [[]]],
	["_target", 0, [0, objNull, "", sideUnknown, grpNull, []]]
];

if (!isServer) exitWith {false};

try {
	if (!isNil {_trader getVariable "HALs_store_trader_type"}) then {throw ["Trader already initialised", __LINE__]};
	if (isNull _trader) then {throw ["Trader cannot be null", __LINE__]};
	if (!alive _trader) then {throw ["Trader cannot be dead", __LINE__]};
	if (isPlayer _trader) then {throw ["Trader cannot be a player", __LINE__]};
	if (_traderType isEqualTo []) then {throw ["No Trader type", __LINE__]};

	{
		if (!isClass (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "stores" >> _x)) then {
			throw ["Invalid Trader type", __LINE__];
			Error_2("Broken Entry: %1. Full Entry: %2", _x, _traderType);
		};
	} forEach _traderType;

	//private _type = {typeOf _trader isKindOf [_x, configFile >> "cfgVehicles"]} count ["CAManBase", "Car_F", "ReammoBox_F"];
	//if (_type isEqualto 0) then {throw ["Trader is not TypeOf: ['CAManBase', 'Car_F', 'ReammoBox_F']", __LINE__]};

	private _categories = [];

	{
		private _categoryAdd = [
			getArray (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "stores" >> _x >> "categories"),
			{getText (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "categories" >> _x >> "displayname")},
			true
		] call HALs_fnc_sortArray;
		// _categories pushBack _categoryAdd;
		_categories = _categories + _categoryAdd;
	} forEach _traderType;

	Verbose_1("_categories:\n%1", _categories);

	private _classes = [];
	private _stocks = [];

	{
		private _category = _x;
		_configCategory = configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "categories" >> _category;
		_items = "true" configClasses (_configCategory) apply {configName _x};

		_duplicateClass = {_classes find _x > -1} count _items > 0;
		_duplicateItem = !(count (_items arrayIntersect _items) isEqualTo count _items);
		// if (_duplicateClass || _duplicateItem) then {
			// throw [format ["Duplicate items [category: %1, type: %2]", toUpper _x, toUpper (_traderType select 0)], __LINE__];
		// };

		{
			_classes pushBack _x;
			_stocks pushBack toLower _x;
			_stocks pushBack (getNumber (_configCategory >> _x >> "stock") max 0);
		} forEach _items;
	} forEach _categories;

	_trader setVariable ["HALs_store_trader_type", _traderType, true];
	_trader setVariable ["HALs_store_trader_stocks", _stocks, true];

	if !(typeOf _trader isKindOf ["CAManBase", configFile >> "cfgVehicles"]) then {
		clearMagazineCargoGlobal _trader;
		clearWeaponCargoGlobal _trader;
		clearItemCargoGlobal _trader;
		clearBackpackCargoGlobal _trader;
	};

	_trader setVariable ["HALs_store_name", getText (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "stores" >> (_traderType select 0) >> "displayName"), true];
	[_trader, _target] call HALs_store_fnc_addActionTrader;
	true
} catch {
	systemChat str _exception;
	[_exception select 0] call BIS_fnc_error;
	// [_exception] call HALs_fnc_log;
	false
};
