/*
	Function: HALs_store_fnc_sell
	Author: HallyG
	Handles the sell transcations on the server.

	Argument(s):
	0: Player <OBJECT>
	1: Item Classname <STRING>
	3: Item price <NUMBER>
	4: Number of items <NUMBER>
	5: Container <OBJECT>

	Return Value:
	None

	Example:
	[player, "hgun_P07_F", 100, 5] call HALs_store_fnc_sell;
__________________________________________________________________*/
params [
	["_unit", objNull, [objNull]],
	["_classname", "", [""]],
	["_price", 0, [0]],
	["_amt", 0, [0]],
	["_container", objNull, [objNull]]
];

if (!isServer) exitWith {};
if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};
if (_amt < 1) exitWith {};
if (_classname isEqualTo "") exitWith {};
if (isNull _container) exitWith {};
if (_price < 0) exitWith {};

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

try {
	// Fetch current trader
	private _trader = _unit getVariable ["HALs_store_trader_current", objNull];
	if (isNull _trader) then {throw [""]};

	private _forbiddenItem_is_unlimited = 0;

	if (_classname in A3U_forbiddenItems) then {
		private _is_forbiddenItem = isClass (configFile >> "A3U" >> "forbiddenItems" >> _classname);

		diag_log format["%1 is a forbidden item.", _classname];

		if (_is_forbiddenItem) then {
			_is_forbiddenItemUnlimited = (getNumber (configFile >> "A3U" >> "forbiddenItems" >> _classname >> "unlimited"));
		};
	};

    // Check if the trader will buy this item
	private _stock = [_trader, _classname] call HALs_store_fnc_getTraderStock;
	if (_stock isEqualTo -1) then { // && {_is_forbiddenItem isEqualTo false}
		// Try parent
		_parent = _classname call HALs_store_fnc_getParentClassname;
		_stock = [_trader, _parent] call HALs_store_fnc_getTraderStock;
		if (_stock isEqualTo -1) then {
			throw ["The trader will not buy this item."]
		};
	};

	["buttonInvToJNA"] call jn_fnc_arsenal;

	//unlocked items are already cut from sell list, but let's make additional check if players will find some exploit to sell unlocked guns 
	private _unlockedItems = ((
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) +
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) +
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) +
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) +
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) +
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_UNIFORM) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) + 
		(jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST)
	) select {(_x select 1) == -1 || {(_x select 1) >= minWeaps && {_is_forbiddenItemUnlimited isEqualTo 0}}}) apply {_x select 0};

	diag_log (format["%1 unlock state: %2", _classname, (_classname in _unlockedItems)]);

	if (_classname in _unlockedItems) then {
		throw ["The trader is not interested in this item, no deal."]
	};

	_unlockedItems = nil;

    // Check that player has the item
    // Remove items from unit
	private _amount = 0;
	private _continue = true;

	for [{private _i = 0}, { _i < floor _amt && _continue}, {_i = _i + 1}] do {
		private _removed = [_container, _classname] call HALs_store_fnc_removeContainerItem;
		if (_removed) then {_amount = _amount + 1} else {_continue = false};
	};

	if (_amount < 1) then {throw ["Unable to sell item."]};

	// Update unit's funds and trader's stock
	private _sellFactor = HALs_store_sellFactor min 1 max 0;
	private _total = (_price max 0) * _amount * _sellFactor;
	[_trader, _classname, _amount] call HALs_store_fnc_updateStock;
	[_unit, _total] call HALs_money_fnc_addFunds;

	private _message = format [
		"x%1 %2(s) sold for %3 %4.", 
		_amount, 
		[(_classname call HALs_fnc_getConfigClass) >> "displayName", ""] call HALs_fnc_getConfigValue, 
		_total, 
		A3A_faction_civ get "currencySymbol"
	];

	// Log sell
	if (HALs_store_debug) then {
		private _log = format ["%2(%1) %3 to (%4).", name _unit, getPlayerUID _unit, _message, _trader];
		[_log] call HALs_fnc_log;
	};

	throw [_message, "FD_CP_CLEAR_F"];
} catch {
	_exception params [
		["_message", ""],
		["_sound", "FD_CP_NOT_CLEAR_F", [""]]
	];

	if (count _message > 0) then {
		[_message, _sound] remoteExecCall ["HALs_store_fnc_systemChat", _unit];
	};
};
