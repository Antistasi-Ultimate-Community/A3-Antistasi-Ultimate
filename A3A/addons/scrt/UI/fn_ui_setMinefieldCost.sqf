#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

disableSerialization;

private _display = findDisplay 60000;

if (str (_display) == "no display") exitWith {};

private _costTextBox = _display displayCtrl 2761;
private _comboBox = _display displayCtrl 2758;
private _index = lbCurSel _comboBox;
private _minefieldType = lbData [2758, _index];

minefieldType = _minefieldType;
private _costs = 0;
private _hr = 0;

private _pool = jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT;
private _quantity = 0;
private _minePool = [
	(A3A_faction_reb getOrDefault ["minesAPERS", []] + A3A_faction_occ getOrDefault ["minefieldAPERS", []] + A3A_faction_inv getOrDefault ["minefieldAPERS", []] + A3A_faction_riv getOrDefault ["minefieldAPERS", []]),
	(A3A_faction_reb getOrDefault ["minesAT", []] + A3A_faction_occ getOrDefault ["minefieldAT", []] + A3A_faction_inv getOrDefault ["minefieldAT", []] + A3A_faction_riv getOrDefault ["minefieldAT", []])
] select (_minefieldType isEqualTo "ATMine");
private _mine = "";

private _availableMinesPool = _pool select { 
	private _className = _x select 0;
	private _quantity = _x select 1;
	_className in _minePool && {_quantity >= 5 || {_quantity isEqualTo -1}};
};

if (count _availableMinesPool < 1) then {
	_quantity = 0;
} else {
	_mine = selectRandom (_availableMinesPool apply {_x select 0});
	private _mineQuantity = (_availableMinesPool select {(_x select 0) == _mine }) apply {_x select 1}; //quantity
	_quantity = _mineQuantity select 0;
};

_costs = (2*(server getVariable (A3A_faction_reb get "unitExp"))) + ([(A3A_faction_reb get "vehiclesTruck") # 0] call A3A_fnc_vehiclePrice);
_hr = 2;
_costTextBox ctrlSetText format [localize "STR_commander_menu_minefield_cost", minefieldType, _hr, _costs, A3A_faction_civ get "currencySymbol"];

minefieldCost = [_costs, _hr, _quantity, _mine];