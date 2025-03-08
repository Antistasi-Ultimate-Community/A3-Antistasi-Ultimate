/*
	Function: HALs_store_fnc_main
	Author: HallyG
	Handles the functionality of RscDisplayStore.
	@todo
	- Calculate total price of primary weapon
	- Prevent selling a container that has items
	- Calcualte accurate price of container

	Argument(s):
	0: Mode <STRING>
	1: Additional Arguments <ARRAY>

	Return Value:
	None

	Example:
	["init"] call HALs_store_fnc_main;
__________________________________________________________________*/
#include "..\..\..\dialog\idcs.hpp"
#define CFG_STORE configFile >> "cfgHALsAddons" >> "cfgHALsStore";

params [
	["_mode", "onload", [""]],
	["_this", [], [[]]]
];

private _trader = player getVariable ["HALs_store_trader_current", objNull];

switch (_mode) do {
	case ("onLoad"): {
		params [
			["_display", displayNull, [displayNull]]
		];

		disableSerialization;
		uiNamespace setVariable ["HALs_store_display", _display];
		
		_display setVariable ["items_idc", _display displayCtrl IDC_GROUP_ITEMS];
		_display setVariable ["trader_idc", _display displayCtrl IDC_GROUP_TRADER];
		_display setVariable ["selected_idc", _display displayCtrl IDC_GROUP_SELECTED];
		
		(_display displayCtrl IDC_TITLE) ctrlSetText (_trader getVariable ["HALs_store_name", "Store"]);

		[["UpdateState", "Trades in Arms Dealer store"]] call SCRT_fnc_misc_updateRichPresence;

		["onInit"] call HALs_store_fnc_main;
	};

	case ("onUnload"): {
		closeDialog 2;
		uiNamespace setVariable ["HALs_store_display", displayNull];

		player setVariable ["HALs_store_trader_current", nil, true];
		HALs_store_item_price = nil;
		HALs_store_category_items = nil;
		HALs_store_vehicles = nil;
		HALs_store_blur ppEffectAdjust [0];
		HALs_store_blur ppEffectCommit 0.3;

		[] call SCRT_fnc_misc_updateRichPresence;
	};

	case ("onInit"): {
		if (isNil "HALs_store_gui_blur") then {
			HALs_store_blur = ppEffectCreate ["DynamicBlur", 999];
			HALs_store_blur ppEffectEnable true;
		};

		HALs_store_blur ppEffectAdjust [8];
		HALs_store_blur ppEffectCommit 0.2;
		
		if (isNil "HALs_store_fnc_formatMoney") then {
			HALs_store_fnc_formatMoney = {format ["%1 %2", _this, A3A_faction_civ get "currencySymbol"]};
		};

		// Get all nearby vehicles that we can sell to
		HALs_store_vehicles = ([_trader] call HALs_store_getNearbyVehicles) apply {
			[typeOf _x, format ["%1 (%2m)", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), (_x distance2D _trader) toFixed 0], "", _x]	
		};
		
		// Process all items and store in trader
		HALs_store_item_price = [];
		HALs_store_category_items = [];
		
		private _items = [];
		private _categories = [];
		private _traderType = _trader getVariable ["HALs_store_trader_type", []];

		{
			private _categoryAdd = getArray (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "stores" >> _x >> "categories");
			_categories append _categoryAdd;
		} forEach _traderType; // make sure it grabs ALL categories, not only the first

		{
			private _categoryItems = "true" configClasses (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "categories" >> _x) apply {[configName _x, getNumber (_x >> "price") max 0]};
			
			[HALs_store_category_items, _x, _categoryItems apply {_x select 0}] call HALs_store_fnc_hashSet;

			{
				private _price = _x select 1;
				private _discount = ((A3U_blackMarketDiscountWeapon / 10) * _price);
				private _price = round (_price - _discount);

				[HALs_store_item_price, _x select 0, _price] call HALs_store_fnc_hashSet
			} forEach _categoryItems;
				
			_items append _categoryItems;
		} forEach _categories;

		[HALs_store_category_items, "all", _items apply {_x select 0}] call HALs_store_fnc_hashSet;

		["listbox", ["init", []]] call HALs_store_fnc_main;
		["combobox", ["init", []]] call HALs_store_fnc_main;
		["edit", ["init", []]] call HALs_store_fnc_main;
		["text", ["init", []]] call HALs_store_fnc_main;
		["combobox", ["update", []]] call HALs_store_fnc_main;
		
		//button is broken when HCs around there
		if (hasHeadlessClients) then {
			private _checkBox = CTRLT(IDC_CHECKBOX_BUY);
    		_checkBox ctrlEnable false;
			_checkBox ctrlShow false;
			_checkBox ctrlCommit 0;
		};
		
		call HALs_store_fnc_eachFrame;
	};
	
	case ("update"): {
		["text", ["update", ["funds", []]]] call HALs_store_fnc_main;
		["listbox", ["update", []]] call HALs_store_fnc_main;
		["combobox", ["update", []]] call HALs_store_fnc_main;
	};

	case ("listbox"): {
		params ["_mode", "_this"];

		switch (toLower _mode) do {
			params ["_mode", "_this"];

			case ("init"): {
				private _ctrlList = CTRL(IDC_LISTBOX);
				ctrlSetFocus _ctrlList;

				_ctrlList ctrlAddEventHandler ["LBSelChanged", {
					params ["_ctrl", "_idx"];
			
					_data = _ctrl lbData _idx;
					_data = if (_data isEqualTo "") then {
						[]
					} else {
						parseSimpleArray _data;
					};
					
					_value = _ctrl lbValue _idx;
					_amt = CTRLT(IDC_EDIT) getVariable ["amt", 1];

					_ctrl setVariable ["idx", _idx];
					_ctrl setVariable ["data", _data];
					_ctrl setVariable ["value", _value];

					["text", ["update", ["buy", [_value, _amt]]]] call HALs_store_fnc_main;
					["progressStats", [_data]] call HALs_store_fnc_main; // this cause _value to become 0
					["text", ["update", ["item", []]]] call HALs_store_fnc_main;
					["progressLoad", [CTRLT(IDC_BUY_ITEM_COMBO) getVariable "container", _data, _amt]] call HALs_store_fnc_main;
					["edit", ["update", []]] call HALs_store_fnc_main;
					["button", ["enabled", []]] call HALs_store_fnc_main;
				}];
			};

			case ("update"): {
				private _ctrlList = CTRL(IDC_LISTBOX); lbClear _ctrlList;
				private _checkAvaliable = CTRL(IDC_CHECKBOX + 1);
				private _checkCompatible = CTRL(IDC_CHECKBOX + 2);
				private _sell = cbChecked CTRL(IDC_CHECKBOX + 3);
				
				private _category = CTRL(IDC_COMBO_CATEGORY) getVariable "data";
				private _items = [HALs_store_category_items, _category, []] call HALs_store_fnc_hashGetOrDefault;
				
				private _sellableItems = [];
				if (_sell) then {
					_checkAvaliable cbSetChecked false;
					_checkCompatible cbSetChecked false;

					_container = CTRLT(IDC_BUY_ITEM_COMBO) getVariable "container";
					_sellableItems = [_container] call HALs_store_fnc_getContainerItems;
					
					// Hacky af but basically allows base weapons
					_items = _sellableItems select {
						_x in _items || (_x call HALs_store_fnc_getParentClassname) in _items;
					};
					
					_items = _items arrayIntersect _items;
				} else {
					if (cbChecked _checkCompatible) then { // Compatible items only (wont run if sale checkbox is checked)
						_filterItems = [];
						{_filterItems append (_x call HALs_store_fnc_getCompatibleItems)} forEach [primaryWeapon player, handgunWeapon player, secondaryWeapon player];
						_items = _items arrayIntersect _filterItems;
					};
				};
				
				if (_items isEqualTo []) exitWith {_ctrlList lbSetCurSel -1};

				_showAvaliable = cbChecked _checkAvaliable;
				private _money = [player] call HALs_money_fnc_getFunds;
				private _sellFactor = HALs_store_sellFactor min 1 max 0;
				{
					_classname = _x;
					_price = [HALs_store_item_price, _x, 0] call HALs_store_fnc_hashGetOrDefault;
					_priceAdjusted = _price;
					_stock = 0;
					
					if (_sell) then {
						_parent = _classname call HALs_store_fnc_getParentClassname;		
						_stock = {_x isEqualTo _className || _x isEqualTo _parent} count _sellableItems;
				
						if (_price isEqualTo 0) then {_price = [HALs_store_item_price, _parent, 0] call HALs_store_fnc_hashGetOrDefault};
						_priceAdjusted = round (_price * _sellFactor);
					} else {
						_stock = [_trader, _classname] call HALs_store_fnc_getTraderStock;
					};

					if (_stock > 0 && !(_showAvaliable && {_price > _money})) then {
						_cfg = _classname call HALs_fnc_getConfigClass;
						_idx = _ctrlList lbAdd getText (_cfg >> "displayName");
						
						_ctrlList lbSetData [_idx, str [_classname, _stock]];
						_ctrlList lbSetPicture [_idx, getText (_cfg >> "picture")];
						_ctrlList lbSetValue [_idx, _price];
						_ctrlList lbSetTextRight [_idx, _priceAdjusted call HALs_store_fnc_formatMoney];

						if (_price > _money && {!_sell}) then {
							_ctrlList lbSetColorRight [_idx, [0.8, 0, 0, 1]];
							_ctrlList lbSetSelectColorRight [_idx, [0.8, 0, 0, 1]];
						};
					};
				} forEach _items;

				lbSort [_ctrlList, ["ASC", "DESC"] select cbChecked CTRL(IDC_LISTBOX_SORT)];
				_ctrlList lbSetCurSel ((_ctrlList getVariable ["idx", -1]) max 0);
			};
			
			case ("sort"): {
				(_this select 0) ctrlSetTooltip (["Sorted ascending.", "Sorted descending."] select (_this select 1));
			
				private _ctrlList = CTRL(IDC_LISTBOX);
				lbSort [_ctrlList, ["ASC", "DESC"] select (_this select 1)];
				ctrlSetFocus _ctrlList;
				_ctrlList lbSetCurSel ((_ctrlList getVariable ["idx", -1]) max 0);
			};
		};
	};

	case ("combobox"): {
		params ["_mode", "_this"];

		switch (toLower _mode) do {
			params ["_mode", "_this"];

			case ("init"): {
				private _ctrlCategory = CTRL(IDC_COMBO_CATEGORY);
				_ctrlCategory ctrlAddEventHandler ["LBSelChanged", {
					params ["_ctrl", "_idx"];

					_ctrl setVariable ["data", _ctrl lbData _idx];
					["listbox", ["update", []]] call HALs_store_fnc_main
				}];

				private _cfg = configFile >> "cfgHALsAddons" >> "cfgHALsStore";

				// hacky fix
				private _categories = [];
				private _traderType = _trader getVariable ["HALs_store_trader_type", []];

				{
					private _categoryAdd = getArray (_cfg >> "stores" >> _x >> "categories");
					_categories append _categoryAdd;
				} forEach _traderType; // make sure it grabs ALL categories, not only the first

				// private _categories = getArray (_cfg >> "stores" >> ( (_trader getVariable ["HALs_store_trader_type", []]) select 0) >> "categories");
				_categories = [_categories, {getText (_cfg >> "categories" >> _x >> "displayName")}, true] call HALs_fnc_sortArray;

				_ctrlCategory lbAdd localize "STR_HALS_STORE_ALL";
				_ctrlCategory lbSetData [0, "all"];
				{
					_idx = _ctrlCategory lbAdd (getText (_cfg >> "categories" >> _x >> "displayName"));
					_ctrlCategory lbSetData [_idx, _x];
				} forEach _categories;
				_ctrlCategory lbSetCurSel 0;

				// Container dropdown
				private _ctrlPurchase = CTRLT(IDC_BUY_ITEM_COMBO);
				_ctrlPurchase ctrlAddEventHandler ["LBSelChanged", {
					params ["_ctrl", "_idx"];

					_data = (_ctrl lbData _idx) call BIS_fnc_objectFromNetId;
					_ctrl setVariable ["idx", _idx];
					_ctrl setVariable ["container", _data];
					_ctrl setVariable ["text", _ctrl lbText _idx];

					if (cbChecked CTRL(IDC_CHECKBOX+3)) then {
						["listbox", ["update", []]] call HALs_store_fnc_main
					} else {
						["progressLoad", [_data, CTRL(IDC_LISTBOX) getVariable "data", CTRLT(IDC_EDIT) getVariable "amt"]] call HALs_store_fnc_main;
						["button", ["enabled", []]] call HALs_store_fnc_main;
					};

					["text", ["update", ["cargo", [_data]]]] call HALs_store_fnc_main;
				}];
			};

			case ("update"): {
				private _ctrlPurchase = CTRLT(IDC_BUY_ITEM_COMBO);
				lbClear _ctrlPurchase;

				private _traderHasContainer = ["LandVehicle", "Air", "Ship", "Car_F", "ReammoBox_F"] findIf {typeOf _trader isKindOf [_x, configFile >> "cfgVehicles"]} > -1;
				private _containers = [
					[
						[],
						[typeOf _trader, "Trader", "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\face_ca.paa", _trader]
					] select _traderHasContainer,
					[uniform player, "Uniform", "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa", uniformContainer player],
					[vest player, "Vest", "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa", vestContainer player],
					[backpack player, "Backpack", "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa", backpackContainer player]
				];

				_containers append HALs_store_vehicles;
				{
					_x params ["_classname", "_displayName", "_picture", "_object"];

					if (count _x > 0 && {!isNull _object && {_classname != ""}}) then {
						_idx = _ctrlPurchase lbAdd _displayName;
						_ctrlPurchase lbSetPicture [_idx, _picture];
						_ctrlPurchase lbSetData [_idx, _object call BIS_fnc_netId];
					};
				} forEach _containers;

				_ctrlPurchase lbSetCurSel ((_ctrlPurchase getVariable ["idx", -1]) max 0);
			};
		};
	};

	case ("edit"): {
		params ["_mode", "_this"];

		switch (toLower _mode) do {
			params ["_mode", "_this"];

			case ("init"): {
				private _ctrlEdit = CTRLT(IDC_EDIT);
				_ctrlEdit setVariable ["amt", 1];

				_ctrlEdit ctrlAddEventHandler ["KeyUp", {
					_ctrl = _this select 0;
					_amt = 1 max (floor parseNumber ctrlText _ctrl);
					_ctrl setVariable ["amt", _amt];

					_listbox = CTRL(IDC_LISTBOX);
					["progressLoad", [CTRLT(IDC_BUY_ITEM_COMBO) getVariable "container", _listbox getVariable "data", _amt]] call HALs_store_fnc_main;
					["text", ["update", ["buy", [_listbox getVariable "value", _amt]]]] call HALs_store_fnc_main;
					["button", ["enabled", []]] call HALs_store_fnc_main;
				}];

				["edit", ["update", []]] call HALs_store_fnc_main;
			};

			case ("update"): {
				private _ctrlEdit = CTRLT(IDC_EDIT);
				if (CTRL(IDC_LISTBOX) getVariable ["idx", -1] > -1) then {
					_ctrlEdit ctrlEnable true;
					_ctrlEdit ctrlSetText format ["%1", _ctrlEdit getVariable "amt"];
				} else {
					_ctrlEdit ctrlEnable false;
					_ctrlEdit ctrlSetText "";
				};
			};
		};
	};

	case ("button"): {
		params ["_mode", "_this"];

		switch (toLower _mode) do {
			params ["_mode", "_this"];

			case ("change"): {
				params ["", "_checked"];
				CTRLT(IDC_BUTTON_BUY) ctrlSetText localize (["STR_HALS_STORE_BUTTON_PURCHASE", "STR_HALS_STORE_BUTTON_SELL"] select _checked);
			};

			case ("enabled"): {
				private _ctrlButton = CTRLT(IDC_BUTTON_BUY);
				private _ctrlList = CTRL(IDC_LISTBOX);
				
				private _idx = _ctrlList getVariable ["idx", -1];
				if (_idx isEqualTo -1) exitWith {
					_ctrlButton ctrlEnable false;
				};

				(_ctrlList getVariable "data") params [
					["_classname", ""],
					["_stock", 0]
				];

				// Insufficient stock check
				_amount = CTRLT(IDC_EDIT) getVariable ["amt", 1];
				if (_stock < 1 ||  _amount < 1 || _amount > _stock) exitWith {
					_ctrlButton ctrlEnable false;
				};

				// Selling
				if (cbChecked CTRL(IDC_CHECKBOX+3)) exitWith {
					_ctrlButton ctrlEnable true;
				};

				// Insufficient Funds check
				_price = _ctrlList lbValue _idx;
				_sale = (1 - (_trader getVariable ["HALs_store_trader_sale", 0])) min 1 max 0;
				_money = [player] call HALs_money_fnc_getFunds;

				if (_price * _amount * _sale > _money) exitWith {
					_ctrlButton ctrlEnable false;
				};

				// Fetch container and check if items can be added
				_container = CTRLT(IDC_BUY_ITEM_COMBO) getVariable "container";
				_canAdd = !isNull _container && {_container canAdd [_classname, _amount]};

				// The item should not be equipped
				if (!cbChecked CTRLT(IDC_CHECKBOX_BUY)) exitWith {
					_ctrlButton ctrlEnable _canAdd;
				};

				// Check if the item can be equipped
				_canEquipPlayer = [player, _classname] call HALs_store_fnc_canEquipItem;

				// Can't equip item
				if (!_canEquipPlayer) exitWith {
					_ctrlButton ctrlEnable _canAdd;
				};

				_canEquip = !isNull _container && {_container canAdd [_classname, _amount - 1]};
				_canEquipEmpty = _amount isEqualTo 1;

				_ctrlButton ctrlEnable (_canEquip || _canEquipEmpty);
			};

			case ("pressed"): {
				private _ctrlList = CTRL(IDC_LISTBOX);
				private _data = [player, (_ctrlList getVariable "data") param [0, ""], _ctrlList getVariable "value", CTRLT(IDC_EDIT) getVariable "amt", CTRLT(IDC_BUY_ITEM_COMBO) getVariable "container"];

				if (cbChecked CTRL(IDC_CHECKBOX+3)) then {
					_data remoteExecCall ["HALs_store_fnc_sell", 2, false];
				} else {
					_data pushBack cbChecked CTRLT(IDC_CHECKBOX_BUY);
					_data remoteExecCall ["HALs_store_fnc_purchase", 2, false];
				};
			};
		};
	};

	case ("text"): {
		params ["_mode", "_this"];

		switch (toLower _mode) do {
			params ["_mode", "_this"];

			case ("init"): {
				["text", ["update", ["buy", [CTRL(IDC_LISTBOX) getVariable "value", CTRLT(IDC_EDIT) getVariable "amt"]]]] call HALs_store_fnc_main;
				["text", ["update", ["cargo", []]]] call HALs_store_fnc_main;
				["text", ["update", ["funds", []]]] call HALs_store_fnc_main;
				["text", ["update", ["item", []]]] call HALs_store_fnc_main;
			};

			case ("update"): {
				params ["_mode", "_this"];

				switch (toLower _mode) do {
					params ["_mode", "_this"];

					case ("buy"): {
						params [
							["_price", 0],
							["_amount", 0]
						];

						private _ctrlList = CTRL(IDC_LISTBOX);
						private _idx = _ctrlList getVariable ["idx", -1];

						if (_amount < 1 || _idx isEqualTo -1) exitWith {
							CTRLT(IDC_ITEM) ctrlSetStructuredText parseText "";
						};

						private _stock = (_ctrlList getVariable "data") param [1, 0];
						private _money = [player] call HALs_money_fnc_getFunds;
						private _sale = (_trader getVariable ["HALs_store_trader_sale", 0]) min 1 max 0;
						private _sell = cbChecked CTRL(IDC_CHECKBOX + 3);
						_price = _price * ([1, HALs_store_sellFactor min 1 max 0] select _sell);
						_total = _amount * _price * ([1 - _sale, 1] select _sell);

						private _ctrlText = CTRLT(IDC_ITEM);
						_ctrlText ctrlSetStructuredText parseText format [
							"<t font ='PuristaMedium' align='right' shadow='2'>%1%2<br/>%3%4</t>",
							format ["<t align='left' color='%2'>x%1</t>", _amount, ['#ffffff', '#ea0000'] select (_amount > _stock)],
							format ["<t color='#aaffaa'>%1</t>", _price call HALs_store_fnc_formatMoney],
							[format ["- %1%2<br/>", _sale * 100, "%"], ""] select (_sale isEqualTo 0),
							format ["<t size='1.1' color='%2'>%3 %1</t>", (_total call HALs_fnc_numberToString) call HALs_store_fnc_formatMoney, ['#b2ec00', '#ea0000'] select (!_sell && {_total > _money}), ["-", "+"] select _sell]
						];

						// Update positions of controls
						_ctrlText ctrlSetPositionH ctrlTextHeight _ctrlText;
						_ctrlText ctrlCommit 0;

						_ctrlEdit = CTRLT(IDC_EDIT);
						private _y = ((ctrlPosition _ctrlText) select 1) + ((ctrlPosition _ctrlText) select 3) + 3 * pixelH;

						_ctrlEdit ctrlSetPositionY _y;
						_ctrlEdit ctrlCommit 0;

						_ctrlButton = CTRLT(IDC_BUTTON_BUY);
						_ctrlCheckbox = CTRLT(IDC_CHECKBOX_BUY);
						_y = _y + ((ctrlPosition _ctrlEdit) select 3) + 3 * pixelH;

						_ctrlButton ctrlSetPositionY _y;
						_ctrlCheckbox ctrlSetPositionY _y;
						_ctrlButton ctrlCommit 0;
						_ctrlCheckbox ctrlCommit 0;

						_ctrlButtonSell = CTRLT(IDC_BUTTON_SELL);
						_y = _y + ((ctrlPosition _ctrlEdit) select 3) + 3 * pixelH;

						_ctrlButtonSell ctrlSetPositionY _y;
						_ctrlButtonSell ctrlCommit 0;
					};

					case ("cargo"): {
						private _classname = typeOf (CTRLT(IDC_BUY_ITEM_COMBO) getVariable "container");
						if (_classname find "Supply" isEqualTo 0) then {
							_text = CTRLT(IDC_BUY_ITEM_COMBO) getVariable ["text", ""];
							_classname = [uniform player, vest player, backpack player] select (["Uniform", "Vest", "Backpack"] find _text);
						};

						private _type = (_classname call BIS_fnc_itemType) select 0;
						private _cargo = ["editorPreview", "picture"] select (_type isEqualTo "Equipment");
						CTRLT(IDC_BUY_PICTURE) ctrlSetText getText ([configFile >> "cfgWeapons" >> _classname >> _cargo, configFile >> "cfgVehicles" >> _classname >> _cargo] select isClass(configFile >> "cfgVehicles" >> _classname));
					};

					case ("funds"): {
						private _money = ([player] call HALs_money_fnc_getFunds) call HALs_fnc_numberToString;
						((uiNamespace getVariable ["HALs_store_display", displayNull]) displayCtrl IDC_FUNDS) ctrlSetStructuredText parseText (_money call HALs_store_fnc_formatMoney);
					};

					case ("item"): {
						private _ctrlList = CTRL(IDC_LISTBOX);
						private _idx = _ctrlList getVariable ["idx", -1];

						if (_idx isEqualTo -1) exitWith {
							CTRLS(IDC_ITEM_PICTURE) ctrlSetText "";
							CTRLS(IDC_ITEM_TEXT) ctrlSetStructuredText parseText "";
							CTRLS(IDC_ITEM_TEXT_DES) ctrlSetStructuredText parseText "";
						};
						
						(_ctrlList getVariable "data") params [
							["_classname", ""],
							["_stock", 0]
						];
						
						private _ctrlText = CTRLS(IDC_ITEM_TEXT_DES);
						_config = _classname call HALs_fnc_getConfigClass;
						_ctrlText ctrlSetStructuredText parseText ([
							getText (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "categories" >>  CTRL(IDC_COMBO_CATEGORY) getVariable "data" >> _classname >> "description"),
							[_config >> "Library" >> "libTextDesc", ""] call HALs_fnc_getConfigValue,
							[_config >> "descriptionShort", ""] call HALs_fnc_getConfigValue
						] select {_x != ""} param [0, ""]); // Description


						_sell = cbChecked CTRL(IDC_CHECKBOX + 3);
						_stockText = format [
							"<t shadow='2' font ='PuristaMedium' color='%1'>%2</t>%3",
							["#DD2626", "#A0DF3B"] select (_stock > 0),
							[[localize "STR_HALS_STORE_TEXT_NOSTOCK", localize "STR_HALS_STORE_TEXT_INSTOCK"] select (_stock > 0), "AVAILABLE"] select _sell,
							["", ":  " + (_stock call HALs_fnc_numberToString)] select (_stock > 0)
						];
						_price = (_ctrlList lbValue _idx) * ([1, HALs_store_sellFactor min 1 max 0] select _sell);
						
						CTRLS(IDC_ITEM_PICTURE) ctrlSetText (_ctrlList lbPicture _idx);
						_ctrlTitle = CTRLS(IDC_ITEM_TEXT);
						_ctrlTitle ctrlSetStructuredText parseText format [
							"<t size='1.3' shadow='2' font ='PuristaMedium'>%1</t><br/><t shadow='2' font ='PuristaMedium'>%3</t>:  <t color='#aaffaa'>%2</t><br/>%4",
							_ctrlList lbText _idx, (_price call HALs_fnc_numberToString) call HALs_store_fnc_formatMoney, toUpper localize "STR_HALS_STORE_TEXT_PRICE", _stockText
						];
						_ctrlTitle ctrlSetPositionH ctrlTextHeight _ctrlTitle;
						_ctrlTitle ctrlCommit 0;

						private _pos = ctrlPosition _ctrlTitle;
						private _y = (_pos select 1) + (_pos select 3) + pixelH * 4;
						{
							_x params ["_ctrlBar", "_ctrlBarText"];
							
							if (ctrlFade _ctrlBar < 1) then {
								_ctrlBar ctrlSetPositionY _y;
								_ctrlBarText ctrlSetPositionY _y;
								_ctrlBar ctrlCommit 0;
								_ctrlBarText ctrlCommit 0;

								_y = _y + ((ctrlPosition _ctrlBar) select 3) + pixelH * 3;
							}
						} forEach STAT_BARS;

						_ctrlText ctrlSetPositionY _y;
						_ctrlText ctrlSetPositionH (ctrlTextHeight _ctrlText);
						_ctrlText ctrlCommit 0;
					};
				};
			};
		};
	};

	case "progressLoad": {
		params [
			["_container", objNull, [objNull]],
			["_data", [], [[]]],
			["_amount", 1, [1]]
		];

		if (isNull _container) exitWith {
			CTRLT(IDC_PROGRESS_LOAD) progressSetPosition 0;
			CTRLT(IDC_PROGRESS_NEWLOAD) progressSetPosition 0;
		};
		
		_bar = CTRLT(IDC_PROGRESS_LOAD);
		_barNew = CTRLT(IDC_PROGRESS_NEWLOAD);
		

		private _classname = _data param [0, ""];
		_currentLoad = [_container] call HALs_store_fnc_getCargoMass;
		_maxLoad = 1 max getNumber (configFile >> "CfgVehicles" >> typeOf _container >> "maximumLoad");
	
		if (_classname isEqualTo "" || cbChecked CTRL(IDC_CHECKBOX + 3)) exitWith {
			_bar progressSetPosition (_currentLoad / _maxLoad);
			_barNew progressSetPosition 0;
		};
	
		// Check if it's a backpack with items
		_load = _classname call HALs_store_fnc_getItemMass;
		if ([_classname] call HALs_store_fnc_getItemType isEqualTo 3) then {
			_arrayCargo = [];
			
			{
				_arrayCargo append (("true" configClasses _x) apply {
					[(configName _x) select [4], getNumber (_x >> "count")]
				});
			} forEach ("true" configClasses (configFile >> "CfgVehicles" >> _classname));

			{_load = _load + ((_x select 0) call HALs_store_fnc_getItemMass) * (_x select 1)} forEach _arrayCargo;
		};

		if (cbChecked CTRL(IDC_CHECKBOX + 3)) then {
			//_barNew progressSetPosition (_currentLoad / _maxLoad);
			//_barNew ctrlSetTextColor [0.9, 0.9, 0.9, 0.9];
			//_bar progressSetPosition linearConversion [0, _maxLoad, _currentLoad + (_load * _amount * -1), 0, 1, true];
			//_bar ctrlSetTextColor [0, 0.9, 0, 0.6];
		} else {
			_colour = [[0.9, 0, 0, 0.6], [0, 0.9, 0, 0.6]] select (_container canAdd [_classname, _amount]);
			_bar ctrlSetTextColor [0.9, 0.9, 0.9, 0.9];
			_bar progressSetPosition (_currentLoad / _maxLoad);
			_barNew progressSetPosition linearConversion [0, _maxLoad, _currentLoad + (_load * _amount), 0, 1, true];
			_barNew ctrlSetTextColor _colour;
		};
	};

	case "progressStats": {
		params [
			["_data", [], [[]]]
		];

		private _cfg = (_data param [0, ""]) call HALs_fnc_getConfigClass;
		private _stats = ([_cfg] call HALs_store_fnc_getItemStats);
		
		{
			_x params ["_ctrlBar", "_ctrlText"];
		
			_stat = _stats select _forEachIndex;
			if (count _stat > 0) then {
				_ctrlBar progressSetPosition (_stat select 0);
				_ctrlBar ctrlSetFade 0;
				_ctrlBar ctrlCommit 0;
					
				_ctrlText ctrlSetText toUpper (_stat select 1);
				_ctrlText ctrlSetFade 0;
				_ctrlText ctrlCommit 0;	
			} else {
				_ctrlBar progressSetPosition 0;
				_ctrlBar ctrlSetFade 1;
				_ctrlBar ctrlCommit 0;
					
				_ctrlText ctrlSetText "";
				_ctrlText ctrlSetFade 1;
				_ctrlText ctrlCommit 0;	
			};
		} forEach STAT_BARS;
	};
};
