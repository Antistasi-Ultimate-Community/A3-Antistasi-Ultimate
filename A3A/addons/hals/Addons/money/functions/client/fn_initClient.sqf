/*
	Function: HALs_money_fnc_init
	Author: HallyG
	Client initialisation.

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call HALs_money_fnc_initModule;
__________________________________________________________________*/
if (!hasInterface) exitWith {};

// Add money when player picks up money
player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];
	
	private _money = 0;
	switch (_item) do {
		case "Money_bunch": {_money = HALs_money_oldManItemsPrice select 0};
		case "Money_roll": {_money = HALs_money_oldManItemsPrice select 1};
		case "Money_stack": {_money = HALs_money_oldManItemsPrice select 2};
		case "Money": {_money = HALs_money_oldManItemsPrice select 3};
	};

	if (_money > 0) then {
		player removeItem _item;
		[player, _money] call HALs_money_fnc_addFunds;
	};
}];		

// Display money in the player's inventory
player addEventHandler ["InventoryOpened", {
	_h = [] spawn {
		disableSerialization;
		waitUntil {!isNull findDisplay 602};
		
		if (isNull (uiNamespace getVariable ["HALs_InventoryMoneyInfo", controlNull])) then {
			uiNamespace setVariable ["HALs_InventoryMoneyInfo", (findDisplay 602) ctrlCreate ["RscStructuredText", 12365]];
		};
		
		_ctrl = uiNamespace getVariable ["HALs_InventoryMoneyInfo", controlNull];
		if (!isNull _ctrl) then {
			ctrlPosition (findDisplay 602 displayCtrl 2) params ["_x", "_y", "", "_h"];
			_w = ctrlPosition (findDisplay 602 displayCtrl 111) param [2, 0];
			_ctrl ctrlSetPosition [_x - _w, _y, _w, _h];
			_ctrl ctrlCommit 0;
			_ctrl ctrlShow true;
			
			while {ctrlShown _ctrl} do {
				private _currencySymbol = if (!isNil "A3A_faction_civ") then {
					A3A_faction_civ get "currencySymbol"
				} else {
					""
				};
				_ctrl ctrlSetStructuredText parseText format [
					"<t align='right' shadow='1' font='RobotoCondensed' color='#aaffaa'>%1 %2</t>",
					([player] call HALs_money_fnc_getFunds) toFixed 2,
					_currencySymbol
				];
				
				sleep 0.5;
			};
		};
	};
}];
