#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _trader = if (!isNil "traderX") then {
    traderX
} else { 
    nil 
};

if (isNil "_trader") exitWith {
    Info("Trader hasn't spawned yet.");
};

private _stocks = _trader getVariable ["HALs_store_trader_stocks", []];

if (_stocks isEqualTo []) exitWith {
    Info("Trader has empty stock.");
};

//looks like this is needed to grab weapons from arsenal
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _weapons = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON)) select {_x select 1 isEqualTo -1};
private _explosives = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT) select {_x select 1 isEqualTo -1};
private _magazines = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) select {_x select 1 isEqualTo -1};
private _backpacks = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) select {_x select 1 isEqualTo -1};
private _items = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_UNIFORM)) select {_x select 1 isEqualTo -1};
private _optics = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) select {_x select 1 isEqualTo -1};
private _nv = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS) select {_x select 1 isEqualTo -1};
private _helmets = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) select {_x select 1 isEqualTo -1};
private _vests = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST) select {_x select 1 isEqualTo -1};

{
    private _item = toLowerANSI (_x select 0);
    private _stockIndex = _stocks find _item;

    if (_stockIndex != -1) then {
        _stocks deleteAt _stockIndex; //item
        _stocks deleteAt (_stockIndex + 1); //quantity
    };
} forEach _weapons + _explosives + _magazines + _backpacks + _items + _optics + _nv + _helmets + _vests;

//saving all changes
_trader setVariable ["HALs_store_trader_stocks", _stocks, true];
private _players = allPlayers select {(_x getVariable ["HALs_store_trader_current", objNull]) isEqualTo _trader} apply {owner _x};
[] remoteExecCall ["HALs_store_fnc_update", _players, false];

Info("Stock clearance pass finished.");
