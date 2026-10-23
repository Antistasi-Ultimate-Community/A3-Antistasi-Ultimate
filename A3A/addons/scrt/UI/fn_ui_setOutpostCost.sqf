#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay A3A_IDD_COMMANDER_MENU;

if (str (_display) == "no display") exitWith {};

private _costTextBox = _display displayCtrl A3A_IDC_COMMANDER_MENU_GARRISON_COST_TEXT;
private _comboBox = _display displayCtrl A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX;
private _index = lbCurSel _comboBox;
private _outpostType =  lbData [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, _index];

outpostType = _outpostType;
private _costs = 50;
private _hr = 0;

switch (outpostType) do {
    case ("WATCHPOST"): {
        _costs = 50;
        _hr = 0;
        {
            _costs = _costs + (server getVariable [_x,0]);
            _hr = _hr + 1; 
        } forEach (A3A_faction_reb get "groupSniper");
        _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("ROADBLOCK"): {
        _costs = [(A3A_faction_reb get "vehiclesLightArmed") # 0] call A3A_fnc_vehiclePrice;
        _hr = 0; //static gunner
        {
            _costs = _costs + (server getVariable [_x,0]);
            _hr = _hr + 1;
        } forEach (A3A_faction_reb get "groupSquad");
        _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("AA"): {
        _costs = [(A3A_faction_reb get "staticAA") # 0] call A3A_fnc_vehiclePrice;
        _hr = 0;
        {
            _costs = _costs + (server getVariable [_x,0]); 
            _hr = _hr +1;
        } forEach (A3A_faction_reb get "groupAaEmpl");
       _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("AT"): {
        _costs = [(A3A_faction_reb get "staticAT") # 0] call A3A_fnc_vehiclePrice; //AT
        _hr = 0;
        {
            _costs = _costs + (server getVariable [_x,0]); 
            _hr = _hr +1;
        } forEach (A3A_faction_reb get "groupAtEmpl");
       _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("HMG"): {
        _costs = [(A3A_faction_reb get "staticMGs") # 0] call A3A_fnc_vehiclePrice;
        _hr = 0;
        {
            _costs = _costs + (server getVariable [_x,0]); 
            _hr = _hr +1;
        } forEach (A3A_faction_reb get "groupHmgEmpl");
       _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    default {
        Error("Bad outpost type.");
	};
};

outpostCost = [_costs, _hr];