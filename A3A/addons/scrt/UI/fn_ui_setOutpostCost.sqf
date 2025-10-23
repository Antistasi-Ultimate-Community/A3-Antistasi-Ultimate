#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay 60000;

if (str (_display) == "no display") exitWith {};

private _costTextBox = _display displayCtrl 2751;
private _comboBox = _display displayCtrl 2750;
private _index = lbCurSel _comboBox;
private _outpostType =  lbData [2750, _index];

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
        _costs = [(FactionGetRebel(A3A_faction_reb, "vehiclesLightArmed")) # 0] call A3A_fnc_vehiclePrice;
        _hr = 0; //static gunner
        {
            _costs = _costs + (server getVariable [_x,0]);
            _hr = _hr + 1;
        } forEach (A3A_faction_reb get "groupSquad");
        _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("AA"): {
        _costs = [(FactionGetRebel(A3A_faction_reb, "staticAA")) # 0] call A3A_fnc_vehiclePrice;
        _hr = 0;
        {
            _costs = _costs + (server getVariable [_x,0]); 
            _hr = _hr +1;
        } forEach (A3A_faction_reb get "groupAaEmpl");
       _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("AT"): {
        _costs = [(FactionGetRebel(A3A_faction_reb, "staticAT")) # 0] call A3A_fnc_vehiclePrice; //AT
        _hr = 0;
        {
            _costs = _costs + (server getVariable [_x,0]); 
            _hr = _hr +1;
        } forEach (A3A_faction_reb get "groupAtEmpl");
       _costTextBox ctrlSetText format [localize "STR_commander_menu_establish_garrison_cost", _hr, _costs, A3A_faction_civ get "currencySymbol"];
    };
    case ("HMG"): {
        _costs = [(FactionGetRebel(A3A_faction_reb, "staticMGs")) # 0] call A3A_fnc_vehiclePrice;
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