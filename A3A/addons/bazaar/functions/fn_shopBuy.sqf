// Client: BUY button / double-click. Pre-checks funds for instant feedback,
// then asks the server (which does the binding checks and the charge).
#include "..\dialogues\ids.inc"
private _d = findDisplay ABZ_IDD_SHOP;
if (isNull _d) exitWith {};
if ((uiNamespace getVariable ["ABZ_shopMode", "stock"]) == "sellcargo") exitWith { call ABZ_fnc_shopSellCargo };
if (uiNamespace getVariable ["ABZ_shopSell", false]) exitWith { call ABZ_fnc_shopSell };
private _mode = uiNamespace getVariable ["ABZ_shopMode", "stock"];
if (_mode == "run") exitWith { call ABZ_fnc_shopRun };
if (_mode == "wanted") exitWith {
	private _row = lnbCurSelRow (_d displayCtrl ABZ_IDC_ITEMLIST);
	private _map = uiNamespace getVariable ["ABZ_shopMap", []];
	if (_row >= 0 && {_row < count _map}) then {
		[_map select _row] call ABZ_fnc_wantedToggle;
		call ABZ_fnc_shopFillList;
	};
};
private _shop = uiNamespace getVariable ["ABZ_shop", []];
private _lnb = _d displayCtrl ABZ_IDC_ITEMLIST;
private _row = lnbCurSelRow _lnb;
private _map = uiNamespace getVariable ["ABZ_shopMap", []];
if (_shop isEqualTo [] || {_row < 0} || {_row >= count _map}) exitWith { ["Select an item first."] call ABZ_fnc_notify };

private _idx = _map select _row;
private _slot = (_shop select 3) select _idx;
_slot params ["_class", "_price", "_tier", "_qty", "_bulk"];
if (_qty <= 0) exitWith { [localize "STR_A3U_Bazaar_Notify_SoldOut"] call ABZ_fnc_notify };

// typed quantity, clamped to 1..what's left (the server clamps again)
private _qtyc = _d displayCtrl ABZ_IDC_QTYEDIT;
private _n = round parseNumber (ctrlText _qtyc);
if (_n < 1) then { _n = 1 };
private _capped = _n > _qty;
if (_capped) then { _n = _qty };
private _isVeh = (_slot param [5, ""]) isEqualTo "vehicle";
if (_bulk || {_isVeh}) then { _n = 1; _capped = false };
_qtyc ctrlSetText str _n;

// a vehicle the rebels can't take delivery of yet: say why straight away
// (the server checks again)
if (_isVeh && {!(([_slot param [6, ""]] call ABZ_fnc_vehReq) select 0)}) exitWith {
	[format [localize "STR_A3U_Bazaar_Notify_VehReq", ([_slot param [6, ""]] call ABZ_fnc_vehReq) select 2]] call ABZ_fnc_notify;
};

(call ABZ_fnc_getFunds) params ["_m", "_fac"];
if (_m >= 0 && {_m < _price * _n}) exitWith {
	private _afford = floor (_m / (_price max 1));
	[format [localize "STR_A3U_Bazaar_Notify_NotEnoughMoney_Multiple", ["", localize "STR_A3U_Bazaar_Misc_Faction"] select _fac, _n, _price * _n, _m,
		["", format [localize "STR_A3U_Bazaar_Notify_CanAfford", _afford]] select (_afford >= 1)]] call ABZ_fnc_notify;
};
if (_capped) then { systemChat format [localize "STR_A3U_Bazaar_Shop_OnlyLeft", _n] };

// delivery destination (single items only; bulk always comes sealed)
private _dest = (lbCurSel (_d displayCtrl ABZ_IDC_DESTCOMBO)) max 0;
uiNamespace setVariable ["ABZ_shopDest", _dest];	// remembered for the next visit
if (_isVeh) then { _dest = 0 };	// the destination box is for single items
private _veh = objNull;
if (!_bulk && {_dest == 1}) then { _veh = call ABZ_fnc_cargoTarget };
if (!_bulk && {_dest == 1} && {isNull _veh}) exitWith {
	[localize "STR_A3U_Bazaar_Notify_NoVehCargo"] call ABZ_fnc_notify;
};

// class and price go along so the server can tell if the table changed under
// this menu (restock) - it never buys "whatever is in that row now"
["ABZ_buy", [player, _shop select 0, _idx, _n, _dest, _veh, _class, _price]] call CBA_fnc_serverEvent;
